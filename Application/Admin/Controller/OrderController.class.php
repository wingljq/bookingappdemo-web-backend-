<?php

namespace Admin\Controller;

use Think\Controller;

class ontroller extends BaseController
{

    public function index()
    {

        $this->display();
    }

    public function index_data()
    {
        $name=trim(I('name'));
        
        $month=date('Y-m');
		$endDay=date("Y-m-d 23:59:59",strtotime($month."-01") );
		$lastMonthBeg=date('Y-m-01 00:00:00',strtotime($endDay));
		$lastMonthBeg1=date('Y-m-01 00:00:00',strtotime($lastMonthBeg. '-11 month'));
		$lastMonthEnd=date('Y-m-d 23:59:59',strtotime("$lastMonthBeg +1 month -1 day"));

        $where['addDate']=array('between',[$lastMonthBeg1,$lastMonthEnd]);

        $list = M('order')->where($where)->page(I('page'), I('pagesize'))->order('addDate desc')->select();
        foreach ($list as $key => $value) {
            if ($value['payStatus'] == 0) {
                $list[$key]['payStatus'] = "Pending";
            } else if ($value['payStatus'] == 1) {
                $list[$key]['payStatus'] = "Paid";
            } else if ($value['payStatus'] == 2) {
                $list[$key]['payStatus'] = "Refound";
            }

            $list[$key]['totalamt'] = M('order')->where(array('uid' => $value['uid'], 'out_trade_no' => $list[$key]['out_trade_no']))->sum('allMoney');

            $userInfo = M('user')->where(array('uid' => $value['uid']))->find();
            $list[$key]['name'] = $userInfo['name'];
            $list[$key]['email'] = $userInfo['email'];
            $list[$key]['tel'] = $userInfo['tel'];
        }

        $count = M('order')->where($where)->count();

        
        $temp = [];
        foreach ($list as $key => $value) {
            $input = preg_quote($name, '~'); // don't forget to quote input string!
            $result = preg_grep('~' . $input . '~', $list[$key]);
            if ($result){
                $temp.array_push($temp,$list[$key]);
            }
        }

        if($name){
            $list = $temp;
        }
        echo json_encode(array('status' => 111, 'data' => $list,  'count' => (int)$count));
    }


    public function orderDetailList()
    {
        $out_trade_no = $_REQUEST['orderId'];

		$list=M('order')->where(array('out_trade_no'=>$out_trade_no))->select();
		
        $where['orderId'] = $list[0]['id'];
		$orderItem=M('orderitem')->where($where)->select();
		$totalprice = 0;
		
        foreach ($orderItem as $key => $value) {
			$res=M('goods')->where(array('id'=>$orderItem[$key]['goodsId']))->field('name,coverImg')->find();		
			$orderItem[$key]['name'] = $res['name'];
			$orderItem[$key]['coverImg'] = C('url').json_decode($res['coverImg'])[0];
            $orderItem[$key]['totalamt']=(int) $orderItem[$key]['number'] * (int)$orderItem[$key]['price'];
			$totalprice = $totalprice + $orderItem[$key]['totalamt'];
		}

        echo json_encode(array('status' => 111, 'data' => $orderItem ,'count' => 0));
    }

    // public function del()
    // {
    // //     $id_arr = explode(",", $_GET['id']);
    // //     foreach ($id_arr as $v) {
    // //         $res = M('order')->where(array('orderId' => $v))->delete();
    // //     }
    // //     if ($res) {
    // //         echo json_encode(array('status' => 111, 'msg' => 'success'));
    // //         exit();
    // //     } else {
    // //         echo json_encode(array('status' => 110, 'msg' => 'fail'));
    // //         exit();
    // //     }
    // }

    public function delOrder(){
        $id_arr=explode(",", $_GET['id']);
        foreach ($id_arr as $v) {
            $res=M('order')->where(array('orderid'=>$v))->save(array('isdel'=>1));
        }
        if($res){
                echo json_encode(array('status'=>111,'msg'=>'success'));exit();
        }else{
            echo json_encode(array('status'=>110,'msg'=>'fail'));exit();
        }
    }



