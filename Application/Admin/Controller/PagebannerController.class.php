<?php
namespace Admin\Controller;
use Think\Controller;
class PagebannerController extends BaseController {

	 public function index(){
	 	$this->display();
	}

	public function index_data(){
		header("Content-type: text/html; charset=utf-8");
		$where=array();
		$where['isdel']=1;
		if($_GET['name']){
			$where['title']=array( 'like' ,'%'.trim($_GET['name'].'%' ) );
		}

		$count=M('pagebanner')->where($where)->count();
        $list=M('pagebanner')->where($where)->select();
		foreach($list as $key => $value){
			$list[$key]['image'] = C('url').$value['image'];
		}
        // $list=$this->tree($list);
        echo json_encode(array('data' =>$list  ,'count'=>(int)$count) );  
	}

	public function addshow(){
		$list=M('pagebanner')->field('*')->select();
        // $list=$this->tree($list);
        $this->assign('cate_list',$list);
		if(I('id')){
			$info=M('pagebanner')->where(array('id'=>I('id')))->field('*')->find();
			$info['image'] = C('url').$info['image'];

			$this->assign('info',$info);
		}
		$this->display();
	}
	
	public function save(){
		if($_FILES['image']['name']!=null){
            $_POST['image']= uploadImg($_FILES['image'],'goods');
        }
		if($_GET['do']=='edit'){
			$res=M('pagebanner')->where(array('id'=>$_GET['id']))->save($_POST);
		}else if($_GET['do']=='add'){
			$res=M('pagebanner')->add($_POST);
		}

		if($res){
            echo json_encode(array('status'=>111,'msg'=>'success'));exit();
        }else{
            echo json_encode(array('status'=>110,'msg'=>'fail','data'=>$_POST));exit();
        }

	}

	public function del(){

        $id_arr=explode(",", $_GET['id']);

        foreach ($id_arr as $v) {
        	$info=M('pagebanner')->where(array('id'=>$v))->find();
            $res=M('pagebanner')->where(array('id'=>$v))->save(array('isdel'=>0));
        }

		if($res){
                echo json_encode(array('status'=>111,'msg'=>'success'));exit();
            }else{
                echo json_encode(array('status'=>110,'msg'=>'fail'));exit();
            }
	}
}