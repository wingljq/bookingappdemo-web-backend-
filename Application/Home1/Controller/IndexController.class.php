<?php

namespace Home\Controller;

use Think\Controller;

class IndexController extends Controller
{

	public function _initialize()
	{
		if ($_SESSION['uid'] == '') {
			//$_SESSION['uid'] = cookie('PHPSESSID');
			$_SESSION['status'] = '0';
		}
		$uid = $_SESSION['uid'];
		$lang= cookie('think_language');

		if($lang=='zh-cn' || $lang=='zh-CN' ){
			cookie('id','1',366*24);
		}else{
			cookie('id','2',366*24);
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
		foreach ($cate as $key => $value) {
			if( L('CURRENTLANGUAGE') == 'tw' && $value['twName'] != ''){
				$cate[$key]['name'] = $value['twName'];
			}else if( L('CURRENTLANGUAGE') == 'cn'&& $value['cnName'] != ''){
				$cate[$key]['name'] = $value['cnName'];
			}

		}
		$this->assign('cate', $cate);

		$pcset = M('pcset')->where('')->select()[0];

        if( L('CURRENTLANGUAGE') == 'tw' && $pcset['companyName2'] != ''){
            $pcset['companyName'] = $pcset['companyName2'];
        }else if( L('CURRENTLANGUAGE') == 'cn'&& $pcset['companyName3'] != ''){
            $pcset['companyName'] = $pcset['companyName3'];
        }else{
            $pcset['companyName'] = $pcset['companyName1'];
        }

		$this->assign('pcset', $pcset);
		$this->assign('count_favorite', $count_favorite);
		$this->assign('count_cart', $count_cart);
		$homebanner = M('homebanner')->where(array('isdel'=>1))->select();
		foreach ($homebanner as $key => $value) {
			$homebanner[$key]['image'] = C('url').$value['image'];
		}
		$this->assign('homebanner', $homebanner);
	}
	public function changeLang()
	{
		$lang = I('lang');
		if ($lang == 1) {
			$lang = 'zh-cn';
		} else {
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
		$list = M('goods')->where(array('isdel' => 1))->select();

		foreach ($list as $key => $value) {
			if( L('CURRENTLANGUAGE') == 'tw' && $value['twName'] != ''){
				$list[$key]['name'] = $value['twName'];
			}else if( L('CURRENTLANGUAGE') == 'cn'&& $value['cnName'] != ''){
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
    public function getPcset()
    {
        $pcset = M('pcset')->find('1');


        if( L('CURRENTLANGUAGE') == 'en'  && $pcset['companyName3'] != ''){
            $pcset['companyName'] = $pcset['companyName1'];

        }else if( L('CURRENTLANGUAGE') == 'cn' && $pcset['companyName2'] != ''){
            $pcset['address1'] = $pcset['address3'];
            $pcset['companyName'] = $pcset['companyName3'];
        }else{
            $pcset['address1'] = $pcset['address2'];
            $pcset['companyName'] = $pcset['companyName2'];
        }

        echo json_encode(array('code' => 0, 'msg' => '獲取成功', 'data' => $pcset));
    }

	public function pcset()
	{
		$info = M('pcset')->find('1');
		echo json_encode(array('code' => 0, 'msg' => '獲取成功', 'data' => $info));
	}
	public function getMap()
	{
		$info = M('pcset')->find('1')['googleMapHtml'];

		if (!strpos($info, '<iframe')) {
			$info = '<iframe width="100%" height="100%" id="gmap_canvas" src="'.$info .'" frameborder="0" scrolling="no" marginheight="0"
			marginwidth="0"></iframe>';
		}
		$new_string = preg_replace('/width="(\d+)" height="(\d+)"/', 'width="100%" height="100%"', $info);
		echo $new_string;
	}

	public function getTawk()
	{
		echo json_encode(array('code' => 0, 'tawk' => c('twak_url')));
		exit();
	}

    public function about()
    {
        $info = M('pcset')->find('1');

        if (L('CURRENTLANGUAGE') == 'tw' && $info['twaboutHtml']) {
            $aboutHtml = $info['twaboutHtml'];
        } else if (L('CURRENTLANGUAGE') == 'cn' && $info['cnaboutHtml']) {
            $aboutHtml = $info['cnaboutHtml'];
        } else if (L('CURRENTLANGUAGE') == 'tw' && $info['aboutHtml2']) {
            $aboutHtml = $info['aboutHtml2'];
        } else if (L('CURRENTLANGUAGE') == 'cn' && $info['aboutHtml3']) {
            $aboutHtml = $info['aboutHtml3'];
        } else {
            $aboutHtml = $info['aboutHtml'];
        }


        $info['aboutHtml'] = base64_decode($aboutHtml);
        $this->assign('info', $info['aboutHtml']);
        $this->display();
    }

	public function shop()
	{
		$list = M('goods')->where(array('isdel' => 1))->select();
		$uid=$_SESSION['uid'];

		if($_COOKIE['id']=="1"){
			if($uid){
				foreach ($list as $key => $value) {
					$list[$key]['coverImg'] = C('url').json_decode($list[$key]['coverImg'])[0];
					$list[$key]['favorite'] = M('favorite')->where(array('goodsId' => $list[$key]['id']))->find();
					if($list[$key]['favorite']){
						$list[$key]['favorite']='刪除願望清單';
					}else{
						$list[$key]['favorite']='添加到願望清單';
					}
				}
			}else{
				foreach ($list as $key => $value) {
					$list[$key]['coverImg'] = C('url').json_decode($list[$key]['coverImg'])[0];
					$list[$key]['favorite']='添加到願望清單';

				}
			}
		}else{
			if($uid){
				foreach ($list as $key => $value) {
					$list[$key]['coverImg'] = C('url').json_decode($list[$key]['coverImg'])[0];
					$list[$key]['favorite'] = M('favorite')->where(array('goodsId' => $list[$key]['id']))->find();
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
		$list['coverImg'] = json_decode($list['coverImg'])[0];


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
			$goods = M('goods')->where(array('cateId'=>$_GET['id'],'isdel' => 1,'isShow'=>1))->select();
			$count = M('goods')->where(array('cateId'=>$_GET['id'],'isdel' => 1,'isShow'=>1))->count();
		}else{
			$goods = M('goods')->where(array( 'isdel' => 1))->select();
			$count = M('goods')->where(array( 'isdel' => 1))->count();
		}

		foreach ($goods as $item => $value){
			$goods[$item]['coverImg'] = C('url').json_decode($goods[$item]['coverImg'])[0];
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
        $goodsInfo['twdesc'] = base64_decode($goodsInfo['twdesc']);
        $goodsInfo['cndesc'] = base64_decode($goodsInfo['cndesc']);
        $goodsInfo['coverImg']=  C('url').json_decode($goodsInfo['coverImg'])[0];

		if( L('CURRENTLANGUAGE') == 'tw'){
			$goodsInfo['name'] = $goodsInfo['twName'];
		}else if( L('CURRENTLANGUAGE') == 'cn'){
			$goodsInfo['name'] = $goodsInfo['cnName'];
		}

        if( L('CURRENTLANGUAGE') == 'tw' && $goodsInfo['twdesc'] != ''){
            $goodsInfo['desc'] = $goodsInfo['twdesc'];
        }else if( L('CURRENTLANGUAGE') == 'cn'&& $goodsInfo['cndesc'] != ''){
            $goodsInfo['desc'] = $goodsInfo['cndesc'];
        }else{
            $goodsInfo['desc'] = $goodsInfo['desc'];
        }

		foreach ($goodsInfos as $item => $value){

			$goodsInfos[$item]['coverImg'] = C('url').json_decode($goodsInfos[$item]['coverImg'])[0];
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
			$res = M('cart')->add(array('uid' => $uid, 'goodsId' => $goodsId, 'quantity' => 1, 'price' => $goodsInfo['price'], 'name' => $goodsInfo['name'], 'goodsType' => $goodsInfo['goodsType']));
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
		$list = [];
        try{
			$list=M('system')->where('')->field('homeBanner')->select()[0];
			$list['homeBanner'] = C('url').$list['homeBanner'];
		}catch(\Exception $e){

		}
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
			if( L('CURRENTLANGUAGE') == 'tw' && $value['twtitle'] != ''){
				$list[$key]['title'] = $value['twtitle'];
			}else if( L('CURRENTLANGUAGE') == 'cn'&& $value['cnName'] != ''){
				$list[$key]['title'] = $value['cntitle'];
			}
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

	public function terms(){

        $this->display();
    }


    public function getAgreement() {
        $type = I('type');

        echo json_encode(array('code' => 0, 'status' => 'success', 'msg' => '', 'data' => empty($type)?L('tandcdetail'):L('privacydetail')));
    }
}