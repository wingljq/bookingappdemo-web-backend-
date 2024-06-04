<?php
namespace Admin\Controller;
use Think\Controller;
class StaffController extends BaseController
{
    public function index(){
        $this->display();
    }

    public function index_data(){
        $name=trim(I('name'));
        $where=array();
        if($name){
            $where['userName|name']=array( 'like' ,'%'.trim($_GET['name'].'%' ) );
        }
        $list=M('stylist')->where($where)->order('staffId')->select();
        foreach ($list as $key => $value) {
            
        }
        $count=M('stylist')->where($where)->count();
        echo  json_encode(array( 'status'=>111  ,'data'=>$list ,  'count'=>(int)$count ));
    }

    public function addshow(){
        if(I('id')){
            $info=M('stylist')->where(array('staffCode'=>I('id')))->find();
           
            $this->assign('info',$info);
        }
        $this->display();
    }

   

   public function save() {
        if ($_FILES['image']['name'] != null) {
        // Compress the uploaded image before saving
        $sourceFile = $_FILES['image']['tmp_name']; // Use the temporary uploaded file
    
        $destinationDirectory = 'Public/Uploads/staff'; // Adjust the directory path
        $destinationFile = uploadImg($_FILES['image'],'staff');
        //$destinationFile = $destinationDirectory . '/' . $_FILES['image']['name']; // Construct the destination file path
        $quality = 10; // Adjust quality as needed
        
        function compressImage($sourceFile, $destinationFile, $quality = 20) {
            // Create an image resource from the source file
            $sourceImage = imagecreatefromjpeg($sourceFile);
            
            // Save the compressed image to the destination file
            imagejpeg($sourceImage, $destinationFile, $quality);
            
            // Clean up resources
            imagedestroy($sourceImage);
        }
        
        compressImage($sourceFile, $destinationFile, $quality);

        // Construct the absolute URL for the compressed image

        $documentRoot = 'https://beautyappdemo.com/';
        $cleanedLink = str_replace(['[\"', '\\/', '\"', ']'], '', $destinationFile);
          $absoluteURL =$documentRoot .  $cleanedLink;
        // Update the $_POST['image'] to point to the absolute URL
        $_POST['image'] = $absoluteURL;
    }
    $info = M('stylist')->where(array('staffCode' => I('staffCode')))->find();
    if ($_GET['do'] == 'edit') {

        if ($info && $info['staffCode'] != $_GET['id']) {
            echo json_encode(array('status' => 110, 'msg' => 'Failed: This staff code already exists.'));
            exit();
        }
        $res = M('stylist')->where(array('staffCode' => $_GET['id']))->save($_POST);
    } else if ($_GET['do'] == 'add') {

        if ($info) {
            echo json_encode(array('status' => 110, 'msg' => 'Failed: This staff code already exists.'));
            exit();
        }

        $res = M('stylist')->add($_POST);
    }
    if ($res) {
        echo json_encode(array('status' => 111, 'msg' => 'Success'));
        exit();
    } else {
        echo json_encode(array('status' => 110, 'msg' => 'Failed'));
        exit();
    }
}
    
    public function del(){
        $id_arr=explode(",", $_GET['id']);
        foreach ($id_arr as $v) {
            $res=M('stylist')->where(array('staffCode'=>$v))->delete();
        }
        if($res){
                echo json_encode(array('status'=>111,'msg'=>'success'));exit();
            }else{
                echo json_encode(array('status'=>110,'msg'=>'fail'));exit();
            }
    }
}