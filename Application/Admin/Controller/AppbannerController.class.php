<?php
namespace Admin\Controller;
use Think\Controller;
class AppbannerController extends BaseController {

	 public function index(){
	 	$this->display();
	}

	public function index_data(){
		header("Content-type: text/html; charset=utf-8");
		$where=array();
		
		$where['isdel']=1;
        $list=M('system')->field('homeBanner')->select();
		foreach($list as $key => $value){
			$list[$key]['homeBanner'] = C('url').$value['homeBanner'];
		}
        echo json_encode(array('data' =>$list  ,'count'=>(int)$count) );  
	}
	public function addshow(){
		if(I('id')){
			$info=M('system')->field('homeBanner')->select();

			$info = C('url').$info[0]['homeBanner'];

			$this->assign('info',$info);
		}
		$this->display();
	}
	
	
	public function save(){
		if($_FILES['homeBanner']['name']!=null){
            $_POST['homeBanner']= uploadImg($_FILES['homeBanner'],'appBanner');
        }

		if($_GET['do']=='edit'){
			
			$res=M('system')->where(array('id'=>1))->save($_POST);
		}

		if($res){
            echo json_encode(array('status'=>111,'msg'=>'success'));exit();
        }else{
            echo json_encode(array('status'=>110,'msg'=>'fail','data'=>$_POST));exit();
        }

	}
}