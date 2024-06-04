<?php

namespace Home\Controller;

use Think\Controller;

require_once('vendor/stripe/stripe-php/init.php');
class CartController extends Controller
{

	public function getLocation()
	{
		$where = array();
		$where['isdel'] = '1';
		$location = M('location')->where($where)->order('id')->select();

		$locations = M('locations')->where($where)->order('id')->select();
		$data = array();
		foreach ($location as $l) {
			$data[$l['name']] = [];
		}
		foreach ($locations as $item) {

			foreach ($location as $l) {
				if ($item['cateId'] == $l['id']) {
					array_push($data[$l['name']], $item);
				}
			}
		}


		echo json_encode(array('data' => $data));
	}
	public function getAllCart()
	{
		$where = array();
		if (isset($_GET['uid'])) {
			$where['uid'] = I('uid');
		} else if ($_SESSION['uid']) {
			$where['uid'] = $_SESSION['uid'];
		}
		if (isset($_GET['status'])) {
			$where['status'] = I('status');
		}else{
			$where['status'] = 0;
		}
		
		if($where['uid']){
			$list = M('cart')->where($where)->order('cartId')->select();
			$count = M('cart')->where($where)->count();
			foreach ($list as $key => $value) {
				$goods = M('goods')->where(array("id"=>$list[$key]['goodsId']))->find();
				$list[$key]['coverImg'] =M('goods')->where(array("id"=>$list[$key]['goodsId']))->find()['coverImg'];
				$list[$key]['coverImg'] = C('url').json_decode($list[$key]['coverImg'])[0];
				
				if( L('CURRENTLANGUAGE') == 'tw' && $goods['twName'] != ''){
					$list[$key]['name'] = $goods['twName'];

				}else if( L('CURRENTLANGUAGE') == 'cn' && $goods['cnName'] != ''){
					$list[$key]['name'] = $goods['cnName'];
				}	
			}
		}
		echo  json_encode(array('status' => 1, 'data' => $list,  'count' => (int)$count));
	}

	public function addCart()
	{
		if ($_SESSION['uid']) {
			$uid = $_SESSION['uid'];
		}else{
			echo json_encode(array('code' => 2001, 'msg' => '請先登入'));
			exit();
		}
		$goodsId = $_POST['goodsId'];

		$info = M('cart', '', 'db')->where(array('uid' => $uid, 'goodsId' => $goodsId, 'status' => 0))->find();
		if ($info) {
			if (isset($_POST['quantity'])) {
				$res = M('cart', '', 'db')->where(array('uid' => $uid, 'goodsId' => $goodsId))->setInc('quantity', $_POST['quantity']);
			} else $res = M('cart', '', 'db')->where(array('uid' => $uid, 'goodsId' => $goodsId))->setInc('quantity', 1);
		} else {
			$goodsInfo = M('goods', '', 'db')->find($goodsId);
			$res = M('cart', '', 'db')->add(array('uid' => $uid, 'goodsId' => $goodsId, 'quantity' => 1, 'price' => $goodsInfo['price'], 'name' => $goodsInfo['name']));
		}

		if ($res) {
			echo json_encode(array('code' => 0, 'msg' => '加入成功'));
			exit();
		} else {
			echo json_encode(array('code' => 2000, 'msg' => '失敗'));
			exit();
		}
	}
	public function updateCart()
	{
		$uid = I('uid');
		$goodsId = I('goodsId');

		$info = M('cart', '', 'db')->where(array('uid' => $uid, 'goodsId' => $goodsId, 'status' => 0))->find();
		if ($info) {
			if (isset($_POST['quantity'])) {
				$res = M('cart', '', 'db')->where(array('uid' => $uid, 'goodsId' => $goodsId))->save('quantity', $_POST['quantity']);
			} else if (isset($_POST['action'])&& $_POST['action']=='increase'){
				$res = M('cart', '', 'db')->where(array('uid' => $uid, 'goodsId' => $goodsId))->setInc('quantity', 1);
			} else if (isset($_POST['action'])&& $_POST['action']=='decrease'){
				$res = M('cart', '', 'db')->where(array('uid' => $uid, 'goodsId' => $goodsId))->setDec('quantity', 1);
			} else {
				echo json_encode(array('code' => 0, 'msg' => 'ERROR'));
			}
		}else {
			echo json_encode(array('code' => 0, 'msg' => '沒有找到貨品'));
			exit();
		}
		if ($res) {
			echo json_encode(array('code' => 0, 'msg' => '加入成功'));
			exit();
		} else {
			echo json_encode(array('code' => 2000, 'msg' => '失敗'));
			exit();
		}
	}
	public function delCart()
	{

		$where = array();

		$data['cartId'] = $_POST['cartId'];
		$data['uid'] = $_POST['uid'];
		$data['goodsId'] = $_POST['goodsId'];
		$data1['status'] = 2;

		$res = M('cart')->where($data)->save($data1);

		//$res = M('cart')->where($data)->delete();
		if ($res) {
			echo json_encode(array('status' => 1));
		}
	}

