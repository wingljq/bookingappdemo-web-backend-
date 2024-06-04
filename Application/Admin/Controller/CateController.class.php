<?php

namespace Admin\Controller;

use Think\Controller;
require_once 'vendor/autoload.php'; // Include the Tinify SDK

// \Tinify\setKey('X08dfFxrNSbKDSr7LRgZYMyk9X6d48Y2'); // Replace with your Tinify API key

class CateController extends BaseController
{
	public function index()
	{
		$this->display();
	}

	public function index_data()
	{
		header("Content-type: text/html; charset=utf-8");
		$where = array();
		$where['isdel'] = 1;
		if ($_GET['name']) {
			$where['name'] = array('like', '%' . trim($_GET['name'] . '%'));
		}
		$count = M('cate')->where($where)->count();
		$list = M('cate')->where($where)->select();
		foreach($list as $key => $value){
			$list[$key]['cateImage'] = C('url').$value['cateImage'];
		}
		//$list=M('cate')->where($where)->field('cateId cateId ,name,pid,cateDesc,sort,cateImage')->select();
		$list = $this->tree($list);
		echo json_encode(array('data' => $list, 'count' => (int)$count));
	}

	public function addshow()
	{
		$list = M('cate')->field('*')->select();
		$list = $this->tree($list);
		$this->assign('cate_list', $list);
		if (I('id')) {
			$info = M('cate')->where(array('cateId' => I('id')))->field('*')->find();
			$info['cateImage'] = C('url').$info['cateImage'];

			$this->assign('info', $info);
		}
		$this->display();
	}

	public function save()
	
	{
		
		// if ($_FILES['cateImage']['name'] != null) {
		// 	$_POST['cateImage'] = uploadImg($_FILES['cateImage'], 'goods');
		// }
		  if ($_FILES['cateImage']['name'] != null) {
        // Compress the uploaded image before saving
        $sourceFile = $_FILES['cateImage']['tmp_name']; // Use the temporary uploaded file
    
        $destinationDirectory = 'Public/Uploads/goods'; // Adjust the directory path
        $destinationFile = uploadImg($_FILES['cateImage'],'goods');
        //$destinationFile = $destinationDirectory . '/' . $_FILES['image']['name']; // Construct the destination file path
        $quality = 10; // Adjust quality as needed
        
        function compressImage($sourceFile, $destinationFile, $quality = 10) {
            // Create an image resource from the source file
            $sourceImage = imagecreatefromjpeg($sourceFile);
            
            // Save the compressed image to the destination file
            imagejpeg($sourceImage, $destinationFile, $quality);
            
            // Clean up resources
            imagedestroy($sourceImage);
        }
        
        compressImage($sourceFile, $destinationFile, $quality);

        // Construct the absolute URL for the compressed image

        //$documentRoot = 'https://beautyappdemo.com/';
        $cleanedLink = str_replace(['[\"', '\\/', '\"', ']'], '', $destinationFile);
          $absoluteURL =$cleanedLink;
        // Update the $_POST['image'] to point to the absolute URL
        $_POST['cateImage'] = $absoluteURL;
    }
		if ($_GET['do'] == 'edit') {
			$_POST['rand'] = rand(1, 9999);
			$res = M('cate')->where(array('cateId' => $_GET['id']))->save($_POST);
		} else if ($_GET['do'] == 'add') {
			$res = M('cate')->add($_POST);
		}
		if ($res) {
			echo json_encode(array('status' => 111, 'msg' => 'success'));
			exit();
		} else {
			echo json_encode(array('status' => 110, 'msg' => 'fail'));
			exit();
		}
	}

	public function del()
	{
		$id_arr = explode(",", $_GET['id']);
		foreach ($id_arr as $v) {
			$info = M('cate')->where(array('cateId' => $v))->find();
			if ($info['pid'] == 0) {
				$nextCate = M('cate')->where(array('pid' => $info['cateId']))->find();
				if ($nextCate) {
					echo json_encode(array('status' => 110, 'msg' => 'There are two levels of classification under this category, which cannot be deleted directly'));
					exit();
				}
			}
			M('goods')->where(array('cateId' => $v))->save(array('isdel' => 0));
			$res = M('cate')->where(array('cateId' => $v))->save(array('isdel' => 0));


		}
		if ($res) {
			echo json_encode(array('status' => 111, 'msg' => 'success'));
			exit();
		} else {
			echo json_encode(array('status' => 110, 'msg' => 'fail'));
			exit();
		}
	}
}
