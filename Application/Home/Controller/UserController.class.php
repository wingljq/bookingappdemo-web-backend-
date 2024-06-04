<?php
namespace Home\Controller;
header('Access-Control-Allow-Origin:*');

use Think\Controller;
class UserController extends Controller {

	public static $uid=0;

	public function _initialize(){
		if($_REQUEST['uid']){
			self::$uid=$_REQUEST['uid'];
		}
		if($_SERVER["HTTP_AUTHORIZATION"]){
			$info=M('user','','db')->where(array('udid'=>$_SERVER["HTTP_AUTHORIZATION"]))->find();

			// if($info  && $info['isLogin']==1){
			// 	self::$uid=$info['uid'];
			// }

			if(!$info || $info['isLogin']==0 ){
				self::$uid=$info['uid'];

			}
		}else if(!I('enter')){//網頁版
			if(!$_SESSION['userInfo']){
				$this->redirect('index/login');
			}
		}
	}

    public function accountInfo(){
		$userInfo=M('user','','db')->where(array('uid'=>self::$uid))->find();
		$this->assign('userInfo',$userInfo);
		$this->display();
    }
	
	public function  youhuiList1Data(){
		
	}
	
	public function getUserInfo(){
		$uid=self::$uid;
		$userInfo=M('user','','db')->where(array('uid'=>$uid ))->find();
		$userInfo['cardNo']=substr(md5($userInfo['uid']), 0,10) ; 
		$signInfo=M('signset','','db')->find(1);


		$signInfo['limitTimeFreeLearnCourse']=explode('，', $signInfo['limitTimeFreeLearnCourse']);
		$signInfo['medicalTreatmentCourse']=explode('，', $signInfo['medicalTreatmentCourse']);
		$signInfo['medicalBeautyCourse']=explode('，', $signInfo['medicalBeautyCourse']);
		$signInfo['huangpaiTreatment']=explode('，', $signInfo['huangpaiTreatment']);
		$signInfo['limitTimeYhCourse']=explode('，', $signInfo['limitTimeYhCourse']);
		$signInfo['payType']=array('在線支付','到店支付');

		// 二維碼
		Vendor('phpqrcode.phpqrcode');
		$QRcode = new \QRcode();
		$data = "http://".$_SERVER['HTTP_HOST']."/".C('appName')."/index.php/home/account/register?enter=1&shareNum=".$userInfo['shareNum'];
		$level = 'L';// 糾錯級別：L、M、Q、H
		$size = 10;//元素尺寸
		$margin = 1;//邊距
		$outfile = "Public/Uploads/qrcode/".$uid.".png";
		if(!file_exists($outfile)){
			$saveandprint = false;// true直接輸出屏幕  false 保存到文件中
			$back_color = 0xFFFFFF;//白色底色
			$fore_color = 0x000000;
			$QRcode->png($data, $outfile, $level, $size, $margin, false, $back_color, $fore_color);
		}
		// 二維碼

		$userInfo['qrcode']="http://".$_SERVER['HTTP_HOST']."/".C('appName')."/".$outfile;
		$userInfo['shareUrl']=$data;
		echo  json_encode(array('code'=>0  ,'msg'=>'成功' ,'data'=>array('userInfo'=>$userInfo,'signInfo'=>$signInfo  ))  ) ;exit();
	}
	

	
	public function addCart(){

		$uid=I('uid');
		$goodsId=I('goodsId');

		M('cart','','db')->where(array('uid'=>$uid,'goodsType'=>2 ))->delete();

		$info=M('cart','','db')->where(array('uid'=>$uid,'goodsId'=>$goodsId))->find();

		$goodsInfo=M('goods','','db')->find($goodsId);
		if($info){

			if($goodsInfo['type']==1){
				$res=M('cart','','db')->where(array('uid'=>$uid,'goodsId'=>$goodsId))->setInc('quantity',1);
			}

		}else{

			$res=M('cart','','db')->add(array('uid'=>$uid,'goodsId'=>$goodsId,'quantity'=>1,'bookTime'=>I('bookTime'), 'goodsType'=>$goodsInfo['type']    ));
		}
		
		if($res){
			echo json_encode(array('code'=>0,'msg'=>'加入成功'     ));exit();
			
		}else{
			echo json_encode(array('code'=>2000,'msg'=>'失敗'     ));exit();
			
		}
	}

