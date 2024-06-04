<?php
namespace Admin\Controller;
use Think\Controller;
class AdminController extends BaseController
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
        $list=M('admin')->where($where)->page(I('page') ,I('pagesize')  )->order('uid desc')->select();
        foreach ($list as $key => $value) {
        }
        $count=M('admin')->where($where)->count();
        echo  json_encode(array( 'status'=>111  ,'data'=>$list ,  'count'=>(int)$count ));
    }

    public function addshow(){
        if(I('id')){
            $info=M('admin')->where(array('staffCode'=>I('id')))->find();
            unset($info['password']);
            $this->assign('info',$info);
        }

        $this->display();
    }


public function saveStaff()
{
    $list = M('stylist')->where(['staffStatus' => '1'])->select();
    $response = array();
    $existingAccounts = array(); // Store existing accounts
    
    foreach ($list as $key => $value) {
        $staffCode = $value['staffCode'];
        $staffNameEn = $value['staffNameEn'];
        
        $accountName = $staffCode . $staffNameEn;
        
        if (in_array($accountName, $existingAccounts)) {
            $response[] = array('status' => 120, 'msg' => 'This account already exists');
            continue; // Skip account creation for this staff member
        }
        
        // Check if the account already exists
        $existingAccount = M('admin')->where("userName = '$accountName'")->find();
        
        if ($existingAccount) {
            $existingAccounts[] = $accountName; // Add account to existing accounts
            $response[] = array('status' => 120, 'msg' => 'This account already exists');
            continue; // Skip account creation for this staff member
        }
        
        $existingAccounts[] = $accountName; // Add account to existing accounts
        
        $password = str_pad(rand(0, 99999), 6, '0', STR_PAD_LEFT);
        $userName = $accountName;
        $name = $staffNameEn;
        
        $data = array(
            'name' => $name,
            'userName' => $userName,
            'staffCode' => $staffCode,
            'password' => $password,
            'addDate' => date('Y-m-d H:i:s')
        );
        
        $res = M('admin')->add($data);
        
        if ($res) {
            $response[] = array('status' => 111, 'msg' => 'Account created successfully');
        } else {
            $response[] = array('status' => 110, 'msg' => 'Failed to create account');
        }
    }
    
    echo json_encode($response);
}



    public function save(){
        if($_POST['password']){
            $_POST['password']=($_POST['password']);
        }else{
            unset($_POST['password']);
        }

     
        $info=M('admin')->where(array('userName'=>I('userName')))->find();
        if($_GET['do']=='edit'){
            $_POST['rand']=rand(1,9999);
            if($info && $info['uid']!=$_GET['id']){
                echo json_encode(array('status'=>110,'msg'=>' The email account protection already exists '));exit();
            }
            $res=M('admin')->where(array('uid'=>$_GET['id']))->save($_POST);
        }else if($_GET['do']=='add'){
            if(!$_POST['password']){
                echo json_encode(array('status'=>110,'msg'=>' Please enter the correct password '));exit();
            }
            if($info){
                echo json_encode(array('status'=>110,'msg'=>' The email account protection already exists '));exit();
            }
            $_POST['addDate']=date('Y-m-d H:i:s');
            $res=M('admin')->add($_POST);
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
            $res=M('admin')->where(array('uid'=>$v))->delete();
        }
        if($res){
                echo json_encode(array('status'=>111,'msg'=>'success'));exit();
            }else{
                echo json_encode(array('status'=>110,'msg'=>'fail'));exit();
            }
    }
}