<?php

namespace Home\Controller;

header('Access-Control-Allow-Origin:*');

use Think\Controller;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require_once('vendor/autoload.php');


use Twilio\Rest\Client;

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
		if( L('CURRENTLANGUAGE') == 'en' && $pcset['address3'] != '' && $pcset['companyName3'] != ''){
			$pcset['address1'] = $pcset['address3'];
			$pcset['companyName1'] = $pcset['companyName3'];
			
		}else if( L('CURRENTLANGUAGE') == 'cn' && $pcset['address2'] != '' && $pcset['companyName2'] != ''){
			$pcset['address1'] = $pcset['address2'];
			$pcset['companyName1'] = $pcset['companyName2'];
		}
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
		$pagebanner = M('pagebanner')->where(array('isdel'=>1))->select();
		foreach ($pagebanner as $key => $value) {
			$pagebanner[$key]['image'] = C('url').$value['image'];
		}
		$this->assign('pagebanner', $pagebanner);


	}


	public function registerAdd()
	{
		if (isset($_POST['platformLogin'])){
			$data['platform'] = $_POST['platform'];
			$data['platformLogin'] = $_POST['platformLogin'];
			$data['email'] = $_POST['email'];
			$data['password'] = $_POST['password'];
			$data['name'] = $_POST['name'];
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
			//$data['address'] = $_POST['address'];
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
		$where['status'] = 0;
		$where['isdel'] = 1;

		$list = M('yhcard')->where($where)->select();
		foreach ($list as $key => $value) {
			$list[$key]['image'] = C('url').$value['image'];	
			if( L('CURRENTLANGUAGE') == 'tw' && $value['twName'] != ''){
				$list[$key]['name'] = $value['twName'];
			}else if( L('CURRENTLANGUAGE') == 'cn' && $value['cnName'] != ''){
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

		$data['rand'] = substr(md5(rand(100000, 999999)), 0, 20);

		M('user')->where($where)->save($data);
		$user = M('user')->where($where)->find();

		if ($user){
			$mail = new PHPMailer(true);
			
			try {
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
				$mail->addAddress($_POST['email'], 'User');     //Add a recipient
				// $mail->addAddress('ellen@example.com');               //Name is optional
				// $mail->addReplyTo('info@example.com', 'Information');
				// $mail->addCC('cc@example.com');
				// $mail->addBCC('bcc@example.com');
			
				//Attachments
				// $mail->addAttachment('/var/tmp/file.tar.gz');         //Add attachments
				// $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name
			
				//Content
				$mail->isHTML(true);                                  //Set email format to HTML
				$mail->Subject = 'Reset password - Don\'t Reply!';
				$mail->Body    = "<a href=\"" . C('url') . "index.php/Home/index/resetpw.html?code={$data['rand']}&email={$_POST['email']}\">Click here to reset password</a>";
				// $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
			
				$mail->send();
				echo json_encode(array('code' => 200,'msg'=>'Message has been sent'));
			
			} catch (Exception $e) {
				echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
			}
		}else {
			echo json_encode(array('code' => 400,'msg'=>'This email is not registered！'));
		}
	}
	public function resetpw(){
		if(!isset($_POST['code'])&&!isset($_POST['email'])){
			redirect(C('host_url'));
		}
		$where['email'] = $_POST['email'];
		$where['rand'] = $_POST['code'];
		$where['isdel'] = 0;

		$res = M('user')->where($where)->select();

		$data['email'] = $_POST['email'];
		$data['password'] = $_POST['password'];
		$data['rand'] = substr(md5(rand(100000, 999999)), 0, 20);

		if ($res) {
			$res = M('user')->where($where)->save($data);
			echo json_encode(array('code' => 200));
		} else {
			echo json_encode(array('code' => 400));
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
		foreach ($list as $key => $value) {
			$goods = M('goods')->where(array('id'=>$list[$key]['goodsId']))->find();
			if( L('CURRENTLANGUAGE') == 'tw' && $goods['twName'] != ''){
				$list[$key]['name'] = $goods['twName'];
			}else if( L('CURRENTLANGUAGE') == 'cn' && $goods['cnName'] != ''){
				$list[$key]['name'] = $goods['cnName'];
			}
			$list[$key]['coverImg'] = C('url').json_decode($goods['coverImg'])[0];
			$list[$key]['total'] = $list[$key]['price'] * $list[$key]['quantity'];
		}
		$list[$key]['sumtotal'] = M('cart')->where(array('out_trade_no' => $list[$key]['out_trade_no']))->sum('quantity*price');
		$list[$key]['sumqty'] = M('cart')->where(array('out_trade_no' => $list[$key]['out_trade_no']))->sum('quantity');
		$this->assign('order', $order);
		$this->assign('list', $list);
		$this->display();
	}

	public function wishlist()
	{
		$where['uid']=$_SESSION['uid'];
		$list=M('favorite')->where($where)->select();
		foreach ($list as $key => $value) {
			$list[$key]=M('goods')->where(array('id'=>$list[$key]['goodsId']))->find();	
			$list[$key]['coverImg'] = C('url').json_decode($list[$key]['coverImg'])[0];			
			if( L('CURRENTLANGUAGE') == 'tw' && $list[$key]['twName'] != ''){
				$list[$key]['name'] = $list[$key]['twName'];
			}else if( L('CURRENTLANGUAGE') == 'cn' && $list[$key]['cnName'] != ''){
				$list[$key]['name'] = $list[$key]['cnName'];
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