	public function editNumber(){
		$uid=self::$uid;
		$cartId=I('cartId');
		$type=I('type');
		$number=I('number');
		$cartInfo=M('cart','','db')->where(array('cartId'=>$cartId))->find();
		$goodsInfo=M('goods','','db')->find($cartInfo['goodsId']);
		if($number>$goodsInfo['stock']){
			echo json_encode(array('code'=>2004,'msg'=>'已超出庫存數量'     ));exit();

		}
		$res=M('cart','','db')->where(array('cartId'=>$cartId))->save(array('number'=>$number));

		if($res){
			echo json_encode(array('code'=>0,'msg'=>'成功'     ));exit();
		}else{
			echo json_encode(array('code'=>2006,'msg'=>'失敗'     ));exit();
			
		}
		
	}

	public function delCartGoods(){
		$cartId=I('cartId');
		$res=M('cart','','db')->where(array('cartId'=>$cartId))->delete();
		if($res){
			echo json_encode(array('code'=>0,'msg'=>'刪除成功'     ));exit();
			
		}else{
			echo json_encode(array('code'=>2000,'msg'=>'失敗'     ));exit();
			
		}
	}

	public function addSign(){
		
		$_POST['uid']=self::$uid;
		$signInfo=M('signset','','db')->find(1);
		$_POST['addDate']=date('Y-m-d H:i:s');
		$_POST['price']=$signInfo['price'];
		$_POST['payStatus']=0;
		$_POST['out_trade_no']=date('Ymdhis').rand(10000,99999);
		$res=M('signlist','','db')->add($_POST);


		// if($_POST['payType']=='在線支付'){

		// 		$signData=M('signlist')->find($res);
		// 		$signData['return_url']=urlencode("http://".$_SERVER['HTTP_HOST'].'/beauty/mweb/accountInfo.html');
		// 		$signData['body']='立即體驗報名';
		// 		echo json_encode(array('code'=>2,'msg'=>'成功','data'=>$signData      ));exit();

		// }else if($_POST['payType']=='到店支付'){

		echo json_encode(array('code'=>0,'msg'=>'提交成功'     ));exit();

		//}
	}
	
	public function searchYhcard(){
	
		$info=M('yhcard','','db')->where(array('yhNum'=>I('yhNum')))->find();
	
		if(!$info){
			echo json_encode(array('code'=>8,'msg'=>'請輸入正確的優惠碼'    ));exit();
		}
	
		if(!$info['status']){
			echo json_encode(array('code'=>6,'msg'=>'該優惠券已使用過'    ));exit();
		}
	
	
		if($info){
			echo json_encode(array('code'=>0,'msg'=>'成功','data'=>$info      ));exit();
	
		}else{
				echo json_encode(array('code'=>4,'msg'=>'失敗'    ));exit();
	
		}
	
	
	}
	