    public function refound()
    {

        $orderId = I('orderId');

        $orderInfo = M('order')->where(array('orderId' => $orderId))->find();

        if (!$orderInfo) {
            echo json_encode(array('status' => 110, 'msg' => '訂單不存在'));
            exit();
        }

        if ($orderInfo['afterStaus'] == 2 ||  $orderInfo['orderStatus'] == 3) {
            echo json_encode(array('status' => 110, 'msg' => '該訂單未付款或者已退過了'));
            exit();
        }


        if ($orderInfo['appid'] == 1) {
            $appid = 'wx39bd3bcace6fb5db';
        } else {
            $appid = 'wxd89196ce19ac3fbe';
        }
        $key = 'asdfghj24rfvsdfaind523fakdadlw13';
        $mch_id = '1535956111';

        $out_trade_no = $orderInfo['out_trade_no'];
        $out_refund_no = date('YmdHis') . rand(111111, 999999) . $orderInfo['uid'];

        $total_fee = $orderInfo['money'] * 100;

        $refund_fee = $orderInfo['money'] * 100;

        $refund_desc = '安全套退款' . $out_trade_no;

        import("Org.Util.refund");
        $refoundPay = new \refund($appid, $key, $mch_id, $out_trade_no, $out_refund_no, $total_fee, $refund_fee, $refund_desc);
        $res = $refoundPay->tuikuan();


        if ($res['return_code'] == 'SUCCESS' &&  $res['return_msg'] == 'OK' && $res['result_code'] == 'SUCCESS') {

            $doRes = M('order')->where(array('orderId' => $orderId))->save(array('out_refund_no' => $out_refund_no, 'refoundDate' => date('Y-m-d H:i:s'), 'refundMoney' => $orderInfo['price'],  'orderStatus' => 3,  'afterStaus' => 2));


            if ($orderInfo['afterStaus'] == 0 &&  $orderInfo['isDivi'] == 1) {
                M('device')->where(array('device_id' => $orderInfo['device_id']))->setInc('stock');
            }

            if ($orderInfo['money'] > 0.01 && $orderInfo['isDivi'] == 1) {

                $incomeList = M('income')->where(array('orderId' => $orderId))->select();
                foreach ($incomeList as $key => $value) {
                    M('income')->add(array(
                        'orderId' => $value['orderId'],
                        'uid' => $value['uid'],
                        'adminUid' => $value['adminUid'],
                        'orderMoney' => $value['orderMoney'],
                        'diviMoney' => $value['diviMoney'],
                        'addDate' => date('Y-m-d H:i:s'),
                        'isCash' => 0,
                        'type' => 0,
                        'event' => '用戶退款',
                    ));
                }
            }

            if ($doRes) {
                echo json_encode(array('status' => 111, 'msg' => '退款成功'));
                exit();
            } else {
                echo json_encode(array('status' => 1101, "msg" => "失敗" . $res['err_code_des'] ? $res['err_code_des'] : $res['return_msg']));
                exit();
            }
        } else {
            echo json_encode(array('status' => 1102, "msg" => "失敗"));
            exit();
        }
    }


    public function devComm()
    {
        $this->assign('orderId', I('id'));
        $this->display();
    }

    public function devCommList()
    {
        $where['orderId'] = I('orderId');
        $list = M('deverror')->where($where)->select();
        $count = M('order')->where($where)->count();
        echo  json_encode(array('status' => 111, 'data' => $list,  'count' => (int)$count));
    }

    public function outOrderList()
    {
        $areaCount = M('order')->where("orderStatus=2")->count();

        $pagesize = 20000;
        $pageCount = ceil($areaCount / $pagesize);

        $arr = array();
        for ($i = 0; $i < $pageCount; $i++) {

            $arritem = array('begNUm' => $i * $pagesize, 'endNum' => ($i + 1) * $pagesize, 'index' => $i + 1, 'size' => $pagesize);
            $arr[] = $arritem;
        }

        //dump($arr);
        $this->assign('arr', $arr);
        $this->display();
    }

    public function calenList()
    {
        $list = M('order')->where(array('goodsType' => 3))->select();
        $twoArr = array();
        foreach ($list as $key => $value) {
            $oneArr = array();
            $goodsInfo = M('goods')->find($value['goodsId']);

            $endDate = date('Y-m-d H:i:s', strtotime($value['orderServerDay'] . ' ' . $value['orderServerHour']) + $goodsInfo['hour'] * 3600);
            $endDate = str_replace(' ', 'T', $endDate);

            if ($value['isAgree'] == 0) {
                $agree = '待接單';
            } else {
                $agree = '已接單';
            }
            $start = date('Y-m-d H:i:s', strtotime($value['orderServerDay'] . ' ' . $value['orderServerHour'] . ':00'));

            $startDate = str_replace(' ', 'T', $start);
            $oneArr = array(
                'title' => $goodsInfo['name'] . "（" . $agree . "）",
                'start' => $startDate,
                'end' => $endDate,


                'duration' => $goodsInfo['hour'], 'className' => 'red', 'orderId' => $value['id'], 'isAgree' => $value['isAgree'], 'color' => $goodsInfo['color']
            );

            $twoArr[] = $oneArr;
        }
        echo  json_encode(array('status' => 110, 'data' => $twoArr));
    }

    public function agree()
    {

        $id = $_REQUEST['orderId'];
        M('order')->where(array('id' => $id))->save(array('isAgree' => 1));
        $info = M('order')->where(array('id' => $id))->find();
        $yuyueInfo = json_decode($info['orderUserData'], true);
        $goodsInfo = M('goods')->where(array('id' => $yuyueInfo['goodsId']))->find();
        $userInfo = M('user')->where(array('uid' => $info['uid']))->find();
        $token = '';

        if ($userInfo['iosToken']) {
            $token = $userInfo['iosToken'];
        } else if ($userInfo['androidToken']) {
            $token = $userInfo['androidToken'];
        }

        $content = "您好，" . $goodsInfo['name'] . "預約成功，時間：" . $yuyueInfo['orderDay'] . "日" . $yuyueInfo['orderHour'];

        $url = "http://" . $_SERVER['HTTP_HOST'] . "/insmile/push/test_push.php?token=" . $token . "&content=" . urlencode($content);

        file_get_contents($url);
        echo  json_encode(array('status' => 111, 'msg' => 'save success'));
        exit;
    }
    public function orderItemData(){
        
        $list = M('orderitem')->group('goodsId')
            ->field("goodsId, count(goodsId) as count")
            ->select();
        
        foreach ($list as $key => $value) {
            $goodsInfo=M('goods')->where(array('id'=>$value['goodsId']))->find();
            $list[$key]['goodsinfo']=$goodsInfo;
        }
        echo json_encode(array( 'status'=>111  ,'data'=>$list,));
    
    }
}
