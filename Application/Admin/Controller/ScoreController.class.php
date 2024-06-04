<?php
namespace Admin\Controller;
use Think\Controller;
class ScoreController extends BaseController {
    
     public function index_data(){

        $where=array();
        $list=M('score')->where($where)->page(I('page') ,I('pagesize')  )->order('id desc')->select();

        $getNum=M('score')->where(" score > 0 ")->sum('score');
        $outNum=M('score')->where(" score < 0 ")->sum('score');
        $outNum=(string)$outNum;
        $outNum=str_replace('-','',$outNum);

       if(!$getNum){
           $changePer=$changePer?$changePer:"0"; 
       }else{
            $changePer= (round($outNum/$getNum ,2)*100)."%";
       }

       if(!$outNum){
       	     $changePer=0;
       }

        foreach ($list as $key => $value) {

            //$list=M('yhcard')->query("SELECT sum(score) as num ,uid FROM `tp_getyhcard`  group by uid ORDER BY num desc");
            $userInfo=M('user')->where(array('uid'=>$value['uid']))->find();

            if($value['score']>0){
                $list[$key]['getNum']=$value['score'];
                $list[$key]['outNum']='';
            }

            if($value['score']<0){
                $list[$key]['getNum']='';
                $list[$key]['outNum']=$value['score'];
            }

            //$list[$key]['name']=$userInfo['firstName'].' '.$userInfo['lastName'];
            $list[$key]['name']=$userInfo['name'];
        }
            //var_dump($list );


        $count=M('score')->where($where)->count();

        $systemInfo=M('system')->find(1);

        echo  json_encode(array( 'status'=>111  ,'data'=>$list ,  'count'=>(int)$count,'systemInfo'=>$systemInfo,'getNum'=>$getNum?$getNum:0,'outNum'=>$outNum?$outNum:0,'changePer'=>$changePer    ));

    }
    
    public function addshow(){
        
        if(I('id')){
            $info=M('score')->where(array('id'=>I('id')))->field('*')->find();
            $this->assign('info',$info);
        }
        $this->display();
    }
    
    public function save(){
        

        if($_FILES['image']['name']!=null){
            $_POST['image']= uploadImg($_FILES['image']);
        }

        if($_GET['do']=='edit'){
            $_POST['rand']=rand(1,9999);
            $res=M('score')->where(array('id'=>$_GET['id']))->save($_POST);
        }else if($_GET['do']=='add'){
            $_POST['addDate']=date('Y-m-d H:i:s');
            $res=M('score')->add($_POST);
        }
        
        if($res){
            echo json_encode(array('status'=>111,'msg'=>'success'));exit();
        }else{
            echo json_encode(array('status'=>110,'msg'=>'fail'));exit();
        }
        
        
    }


    public function saveSysInfo(){


            $_REQUEST['rand']=rand(1,9999);

            $res=M('system')->where(array('id'=>1))->save($_REQUEST);


             echo json_encode(array('status'=>111,'msg'=>'success'));exit();



    }



    
  
    
    
    public function del(){

        $id_arr=explode(",", $_GET['id']);

        foreach ($id_arr as $v) {
            $res=M('score')->where(array('id'=>$v))->save(array('isdel'=>0));
        }

        if($res){
                echo json_encode(array('status'=>111,'msg'=>'success'));exit();
            }else{
                echo json_encode(array('status'=>110,'msg'=>'fail'));exit();
            }
    }

    
}