	public function checkout()
	{
		if (!isset($_POST['uid'])) {
			redirect(C('host_url'));
		}
		// Set your secret key. Remember to switch to your live secret key in production.
		// See your keys here: https://dashboard.stripe.com/apikeys
		if (C("buildmode")){
			\Stripe\Stripe::setApiKey(C("b_stripeSecret"));
		}else \Stripe\Stripe::setApiKey(C("stripeSecret"));
		
		// Use an existing Customer ID if this is a returning customer.

		//$customer = \Stripe\Customer::create();
		$where = array();

		$where['uid'] = $_POST['uid'];
		$where['status'] = 0;

		$cartitem = M('cart')->where($where)->select();
		$tours = '';
		if (!$cartitem) {
			exit;
		}
		foreach ($cartitem as $item) {
			if ($tours) {
				$tours = $tours . ',' . $item['goodsId'];
			} else $tours = $item['goodsId'];
		}
		$where = array();
		if (count($cartitem) > 1) {
			$where['id'] = array('in', $tours);
		} else $where['id'] = $tours;

		$data = M('goods')->where($where)->select();

		$price = 0;
		foreach ($data as $product) {
			$price += $product['price'];
		}

		$c = '';
		if (isset($_POST['coupon'])) {
			if ($_POST['coupon']) {
				$c = '&coupon=' . $_POST['coupon'];
				$where = array();
				$where['yhId'] = $_POST['coupon'];
				$where['uid'] = $_POST['uid'];
				$where['status'] = 0;

				$user_coupon = M('getyhcard')->where($where)->select()[0];

				if ($user_coupon) {
					$where = array();
					$where['id'] = $user_coupon['yhId'];
					$coupon = M('yhcard')->where($where)->select()[0];
					$price = $price - $coupon['deduMoney'];
				}
			}
		}

		$where = array();
		$where['uid'] = $_POST['uid'];
		$where['isdel'] = 0;
		
		$stuid = M('user')->where($where)->field('stripeUid')->find();

		$ephemeralKey = \Stripe\EphemeralKey::create(
			[
				'customer' => $stuid['stripeUid']
			],
			[
				'stripe_version' => '2020-08-27'
			]
		);

		$paymentIntent = \Stripe\PaymentIntent::create([
			'amount' => $price * 100,
			'currency' => 'hkd',
			'customer' => $stuid['stripeUid'],
			'automatic_payment_methods' => [
				'enabled' => 'true',
			],
		]);
		if ($paymentIntent) {
			$where = array();

			$where['uid'] = $_POST['uid'];
			$where['status'] = 0;
			$data = array();
			$data['out_trade_no'] = $paymentIntent->id;

			$cartitem = M('cart')->where($where)->save($data);

			if (isset($_POST['coupon'])) {
				if ($_POST['coupon']) {
					if ($user_coupon) {
						$where = array();
						$where['yhId'] = $_POST['coupon'];
						$where['uid'] = $_POST['uid'];
						$where['status'] = 0;
						$data = array();
						$data['orderId'] = $paymentIntent->id;

						$user_coupon = M('getyhcard')->where($where)->save($data);
					} else {
						echo json_encode(array('status' => 400));
						exit;
					}
				}
			}

			echo json_encode(array('paymentIntent' => $paymentIntent->client_secret, 'ephemeralKey' => $ephemeralKey->secret, 'customer' => $stuid));
		}
	}
	public function webhook()
	{
		//$endpoint_secret = 'whsec_kx84emIzYJ9JktqQSSrDNRJQQzDuVkhu';
		$endpoint_secret = C('endpoint_secret');
		$payload = @file_get_contents('php://input');
		$sig_header = $_SERVER['HTTP_STRIPE_SIGNATURE'];
		$event = null;

		try {
			$event = \Stripe\Webhook::constructEvent(
				$payload,
				$sig_header,
				$endpoint_secret
			);
		} catch (\UnexpectedValueException $e) {
			// Invalid payload
			http_response_code(400);
			exit();
		} catch (\Stripe\Exception\SignatureVerificationException $e) {
			// Invalid signature
			http_response_code(400);
			exit();
		}

		if ($event->type == "charge.succeeded") {
			//$event->data->object
			$charge = $event->data->object;

			$stripe = new \Stripe\StripeClient(C("Secret"));
			$expandCharges = $stripe->charges->retrieve(
				$charge->id,
				['expand' => ['customer', 'invoice.subscription']]
			);

			$stripeUid = $expandCharges->customer->id;

			$where = array();
			$where['stripeUid'] = $stripeUid;
			$where['isdel'] = 0;

			$uidRs = M('user')->where($where)->field('uid,score')->find();
			$uid = $uidRs['uid'];

			$where = array();
			$where['status'] = 2;
			$where['uid'] = $uid;
			$where['out_trade_no'] = $expandCharges['payment_intent'];
			$cartitem = M('cart')->where($where)->select();
			$totalPrice = 0;
			$qty = 0;
			$userTours = array();
			foreach ($cartitem as $item) {
				$where = array();
				$where['id'] = $item['goodsId'];
				$userTour =  M('goods')->where($where)->select();
				$userTour[0]['qty'] = $item['quantity'];
				array_push($userTours, $userTour[0]);
				$totalPrice = $totalPrice + ((int) $userTour[0]['price'] * (int)$item['quantity']);
				$qty = $qty + (int)$item['quantity'];
			}
			//
			$deduMoney = 0;
			$allmoney = $totalPrice;
			///_-_-_-_-
			$where = array();
			$where['orderId'] = $expandCharges['payment_intent'];
			$where['status'] = 0;
			$data['status'] = 1;
			$user_coupon = M('getyhcard')->where($where)->find();
			$res = M('getyhcard')->where($where)->save($data);


			if ($res) {
				$where = array();
				$where['id'] = $user_coupon['yhId'];
				$coupon = M('yhcard')->where($where)->select()[0];
				$deduMoney = $coupon['deduMoney'];
				$allmoney = $totalPrice - $coupon['deduMoney'];
			}

			$data = array();

			$data['addDate'] = date('Y-m-d H:i:s');
			$data['uid'] = $uid;
			$data['payStatus'] = 1;
			$data['out_trade_no'] = $expandCharges['payment_intent'];
			$data['yhId'] = $_POST['coupon'] || null;
			$data['money'] = $totalPrice;
			$data['deduMoney'] = $deduMoney;
			$data['allMoney'] = $allmoney;
			$data['payType'] = 1;
			$data['score'] = $totalPrice;
			$data['isdel'] = 0;
			$data['address'] = '';
			$data['quantity'] = $qty;
			$data['orderUserData'] = null;
			$data['orderServerDay'] = null;
			$data['orderServerHour'] = null;
			//dump($data);
			$orderId = M('order')->add($data);


			//update coupon
			$where = array();
			$where['uid'] = $uid;
			$where['orderId'] = $expandCharges['payment_intent'];
			$data = array();
			$data['status'] = 1;

			M('getyhcard')->where($where)->save($data);

			//update cart
			$where = array();
			$where['status'] = 2;
			$where['uid'] = $uid;
			$where['out_trade_no'] = $expandCharges['payment_intent'];
			$cartStatus['status'] = 1;
			M('cart')->where($where)->save($cartStatus);
			$where = array();

			foreach ($userTours as $tour) {
				$orderItemTemp['orderId'] = $orderId;
				$orderItemTemp['uid'] = $uid;
				$orderItemTemp['goodsId'] = $tour['id'];
				$orderItemTemp['price'] = $tour['price'];
				$orderItemTemp['number'] = $tour['qty']; //need change in other project
				$res = M('orderitem')->add($orderItemTemp);
			}

			$data = array();
			$where = array();

			$where['uid'] = $uid;
			$where['isdel'] = 0;

			$uidRs = M('user')->where($where)->field('uid,score')->find();
			$data['score'] = $uidRs['score'] + $totalPrice;
			M('user')->where($where)->save($data);
			/*
			//update cart status
			$where['status'] = 2;
			$where['uid'] = $uid;
			$where['out_trade_no'] = $expandCharges['payment_intent'];
			$cartitem = M('cart')->where($where)->select();

			$totalPrice = 0;
			$qty = 0;
			$userTours = array();
			foreach ($cartitem as $item) {
				$where = array();
				$where['id'] = $item['goodsId'];
				$userTour =  M('goods')->where($where)->select();
				$userTour[0]['qty'] = $item['quantity'];
				array_push($userTours, $userTour[0]);
				$totalPrice = $totalPrice + ((int) $userTour[0]['price'] * (int)$item['quantity']);
				$qty = $qty + (int)$item['quantity'];
			}

			$cartStatus['status'] = 1;
			M('cart')->where($where)->save($cartStatus);


			//update coupon
			$where = array();
			$where['uid'] = $uid;
			$where['orderId'] = $expandCharges['payment_intent'];
			$data = array();
			$data['status'] = 1;
			$deduMoney = 0;
			$res = M('getyhcard')->where($where)->save($data);
			$res = M('getyhcard')->where($where)->find();

			if ($res) {
				$where = array();
				$where['id'] = $res['yhId'];
				$coupon = M('yhcard')->where($where)->select()[0];
				$deduMoney = $coupon['deduMoney'];
			}
			//
			$data = array();

			$data['addDate'] = date('Y-m-d H:i:s');
			$data['uid'] = $uid;
			$data['payStatus'] = 0;
			$data['out_trade_no'] = '';
			$data['yhId'] = 0;
			$data['money'] = $totalPrice;
			$data['deduMoney'] = $deduMoney;
			$data['allMoney'] = $expandCharges->amount / 100;
			$data['payType'] = 0;
			$data['score'] = 0;
			$data['isdel'] = 0;
			$data['address'] = '';
			$data['orderUserData'] = json_encode($event);
			$data['orderServerDay'] = null;
			$data['orderServerHour'] = null;

			//dump($data);
			$orderId = M('order')->add($data);


			$tours = '';
			$where = array();

			foreach ($cartitem as $item) {
				if ($tours) {
					$tours = $tours . ',' . $item['goodsId'];
					$in = true;
				} else {
					$tours = $item['goodsId'];
					$where['id'] = $tours;
				}
			}
			if ($in) {
				$where['id'] = array('in', $tours);
			}
			$userTour =  M('goods')->where($where)->select();

			//array_push($tours , M('goods')->where("id={$item['goodsId']}")->select());

			foreach ($userTour as $tour) {
				$orderItemTemp['orderId'] = $orderId;
				$orderItemTemp['uid'] = $uid;
				$orderItemTemp['goodsId'] = $tour['id'];
				$orderItemTemp['price'] = $tour['price'];
				$orderItemTemp['number'] = 1; //need change in other project
				M('orderitem')->add($orderItemTemp);
			}

			$data = array();
			$where = array();

			$where['uid'] = $uid;
			$data['score'] = $uidRs['score'] + $expandCharges->amount / 100;
			M('user')->where($where)->save($data);
			*/
			http_response_code(200);
			exit();
		}
		if ($event->type == "payment_intent.created") {
			http_response_code(200);
			exit();
		}
		if ($event->type == "payment_intent.succeeded") {
			$intent = $event->data->object;
			printf("Succeeded: %s", $intent->id);
			http_response_code(200);
			exit();
		} elseif ($event->type == "payment_intent.payment_failed") {
			$intent = $event->data->object;
			$error_message = $intent->last_payment_error ? $intent->last_payment_error->message : "";
			printf("Failed: %s, %s", $intent->id, $error_message);
			http_response_code(200);
			exit();
		}
	}

