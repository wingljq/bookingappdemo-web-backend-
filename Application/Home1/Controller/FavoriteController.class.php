<?php

namespace Home\Controller;

use Think\Controller;

class FavoriteController extends Controller
{

    public function getFav()
    {
        $data['uid'] = I('uid');
        $res = M('favorite')->where(array('uid' => I('uid')))->select();

        foreach ($res as $key => $value) {
            if (L('CURRENTLANGUAGE') == 'tw') {
                $res[$key]['name'] = $res[$key]['twName'];
            } else if (L('CURRENTLANGUAGE') == 'cn') {
                $res[$key]['name'] =  $res[$key]['cnName'];
            }
        }
        if ($res) {
            echo json_encode(array('status' => 1, 'data' => $res));
            exit;
        }
    }
    public function isFav()
    {

        $where = array();
        $where['uid'] = I('uid');
        $where['goodsId'] = I('goodsId');
        $res = M('favorite')->where($where)->find();

        if ($res) {
            echo json_encode(array('status' => 1, 'data' => $res));
            exit;
        } else {
            echo json_encode(array('status' => 2));
            exit;
        }
    }
    public function addFav()
    {
        $data['uid'] = I('uid');
        $data['goodsId'] = I('goodsId');
        $res = M('favorite')->add($data);
        if ($res) {
            echo json_encode(array('status' => 111));
        }
    }

    public function delFav()
    {
        $where = array();
        $where['uid'] = I('uid');
        $where['goodsId'] = I('goodsId');

        $res = M('favorite')->where($where)->delete();
        if ($res) {
            echo json_encode(array('status' => 111));
        }
    }
}