	public function addOrder(){
		
		$data['uid']=self::$uid;
		$data['address']=I('address');
		$data['addDate']=date('Y-m-d H:i:s');
		$data['payStatus']=0;
		$data['out_trade_no']=date('Ymdhis').rand(10000,99999);
	
		$yhInfo=M('yhcard','','db')->where(array('yhNum'=>I('yhNum')))->find();
		$data['yhId']=$yhInfo['id'];
		$data['deduMoney']=$yhInfo['deduMoney'];
	
		$orderId=M('order','','db')->add($data);
	
		$goodsList=M('cart','','db')->where(array('uid'=>self::$uid))->select();
		$allMoney=0;
		$allScore=0;
		foreach ($goodsList as $key => $value) {
			$goodsInfo=M('goods','','db')->find($value['goodsId']);
			M('orderitem','','db')->add(array('orderId'=>$orderId,'goodsId'=>$value['goodsId'],'number'=>$value['number'],'price'=>$goodsInfo['price'],'uid'=>self::$uid  ,'bookTime'=>$value['bookTime']  ));

			$allMoney=$allMoney+($value['number']*$goodsInfo['price']);
			$allScore=$allScore+($value['number']*$goodsInfo['score']);
		}
	
		$money=$allMoney-$data['deduMoney'];

		$res=M('order','','db')->where(array('id'=>$orderId))->save(array('money'=>$money ,'allMoney'=>$allMoney,'score'=>$allScore  ));
	
		$orderInfo=M('order','','db')->find($orderId);
		$orderInfo['return_url']=urlencode("http://".$_SERVER['HTTP_HOST'].'/'.C('appName').'/mweb/accountInfo.html');
		$orderInfo['body']='網站購買商品';
	
		if($res && $orderId  && $orderInfo){
			
			echo json_encode(array('code'=>0,'msg'=>'成功','data'=>$orderInfo      ));exit();
	
		}else{
				echo json_encode(array('code'=>4,'msg'=>'失敗'    ));exit();
		}	
	}
	
	public function getAllOrderItem()
	{
		$where = array();
		if (isset($_GET['bookingId'])) {
			$where['id'] = $_GET['bookingId'];
			$list = M('user_booking')->where($where)->select();

			 $result = array();
       
         // for each booking 
           foreach ($list as $booking) {
            $where['id'] = array('in', $booking['good_id']);
            //select goods from goods table where id = goodsid in booking
            $goodslist = M('goods')->where($where)->select();
            //store selected item in goodslist in $booking
            //$stroe booking in $result
            foreach ($goodslist as $key => $value) {
                //shape coverimg into a url form
                //example:"coverImg":"https:\/\/eshkhk.com\/.\/Public\/Uploads\/goods\/2022-09-14\/6321a2c08cdfb.jpg"
                $goodslist[$key]['coverImg'] = C('url').json_decode($value['coverImg'])[0];
            }
            
            $booking['goodslist'] = $goodslist;

            $result[] = $booking;

        }

        if (!empty($result)) {
            echo json_encode(array('status' => 200, 'data' => $result));
        } else {
            echo json_encode(array('status' => 200, 'data' => array()));
        }
    } else {
        echo json_encode(array('status' => 400));
    }
    exit();
}
			
		
	
	
	public function addCard(){
		$uid = I('uid');
		$cardId=I('cardId');
		$where['uid']=I('uid');

		$cardInfo=M('yhcard','','db')->find($cardId);
		
		$iscz=M('getyhcard')->where(array('uid'=>$uid,'yhId'=>$cardId))->find();
		if($iscz){
			echo json_encode(array('code'=>4,'msg'=>'已經兌換過該優惠券' ));exit();
		}
	
		$userInfo=M('user','','db')->where($where)->find();

	
		if(!$userInfo  ||  $userInfo['score']<$cardInfo['score'] ){
			echo json_encode(array('code'=>2,'msg'=>'積分不足', 'userscore'=>$userInfo['score']));exit();
		}
	
		M('user','','db')->where($where)->setDec('score',$cardInfo['score'] );
	
	
		$res=M('getyhcard','','db')->add(array('uid'=>$uid,'yhId'=>$cardInfo['id'],'addDate'=>date("Y-m-d H:i:s"),'status'=>0,'score'=>$cardInfo['score']  )); 
	
	
		echo json_encode(array('code'=>0,'msg'=>'換領成功'      ));exit();
	}
	
	
	
