<?php
namespace Admin\Controller;
use Think\Controller;
class BranchController extends BaseController
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
        $list=M('branch')->where($where)->page(I('page') ,I('pagesize')  )->order('branchId')->select();
        foreach ($list as $key => $value) {
            
        }
        $count=M('branch')->where($where)->count();
        echo  json_encode(array( 'status'=>111  ,'data'=>$list ,  'count'=>(int)$count ));
    }

    public function addshow(){
        if(I('id')){
            $info=M('branch')->where(array('branchId'=>I('id')))->find();
           
            $this->assign('info',$info);
        }
        $this->display();
    }

    public function save(){
      
        $info=M('branch')->where(array('branchId'=>I('branchId')))->find();
        if($_GET['do']=='edit'){
           
            if($info && $info['branchId']!=$_GET['id']){
                echo json_encode(array('status'=>110,'msg'=>' fail '));exit();
            }
            $res=M('branch')->where(array('branchId'=>$_GET['id']))->save($_POST);
        }else if($_GET['do']=='add'){
           
            if($info){
                echo json_encode(array('status'=>110,'msg'=>' This branch already exists '));exit();
            }
           
            $res=M('branch')->add($_POST);
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
            $res=M('branch')->where(array('branchId'=>$v))->delete();
        }
        if($res){
                echo json_encode(array('status'=>111,'msg'=>'success'));exit();
            }else{
                echo json_encode(array('status'=>110,'msg'=>'fail'));exit();
            }
    }
}