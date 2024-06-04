<?php

namespace Home\Controller;

use Think\Controller;

class IndexController extends Controller
{
	
	public function _initialize()
	{
		$uid=$_SESSION['uid'];
		
		$lang= cookie('think_language');

		if($lang=='zh-tw' || $lang=='zh-TW' ){
			cookie('id','1',366*24);
		}else if($lang=='zh-cn' || $lang=='zh-CN' ){
			cookie('id','2',366*24);
		}else{
			cookie('id','3',366*24);
		}
		$fromUrl = $_SERVER["HTTP_REFERER"];
	
		$uid=$_SESSION['uid'];
		if($uid){
			$count_favorite = M('favorite')->where(array('uid'=>$uid))->count();
			$count_cart = M('cart')->where(array('uid'=>$uid,'status'=>'0'))->count();	
		}else{
			$count_favorite =0;
			$count_cart =0;
		}

		$cate = M('cate')->where(array('isdel'=>1))->select();

		foreach ($cate as $key => $value){
			if( L('CURRENTLANGUAGE') == 'tw' && $value['twName']!=''){
				$cate[$key]['name'] = $value['twName'];
					
			}else if( L('CURRENTLANGUAGE') == 'cn' && $value['cnName']!=''){
				$cate[$key]['name'] = $value['cnName'];
			}
		}
		$this->assign('cate', $cate);

		$pcset = M('pcset')->where('')->select()[0];
		if( L('CURRENTLANGUAGE') == 'en' && $pcset['address3']!=''){
			$pcset['address1'] = $pcset['address3'];
			$pcset['companyName1'] = $pcset['companyName3'];
			
		}else if( L('CURRENTLANGUAGE') == 'cn'&& $pcset['companyName2']!=''){
			$pcset['address1'] = $pcset['address2'];
			$pcset['companyName1'] = $pcset['companyName2'];
		}
		$this->assign('pcset', $pcset);
		$this->assign('count_favorite', $count_favorite);
		$this->assign('count_cart', $count_cart);
		$homebanner = M('homebanner')->where(array('isdel'=>1))->select();
		foreach ($homebanner as $key => $value) {
			$homebanner[$key]['image'] = C('url').$value['image'];
		}
		// if($uid){
		// 	$cart = M('cart')->where(array('uid' => $uid, 'status' => 0))->select();
		// 	$this->assign('cart', $cart);
		// }
		$this->assign('homebanner', $homebanner);

		$pagebanner = M('pagebanner')->where(array('isdel'=>1))->select();
		foreach ($pagebanner as $key => $value) {
			$pagebanner[$key]['image'] = C('url').$value['image'];
		}
		$this->assign('pagebanner', $pagebanner);
	}
	public function changeLang()
	{
		$lang = I('lang');
		if ($lang == 1) {
			$lang = 'zh-tw';
		}else if($lang == 2) {
			$lang = 'en-cn';
		}else {
			$lang = 'en-us';
		}
		$fromUrl = $_SERVER["HTTP_REFERER"];
		if ($fromUrl == "http://" . $_SERVER['HTTP_HOST'] . "/") {
			$jumpUrl = "http://" . $_SERVER['HTTP_HOST'] . "/index.php/Home/Index/index.html?l=" . $lang;
		} else {
			$pageUrl = $this->cut('/Home/', '.html', $fromUrl) . '.html';
			//var_dump($fromUrl);exit;
			$jumpUrl = 'http://' . $_SERVER['HTTP_HOST'] . '/' . 'index.php/Home/' . $pageUrl . '?l=' . $lang;
			if (strpos($fromUrl, 'navTitle') !== false) {
				$navTitle = substr(substr($fromUrl, strpos($fromUrl, 'navTitle=')), 9);
				$jumpUrl = 'http://' . $_SERVER['HTTP_HOST'] . '/' . '/index.php/Home/' . $pageUrl . '?l=' . $lang . "&navTitle=" . $navTitle;
			}
		}
		header("Location:{$jumpUrl}");
	}
	public function getUrlData($query)
	{
		$queryParts = explode('&', $query);
		$params = array();
		foreach ($queryParts as $param) {
			$item = explode('=', $param);
			$params[$item[0]] = $item[1];
		}
		return $params;
	}
	public function cut($begin, $end, $str)
	{
		$b = mb_strpos($str, $begin) + mb_strlen($begin);
		$e = mb_strpos($str, $end) - $b;
		return mb_substr($str, $b, $e);
	}
	public function index()
	{
		$list = M('goods')->where(array('isdel' => 1))->page(1, 16)->select();

		foreach ($list as $key => $value) {
			if( L('CURRENTLANGUAGE') == 'tw' && $value['twName'] != ''){
				$list[$key]['name'] = $value['twName'];
			}else if( L('CURRENTLANGUAGE') == 'cn' && $value['cnName'] != ''){
				$list[$key]['name'] = $value['cnName'];
			}	
			$list[$key]['coverImg'] = C('url').json_decode($list[$key]['coverImg'])[0];
		}
		$this->assign('list', $list);
		$shop = M('shop')->where(array('isdel' => 1))->find();
		$this->assign('shop', $shop);
		$this->display();
	}
	public function indexNavList()
	{
		$navTitle = I('navTitle');
		$htmlInfo = M('html')->where(array('navTitle' => I('navTitle')))->find();
		$htmlInfo['content'] = base64_decode($htmlInfo['content']);
		//dump($info);
		$this->assign('htmlInfo', $htmlInfo);
		$this->display();
	}
	public function about()
	{
		// $info=M('pcset','','db')->find($_COOKIE['id']);
		$info = M('pcset')->find('1');
		$info['aboutHtml'] = base64_decode($info['aboutHtml']);
		$this->assign('info', $info['aboutHtml']);
		// $this->display('about'.$_COOKIE['id'] );
		$this->display();
	}

