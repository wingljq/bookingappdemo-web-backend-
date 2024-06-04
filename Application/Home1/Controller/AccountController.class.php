<?php

namespace Home\Controller;

header('Access-Control-Allow-Origin:*');

use Think\Controller;

require_once('vendor/autoload.php');


use Twilio\Rest\Client;
use PHPMailer\PHPMailer\PHPMailer;

class AccountController extends Controller
{


    public function _initialize()
    {
        $lang= cookie('think_language');
        if($lang=='zh-tw' || $lang=='zh-TW' ){
            cookie('id','1',366*24);
        }else if($lang=='zh-cn' || $lang=='zh-CN' ){
            cookie('id','2',366*24);
        }else{
            cookie('id','3',366*24);
        }

        $uid=$_SESSION['uid'];

        if($uid){
            $count_favorite = M('favorite')->where(array('uid'=>$uid))->count();
            $count_cart = M('cart')->where(array('uid'=>$uid,'status'=>'0'))->count();
        }else{
            $count_favorite =0;
            $count_cart =0;
        }
        $pcset = M('pcset')->where('')->select()[0];
        $score= M('user')->where(array('uid' => $uid))->find()['score'];
        $list = M('user')->find($uid);
        $list['regDate']=date('Y-m-d', strtotime('+1 year', strtotime($list['regDate'])));
        $this->assign('list', $list);


        if( L('CURRENTLANGUAGE') == 'en'  && $pcset['companyName3'] != ''){
            $pcset['companyName'] = $pcset['companyName1'];

        }else if( L('CURRENTLANGUAGE') == 'cn' && $pcset['companyName2'] != ''){
            $pcset['address1'] = $pcset['address3'];
            $pcset['companyName'] = $pcset['companyName3'];
        }else{
            $pcset['address1'] = $pcset['address2'];
            $pcset['companyName'] = $pcset['companyName2'];
        }

        $userInfo = M("user")->where(['uid' => $uid])->find();

        $score = $userInfo['score'];

        if ($score >= 0 && $score <= 100) {
            $userRank = 'General';
        } elseif ($score >= 101 && $score <= 300) {
            $userRank = 'Gold';
        } elseif ($score >= 301 && $score <= 600) {
            $userRank = 'Platinum';
        } elseif ($score >= 601 && $score <= 1000) {
            $userRank = 'Diamond';
        } else {
            $userRank = 'Super';
        }

        $this->assign('__login_uid__', $_SESSION['userInfo'] ? $_SESSION['userInfo']['uid'] : '');

        $userNo = md5($userInfo['user_id']);
        $userInfo['userNo'] = substr($userNo, 0, 8);

        $this->assign('user_info', $userInfo);
        $this->assign('user_rank', $userRank);

        $this->assign('pcset', $pcset);
        $this->assign('count_favorite', $count_favorite);
        $this->assign('count_cart', $count_cart);
        $cate = M('cate')->where(array('isdel'=>1))->select();
        foreach ($cate as $key => $value){
            if( L('CURRENTLANGUAGE') == 'tw' && $value['twName'] != ''){
                $cate[$key]['name'] = $value['twName'];
            }else if( L('CURRENTLANGUAGE') == 'cn' && $value['cnName'] != ''){
                $cate[$key]['name'] = $value['cnName'];
            }
        }
        $this->assign('cate', $cate);
    }


