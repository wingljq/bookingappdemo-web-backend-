<?php
namespace Admin\Controller;
use Think\Controller;
class UserController extends BaseController
{
    public function index_data(){
        $where=array();
        $where['isdel']=0;
        $list=M('user')->where($where)->page(I('page') ,I('pagesize')  )->order('uid desc')->select();
        foreach ($list as $key => $value) {
           // $res=file_get_contents($value['headImg']);
        }
        $count=M('user')->where($where)->count();

        $temp = [];
        $name=trim(I('name'));
        foreach ($list as $key => $value) {
            $input = preg_quote($name, '~'); // don't forget to quote input string!
            $result = preg_grep('~' . $input . '~', $list[$key]);
            if ($result){
                $temp.array_push($temp,$list[$key]);
            }
        }
        if($name){
            $list = $temp;
        }
        echo  json_encode(array('status'=>111 ,'data' => $list ,'count'=>(int)$count ));
    }
    public function addshow(){
        if(I('id')){
            $info=M('user')->where(array('uid'=>I('id')))->find();
            unset($info['password']);
            $this->assign('info',$info);
        }
        $this->display();
    }
    public function save(){
        if($_FILES['headImg']['name']!=null){
            $_POST['headImg']= uploadImg($_FILES['headImg'],'user');
        }
        if($_POST['password']){
            $_POST['password']=($_POST['password']);
        }else{
            unset($_POST['password']);
        }
        $info=M('user')->where(array('email'=>I('email')))->find();
        if($_GET['do']=='edit'){
            $_POST['rand']=rand(1,9999);
            if($info && $info['uid']!=$_GET['id']){
                echo json_encode(array('status'=>110,'msg'=>' The email account protection already exists '));exit();
            }
            $res=M('user')->where(array('uid'=>$_GET['id']))->save($_POST);
        }else if($_GET['do']=='add'){
            if($info){
                echo json_encode(array('status'=>110,'msg'=>' The email account protection already exists '));exit();
            }
            if(!$_POST['password']){
                echo json_encode(array('status'=>110,'msg'=>' Please enter the correct password '));exit();
            }
            $_POST['regDate']=date('Y-m-d H:i:s');
            // $_POST['shareNum']=randStr(6);
            $res=M('user')->add($_POST);
        }
        if($res){
            echo json_encode(array('status'=>111,'msg'=>'success'));exit();
        }else{
            echo json_encode(array('status'=>110,'msg'=>'fail'));exit();
        }
    }
      public function del(){
        $id_arr=explode(",", $_GET['id']);
        foreach ($id_arr as $v) {
            $res=M('user')->where(array('uid'=>$v))->save(array('isdel'=>1));
        }
        if($res){
            echo json_encode(array('status'=>111,'msg'=>'success'));exit();
        }else{
            echo json_encode(array('status'=>110,'msg'=>'fail'));exit();
        }
    }
}