	public function cardList(){
		$pageIndex=$_REQUEST['pageIndex'];
		$pageSize=$_REQUEST['pageSize'];
		$uid=self::$uid;
		$type=I('type');
		
		if(self::$uid){
			$where['uid']=$uid;
		}
	
		
	
		$yhList=M('getyhcard','','db')->where(array('uid'=>$uid))->select();
		foreach ($yhList as $key => $value) {
			$yhIdArr[]=$value['yhId'];
		}
	
		if($type==1){//全部換過的不顯示
	
			$where['id']=array('not in',$yhIdArr);
			
		}else{
			$where['id']=array('in',$yhIdArr);
			
		}
		$where['isdel']=1;
	
		$list=M('yhcard','','db')->page($pageIndex,$pageSize)->where($where)->select();

	
	
		foreach ($list as $key => $value) {
			$list[$key]['endDate']=str_replace('-', '/', $value['endDate']);
		}
	
	
	
		echo json_encode(array('code'=>0,'msg'=>'獲取成功','data'=>array(  'list'=>$list?$list:array()   )   ));exit();
	
	
	
	}
	
	
	public function  cartList(){
		
		if(self::$uid){
			$where['tp_cart.uid']=self::$uid;
		}
			

		$where['tp_cart.goodsType']=I('goodsType');
		
		$list=M('cart','','db')->join("tp_goods on tp_goods.id=tp_cart.goodsId")->where($where)->select();
	
		$allMoney=0;
	
		foreach ($list as $key => $value) {
			$list[$key]['cartMoney']=bcmul($value['price'],$value['number'],2);
			$allMoney=$allMoney+($value['price']*$value['number']);
		}

		$systemInfo=M('system','','db')->find(1);
		if(I('goodsType')==2){
			$systemInfo['sendMoney']=0;
		}

		//var_dump(  $allMoney  );

		$allMoney= bcadd( $allMoney ,$systemInfo['sendMoney'], 2);  

		echo json_encode(array('code'=>0,'msg'=>'獲取成功','data'=>array(  'list'=>$list?$list:array(),'cartCount'=>count($list),'allMoney'=>$allMoney   )  ,'systemInfo'=>$systemInfo   ));exit();
	
	
	
	}
	
	
	public function  msgList(){
		$pageIndex=$_REQUEST['pageIndex'];
		$pageSize=$_REQUEST['pageSize'];
		$uid=self::$uid;
		//$where['uid']=$uid;
		$list=M('msg','','db')->where($where)->page($pageIndex,$pageSize)->select();
		
		foreach($list as $key=>$value){
			$userInfo=M('user','','db')->where(array('uid'=>$value['fromUid']))->find();
			$list[$key]['name']=$userInfo['firstName'].$userInfo['lastName'];
			$list[$key]['headImg']=$userInfo['headImg'];
	
			$agoTime= ceil((time()-strtotime($value['addDate']))/3600)."時";
	
			if($agoTime>24){
				$agoTime=floor((time()-strtotime($value['addDate']))/3600/24)."天";
			}
	
			$list[$key]['agoTime']=$agoTime;
	
			
		}
		
		echo json_encode(array('code'=>0,'msg'=>'獲取成功','data'=>array(  'list'=>$list?$list:array()   )   ));exit();
	}
	
	public function  goodsListData(){




		$pageIndex=$_REQUEST['pageIndex'];
		$pageSize=$_REQUEST['pageSize'];
		if(I('cateId')){
			$where['cateId']=I('cateId');
		}

		if(I('type')){
			$where['type']=I('type');
		}else{
			$where['type']=1;
		}


		$where['isdel']=1;
		$where['isShow']=1;

		// //dump($pageIndex);
		 $list=M('goods','','db')->where($where)->page($pageIndex,$pageSize)->select();

		 //var_dump( M('goods')->_sql() );

		foreach ($list as $key => $value) {

			$desc=base64_decode($value['desc']);
			$list[$key]['desc']=$desc;
			if($value['type']==2){
				$list[$key]['endTime']=strtotime($value['endDate']." 23:59:59");
			}

			if($value['type']==3){
				if($value['hour']<1){
					$list[$key]['hour']=($value['hour']*60) ."分鐘";
				}else{
					$list[$key]['hour']=$value['hour']."小時";
				}
			}


		}

		$dateArr=array();


		for ($i=0; $i <10 ; $i++) { 
			$dateArr[]=date("m月d日",strtotime("{$i} day"));
		}

		//var_dump( $list );

		echo json_encode(array('code'=>0,'msg'=>'獲取成功','data'=>array(  'list'=>$list  ,'dateList'=>$dateArr    ) ));exit();
	}


