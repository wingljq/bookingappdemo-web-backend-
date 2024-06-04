<?php

namespace Admin\Controller;

use Think\Controller;

class GoodsController extends BaseController
{
    public function index_data()
    {
        $where = array();
        $where['isdel'] = 1;
        // if (I('name')) {
        //     $where['name|desc'] = array('like', '%' . trim($_GET['name'] . '%'));
        // }
        $list = M('goods')->where($where)->page(I('page'), I('pagesize'))->order('id desc')->select();
       
        foreach ($list as $key => $value) {
            if ($value['isShow'] == 1) {
                $list[$key]['isShow'] = 'On shelf';
            } else {
                $list[$key]['isShow'] = 'Off shelf';
            }
            $list[$key]['cateName'] = M('cate')->where(array('cateId' => $value['cateId']))->find()['name'];
            $list[$key]['addDate'] = date('Y-m-d H:i', strtotime($value['addDate']));
            $list[$key]['coverImg'] = json_decode($list[$key]['coverImg']);

        }
        // echo  json_encode(array('status' => 111, 'data' => $list));
        // exit();
        $count = M('goods')->where($where)->count();
        
        $temp = [];
        $name=trim(I('name'));
        

        foreach ($list as $key => $value) {
            $input = preg_quote($name, '~'); // don't forget to quote input string!
            $result = preg_grep('~' . $input . '~', $list[$key]);
            if ($result){
                $temp.array_push($temp,$list[$key]);
            }
            foreach ($value['coverImg'] as $key1 => $value1) {
                if($value1 !== null){
  $list[$key]['coverImg'][$key1] = C('url').$value1;
                } 
              
            }
        }
        if($name){
            $list = $temp;
        }
        echo  json_encode(array('status' => 111, 'data' => $list,  'count' => (int)$count));
    }
    public function addshow()
    {
        if (I('id')) {
            $info = M('goods')->where(array('id' => I('id')))->find();
            $info['desc'] = base64_decode($info['desc']);
            $this->assign('info', $info);
        }
        $list = M('cate')->field('*')->where("isdel=1")->select();
        $list = $this->tree($list);
        $this->assign('cate_list', $list);
        $this->display();
    }
    public function addservice()
    {
        if (I('id')) {
            $info = M('goods')->where(array('id' => I('id')))->find();
            $this->assign('info', $info);
        }
        $list = M('schedule')->field('*')->where(array('isdel' => 1))->select();
        $this->assign('list', $list);
        $this->display();
    }
    public function yhgoodsadd()
    {
        if (I('id')) {
            $info = M('goods')->where(array('id' => I('id')))->find();
            $this->assign('info', $info);
        }
        $list = M('cate')->field('*')->where("isdel=1")->select();
        $list = $this->tree($list);
        $this->assign('cate_list', $list);
        $this->display();
    }
    public function save()
    {
        if (!$_POST['endDate']) {
            unset($_POST['endDate']);
        }
        
        if ($_FILES['video']['name'] != null) {
            $_POST['video'] = uploadImg($_FILES['video'], 'goods');
        }
        if ($_POST['desc']) {
            $_POST['desc'] = base64_encode($_POST['desc']);
        }
        if ($_GET['do'] == 'edit') {
            if ($_FILES['photo']['size'] != [0]) {
                $_POST['coverImg'] = uploadImages($_FILES["photo"], 'goods');
            }

            $res = M('goods')->where(array('id' => $_GET['id']))->save($_POST);
        } else if ($_GET['do'] == 'add') {
            if ($_FILES['photo']['size'] != [0]) {
                $_POST['coverImg'] = uploadImages($_FILES["photo"], 'goods');
            }else{
                echo json_encode(array('status' => 110, 'msg' => ' Please upload the picture '));
                exit();
            }
            $res = M('goods')->add($_POST);
        }
        if ($res) {
            echo json_encode(array('status' => 111, 'msg' => 'success','file'=>  $_FILES['photo']['size']));
            exit();
        } else {
            echo json_encode(array('status' => 110, 'msg' => 'fail','file'=> $_FILES['photo']['size']));
            exit();
        }
    }