	public function registerAdd()
	{
		if (isset($_POST['platformLogin'])){
			$data['platform'] = $_POST['platform'];
			$data['platformLogin'] = $_POST['platformLogin'];
			$data['email'] = $_POST['email'];
			$data['name'] = $_POST['name'];
            $data['sex'] = $_POST['sex'];
            $data['udid'] = $_POST['udid'];
			$data['isVerified'] = 1;
			$info = M('user', '', 'db')->where(array('email' => $_POST['email'],'isdel'=>0))->find();

			if ($info) {
				$info = M('user')->where(array('email' => $_POST['email'], 'platformLogin' => $_POST['platformLogin'],'isdel'=>0))->field('password',true)->find();
				$_SESSION['uid'] = $info['uid'];
				$_SESSION['userInfo'] = $info;

				echo json_encode(array('code' => 0, 'message' => '登錄成功', 'data' => array('userInfo' => $info)));
				exit();
			}
		}else{
			// $data['date'] = $_POST['date'];
			$data['name'] = $_POST['name'];
			$data['tel'] = $_POST['tel'];
			$data['address'] = $_POST['address'];
            $data['sex'] = $_POST['sex'];
            $data['email'] = $_POST['email'];
			$data['password'] = $_POST['password'];
			$data['udid'] = $_POST['udid'];
			$data['isVerified'] = 1;
			$data['isdel'] = 0;

			$info = M('user', '', 'db')->where(array('email' => $_POST['email'],'isdel'=>0))->find();
			if ($info) {
				echo json_encode(array('code' => 2, 'message' => '帳戶已存在'));
				exit();
			}
		}

		if (C("buildmode")){
			\Stripe\Stripe::setApiKey(C("b_stripeSecret"));
		}else \Stripe\Stripe::setApiKey(C("stripeSecret"));

		$customer = \Stripe\Customer::create([
			'email' => $data['email'],
			'name' => $data['name'],
		]);
		$data['stripeUid'] = $customer->id;
		$res = M('user')->add($data);
		if ($res) {
			echo json_encode(array('code' => 0, 'message' => '註冊成功', 'id' => $res));
			$_SESSION['uid'] = $res;
			//echo json_encode(array('code' => 0, 'message' => '註冊成功, 請輸入手機短信驗證碼開通帳號', 'id' => $res));
			exit();
		} else {
			echo json_encode(array('code' => 8, 'message' => '註冊失敗'));
			exit();
		}
	}
	public function loginData()
	{
		if ($_POST['platformLogin']) {
			$info = M('user')->where(array('email' => $_POST['email'], 'platformLogin' => $_POST['platformLogin'],'isdel'=>0))->field('password',true)->find();

			if (!$info) {
				echo json_encode(array('code' => 11, 'message' => 'error'));
				exit;
			}
			$_SESSION['uid'] = $info['uid'];
			$_SESSION['userInfo'] = $info;
			echo json_encode(array('code' => 0, 'message' => '登錄成功', 'data' => array('userInfo' => $info)));
			exit;
		}

		$email = trim($_POST['email']);
		$password = $_POST['password'];

		if (!$email || !$password) {
			echo json_encode(array('code' => 2, 'message' => '請輸入正確的用戶名和密碼'));
			exit;
		}
		$info = M('user')->where(array('email' => $email, 'password' => $password,'isdel'=>0))->find();
		if (!$info) {
			echo json_encode(array('code' => 2, 'message' => '請輸入正確的用戶名和密碼'));
			exit;
		}
		$_SESSION['uid'] = $info['uid'];
		$_SESSION['userInfo'] = $info;
		$info = M('user')->where(array('email' => $email, 'password' => $password, 'isdel'=>0))->field('password', true)->find();
		if (!$info) {
			echo json_encode(array('code' => 11, 'message' => '請輸入正確的用戶名和密碼'));
			exit;
		}

		$_SESSION['userInfo'] = $info;
		echo json_encode(array('code' => 0, 'message' => '登錄成功', 'data' => array('userInfo' => $info)));
		exit;
	}

	public function logOut()
	{
		$_SESSION['uid'] = "";
		$_SESSION['userInfo'] = "";
		$this->redirect("index/index");
	}

	public function savePwd()
	{
		$res = M('user', '', 'db')->where(array('email' => I('email')))->save(array('password' => md5(I('password')), 'rand' => rand(1000, 9999)));
		if ($res) {

			echo json_encode(array('code' => 0, 'msg' => '修改成功，請重新登錄'));
			exit();
		} else {
			echo json_encode(array('code' => 2006, 'msg' => '修改失敗'));
			exit();
		}
	}

	public function info()
	{

		if (!$_SESSION['uid']){
			$this->redirect("index/index");
			exit();
		}
		$uid=$_SESSION['uid'];

		$out_trade_no = I('id');

		$list = M('order')->where(array('uid' => $uid, 'out_trade_no' => $out_trade_no))->select();
		$where['orderId'] = $list[0]['id'];
		$orderItem = M('orderitem')->where($where)->select();
		$totalprice = 0;
		foreach ($orderItem as $key => $value) {

			$orderItem[$key]['name'] = M('goods')->where(array('id' => $orderItem[$key]['goodsId']))->find()['name'];
			$orderItem[$key]['totalamt'] = (int) $orderItem[$key]['number'] * (int)$orderItem[$key]['price'];
			$totalprice = $totalprice + $orderItem[$key]['totalamt'];
		}
		$this->assign('list', $orderItem);
		$this->assign('totalamt', $totalprice);
		$this->display();
	}