	public function shop()
	{
		$list = M('goods')->where(array('isdel' => 1))->page($page,8)->select();
		$uid=$_SESSION['uid'];
	
		if($_COOKIE['id']=="1"){
			if($uid){
				foreach ($list as $key => $value) {
					$list[$key]['coverImg'] = C('url').json_decode($list[$key]['coverImg'])[0];
					$list[$key]['favorite'] = M('favorite')->where(array('goodsId' => $list[$key]['id']))->find();
					if( L('CURRENTLANGUAGE') == 'tw' && $list[$key]['twName'] != ''){
						$list[$key]['name'] = $list[$key]['twName'];
					}else if( L('CURRENTLANGUAGE') == 'cn' && $list[$key]['cnName'] != ''){
						$list[$key]['name'] = $list[$key]['cnName'];
					}
					if($list[$key]['favorite']){
						$list[$key]['favorite']='刪除願望清單';
					}else{
						$list[$key]['favorite']='添加到願望清單';
					}
				}
			}else{
				foreach ($list as $key => $value) {
					if( L('CURRENTLANGUAGE') == 'tw' && $list[$key]['twName'] != ''){
						$list[$key]['name'] = $list[$key]['twName'];
					}else if( L('CURRENTLANGUAGE') == 'cn' && $list[$key]['cnName'] != ''){
						$list[$key]['name'] = $list[$key]['cnName'];
					}
					$list[$key]['coverImg'] = C('url').json_decode($list[$key]['coverImg'])[0];
					$list[$key]['favorite']='添加到願望清單';
					
				}
			}
		}else{
			if($uid){
				foreach ($list as $key => $value) {
					$list[$key]['coverImg'] = C('url').json_decode($list[$key]['coverImg'])[0];
					$list[$key]['favorite'] = M('favorite')->where(array('goodsId' => $list[$key]['id']))->find();
					if( L('CURRENTLANGUAGE') == 'tw' && $list[$key]['twName'] != ''){
						$list[$key]['name'] = $list[$key]['twName'];
					}else if( L('CURRENTLANGUAGE') == 'cn' && $list[$key]['cnName'] != ''){
						$list[$key]['name'] = $list[$key]['cnName'];
					}
					if($list[$key]['favorite']){
						$list[$key]['favorite']='Delete  Wishlist';
					}else{
						$list[$key]['favorite']='Add To  Wishlist';
					}
				}
			}else{
				foreach ($list as $key => $value) {
					$list[$key]['coverImg'] = C('url').json_decode($list[$key]['coverImg'])[0];
					$list[$key]['favorite']='Add To  Wishlist';
					if( L('CURRENTLANGUAGE') == 'tw' && $list[$key]['twName'] != ''){
						$list[$key]['name'] = $list[$key]['twName'];
					}else if( L('CURRENTLANGUAGE') == 'cn' && $list[$key]['cnName'] != ''){
						$list[$key]['name'] = $list[$key]['cnName'];
					}
				}
			}

		}
		$this->assign('list', $list);
		$this->display();
	}

