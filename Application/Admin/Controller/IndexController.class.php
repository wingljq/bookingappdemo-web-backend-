<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends BaseController {
	
    public function index(){
      if (isset($_SESSION['userInfo'])){
        $this->display();
      }else redirect('/index.php/admin/login');
    }
}