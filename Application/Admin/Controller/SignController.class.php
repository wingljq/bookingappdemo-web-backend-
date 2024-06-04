<?php
namespace Admin\Controller;
use Think\Controller;
class SignController extends BaseController {
     public function index_data(){
        $where=array();
         $where['tp_signlist.isdel']=1;
        if(I('name')){
            // $where['tp_user.userName|tp_user.firstName|tp_user.lastName']=array( 'like' ,'%'.trim($_GET['name'].'%' ) );
        }
        $list=M('signlist')->join("tp_user on  tp_signlist.uid=tp_user.uid")->where($where)->page(I('page') ,I('pagesize')  )->order('tp_signlist.id desc')->select();    
        $count=M('signlist')->where($where)->count();
        echo  json_encode(array( 'status'=>111  ,'data'=>$list ,  'count'=>(int)$count ));
    }

    public function addshow(){
        if(I('id')){
            $info=M('signlist')->where(array('id'=>I('id')))->field('*')->find();
            $this->assign('info',$info);
        }
        $this->display();
    }

    public function save(){
        if($_GET['do']=='edit'){
            $_POST['rand']=rand(1,9999);
            $res=M('signlist')->where(array('id'=>$_GET['id']))->save($_POST);
        }else if($_GET['do']=='add'){
            $_POST['addDate']=date('Y-m-d H:i:s');
            $res=M('signlist')->add($_POST);
        }
        if($res){
            echo json_encode(array('status'=>111,'msg'=>'success'));exit();
        }else{
            echo json_encode(array('status'=>110,'msg'=>'fail'));exit();
        }
    }

    public function setSave(){
        if($_GET['do']=='edit'){
            $_POST['rand']=rand(1,9999);
            $res=M('signset')->where(array('id'=>1))->save($_POST);
        }else if($_GET['do']=='add'){
            $_POST['addDate']=date('Y-m-d H:i:s');
            $res=M('signset')->add($_POST);
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
            $res=M('signlist')->where(array('id'=>$v))->save(array('isdel'=>0));
        }
        if($res){
                echo json_encode(array('status'=>111,'msg'=>'success'));exit();
            }else{
                echo json_encode(array('status'=>110,'msg'=>'fail'));exit();
            }
    }
    
    public function set(){
        $info=M('signset')->find(1);
        $this->assign('info',$info);
        $this->display();
    }
}