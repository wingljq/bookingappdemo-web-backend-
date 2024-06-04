<?php

namespace Home\Controller;

use Think\Controller;

class GoodsController extends Controller
{
	//phone
	public function getAllGoods()
	{
		$where = array();
		if (I('name')) {
			$where['twName|cnName|name|place'] = array('like', '%' . trim(I('name') . '%'));
		}
		if ($_GET['type'] == 'app'){
			$list = M('goods')->where($where)->order('cateId')->select();
			$count = M('goods')->where($where)->count();
			
			foreach ($list as $key => $value) {
				$temp = array();
				$cate = M('cate')->where(array('cateId'=>$list[$key]['cateId']))->find();

				if( L('CURRENTLANGUAGE') == 'tw' && $value['twName'] != ''){
					$list[$key]['name'] = $value['twName'];
					$list[$key]['cateName'] = $cate['twName'];
				}else if( L('CURRENTLANGUAGE') == 'cn'&& $value['cnName'] != ''){
					$list[$key]['name'] = $value['cnName'];
					$list[$key]['cateName'] = $cate['twName'];
				}
				foreach (json_decode($list[$key]['coverImg']) as $key1 => $value1) {
					array_push($temp,C('url').$value1);
				}
				$list[$key]['coverImg'] = $temp;	
			}
			echo json_encode(array('status' => 111, 'data' => $list, 'count' => (int)$count));
			exit();
		}
		if (I('type')) {
			$where['type'] = I('type');
		}
		if (I('cateId')) {
			$where['cateId'] = I('cateId');
		}
		if (I('id')) {
			$where['id'] = I('id');
		}
		if (I('isdel')) {
			$where['isdel'] = I('isdel');
		}else $where['isdel'] = 1;
		$list = M('goods')->where($where)->order('cateId')->select();
		$count = M('goods')->where($where)->count();

		foreach ($list as $key => $value) {
			$cate = M('cate')->where(array('cateId'=>$list[$key]['cateId']))->find();
			$list[$key]['cateName'] = $cate['name'];
			
			if( L('CURRENTLANGUAGE') == 'tw' && $value['twName'] != ''){
				$list[$key]['name'] = $value['twName'];
				$list[$key]['cateName'] = $cate['twName'];
			}else if( L('CURRENTLANGUAGE') == 'cn'&& $value['cnName'] != ''){
				$list[$key]['name'] = $value['cnName'];
				$list[$key]['cateName'] = $cate['twName'];
			}
			$temp = array();
			foreach (json_decode($list[$key]['coverImg']) as $key1 => $value1) {
				array_push($temp,C('url').$value1);
			}
			
			$list[$key]['coverImg'] = $temp;	
		}
		echo  json_encode(array('status' => 111, 'data' => $list,  'count' => (int)$count));
	}

	public function  goodsListData()
	{
		$where['isdel'] = 1;
		$where['isShow'] = 1;
		if ($_REQUEST['goodsType']) {
			$where['type'] = $_REQUEST['goodsType'];
		}
		$list = M('goods', '', 'db')->where($where)->select();

		foreach ($list as $key => $value) {
			// $list[$key]['coverImg'] = json_decode($list[$key]['coverImg']);
		}
		echo json_encode(array('code' => 0, 'msg' => '獲取成功', 'data' => array('list' => $list ? $list : array())));
		exit();
	}
	public function addOrderService()
	{
		$data['addDate'] = date('Y-m-d H:i:s');
		$data['out_trade_no'] = date('Ymdhis') . rand(10000, 99999);
		$data['orderUserData'] = json_encode($_POST);
		$data['goodsType'] = I('goodsType');
		$data['orderServerDay'] = I('date');
		$data['orderServerHour'] = I('time');
		$data['goodsId'] = I('goodsId');
		$res = M('order', '', 'db')->add($data);
		M('orderitem', '', 'db')->add(array('orderId' => $res, 'goodsId' => I('goodsId'), 'bookTime' => I('date') . " " . I('time')));
		// M('orderitem','','db')->add(array('orderId'=>$res,'goodsId'=>$goodsInfo['id'],'number'=>1,'price'=>$goodsInfo['price'],'uid'=>$uid ));
		if ($res) {
			echo json_encode(array('code' => 0, 'msg' => '預約成功'));
			exit();
		} else {
			echo json_encode(array('code' => 2, 'msg' => '預約失敗'));
			exit();
		}
	}
	public function addOrderService_test()
	{
		$goodsInfo = M('goods', '', 'db')->find($_REQUEST['goodsId']);
		$data = M('order', '', 'db')->field("count(orderServerDay) as counts,orderServerHour,orderServerDay,goodsId")->where(array('goodsId' => $_REQUEST['goodsId']))->group("orderServerDay,orderServerHour")->select();
		$twoArr = array();
		foreach ($data as $value) {
			if ($value[counts] >= $goodsInfo['oneHourStock']) {
				$oneArr = array();
				$i++;
				$a = $value[counts] . " " . $value[orderServerHour] . " " . $value[orderServerDay] . " " . $value[goodsId];
				file_put_contents($i . ".txt", $a);
				$oneArr = array('counts' => $value[orderServerHour], 'orderServerDay' => $value[orderServerDay], 'goodsId' => $value[goodsId]);
				$twoArr[] = $oneArr;
			}
		}
		echo  json_encode(array('status' => 110, 'data' => $twoArr));
	}
}