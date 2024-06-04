<?php
namespace Admin\Controller;
use Think\Controller;
class SystemController extends BaseController {
     public function content(){
        $info=M('system')->where(array('id'=>1))->field('*')->find();
        $info['homeBanner']=explode(';', $info['homeBanner']);
        $this->assign('info',$info);
        $this->display();
    }

    public function save(){
        $_POST['homeBanner']=$_POST['homeBanner'];
        if($_FILES['aboutImage']['name']){
            $_POST['aboutImage']=uploadImg($_FILES['aboutImage'],'banner');
        }
         if($_FILES['latestoffersPagePictures']['name']){
            $_POST['latestoffersPagePictures']=uploadImg($_FILES['latestoffersPagePictures'],'banner');
        }
        $_POST['rand']=rand(1,9999);
        $res=M('system')->where(array('id'=>1))->save($_POST);
       // var_dump( M('system')->_sql() );
        if($res){
            echo json_encode(array('status'=>111,'msg'=>'success'));exit();
        }else{
            echo json_encode(array('status'=>110,'msg'=>'fail'));exit();
        }
    }

    public function chinese(){
        $info=M('pcset')->where(array('id'=>1))->field('*')->find();
        $this->assign('info',$info);
        $this->display();
    }

    public function english(){
        $info=M('pcset')->where(array('id'=>2))->field('*')->find();
        $this->assign('info',$info);
        $this->display();
    }

    public function pcsetSave(){
        $id=$_GET['id'];
        // $id=$_GET['id'];
        $data['facebook'] = $_POST['facebook'];
        $data['instagram'] = $_POST['instagram'];
        // $data['email'] = $_POST['email'];
        $data['whatsapp'] = $_POST['whatsapp'];
        $data['workTime'] = $_POST['workTime'];
        $data['workDate'] = $_POST['workDate'];
        $data['address1'] = $_POST['address1'];
        $data['address2'] = $_POST['address2'];
        $data['address3'] = $_POST['address3'];
        $data['phone'] = $_POST['phone'];
        $data['companyName1'] = $_POST['companyName1'];
        $data['companyName2'] = $_POST['companyName2'];
        $data['googleMapHtml'] = $_POST['googleMapHtml'];
      //  echo json_encode(array('status'=>111,'msg'=>$data));exit();
        $res=M('pcset')->where(array('id'=>1))->save($data);
        if($res){
            echo json_encode(array('status'=>111,'msg'=>'success'));exit();
        }else{
            echo json_encode(array('status'=>110,'msg'=>'fail','data'=>$_POST));exit();
        }
    }

    public function websitHtml(){
        $info=M('pcset')->find(1);
        $info2=M('pcset')->find(2);
        if($info['navTitle']){
            $navTitle=explode('|', $info['navTitle']);
            $info['navTitle']=$navTitle;
        }
        if($info2['navTitle']){
            $navTitle2=explode('|', $info2['navTitle']);
            $info['navTitle']=array_merge($info['navTitle'],$navTitle2  );
        }
        if(I('navTitle')){
            $htmlInfo=M('html')->where(array('navTitle'=>I('navTitle')))->find();
            $info['navTitle'] =array_diff($info['navTitle'],[I('navTitle')]);
        }
        //dump( $htmlInfo['content']);
        $this->assign('info',$info);
        $this->assign('navTitle',I('navTitle'));
        $this->assign('htmlInfo',$htmlInfo);
        $this->display();
    }

    public function saveHtml(){
        $_POST['navTitle']=I('navTitle');
        $_POST['content']=base64_encode($_POST['content']);
        $info=M('html')->where(array('navTitle'=>$_POST['navTitle']))->find();
        if($info){
            $res=M('html')->where(array('navTitle'=>$_POST['navTitle'] ))->save($_POST);
        }else{
            $res=M('html')->add($_POST);
        }
        if($res){
            echo json_encode(array('status'=>111,'msg'=>'success'));exit();
        }else{
            echo json_encode(array('status'=>110,'msg'=>'fail'));exit();
        }
    }

    public function aboutSet(){
        $lang=I('lang');
        $info=M('pcset')->where(array('id'=>$lang ))->find();
        $info['content']=$info['aboutHtml'];
        $this->assign('info',$info);
         $this->assign('lang',$lang);
        $this->display();
    }
    
    public function saveAbout(){
       $res= M('pcset')->where(array('id'=>$_POST['lang']))->save(array('aboutHtml'=>base64_encode($_POST['content']) ));
         if($res){
            echo json_encode(array('status'=>111,'msg'=>'success'));exit();
        }else{
            echo json_encode(array('status'=>110,'msg'=>'fail'));exit();
        }
    }

    public function saveAbout444(){
        echo json_encode(array('status'=>111,'msg'=>'success'));exit();
     }
}