	public function getSMS()
	{
		$where['uid'] = $_GET['uid'];
		$data['rand'] = rand(100000, 999999);

		M('user')->where($where)->save($data);
		$user = M('user')->where($where)->find();

		// Your Account SID and Auth Token from twilio.com/console
		$account_sid = C('twilioId');
		$auth_token = C('twilioToken');
		// In production, these should be environment variables. E.g.:
		// $auth_token = $_ENV["TWILIO_AUTH_TOKEN"]

		// A Twilio number you own with SMS capabilities
		$twilio_number =  C("twilio_number");

		$client = new Client($account_sid, $auth_token);

		$client->messages->create(
			// Where to send a text message (your cell phone?)
			'+852' . $user['tel'],
			array(
				'from' => $twilio_number,
				'body' => 'your verification code is ' . $data['rand'] . '!'
			)
		);
		echo json_encode(array('code' => 200));
	}
	public function verify()
	{
		$where['uid'] = $_POST['uid'];
		$where['rand'] = $_POST['code'];
		$data['isVerified'] = 1;
		$res = M('user')->where($where)->select();
		if ($res) {
			$res = M('user')->where($where)->save($data);
			echo json_encode(array('code' => 200));
		} else {
			echo json_encode(array('code' => 400));
		}
	}
	public function coupon()
	{
		$where['status'] = 1;
		$where['isdel'] = 1;

		$list = M('yhcard')->where($where)->select();

        $lang= cookie('think_language');


		foreach ($list as $key => $value) {
			$list[$key]['image'] = C('url').$value['image'];
			// if($lang=='zh-tw' || $lang=='zh-TW' ){

			// 	$list[$key]['name'] = $value['twName'];

            // }else if($lang=='zh-cn' || $lang=='zh-CN' ){

            //     $list[$key]['name'] = $value['cnName'];

            // }
			if( L('CURRENTLANGUAGE') == 'tw' && $value['twName'] != ''){
				$list[$key]['name'] = $value['twName'];
			}else if( L('CURRENTLANGUAGE') == 'cn'&& $value['cnName'] != ''){
				$list[$key]['name'] = $value['cnName'];
			}
		}

		$this->assign('coupon', $list);
		$this->display();
	}

	public function sendRecoverPWEmail()
	{
		if(!isset($_POST['email'])){
			redirect(C('host_url'));
		}

		$where['email'] = $_POST['email'];
		$where['isdel'] = 0;
		$data['rand'] = substr(md5(rand(100000, 999999)), 0, 20);

		M('user')->where($where)->save($data);
		$user = M('user')->where($where)->find();


		$mail = new PHPMailer(true);

		//Server settings
		//$mail->SMTPDebug = SMTP::DEBUG_SERVER;
		$mail->isSMTP();                                            //Send using SMTP
		$mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
		$mail->SMTPAuth   = true;                                   //Enable SMTP authentication
		$mail->Username   = 'emailonlydontreply@gmail.com';                     //SMTP username
		$mail->Password   = 'pbcwtvwxokeuybiy';                               //SMTP password
		$mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
		$mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

		//Recipients
		$mail->setFrom('emailonlydontreply@gmail.com', C('title_email'));
		$mail->addAddress($_POST['email'], 'User');
		$mail->isHTML(true);
		$mail->Subject = "Reset your password from ".C('appName');
		$mail->Body = "Click this link to reset password ".C('url')."/index.php/Home/index/resetpw.html?code={$data['rand']}&email={$_POST['email']}";
		$mail->send();

		die(json_encode(array('code' => 200, 'msg'=>'Message has been sent')));

		/*
		$mailchimp = new \MailchimpTransactional\ApiClient();
		$mailchimp->setApiKey(C('mandrillappapi'));
		$message = [
			"from_email" => "resetPW@".C('appName').".com",
			"subject" => "Reset your password from ".C('appName'),
			"text" => "Click this link to reset password ".C('url')."/index.php/Home/index/resetpw.html?code={$data['rand']}&email={$_POST['email']}",
			"to" => [
				[
					"email" => $_POST['email'],
					"type" => "to"
				]
			]
		];
		$response = $mailchimp->messages->send(["message" => $message]);
		print_r($response[0]->status);*/
	}
	public function resetpw(){
		try{
			if(!isset($_POST['code'])&&!isset($_POST['email'])){
				redirect(C('host_url'));
			}
			$where['email'] = $_POST['email'];
			//$where['rand'] = $_POST['code'];
			$where['isdel'] = 0;

			$res = M('user')->where($where)->select();

			$data['password'] = $_POST['password'];
			$data['rand'] = substr(md5(rand(100000, 999999)), 0, 20);

			if ($res) {
				$res = M('user')->where($where)->save($data);
				echo json_encode(array('code' => 200));
			} else {
				echo json_encode(array('code' => 400));
			}
		}catch(\Exception $e){
			echo $e->getMessage();
			exit;
		}
	}
	public function order()
	{
		if (!$_SESSION['uid']){
			$this->redirect("index/index");
			exit();
		}
		$uid = $_SESSION['uid'];
		$list = M('order')->where(array('uid' => $uid))->order(array('payStatus','id'=>'desc'))->select();

		$this->assign('list', $list);
		$this->display();
	}

