<?php

namespace Home\Controller;

use Think\Controller;

class CateController extends Controller
{

	public function getAllCate()
	{
		header("Content-type: text/html; charset=utf-8");
		$where = array();
		if ($_GET['name']) {
			$where['name'] = array('like', '%' . trim($_GET['name'] . '%'));
		}
		$where['isdel'] = 1;
		$count = M('cate')->where($where)->count();
		$list = M('cate')->where($where)->select();
		foreach ($list as $key => $value) {
			if ( $list[$key]['cateImage'] ){
				$list[$key]['cateImage'] = C('url') . $list[$key]['cateImage'];
			}
			if( L('CURRENTLANGUAGE') == 'tw' && $list[$key]['twName'] != ''){
				$list[$key]['name'] = $list[$key]['twName'];

			}else if( L('CURRENTLANGUAGE') == 'cn' && $list[$key]['cnName'] != ''){
				$list[$key]['name'] = $list[$key]['cnName'];
			}
		}
		echo json_encode(array('data' => $list, 'count' => (int)$count, 'cu'=> L('CURRENTLANGUAGE')));
	}
}
