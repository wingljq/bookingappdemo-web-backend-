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
			$where['name|twName|cnName|place'] = array('like', '%' . trim($_GET['name'] . '%'));
		}

		if ($_GET['type'] == 'app'){
			$list = M('goods')->where($where)->order('id DESC')->select();
			$count = M('goods')->where($where)->count();

			foreach ($list as $key => $value) {
				if( L('CURRENTLANGUAGE') == 'tw' && $value['twName'] != ''){
					$list[$key]['name'] = $value['twName'];
                    $list[$key]['desc'] = $value['twdesc'];

                }else if( L('CURRENTLANGUAGE') == 'cn'&& $value['cnName'] != ''){
					$list[$key]['name'] = $value['cnName'];
                    $list[$key]['desc'] = $value['cndesc'];
                }

                $temp = [];

                foreach (json_decode($list[$key]['coverImg']) as $key1 => $value1) {
                    if ($value1 !== null) {
                        // 将非空值添加到数组开头
                        array_push($temp,C('url') . $value1);
                    }
                }

                $list[$key]['coverImg'] = $temp;


			}
			echo json_encode(array('status' => 111, 'data' => $list, 'count' => (int)$count));
			exit();
		}

		file_put_contents('1.txt',L('CURRENTLANGUAGE'));
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


		$sort = I('sort');
		$order = [];
		if ($sort == 'sortByLowPrice') {
			$order['price']= 'desc';

		} else if ($sort == 'sortByHighPrice') {
			$order['price']= 'asc';
		} else if ($sort == 'Discount') {
			$order['name']= 'asc';
		} else if ($sort == 'LatestArrival') {
			$order['addDate']= 'asc';
		} else if ($sort == 'Popularity') {
			$order['id']= 'asc';
		} else {
			$order['id']= 'asc';
		}


        $cateId = explode(",", I('cateId'));


        if (I('cateIds') && is_array(I('cateIds'))) {
			$where['cateId'] = array("IN", I('cateIds'));
		}

		if (I('cateId') && is_array($cateId)) {
			$where['cateId'] = array("IN", I('cateId'));
		}



		$list = M('goods')->where($where)->page(I('page'), I('pagesize'))->order($order)->select();


		$count = M('goods')->where($where)->count();

		$cate = M('cate')->where('')->select();

		$district = M('district')->select();

		foreach ($list as $key => $value) {

			foreach ($cate as $key1=> $value1){
				if ($value['cateId'] == $value1['cateId']){
					if( L('CURRENTLANGUAGE') == 'tw' && $value['twName'] != ''){
						$list[$key]['industry'] = $value1['twName'];
					}else if( L('CURRENTLANGUAGE') == 'cn'&& $value['cnName'] != ''){
						$list[$key]['industry'] = $value1['cnName'];
					}else{
						$list[$key]['industry'] = $value1['name'];
					}

				}
			}

			if( L('CURRENTLANGUAGE') == 'tw' && $value['twName'] != ''){
				$list[$key]['name'] = $value['twName'];
			}else if( L('CURRENTLANGUAGE') == 'cn'&& $value['cnName'] != ''){
				$list[$key]['name'] = $value['cnName'];
			}else{
				$list[$key]['name'] = $value['name'];
			}


			if( L('CURRENTLANGUAGE') == 'tw' && $value['twdesc'] != ''){
				$list[$key]['desc'] = $value['twdesc'];
			}else if( L('CURRENTLANGUAGE') == 'cn'&& $value['cndesc'] != ''){
				$list[$key]['desc'] = $value['cndesc'];
			}else{
				$list[$key]['desc'] = $value['desc'];
			}


			$temp = array();
			foreach (json_decode($list[$key]['coverImg']) as $key1 => $value1) {
				array_push($temp,C('url').$value1);
			}

			foreach ($district as $key1=> $value1){
				if ($value['district'] == $value1['id']){
					if( L('CURRENTLANGUAGE') == 'tw' && $value1['twName'] != ''){
						$list[$key]['district_str'] = $value1['twName'];
					}else if( L('CURRENTLANGUAGE') == 'cn'&& $value1['cnName'] != ''){
						$list[$key]['district_str'] = $value1['cnName'];
					}else{
						$list[$key]['district_str'] = $value1['name'];
					}
				}
			}


			$list[$key]['coverImg'] = $temp;
		}

		$cateAllname = M('cate')->field('cateId,name,twName,cnName')->where('isdel=1')->select();

		foreach ($cateAllname as $key => $value) {
			if( L('CURRENTLANGUAGE') == 'tw' && $cateAllname[$key]['twName'] != ''){
				$cateAllname[$key]['name'] = $cateAllname[$key]['twName'];
			}else if( L('CURRENTLANGUAGE') == 'cn' && $list[$key]['cnName'] != ''){
				$cateAllname[$key]['name'] = $cateAllname[$key]['cnName'];
			}
		}

		echo  json_encode(array('status' => 111, 'data' => $list ? $list : [], 'cateAllname' => $cateAllname ? $cateAllname : [],  'count' => (int)$count));
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
			$list[$key]['coverImg'] = json_decode($list[$key]['coverImg']);
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