	public function paypalIntent()
	{
		if (!isset($_POST['uid'])) {
			redirect(C('host_url'));
		}

		$ch = curl_init();

		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
		curl_setopt($ch, CURLOPT_CAINFO, '/etc/ssl/certs/cacert.pem');
		
		if (C("buildmode")){
			curl_setopt($ch, CURLOPT_URL, 'https://api-m.sandbox.paypal.com/v1/oauth2/token');
		}else curl_setopt($ch, CURLOPT_URL, 'https://api-m.paypal.com/v1/oauth2/token');
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, "grant_type=client_credentials");

		$headers = array();
		if (C("buildmode")){
			$headers[] = 'Authorization: Basic ' . C("b_paypalAuth");
		}else $headers[] = 'Authorization: Basic ' . C("paypalAuth");
		
		$headers[] = 'Content-Type: application/x-www-form-urlencoded';
		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
		
		$result = (array) json_decode(curl_exec($ch));
		if (curl_errno($ch)) {
			echo 'Error:' . curl_error($ch);
		}
		curl_close($ch);
		// get price from user cart
		$where = array();

		$where['uid'] = $_POST['uid'];
		$where['status'] = 0;
		$cartitem = M('cart')->where($where)->select();
		
		if (!$cartitem) {
			exit;
		}