    public function coverUpload($image)
    { //封面圖單個
        $upload = new \Think\Upload(); // 實例化上傳類
        $upload->maxSize   =     3145728; // 設置附件上傳大小
        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg'); // 設置附件上傳類型
        $upload->savePath  =      'Public/Uploads/goodImg/'; // 設置附件上傳目錄
        $upload->rootPath  =      getcwd().'/';
        $info   =   $upload->uploadOne($image);
        if (!$info) { // 上傳錯誤提示錯誤信息
            echo json_encode(array('status' => 110, 'msg' => $upload->getError()));
            exit();
        } else { // 上傳成功
            $res = $info['savepath'] . $info['savename'];
            $image = new \Think\Image();
            $image->open($res);
            $image->thumb(500, 500, \Think\Image::IMAGE_THUMB_CENTER)->save($res);
            return "http://" . $_SERVER['HTTP_HOST'] . __ROOT__ . "/" . $info['savepath'] . $info['savename'];
        }
    }
    public function bannerUpload()
    { //多個詳細頁輪播
        $upload = new \Think\Upload(); // 實例化上傳類
        $upload->maxSize   =     3145728; // 設置附件上傳大小
        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg'); // 設置附件上傳類型
        $upload->savePath  =      'Public/Uploads/goodImg/'; // 設置附件上傳目錄
        $upload->rootPath  =      getcwd().'/';
        $info   =   $upload->uploadOne($_FILES['file']);
        if (!$info) { // 上傳錯誤提示錯誤信息
            echo json_encode(array('status' => 110, 'msg' => $upload->getError()));
            exit();
        } else { // 上傳成功
            $res = $info['savepath'] . $info['savename'];
            // $image = new \Think\Image();
            // $image->open($res);
            // $image->thumb(600, 800,\Think\Image::IMAGE_THUMB_CENTER)->save($res); 
            die(json_encode(array('status' => 111, 'msg' => '上傳成功', 'path' => "http://" . $_SERVER['HTTP_HOST'] . __ROOT__ . "/" . $info['savepath'] . $info['savename'])));
        }
    }
    public function detailUpload($conimages)
    { //多個詳細頁輪播
        $_FILES['detailConImg'] = $conimages;
        for ($i = 0; $i < (count($_FILES['detailConImg']['name'])); $i++) {
            //var_dump($i);
            $onImage = [];
            $onImage = array('detailConImg' => array(
                'name' => $_FILES['detailConImg']['name'][$i],
                'type' => $_FILES['detailConImg']['type'][$i],
                'tmp_name' => $_FILES['detailConImg']['tmp_name'][$i],
                'error' => $_FILES['detailConImg']['error'][$i],
                'size' => $_FILES['detailConImg']['size'][$i],
            ));
            $imageArr[] = $onImage;
        }
        $allUrl = '';
        for ($i = 0; $i < count($imageArr); $i++) {
            $upload = new \Think\Upload();
            $upload->maxSize   =     3145728;
            $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');
            $upload->savePath  =      'Public/Uploads/goodImg/';
            $upload->rootPath  =      getcwd().'/';
            $info   =   $upload->uploadOne($imageArr[$i]['detailConImg']);
            if (!$info) {
                echo json_encode(array('status' => 110, 'msg' => $upload->getError()));
                exit();
            } else {
                $res = $info['savepath'] . $info['savename'];
                $oneUrl = "http://" . $_SERVER['HTTP_HOST'] . __ROOT__ . "/" . $info['savepath'] . $info['savename'] . ';';
                $allUrl = $allUrl . $oneUrl;
            }
        }
        $allUrl = substr($allUrl, 0, -1);
        return $allUrl;
    }
    public function del()
    {
        $id_arr = explode(",", $_GET['id']);
        foreach ($id_arr as $v) {
            $res = M('goods')->where(array('id' => $v))->save(array('isdel' => 0));
        }
        if ($res) {
            echo json_encode(array('status' => 111, 'msg' => 'success'));
            exit();
        } else {
            echo json_encode(array('status' => 110, 'msg' => 'fail'));
            exit();
        }
    }
    public function yhListData()
    {
    }
}