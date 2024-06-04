<?php
namespace Admin\Controller;
use Think\Controller;
class ShopController extends BaseController {
     public function index_data(){
        $where=array();
         $where['isdel']=1;
        if(I('name')){
            $where['name|address|desc1']=array( 'like' ,'%'.trim($_GET['name'].'%' ) );
        }
        $list=M('shop')->where($where)->page(I('page') ,I('pagesize')  )->order('id desc')->select();
        foreach ($list as $key => $value) {
        }
        $count=M('shop')->where($where)->count();
        echo  json_encode(array( 'status'=>111  ,'data'=>$list ,  'count'=>(int)$count ));
    }

    public function addshow(){
        if(I('id')){
            $info=M('shop')->where(array('id'=>I('id')))->field('*')->find();
            $info['desc1']=base64_decode($info['desc1']);
            $info['desc2']=base64_decode($info['desc2']);
            $this->assign('info',$info);
        }
        $this->display();
    }

    public function save(){
        if($_FILES['image']['name']!=null){
            $_POST['image']= uploadImg($_FILES['image'],'shop');
        }
        $_POST['desc1']=base64_encode($_POST['desc1']);
        $_POST['desc2']=base64_encode($_POST['desc2']);
        if($_GET['do']=='edit'){
            $_POST['rand']=rand(1,9999);
            $res=M('shop')->where(array('id'=>$_GET['id']))->save($_POST);
        }else if($_GET['do']=='add'){
            $_POST['addDate']=date('Y-m-d H:i:s');
            $res=M('shop')->add($_POST);
        }
        if($res){
            echo json_encode(array('status'=>111,'msg'=>'success'));exit();
        }else{
            echo json_encode(array('status'=>110,'msg'=>'fail'));exit();
        }
    }

    public function coverUpload($image){//封面圖單個
        $upload = new \Think\Upload();// 實例化上傳類
        $upload->maxSize   =     3145728 ;// 設置附件上傳大小
        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 設置附件上傳類型
        $upload->savePath  =      'Public/Uploads/goodImg/'; // 設置附件上傳目錄
        $upload->rootPath  =      getcwd().'/';
        $info   =   $upload->uploadOne($image);
        if(!$info) {// 上傳錯誤提示錯誤信息
            echo json_encode(array('status'=>110,'msg'=>$upload->getError()));exit();
        }else{// 上傳成功
            $res=$info['savepath'].$info['savename'];
            $image = new \Think\Image();
            $image->open($res);
            $image->thumb(500,500 ,\Think\Image::IMAGE_THUMB_CENTER)->save($res); 
           return "http://".$_SERVER['HTTP_HOST'].__ROOT__."/".$info['savepath'].$info['savename'];
        }       
    }

    public function bannerUpload(){//多個詳細頁輪播
        $upload = new \Think\Upload();// 實例化上傳類
        $upload->maxSize   =     3145728 ;// 設置附件上傳大小
        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 設置附件上傳類型
        $upload->savePath  =      'Public/Uploads/goodImg/'; // 設置附件上傳目錄
        $upload->rootPath  =      getcwd().'/';
        $info   =   $upload->uploadOne($_FILES['file']);
        if(!$info) {// 上傳錯誤提示錯誤信息
            echo json_encode(array('status'=>110,'msg'=>$upload->getError()));exit();
        }else{// 上傳成功
            $res=$info['savepath'].$info['savename'];
            // $image = new \Think\Image();
            // $image->open($res);
            // $image->thumb(600, 800,\Think\Image::IMAGE_THUMB_CENTER)->save($res); 
            die(json_encode(array('status'=>111,'msg'=>'success','path'=>"http://".$_SERVER['HTTP_HOST'].__ROOT__."/".$info['savepath'].$info['savename'])));
        }       
    }

    public function detailUpload($conimages){//多個詳細頁輪播
        $_FILES['detailConImg']=$conimages;
        for ($i=0; $i < (count($_FILES['detailConImg']['name']) ); $i++) { 
            //var_dump($i);
            $onImage=[];
            $onImage=array('detailConImg'=>array(
                'name'=>$_FILES['detailConImg']['name'][$i],
                'type'=>$_FILES['detailConImg']['type'][$i],
                'tmp_name'=>$_FILES['detailConImg']['tmp_name'][$i],
                'error'=>$_FILES['detailConImg']['error'][$i],
                'size'=>$_FILES['detailConImg']['size'][$i],
                 ));
            $imageArr[]=$onImage;
        }
        $allUrl='';
        for ($i=0; $i <count($imageArr) ; $i++) {
            $upload = new \Think\Upload();
            $upload->maxSize   =     3145728 ;
            $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');
            $upload->savePath  =      'Public/Uploads/goodImg/'; 
            $upload->rootPath  =      getcwd().'/';
            $info   =   $upload->uploadOne($imageArr[$i]['detailConImg']);
            if(!$info) {
                echo json_encode(array('status'=>110,'msg'=>$upload->getError()));exit();
            }else{
                $res=$info['savepath'].$info['savename'];
                $oneUrl="http://".$_SERVER['HTTP_HOST'].__ROOT__."/".$info['savepath'].$info['savename'].';';
                $allUrl=$allUrl.$oneUrl;
            }
        }
        $allUrl=substr($allUrl, 0,-1);
        return $allUrl;
    }
    
    public function del(){
        $id_arr=explode(",", $_GET['id']);
        foreach ($id_arr as $v) {
            $res=M('shop')->where(array('id'=>$v))->save(array('isdel'=>0));
        }
        if($res){
                echo json_encode(array('status'=>111,'msg'=>'success'));exit();
            }else{
                echo json_encode(array('status'=>110,'msg'=>'fail'));exit();
            }
    }
}