	public function orderListData(){

		$uid=self::$uid;

		$pageIndex=$_REQUEST['pageIndex'];
		$pageSize=$_REQUEST['pageSize'];

		$orderList=M('order','','db')->where(array('payStatus'=>1,'isdel'=>1,'uid'=>$uid ))->select();

		foreach ($orderList as $key => $value) {
			$idArr[]=$value['id'];
		}

		$where['orderId']=array('in',$idArr);
		$where['uid']=$uid;
		$list=M('orderitem','','db')->where($where)->page($pageIndex,$pageSize)->select();


		foreach ($list as $key => $value) {
			
			$list[$key]['goodsInfo']=M('goods','','db')->find($value['goodsId']);
			
			$orderInfo=M('order','','db')->field("out_trade_no,addDate")->find($value['orderId']);



			$orderInfo['addDate']=date('Y-m-d',strtotime($orderInfo['addDate']));

			$list[$key]['orderInfo']=$orderInfo;

		}

		echo json_encode(array('code'=>0,'msg'=>'獲取成功','data'=>array(  'list'=>$list?$list:array()   )   ));exit();


	}


	public function orderInfo(){

		$id=$_REQUEST['id'];

		$info=M('orderitem','','db')->find($id);

		$info['goodsInfo']=M('goods','','db')->find($info['goodsId']);

		$info['orderInfo']=M('order','','db')->find($info['orderId']);

		echo json_encode(array('code'=>0,'msg'=>'獲取成功','data'=>array(  'info'=>$info  )   ));exit();


	}


	public function goodsInfo(){

		$id=I('id');

		if($id==0){
			$info=M('goods','','db')->where(array('isdel'=>1,'type'=>3 ))->order('id desc')->find();
			$id=$info['id'];

		}


		$uid=self::$uid;
		$info=M('goods','','db')->where(array('id'=>$id))->find();

		//var_dump($id );

		$schedule=M('schedule','','db')->where(array('id'=>$info['richengId']))->find()['allData'];

		//var_dump($info, M('schedule')->_sql() );
		$info['orderDate']=json_decode($schedule,true);

		echo json_encode(array('code'=>0,'msg'=>'獲取成功','data'=>$info   ));exit();



	}


	public function addOrderService(){

		$uid=self::$uid;

		$userInfo=M('user','','db')->where(array('uid'=>$uid ))->find();
		$goodsInfo=M('goods','','db')->find($_REQUEST['goodsId']);



		$oneHourCount=M('order','','db')->where(array('goodsId'=>$_REQUEST['goodsId'],'orderServerDay'=>$_POST['orderDay'],'orderServerHour'=>$_POST['orderHour']  ))->count();


		$oneDayCount=M('order','','db')->where(array('goodsId'=>$_REQUEST['goodsId'],'orderServerDay'=>$_POST['orderDay']))->count();

		if($oneHourCount>=$goodsInfo['oneHourStock']){
			echo json_encode(array('code'=>2,'msg'=>'預約失敗，本時段預約人數已滿'   ));exit();
		}




		if($oneDayCount>=$goodsInfo['stock']){
			echo json_encode(array('code'=>2,'msg'=>'預約失敗，該天預約人數已滿'   ));exit();
		}



		//var_dump(  $goodsInfo['oneHourStock']  );exit;



		$data['uid']=$uid;
		$data['addDate']=date('Y-m-d H:i:s');

		if($_POST['payType']=1){
			$data['payStatus']=0;
		}else{
			$data['payStatus']=1;
		}
		
		$data['out_trade_no']=date('Ymdhis').rand(10000,99999);
		$data['money']=$goodsInfo['price'];
		$data['allMoney']=$goodsInfo['price'];
		$data['payType']=$_REQUEST['payType'];
		$data['goodsType']=$goodsInfo['type'];
		$data['orderUserData']=json_encode($_POST);
		$data['orderServerDay']=$_POST['orderDay'];
		$data['orderServerHour']=$_POST['orderHour'];
		$data['goodsId']=I('goodsId');
		$res=M('order','','db')->add($data);
		M('orderitem','','db')->add(array('orderId'=>$res,'goodsId'=>$goodsInfo['id'],'number'=>1,'price'=>$goodsInfo['price'],'uid'=>$uid ));
		if($res){

			if($_REQUEST['payType']==2){

					$token='';
					if($userInfo['iosToken']){
						$token=$userInfo['iosToken'];
					}
					if($userInfo['androidToken']){
						$token=$userInfo['androidToken'];
					}
					$url="http://".$_SERVER['HTTP_HOST']."/insmile/push/test_push.php?token=".$token;
					file_get_contents($url);
					echo json_encode(array('code'=>0,'msg'=>'預約成功'   ));exit();

			}else if($_REQUEST['payType']==1){

					$data['return_url']=urlencode("http://".$_SERVER['HTTP_HOST'].'/'.C('appName').'/mweb/accountInfo.html');
					$data['body']='網站購買商品';

					echo json_encode(array('code'=>1,'msg'=>'成功','data'=>$data      ));exit();
			}
		}else{
			echo json_encode(array('code'=>2,'msg'=>'預約失敗'   ));exit();
		}	
	}

