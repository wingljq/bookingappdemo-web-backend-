<?php
namespace Admin\Controller;
use Think\Controller;
class LoginController extends Controller {
    public function index(){
		$this->display();
    }
	// public function loginData(){//登錄
	// 	$where['userName'] = I('userName');
	// 	$where['password']=md5(I('password'));
	// 	$info=M('admin')->where($where)->find();
	// 	if(!$info){
	// 		echo json_encode(array('code'=>2  ,'msg'=>' Account does not exist ' ,'data'=>(object)array() ));exit();
	// 	}
	// 	$info=M('admin')->where($where)->find();
	// 	//var_dump(M('user')->_sql());
	// 	if(!$info){
	// 		echo json_encode(array('code'=>4  ,'msg'=>' Please enter the correct user name and password ' ,'data'=>(object)array() ));exit();
	// 	}
	// 	$_SESSION['userInfo']=$info;
	// 	echo  json_encode(array('code'=>0  ,'msg'=>'success' ,'data'=>$info  )  ) ;exit();
	// }
	public function loginData(){//登錄
		$where['userName'] = I('userName');
		$where['password']=I('password');
		$info=M('admin')->where($where)->find();
		if(!$info){
			echo json_encode(array('code'=>2  ,'msg'=>'99                    Account does not exist ' ,'data'=> $where ));exit();
		}
		$info=M('admin')->where($where)->find();
		//var_dump(M('user')->_sql());
		if(!$info){
			echo json_encode(array('code'=>4  ,'msg'=>' Please enter the correct user name and password ' ,'data'=>(object)array() ));exit();
		}
		$_SESSION['userInfo']=$info;
		$_SESSION['useruid']=$info['uid'];
		echo  json_encode(array('code'=>0  ,'msg'=>'success' ,'data'=>$info  )  ) ;exit();
	}
	
	public function out(){
		$_SESSION['userInfo']['uid']='';
		echo  json_encode(array('code'=>0  ,'msg'=>'success'  )  ) ;exit();
	}
}