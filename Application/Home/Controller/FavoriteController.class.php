<?php

namespace Home\Controller;

use Think\Controller;

class FavoriteController extends Controller
{

    public function getFav()
    {
        $data['uid'] = I('uid');
		$res = M('favorite')->where(array('uid'=>I('uid'),'status' => 0))->select();
        
        if($res){
            echo json_encode(array( 'status'=>1,'data'=>$res ));exit;
        }
    }
    public function isFav()
    {

        $where = array();
        $where['uid']=I('uid');
        $where['goodsId'] = I('goodsId');
		$res = M('favorite')->where($where)->find();

        if($res){
            echo json_encode(array( 'status'=>1,'data'=>$res ));exit;
        }else {
            echo json_encode(array( 'status'=>2 ));exit;
        }
    }
    public function addFav()
    {
        $data['uid'] = I('uid');
        $data['goodsId'] = I('goodsId');
		$res = M('favorite')->add($data);
        if($res){
            echo json_encode(array( 'status'=>111 ));
        }

    }

    public function delFav()
    {
        $where = array();
        $where['uid']=I('uid');
        $where['goodsId'] = I('goodsId');

        $res = M('favorite')->where($where)->delete();
        if($res){
            echo json_encode(array( 'status'=>111 ));
        }
    }

}