	public function goodslist()
	{
		$id = I('id');
		$list = M('goods')->where(array('goodsType' => 1, 'isdel' => 1, 'id' => $id))->find();
		$list['desc'] = base64_decode($list['desc']);
		$list['coverImg'] = C('url').json_decode($list['coverImg'])[0];
			
		
		$this->assign('list', $list);
		$this->display();
	}
	public function cate()
	{
		if ($_GET['page']){
			$page = $_GET['page'];
		}else {
			$page = 1;
		}
		if(isset($_GET['id']) && $_GET['id'] != ''){
			$goods = M('goods')->where(array('cateId'=>$_GET['id'],'isdel' => 1,'isShow'=>1))->page($page,8)->select();
			$count = M('goods')->where(array('cateId'=>$_GET['id'],'isdel' => 1,'isShow'=>1))->count();
		}else{
			$goods = M('goods')->where(array( 'isdel' => 1))->page($page,8)->select();
			$count = M('goods')->where(array( 'isdel' => 1))->page($page,8)->count();
		}
		
		foreach ($goods as $item => $value){
			$goods[$item]['coverImg'] = C('url').json_decode($goods[$item]['coverImg'])[0];	
			if( L('CURRENTLANGUAGE') == 'tw' && $value['twName'] != ''){
				$goods[$item]['name'] = $value['twName'];
			}else if( L('CURRENTLANGUAGE') == 'cn' && $value['cnName'] != ''){
				$goods[$item]['name'] = $value['cnName'];
			}	
		}

		$this->assign('goods', $goods);
		$this->assign('count', $count);

		$this->display();

	}
	public function detail()
	{
		if (!isset($_GET['id'])){
			redirect(C('url'));
		}
		$cateList = M('cate')->where(array('isdel' => 1))->order('cateId asc')->select();
		$goodsInfos = M('goods')->select();
		$goodsInfo = M('goods')->find(I('id'));
		
		$goodsInfo['desc'] = base64_decode($goodsInfo['desc']);
		$goodsInfo['coverImg']=  C('url').json_decode($goodsInfo['coverImg'])[0];
		foreach ($goodsInfos as $item => $value){
			$goodsInfos[$item]['coverImg'] = C('url').json_decode($goodsInfos[$item]['coverImg'])[0];
			if( L('CURRENTLANGUAGE') == 'tw' && $value['twName'] != ''){
				$goodsInfos[$item]['name'] = $value['twName'];
			}else if( L('CURRENTLANGUAGE') == 'cn' && $value['cnName'] != ''){
				$goodsInfos[$item]['name'] = $value['cnName'];
			}	
			
		}
		if( L('CURRENTLANGUAGE') == 'tw' && $value['twName'] != ''){
			$goodsInfo['name'] = $goodsInfo['twName'];
		}else if( L('CURRENTLANGUAGE') == 'cn' && $value['cnName'] != ''){
			$goodsInfo['name'] = $goodsInfo['cnName'];
		}

		$this->assign('cateList', $cateList);
		$this->assign('goodsInfos', $goodsInfos);
		$this->assign('goodsInfo', $goodsInfo);
	
		$this->display();
	}
	public function  goodsListData()
	{
		$where['isdel'] = 1;
		$where['isShow'] = 1;
		if ($_REQUEST['goodsType']) {
			$where['type'] = $_REQUEST['goodsType'];
		}
		$list = M('goods')->where($where)->select();
		echo json_encode(array('code' => 0, 'msg' => '獲取成功', 'data' => array('list' => $list ? $list : array())));
		exit();
	}
	public function goodsInfo()
	{
		$id = I('id');
		$info = M('goods')->where(array('id' => $id))->find();
		$schedule = M('schedule')->where(array('id' => $info['richengId']))->find()['allData'];
		$info['orderDate'] = json_decode($schedule, true);
		echo json_encode(array('code' => 0, 'msg' => '獲取成功', 'data' => $info));
		exit();
	}
	public function addCart()
	{
		$uid = $_SESSION['uid'];
		$goodsId = I('goodsId');
		$info = M('cart')->where(array('uid' => $uid, 'goodsId' => $goodsId, 'status' => 0))->find();
		if ($info) {
			$res = M('cart')->where(array('uid' => $uid, 'goodsId' => $goodsId))->setInc('quantity', 1);
		} else {
			$goodsInfo = M('goods')->find($goodsId);
			$res = M('cart')->add(array('uid' => $uid, 'goodsId' => $goodsId, 'quantity' => 1, 'price' => $goodsInfo['price'], 'name' => $goodsInfo['name']));
		}
		if($uid){
			if ($res) {
				echo json_encode(array('code' => 1, 'message' => '加入成功'));
				exit();
			} else {
				echo json_encode(array('code' => 2000, 'message' => '失敗'));
				exit();
			}
		}else{
			echo json_encode(array('code' => 0, 'message' => '請先登入'));
			exit();
		}
	}
	public function editNumber()
	{
		$totalamt = "0";
		$uid = $_SESSION['uid'];
		$goodsId = $_POST['id'];
		$quantity = $_POST['quantity'];
		$res = M('cart')->where(array('uid' => $uid, 'status' => 0, 'goodsId' => $goodsId))->save(array('quantity' => $quantity));
		$cart = M('cart')->where(array('uid' => $uid, 'status' => 0))->select();
		if (!$res){
			$goodsInfo = M('goods')->find($goodsId);
			$res = M('cart')->add(array('uid' => $uid, 'goodsId' => $goodsId, 'quantity' => 1, 'price' => $goodsInfo['price'], 'name' => $goodsInfo['name']));
		}
		foreach ($cart as $key => $value) {
			//dump($cart);
			$cart[$key]['totalamt'] = $cart[$key]['price'] * $cart[$key]['quantity'];
			$totalamt += $cart[$key]['totalamt'];
		}
		//var_dump($res);
		if ($res && $cart) {
			echo json_encode(array('code' => 0, 'msg' => '成功', 'data' => array('totalamt' => $totalamt)));
			exit();
		} else {
			echo json_encode(array('code' => 2006, 'msg' => '失敗'));
			exit();
		}
	}
	public function delCartGoods()
	{
		$totalamt = "0";
		$uid = $_SESSION['uid'];
		$goodsId = $_POST['id'];
		$res = M('cart')->where(array('goodsId' => $goodsId))->delete();
		$cart = M('cart')->where(array('uid' => $uid))->select();
		foreach ($cart as $key => $value) {
			$cart[$key]['totalamt'] = $cart[$key]['price'] * $cart[$key]['quantity'];
			$totalamt += $cart[$key]['totalamt'];
		}
		if ($res) {
			echo json_encode(array('code' => 0, 'msg' => '刪除成功', 'data' => array('totalamt' => $totalamt)));
			exit();
		} else {
			echo json_encode(array('code' => 2000, 'msg' => '失敗'));
			exit();
		}
	}