	public function getUserInfoPhone()
	{
		$where = array();
		if (I('uid')) {
			$where['uid'] = $_GET['uid'];
		}
		if (I('email')) {
			$where['email'] = $_GET['email'];
		}
		$where['isdel'] = 0;
		$list = M('user')->where($where)->field('name,headImg,score,email,tel,memberId')->find();
		echo json_encode(array('status' => 111, 'data' => $list));
	}
	public function saveUserInfo()
	{
		if (isset($_POST['id']) && isset($_POST['name'])) {

			$where['uid'] = $_POST['id'];
			$where['isdel'] = 0;

			$data['name'] = $_POST['name'];
			if($_POST['address']){
				$data['address'] = $_POST['address'];
			}
			if($_POST['email']){
				$data['email'] = $_POST['email'];
			}
			
			$list = M('user')->where($where)->save($data);
			echo json_encode(array('status' => 111, 'msg' => 'Success'));

		} else redirect(C('url'));
	}


	public function getAllOrder()
	{
		$where = array();
		if (isset($_GET['uid'])) {
			$where['uid'] = I('uid');
			$where['payStatus'] = 1;
			$list = M('order')->where($where)->select();
			echo json_encode(array('data' => $list));
		}
	}
	public function getAVyhcard()
	{

		$where['status'] = 0;
		$where['isdel'] = 0;

		$list = M('yhcard')->where($where)->select();
		$lang= cookie('think_language');
		if($lang=='zh-tw' || $lang=='zh-TW' ){
			foreach ($list as $key => $value){
				$lang[$key]['name'] = $value['twName'];
			}
		}else if($lang=='zh-cn' || $lang=='zh-CN' ){
			foreach ($list as $key => $value){
				$lang[$key]['name'] = $value['cnName'];
			}
		}
		
		echo json_encode(array('data' => $list));
		
	}
	//get coupon function
	public function getyhcard()
	{
		//get user id
		if (isset($_GET['uid'])) {
			$uid = I('uid');
		} else if ($_SESSION['uid']) {
			$uid = $_SESSION['uid'];
		}

		//get coupon id
		if ($uid && isset($_GET['yhcardId'])) {
			$where['id'] = $_GET['yhcardId'];

			//find the coupon which match the id got above and put it into list
			$list = M('yhcard')->where($where)->find();

			$where = array();
			//array $where(yhid:yhcardid, uid=$uid, status = 0, isdel =1)
			$where['yhId'] = $_GET['yhcardId'];
			$where['uid'] = $uid;
			$where['status'] = 0;
			$where['isdel'] = 1;

			//find the item match the above condition in table geyyhcard and put it into $res which status = 0, isdel = 1,uid=128
			$res = M('getyhcard')->where($where)->find();

			$where = array();
			$where['uid'] = $uid;
   
			$where['isdel'] = 0;
     
			//if $res is true, which means user already had the coupon 
			if ($res){
				echo json_encode(array('status' => 400, 'message'=> 'Already have'));
			}else{
				
			//if $res is false, find the user table based on user id and find user's score.
				$user = M('user')->where($where)->field('score')->find();
				//get the yhid of the coupon
				$data['yhId'] = $_GET['yhcardId'];
                //if user's score is more than the requiremen of coupon, save the updated score to user;s table
				$score = $user['score'] - $list['score'];
				if ($score > 0) {
					$data['uid'] = $uid;
					$data['score'] = $list['score'];
					$newdata['score'] = $score;
					M('user')->where($where)->save($newdata);
	 
					//save the couppon(based on the yhid) into table getyhcard
					$orderId = M('getyhcard')->add($data);
					echo json_encode(array('status' => 111));
				}else{
					
					echo json_encode(array('status' => 400, 'message'=> 'Not enough point'));
				}
			}
			
			
			
		} else redirect(C('host_url'));
	}
	public function getUseryhcard()
	{
		if (isset($_GET['uid'])) {
			$where['uid'] = $_GET['uid'];
		} else {
			$where['uid'] = $_SESSION['uid'];
		}
		$where['status'] = 0;
		$where['isdel'] = 1;

        //take out the user's coupon where its status is 0{usable} and not deleted
		$list = M('getyhcard')->where($where)->select();

		// $useryhcard = '';
		// $where = array();
		// //
		// foreach ($list as $yhcard) {
		// 	if ($useryhcard) {
		// 		//for coupon into $useryhcard
		// 		$useryhcard = $useryhcard . ',' . $yhcard['yhId'];
		// 		$in = true;
		// 	} else {
		// 		$useryhcard = $yhcard['yhId'];
		// 		//take the id as key in $where array
		// 		$where['id'] = $useryhcard;
		// 	}
		// }
		// if ($in) {
		// 	$where['id'] = array('in', $useryhcard);
		// }
		// if ($where['id']) {
		// 	$where['isdel'] = 1;

		// 	$list = M('yhcard')->where($where)->select();
		// } else $list = array();

		echo json_encode(array('data' => $list));
	}
	public function getAllUseryhcard()
	{
		if (isset($_GET['uid'])) {
			$where['uid'] = $_GET['uid'];
			$list = M('getyhcard')->where($where)->select();
			$useryhcard = '';
			$where = array();
			//use $yhcard as the name of each row of $list
			foreach ($list as $yhcard) {
				if ($useryhcard) {
					$useryhcard = $useryhcard . ',' . $yhcard['yhId'];
					// $useryhcard alreedy have value, $in = true
					$in = true;
				} else {
					//put the value of key'yhid' of each row into $useryhcard and seperate them with ','
					$useryhcard = $yhcard['yhId'];
					//take the value of $useryhcard as the key'id' of array $where
					$where['id'] = $useryhcard;
				}
			}
			
			if ($in) {
				//if in is true, ask andy tmr about thiss
				$where['id'] = array('in', $useryhcard);
			}
			if ($where['id']) {
				//select where column id = $where('id') in table yhcard and put into $allists(array)
				$alllist = M('yhcard')->where($where)->select();
			} else $alllist = array();

			foreach ($list as $item){
			 // for each row of $list,name it as $item, compare it with every row in array $allsit
				for($i=0;$i<count($alllist);$i++){
					//if $alllist[$id] = $item['yhid'] and item's status is 1 [useable]
					if ($alllist[$i]['id']==$item['yhId']&&$item['status']==0){
						//set alllist[i][status] is 1
						$alllist[$i]['status'] = 1;
					}
				}
			}

			echo json_encode(array('data' => $alllist));
		} else redirect(C('host_url'));
	}

	public function getAllyhcard() {
          $where['isdel'] = 1;
		  
		  $list = M('yhcard')->where($where)->select();
		  echo json_encode(array('data' => $list));

	}

	public function updateMemberId() {
    $where['uid'] = $_GET['uid'];
    $data['memberId'] = $_GET['memberId'];
    $res = M('user')->where($where)->save($data);
    if($res) {
        echo json_encode(array('status' => 200, 'msg' => 'updated', 'data'=>$res));
    } else {
        echo json_encode(array('status' => 400, 'msg' => 'cannot updated'));
    }
}

	
}