	public function orderlist()
	{
		if (!$_SESSION['uid']){
			$this->redirect("index/index");
			exit();
		}
		$uid=$_SESSION['uid'];
		$out_trade_no = I('id');

		$order = M('order')->where(array('uid' => $uid,'out_trade_no'=>$out_trade_no))->order(array('payStatus','id'=>'desc'))->select()[0];
		$list = M('cart')->where(array('uid' => $uid))->where(array('out_trade_no'=>$out_trade_no))->select();
        $userInfo = M('user')->where(['uid' => $uid])->find();

        $order["dPhone"] = empty($order["dPhone"])?$userInfo["tel"]:$order["dPhone"];
        $order["dName"] = empty($order["dName"])?$userInfo["name"]:$order["dName"];
        $order["email"] = empty($order["email"])?$userInfo["email"]:$order["email"];

		foreach ($list as $key => $value) {
			$list[$key]['coverImg'] = C('url').json_decode(M('goods')->where(array('id'=>$list[$key]['goodsId']))->find()['coverImg'])[0];
			$list[$key]['total'] = $list[$key]['price'] * $list[$key]['quantity'];
		}

		$list[$key]['sumtotal'] = M('cart')->where(array('out_trade_no' => $list[$key]['out_trade_no']))->sum('quantity*price');
		$list[$key]['sumqty'] = M('cart')->where(array('out_trade_no' => $list[$key]['out_trade_no']))->sum('quantity');
		$this->assign('order', $order);
		$this->assign('list', $list);
        $this->assign('user_info', $userInfo);

        $this->display();
	}

	public function wishlist()
	{
		$where['uid']=$_SESSION['uid'];
		$list=M('favorite')->where($where)->select();

		foreach ($list as $key => $value) {

			$list[$key]=M('goods')->where(array('id'=>$list[$key]['goodsId']))->find();

			$list[$key]['coverImg'] = C('url').json_decode($list[$key]['coverImg'])[0];
			if( L('CURRENTLANGUAGE') == 'tw' ){
				$list[$key]['name'] = $list[$key]['twName'];
			}else if( L('CURRENTLANGUAGE') == 'cn'){
				$list[$key]['name'] =  $list[$key]['cnName'];
			}
		}
		$this->assign('list', $list);
		$this->display();
	}

	public function delAcc()
	{
		if($_POST['uid']){
			$uid = $_POST['uid'];
		}else{
			$uid = $_SESSION['uid'];
		}
		$where = array();
		$where['uid'] = $uid;
		$where['isdel'] = 0;

		$data = array();
		$data['isdel'] = 1;

		M('user')->where($where)->save($data);
		$where = array();
		$_SESSION['uid'] = "";
		$_SESSION['userInfo'] = "";
		if ($_POST['type']=='phone'){
			echo json_encode(array('code' => 200));
		}else{
			$this->redirect("index/index");
		}
	}
}