	public function getAppBanner(){
        $list=M('system')->where('')->field('homeBanner')->select()[0];
		$list['homeBanner'] = C('url').$list['homeBanner'];
        echo json_encode(array('data' =>$list) );  
	}

	public function getBanner(){
		$where=array();
		$where['isdel']=1;
		if($_GET['name']){
			$where['name']=array( 'like' ,'%'.trim($_GET['name'].'%' ) );
		}
        $list=M('homebanner')->where($where)->select();
		foreach ($list as $key => $value) {
			$list[$key]['image'] = C('url').$value['image'];
		}
        echo json_encode(array('data' =>$list) );  
	}
	public function getPromote(){
		$where=array();
		$where['isdel']=1;
		if($_GET['name']){
			$where['name']=array( 'like' ,'%'.trim($_GET['name'].'%' ) );
		}
        $list=M('promote')->where($where)->select();
		foreach ($list as $key => $value) {
			$list[$key]['image'] = C('url').$value['image'];
		}
        echo json_encode(array('data' =>$list) );  
	}
	
	public function addfavorite(){ 
	
		$data['goodsId']=$_POST['goodsId'];
		$data['uid']=$_SESSION['uid'];
		$list=M('favorite')->where($data)->find();
		file_put_contents('213.txt',$_SESSION['uid']);
		if($_SESSION['uid']){
			if($list){
				$list=M('favorite')->where($data)->delete();
				echo json_encode(array('code' => 1, 'message' => 'Add To Wishlist'));
				exit(); 
			}else{
				$list=M('favorite')->add($data);
				echo json_encode(array('code' => 2, 'message' => 'Delete  Wishlist'));
				exit(); 				
			}
		}else{
				echo json_encode(array('code' => 0, 'message' => '請先登入'));
				exit(); 	

		}
	}	
	public function searchGoods()
	{
		if (L('CURRENTLANGUAGE')=='tw'){
			$l= 'twName as name';
		}else if (L('CURRENTLANGUAGE') == 'cn'){
			$l= 'cnName as name';
		}else{ 
			$l='name';
		}

		$where['isdel'] = 1;
		if($_GET['cateId']){
			$where['cateId'] = $_GET['cateId'];
		}else{
			if ($_POST['keyword']) {
				$where['name|twName|cnName|place|desc|industry'] = array('like', '%' . trim($_POST['keyword'] . '%'));
			}
			if ($_POST['district']) {
				$where['district'] = $_POST['district'];
			}
			if ($_POST['budget']) {
				$min = 0;
				$max = 99999999999;
				switch ($_POST['budget']) {
					case 1:
						$min = 1;
						$max = 500000;
						break;
					case 2:
						$min = 5000001;
						$max = 1000000;
						break;
					case 3:
						$min = 10000001;
						$max = 1500000;
						break;
					case 4:
						$min = 1500001;
						$max = 2000000;
						break;
					case 5:
						$min = 2000001;
						$max = 2500000;
						break;
					case 6:
						$min = 2500001;
						$max = 3000000;
						break;
					case 7:
						$min = 3000001;
						break;
				}
				$where['resale_fee'] =  array('between', array($min, $max));
			}
			if ($_POST['cate']&&$_POST['cate']) {
				$where['cateId'] = $_POST['cate'];
			}
		}
		$list = M('goods')->where($where)->page($_GET['page'], $_GET['pagesize'])->select();

		$count = M('goods')->where($where)->count();

		$district = M('district')->select();
		foreach ($list as $key => $value) {
			if (L('CURRENTLANGUAGE') == 'tw' && $value['twName'] != '') {
				$list[$key]['name'] = $value['twName'];

			} else if (L('CURRENTLANGUAGE') == 'cn' && $value['cnName'] != '') {
				$list[$key]['name'] = $value['cnName'];
			}
			$list[$key]['coverImg'] = C('url') . json_decode($list[$key]['coverImg'])[0];
		}
		foreach ($district as $key1 => $value1) {
			foreach ($list as $key => $value) {
				if ($value['district'] == $value1['id']) {
					if (L('CURRENTLANGUAGE') == 'tw' && $value1['twName'] != '') {
						$list[$key]['district_str'] = $value1['twName'];
		
					} else if (L('CURRENTLANGUAGE') == 'cn' && $value1['cnName'] != '') {
						$list[$key]['district_str'] = $value1['cnName'];
					}else{
						$list[$key]['district_str'] = $value1['name'];
					}

				}

			}
		}
		foreach ($list as $item => $value) {
			$list[$item]['industry'] =  M('cate')->where(array('cateId' => $list[$item]['cateId']))->field($l)->select()[0]['name'];
		}

		echo json_encode(array('data' => $list,'count'=>$count));
	}

	public function changeLangPhone(){
		$lang = $_GET['lang'];
		$_COOKIE['think_language'] = $lang;
		setcookie('think_language',$lang, time() + (86400 * 30 * 9999999), "/");
		
		echo json_encode(array('data' => $lang,'cu' => L('CURRENTLANGUAGE'), 'co' => $_COOKIE['think_language']));

		// $_COOKIE
	}

}