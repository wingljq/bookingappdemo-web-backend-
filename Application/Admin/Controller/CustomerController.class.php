<?php
namespace Admin\Controller;
use Think\Controller;
class CustomerController extends BaseController
{
    public function index_data(){
        $name=trim(I('name'));
        $where=array();
         $where['isdel']=1;
        if($name){
            $where['name|phone|address']=array( 'like' ,'%'.trim($_GET['name'].'%' ) );
        }
        $list=M('customer')->where($where)->page(I('page') ,I('pagesize')  )->order('id desc')->select();
        foreach ($list as $key => $value) {
        }
        $count=M('customer')->where($where)->count();
        echo  json_encode(array( 'status'=>111  ,'data'=>$list ,  'count'=>(int)$count ));
    }

    public function addshow(){
        if(I('id')){
            $info=M('customer')->where(array('id'=>I('id')))->find();
            unset($info['password']);
            $this->assign('info',$info);
        }
        $this->display();
    }

    public function save(){
        if($_GET['do']=='edit'){
            $_POST['rand']=rand(1,9999);
            $res=M('customer')->where(array('id'=>$_GET['id']))->save($_POST);
        }else if($_GET['do']=='add'){
            $res=M('customer')->add($_POST);
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
            $res=M('customer')->where(array('id'=>$v))->save(array('isdel'=>0));
        }
        if($res){
                echo json_encode(array('status'=>111,'msg'=>'success'));exit();
            }else{
                echo json_encode(array('status'=>110,'msg'=>'fail'));exit();
            }
    }
}