		$price = 0;
		$totalPrice = 0;
		$deduMoney = 0;
		$qty = 0;
		foreach ($cartitem as $item) {
			// if ($tours) {
			// 	$tours = $tours . ',' . $item['goodsId'];
			// } else $tours = $item['goodsId'];
			$where = array();
			$where['id'] = $item['goodsId'];
			$goods = M('goods')->where($where)->select();

			for ($i = 0; $i < $item['quantity']; $i++) {
				$price =  $price + (int) $goods[0]['price'];
				$qty =$qty + 1;
			}
		}
		$totalPrice = $price;
		$c = '';
		if (isset($_POST['coupon'])) {
			if ($_POST['coupon']) {
				$c = '&coupon=' . $_POST['coupon'];
				$where = array();
				$where['yhId'] = $_POST['coupon'];
				$where['uid'] = $_POST['uid'];
				$where['status'] = 0;

				$user_coupon = M('getyhcard')->where($where)->select()[0];
				if ($user_coupon) {
					$where = array();
					$where['id'] = $user_coupon['yhId'];
					$coupon = M('yhcard')->where($where)->select()[0];
					$price = $price - $coupon['deduMoney'];
					$deduMoney = $coupon['deduMoney'];
				}
			}
		}

		//create paypal intent
		
		$curl = curl_init();

		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, true);
		curl_setopt($curl, CURLOPT_CAINFO, '/etc/ssl/certs/cacert.pem');
		$redirect_uri = '';

		if (isset($_POST['type'])) {
			if ($_POST['type'] == 'web') {
				$redirect_uri = C('url') . '/index.php/Home/cart/paypalCapture?type=web&uid=' . $_POST['uid'] . $c;
			}
		} else {
			$redirect_uri = C('url') . '/index.php/Home/cart/paypalCapture?uid=' . $_POST['uid'] . $c;
		}

		// phone type
		if (C("buildmode")){
			$url = 'https://api-m.sandbox.paypal.com/v2/checkout/orders';
		}else $url = 'https://api-m.paypal.com/v2/checkout/orders';
		
		curl_setopt_array($curl, array(
			CURLOPT_URL => $url,
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => '',
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 0,
			CURLOPT_FOLLOWLOCATION => true,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => 'POST',
			CURLOPT_POSTFIELDS => '{
				"intent": "CAPTURE",
				"purchase_units": [
					{
						"amount": {
							"currency_code": "HKD",
							"value": ' . $price . '
						}
					}
				],
				"application_context":{
					"return_url": "' . $redirect_uri . '",
					"user_action": "PAY_NOW"
				}
				}',
			CURLOPT_HTTPHEADER => array(
				'Content-Type: application/json',
				'Authorization: Bearer ' . $result['access_token']
			),
		));
		$response = (array) json_decode(curl_exec($curl));
		$where = array();
		$where['uid'] = $_POST['uid'];
		$where['status'] = 0;
		$data['out_trade_no'] = $response['id'];
		$data['status'] = 2;
		$data['customer'] = $_POST['customer'];
		$data['email'] = $_POST['email'];
		$data['phone'] = $_POST['phone'];
		$data['address'] = $_POST['address'];
		$data['location'] = $_POST['location'];
		$data['locations'] = $_POST['locations'];
		$cartitem = M('cart')->where($where)->save($data);
		if (isset($_POST['coupon'])) {
			if ($_POST['coupon']) {
				if ($user_coupon) {
					$where = array();
					$where['yhId'] = $_POST['coupon'];
					$where['uid'] = $_POST['uid'];
					$where['status'] = 0;
					$data = array();
					$data['orderId'] = $response['id'];

					$user_coupon = M('getyhcard')->where($where)->save($data);
				} else {
					echo json_encode(array('status' => 400));
					exit;
				}
			}
		}
		
		//create order paystatus 0
		$data = array();

		$data['addDate'] = date('Y-m-d H:i:s');
		$data['uid'] = $_POST['uid'];
		$data['payStatus'] = 0;
		$data['out_trade_no'] = $response['id'];
		$data['yhId'] = $user_coupon['yhId'] || null;
		$data['money'] = $totalPrice;
		$data['deduMoney'] = $deduMoney;
		$data['allMoney'] = $price;
		$data['payType'] = 'paypal';
		$data['score'] = $totalPrice;
		$data['isdel'] = 0;
		$data['address'] = '';
		$data['quantity'] = $qty;
		$data['orderUserData'] = null;
		$data['orderServerDay'] = null;
		$data['orderServerHour'] = null;
		$data['paypalLink'] = $response['links'][1]->href;
		
		//dump($data);
		$orderId = M('order')->add($data);

		curl_close($curl);
		echo json_encode(array('status' => '1', 'data' => $response['links'][1]->href));
	}
	public function paypalCapture()
	{
		if (isset($_GET['uid'])) {
			$uid = $_GET['uid'];
		} else redirect(C('host_url'));
		$ch = curl_init();

		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
		curl_setopt($ch, CURLOPT_CAINFO, '/etc/ssl/certs/cacert.pem');
		if (C("buildmode")){
			curl_setopt($ch, CURLOPT_URL, 'https://api-m.sandbox.paypal.com/v1/oauth2/token');
		}else curl_setopt($ch, CURLOPT_URL, 'https://api-m.paypal.com/v1/oauth2/token');;
		
		
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, "grant_type=client_credentials");

		$headers = array();
		if (C("buildmode")){
			$headers[] = 'Authorization: Basic ' . C("b_paypalAuth");
		}else $headers[] = 'Authorization: Basic ' . C("paypalAuth");
		
		$headers[] = 'Content-Type: application/x-www-form-urlencoded';
		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

		$result = (array) json_decode(curl_exec($ch));
		if (curl_errno($ch)) {
			echo 'Error:' . curl_error($ch);
		}
		curl_close($ch);

		//create paypal intent

		$curl = curl_init();
		if (C("buildmode")){
			$url = 'https://api-m.sandbox.paypal.com/v2/checkout/orders/';
		}else $url = 'https://api-m.paypal.com/v2/checkout/orders/';
		
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, true);
		curl_setopt($curl, CURLOPT_CAINFO, '/etc/ssl/certs/cacert.pem');
		curl_setopt_array($curl, array(
			CURLOPT_URL => $url . $_GET['token'] . '/capture',
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => '',
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 0,
			CURLOPT_FOLLOWLOCATION => true,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => 'POST',
			CURLOPT_HTTPHEADER => array(
				'Content-Type: application/json',
				'Authorization: Bearer ' . $result['access_token']
			)
		));

		$response = (array) json_decode(curl_exec($curl));
		//
		curl_close($curl);

		$payments = (array)$response['purchase_units'][0];
		$payments = (array)$payments['payments'];
		$out_trade_no = $payments["captures"][0]->id;
		$payments = (array)$payments["captures"][0];

		$payments = (array)$payments["amount"];
		$price = $payments["value"];

		if ($response['status'] == 'COMPLETED') {
			//echo json_decode(json_encode($response));
			//redirect('http://localhost:8080/backend/index.php/Home/cart/paypalCheckout');
			$where = array();
			$where['status'] = 2;
			$where['uid'] = $uid;
			$where['out_trade_no'] = $response['id'];
			$cartitem = M('cart')->where($where)->select();
			$totalPrice = 0;
			$qty = 0;
			$userTours = array();
			foreach ($cartitem as $item) {
				$where = array();
				$where['id'] = $item['goodsId'];
				$userTour =  M('goods')->where($where)->select();
				$userTour[0]['qty'] = $item['quantity'];
				array_push($userTours, $userTour[0]);
				$totalPrice = $totalPrice + ((int) $userTour[0]['price'] * (int)$item['quantity']);
				$qty = $qty + (int)$item['quantity'];
			}
			//
			$deduMoney = 0;
			$allmoney = $totalPrice;
			///_-_-_-_-
			if (isset($_GET['coupon'])) {
				$where = array();
				$where['yhId'] = $_GET['coupon'];
				$where['uid'] = $_GET['uid'];
				$where['status'] = 0;
				$data['status'] = 1;
				$user_coupon = M('getyhcard')->where($where)->save($data);


				if ($user_coupon) {
					$where = array();
					$where['id'] = $_GET['coupon'];
					$coupon = M('yhcard')->where($where)->select()[0];
					$allmoney = $price;
					$deduMoney = $coupon['deduMoney'];
				}
			}
			// intent create order Capture update order
			// $data['addDate'] = date('Y-m-d H:i:s');
			// $data['uid'] = $uid;
			// $data['payStatus'] = 1;
			// $data['out_trade_no'] = $out_trade_no;
			// $data['yhId'] = $_GET['coupon'] || null;
			// $data['money'] = $totalPrice;
			// $data['deduMoney'] = $deduMoney;
			// $data['allMoney'] = $allmoney;
			// $data['payType'] = 1;
			// $data['score'] = $totalPrice;
			// $data['isdel'] = 0;
			// $data['address'] = '';
			// $data['quantity'] = $qty;
			// $data['orderUserData'] = null;
			// $data['orderServerDay'] = null;
			// $data['orderServerHour'] = null;
			// //dump($data);
			// $orderId = M('order')->add($data);


			

			// update order

			$data = array();
			$data['payStatus'] = 1;

			$where = array();
			$where['uid'] = $uid;
			$where['out_trade_no'] = $response['id'];
			$orderId = M('order')->where($where)->save($data);


			if($data){
				
				$item="";
				$shipanydata = M('cart')->where(array("out_trade_no"=>$response['id']))->select();
				$location=$shipanydata[0]['location'];
				$locations=$shipanydata[0]['locations'];
				$f_name=$shipanydata[0]['customer'];
				$num=$shipanydata[0]['phone'];
				$ownerdata = M('pcset')->find();
				$owner_name=$ownerdata['companyName1'];
				$owner_tel=$ownerdata['phone'];
				$owner_address=$ownerdata['address1'];
				$owner_email=$ownerdata['email'];
	
				foreach($shipanydata as $key => $value){
				
				$shipanydata[$key]='{"sku":"'. $shipanydata[$key]['cartId'] .'","name":"'. $shipanydata[$key]['name'] .'","unt_price":{"val":'. $shipanydata[$key]['price'] .',"ccy":"HKD"},"qty":'. $shipanydata[$key]['quantity'] .',"wt":{"val":3,"unt":"kg"},"dim":{"len":1,"wid":2,"hgt":3,"unt":"cm"},"stg":"Normal"}';
				$item.=','.$shipanydata[$key];
				}
				
				$item = str_replace_once(",","",$item);
				$curl = curl_init();
				if (C("buildmode")){
					$url = 'https://api-demo1.shipany.io/orders/';
				}else $url = 'https://api-demo1.shipany.io/orders/';
				
				curl_setopt_array($curl, array(
					CURLOPT_URL => $url,
					CURLOPT_RETURNTRANSFER => true,
					CURLOPT_ENCODING => '',
					CURLOPT_MAXREDIRS => 10,
					CURLOPT_TIMEOUT => 10, 
					CURLOPT_SSL_VERIFYPEER => true,
					CURLOPT_CAINFO =>  '/etc/ssl/certs/cacert.pem',
					CURLOPT_FOLLOWLOCATION => true,
					CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
					CURLOPT_CUSTOMREQUEST => 'POST',
					CURLOPT_POSTFIELDS => '{"cour_uid":"0a2e1f15-3a79-4756-8495-300ee443f06e","mch_uid":"99a3e4bf-38db-4ba4-a400-495385c9eeeb","quots_uid":"5b7be453-ff62-4a17-930f-1f3e68863f3d","ext_order_ref":"'. $response['id'] .'","wt":{"val":6,"unt":"kg"},"dim":{"len":10,"wid":15,"hgt":20,"unt":"cm"},"items":['.$item.'],"mch_ttl_val":{"val":'.$totalPrice.',"ccy":"HKD"},"cour_ttl_cost":{"val":30,"ccy":"HKD"},"cour_svc_pl":"SFExpress","sndr_ctc":{"ctc":{"f_name":"'.$owner_name.'","phs":[{"typ":"Work","cnty_code":"852","num":"'.$owner_tel.'"}],"email":"victor.li@example.com"},"addr":{"typ":"Business","ln":"'.$owner_address.'","distr":"Ma OnShan","state":"Sha Tin District","cnty":"HKG"}},"rcvr_ctc":{"ctc":{"f_name":"'.$f_name.'","phs":[{"typ":"Mobile","cnty_code":"852","num":"'.$num.'"}]},"addr":{"typ":"SF Smart Cabinet","ln":"'.$locations.'","ln2":"'.$location.'","distr":"NorthPoint","state":"Eastern District","cnty":"HKG"}},"states":[{"stat":"Order Created"}]}',
					CURLOPT_HTTPHEADER => array(
						'api-tk: 6878122e-c92c-49b8-8eed-0e5eed1971d1',
						'Content-Type: application/json'
					),
				));
	
				$response = curl_exec($curl);
	
				curl_close($curl);
	
				}
			//update coupon
			$where = array();
			$where['uid'] = $uid;
			$where['orderId'] = $response['id'];
			$data = array();
			$data['status'] = 1;

			M('getyhcard')->where($where)->save($data);

			//update cart
			$where = array();
			$where['status'] = 2;
			$where['uid'] = $uid;
			$where['out_trade_no'] = $out_trade_no;
			$cartStatus['status'] = 1;
			M('cart')->where($where)->save($cartStatus);
			$where = array();

			foreach ($userTours as $tour) {
				$orderItemTemp['orderId'] = $orderId;
				$orderItemTemp['uid'] = $uid;
				$orderItemTemp['goodsId'] = $tour['id'];
				$orderItemTemp['price'] = $tour['price'];
				$orderItemTemp['number'] = $tour['qty']; //need change in other project
				$res = M('orderitem')->add($orderItemTemp);
			}

			$data = array();
			$where = array();

			$where['uid'] = $uid;
			$where['isdel'] = 0;

			$uidRs = M('user')->where($where)->field('uid,score')->find();
			$data['score'] = $uidRs['score'] + $price;
			M('user')->where($where)->save($data);
			if (isset($_GET['type'])) {
				if ($_GET['type'] == 'web') {
					redirect(C('url') . '/index.php/Home/account/order');
				}
			} else {
				echo "<script type='text/javascript'>window.ReactNativeWebView.postMessage('success')</script>";
			}
		} else {
			echo "<script type='text/javascript'>alert('error')</script>";

			echo "<script type='text/javascript'>window.ReactNativeWebView.postMessage('error')</script>";
		}
	}

	public function test()
	{
	
		$totalPrice=60;
		$response['id']='4SX07598TB309292P';
		$item="";
		$shipanydata = M('cart')->where(array("out_trade_no"=>$response['id']))->select();
		$location=$shipanydata[0]['location'];
		$locations=$shipanydata[0]['locations'];
		$f_name=$shipanydata[0]['customer'];
		$num=$shipanydata[0]['phone'];
		$ownerdata = M('pcset')->find();
		$owner_name=$ownerdata['companyName1'];
		$owner_tel=$ownerdata['phone'];
		$owner_address=$ownerdata['address1'];
		$owner_email=$ownerdata['email'];

		foreach($shipanydata as $key => $value){
		
		$shipanydata[$key]='{"sku":"'. $shipanydata[$key]['cartId'] .'","name":"'. $shipanydata[$key]['name'] .'","unt_price":{"val":'. $shipanydata[$key]['price'] .',"ccy":"HKD"},"qty":'. $shipanydata[$key]['quantity'] .',"wt":{"val":3,"unt":"kg"},"dim":{"len":1,"wid":2,"hgt":3,"unt":"cm"},"stg":"Normal"}';
		$item.=','.$shipanydata[$key];
		}
		
		$item = str_replace_once(",","",$item);
		
		$curl = curl_init();
		if (C("buildmode")){
			$url = 'https://api-demo1.shipany.io/orders/';
		}else $url = 'https://api-demo1.shipany.io/orders/';
		
		curl_setopt_array($curl, array(
			CURLOPT_URL => $url,
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => '',
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 10, 
			CURLOPT_SSL_VERIFYPEER => true,
			CURLOPT_CAINFO =>  '/etc/ssl/certs/cacert.pem',
			CURLOPT_FOLLOWLOCATION => true,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => 'POST',
			CURLOPT_POSTFIELDS => '{"cour_uid":"0a2e1f15-3a79-4756-8495-300ee443f06e","mch_uid":"99a3e4bf-38db-4ba4-a400-495385c9eeeb","quots_uid":"5b7be453-ff62-4a17-930f-1f3e68863f3d","ext_order_ref":"'. $response['id'] .'","wt":{"val":6,"unt":"kg"},"dim":{"len":10,"wid":15,"hgt":20,"unt":"cm"},"items":['.$item.'],"mch_ttl_val":{"val":'.$totalPrice.',"ccy":"HKD"},"cour_ttl_cost":{"val":30,"ccy":"HKD"},"cour_svc_pl":"SFExpress","sndr_ctc":{"ctc":{"f_name":"'.$owner_name.'","phs":[{"typ":"Work","cnty_code":"852","num":"'.$owner_tel.'"}],"email":"victor.li@example.com"},"addr":{"typ":"Business","ln":"'.$owner_address.'","distr":"Ma OnShan","state":"Sha Tin District","cnty":"HKG"}},"rcvr_ctc":{"ctc":{"f_name":"'.$f_name.'","phs":[{"typ":"Mobile","cnty_code":"852","num":"'.$num.'"}]},"addr":{"typ":"SF Smart Cabinet","ln":"'.$locations.'","ln2":"'.$location.'","distr":"NorthPoint","state":"Eastern District","cnty":"HKG"}},"states":[{"stat":"Order Created"}]}',
			CURLOPT_HTTPHEADER => array(
				'api-tk: 6878122e-c92c-49b8-8eed-0e5eed1971d1',
				'Content-Type: application/json'
			),
		));

		$response = curl_exec($curl);
		var_dump($response);
		curl_close($curl);
		
		$where = array();
		$where['uid'] = 129;
		$where['out_trade_no'] = 'pi_3Kc55dHjCjVcl01l0gDULuSK';
		$cartitem = M('cart')->where($where)->select();
		$totalPrice = 0;
		$qty = 0;
		$userTours = array();
		foreach ($cartitem as $item) {
			$where = array();
			$where['id'] = $item['goodsId'];
			$userTour =  M('goods')->where($where)->select();
			$userTour[0]['qty'] = $item['quantity'];
			array_push($userTours, $userTour[0]);
			$totalPrice = $totalPrice + ((int) $userTour[0]['price'] * (int)$item['quantity']);
			$qty = $qty + (int)$item['quantity'];
			dump((int)$item['quantity']);
		}
		dump($totalPrice);
		/*

		$stripe = new \Stripe\StripeClient(C("Secret"));
		$expandCharges = $stripe->charges->retrieve(
			'ch_3Kc18IHjCjVcl01l1ic53Qya',
			['expand' => ['customer', 'invoice.subscription']]
		);

		$stripeUid = $expandCharges->customer->id;

		$where = array();
		$where['stripeUid'] = $stripeUid;
		$uidRs = M('user')->where($where)->field('uid,score')->find();
		$uid = $uidRs['uid'];

		$where = array();
		$where['status'] = 2;
		$where['uid'] = $uid;

		$where['out_trade_no'] = $expandCharges['payment_intent'];
		$cartitem = M('cart')->where($where)->select();
		$totalPrice = 0;
		$qty = 0;
		$userTours = array();
		foreach ($cartitem as $item) {
			$where = array();
			$where['id'] = $item['goodsId'];
			$userTour =  M('goods')->where($where)->select();
			$userTour[0]['qty'] = $item['quantity'];
			array_push($userTours, $userTour[0]);
			$totalPrice = $totalPrice + ((int) $userTour[0]['price'] * (int)$item['quantity']);
			$qty = $qty + (int)$item['quantity'];
		}
		//
		$deduMoney = 0;
		$allmoney = $totalPrice;
		///_-_-_-_-
		if (isset($_POST['coupon'])) {
			$where = array();
			$where['yhId'] = $_POST['coupon'];
			$where['uid'] = $_POST['uid'];
			$where['orderId'] = $expandCharges['payment_intent'];
			$where['status'] = 0;
			$data['status'] = 1;

			$user_coupon = M('getyhcard')->where($where)->save($data);
			var_dump($where);

			if ($user_coupon) {
				$where = array();
				$where['id'] = $_POST['coupon'];
				$coupon = M('yhcard')->where($where)->select()[0];

				$allmoney = $totalPrice - $coupon['deduMoney'];
				$deduMoney = $coupon['deduMoney'];
			}
		}


		$data = array();

		$data['addDate'] = date('Y-m-d H:i:s');
		$data['uid'] = $uid;
		$data['payStatus'] = 1;
		$data['out_trade_no'] = $expandCharges['payment_intent'];
		$data['yhId'] = $_POST['coupon'] || null;
		$data['money'] = $totalPrice;
		$data['deduMoney'] = $deduMoney;
		$data['allMoney'] = $allmoney;
		$data['payType'] = 1;
		$data['score'] = $totalPrice;
		$data['isdel'] = 0;
		$data['address'] = '';
		$data['quantity'] = $qty;
		$data['orderUserData'] = null;
		$data['orderServerDay'] = null;
		$data['orderServerHour'] = null;
		//dump($data);
		$orderId = M('order')->add($data);


		//update coupon
		$where = array();
		$where['uid'] = $uid;
		$where['orderId'] = $expandCharges['payment_intent'];
		$data = array();
		$data['status'] = 0;

		M('getyhcard')->where($where)->save($data);

		//update cart
		$where = array();
		$where['status'] = 2;
		$where['uid'] = $uid;
		$where['out_trade_no'] = $expandCharges['payment_intent'];
		$cartStatus['status'] = 2;
		M('cart')->where($where)->save($cartStatus);
		$where = array();

		foreach ($userTours as $tour) {
			$orderItemTemp['orderId'] = $orderId;
			$orderItemTemp['uid'] = $uid;
			$orderItemTemp['goodsId'] = $tour['id'];
			$orderItemTemp['price'] = $tour['price'];
			$orderItemTemp['number'] = $tour['qty']; //need change in other project
			$res = M('orderitem')->add($orderItemTemp);
		}

		$data = array();
		$where = array();

		$where['uid'] = $uid;
		$uidRs = M('user')->where($where)->field('uid,score')->find();
		$data['score'] = $uidRs['score'] + $totalPrice;
		M('user')->where($where)->save($data);
		/*
		$stripeUid = 'cus_LFmE3YxQMiKfXd';
		$stripe = new \Stripe\StripeClient(C("Secret"));
		$expandCharges = $stripe->charges->retrieve(
			'ch_3Kc0dmHjCjVcl01l0rL1RB2W',
			['expand' => ['customer', 'invoice.subscription']]
		);



			$where = array();
			$where['stripeUid'] = $expandCharges->customer->id;
			$uidRs = M('user')->where($where)->field('uid,score')->find();
			$uid = $uidRs['uid'];
			$where = array();


			//update cart status
			$where['status'] = 2;
			$where['uid'] = $uid;
			$where['out_trade_no'] = $expandCharges['payment_intent'];
			$cartitem = M('cart')->where($where)->select();

			$totalPrice = 0;
			$qty = 0;
			$userTours = array();
			foreach ($cartitem as $item) {
				$where = array();
				$where['id'] = $item['goodsId'];
				$userTour =  M('goods')->where($where)->select();
				$userTour[0]['qty'] = $item['quantity'];
				array_push($userTours, $userTour[0]);
				$totalPrice = $totalPrice + ((int) $userTour[0]['price'] * (int)$item['quantity']);
				$qty = $qty + (int)$item['quantity'];
			}
			$cartStatus['status'] = 1;
dump($where);

			M('cart')->where($where)->save($cartStatus);
			dump($where);


			//update coupon
			$where = array();
			$where['uid'] = '129';
			$where['orderId'] = $expandCharges['payment_intent'];

			$data = array();
			$data['status'] = 1;
			$deduMoney = 0;

			$res = M('getyhcard')->where($where)->save($data);
			$res = M('getyhcard')->where($where)->find();

			if ($res) {

				$where = array();
				$where['id'] = $res['yhId'];
				$coupon = M('yhcard')->where($where)->select()[0];
				$deduMoney = $coupon['deduMoney'];
			}
			//
			$data = array();

			$data['addDate'] = date('Y-m-d H:i:s');
			$data['uid'] = $uid;
			$data['payStatus'] = 0;
			$data['out_trade_no'] = '';
			$data['yhId'] = 0;
			$data['money'] = $totalPrice;
			$data['deduMoney'] = $deduMoney;
			$data['allMoney'] = $expandCharges->amount / 100;
			$data['payType'] = 0;
			$data['score'] = 0;
			$data['isdel'] = 0;
			$data['address'] = '';
			$data['orderUserData'] = json_encode($event);
			$data['orderServerDay'] = null;
			$data['orderServerHour'] = null;

			//dump($data);
			$orderId = M('order')->add($data);


			$tours = '';
			$where = array();

			foreach ($cartitem as $item) {
				if ($tours) {
					$tours = $tours . ',' . $item['goodsId'];
					$in = true;
				} else {
					$tours = $item['goodsId'];
					$where['id'] = $tours;
				}
			}
			if ($in) {
				$where['id'] = array('in', $tours);
			}
			$userTour =  M('goods')->where($where)->select();

			//array_push($tours , M('goods')->where("id={$item['goodsId']}")->select());

			foreach ($userTour as $tour) {
				$orderItemTemp['orderId'] = $orderId;
				$orderItemTemp['uid'] = $uid;
				$orderItemTemp['goodsId'] = $tour['id'];
				$orderItemTemp['price'] = $tour['price'];
				$orderItemTemp['number'] = 1; //need change in other project
				M('orderitem')->add($orderItemTemp);
			}

			$data = array();
			$where = array();

		/*
		$where = array();
		$where['uid'] = 129;
		$where['orderId'] = 'pi_3Kc0uiHjCjVcl01l0RVaLgSC';
		$data = array();
		$data['status'] = 1;
		$deduMoney = 0;
		$res = M('getyhcard')->where($where)->save($data);
		$res = M('getyhcard')->where($where)->find();

		if ($res) {
			$where = array();
			$where['id'] = $res['yhId'];
			$coupon = M('yhcard')->where($where)->select()[0];
			$deduMoney = $coupon['deduMoney'];
			var_dump($deduMoney);
		}
		/*
		$stripeUid = 'cus_LFmE3YxQMiKfXd';
		$stripe = new \Stripe\StripeClient(C("Secret"));
		$expandCharges = $stripe->charges->retrieve(
			'ch_3Kc0dmHjCjVcl01l0rL1RB2W',
			['expand' => ['customer', 'invoice.subscription']]
		);

		var_dump($expandCharges['payment_intent']);
		$stripeUid = $expandCharges->customer->id;

		$where = array();
		$where['stripeUid'] = $stripeUid;
		$uidRs = M('user')->where($where)->field('uid,score')->find();
		$uid = $uidRs['uid'];

		$data = array();
		*/
	}
}
