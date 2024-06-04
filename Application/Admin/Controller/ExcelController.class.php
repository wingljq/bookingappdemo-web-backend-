<?php
namespace Admin\Controller;
use Think\Controller;
class ExcelController extends BaseController
{
  public  function  outOrder()
  {
    $list = M('order')->field("out_trade_no,money,addDate,payType,payStatus,uid")->where("isdel=1")->select();
    foreach ($list as $key => $value) {
      if ($value['payType'] == 1) {
        $list[$key]['payType'] = "VISA";
      } else if ($value['payType'] == 2) {
        $list[$key]['payType'] = "apple";
      }
      if ($value['payStatus'] == 0) {
        $list[$key]['payStatus'] = "Paid";
      } else if ($value['payStatus'] == 1) {
        $list[$key]['payStatus'] = "Pending";
      } else if ($value['payStatus'] == 2) {
        $list[$key]['payStatus'] = "Refound";
      }
      $userInfo = M('user')->where(array('uid' => $value['uid']))->find();
      $list[$key]['firstName'] = $userInfo['firstName'] . $userInfo['lastName'];
      unset($list[$key]['uid']);
    }
    $headerArr = array(' order No. ', 'value' and 'time', 'payment', 'order status', ' name ');
    putcsv($list, $headerArr, 'orrderList' . date("YmdHis") . '.csv');
  }

  public function outShop()
  {
    $list = M('shop')->field('name,desc1,desc2,phone,whatsApp,facebook,address,addDate')->where("isdel=1")->select();
    $headerArr = array('name ', 'introduction', 'description', 'phone', 'whatsApp', 'facebook', 'address', 'add time');
    putcsv($list, $headerArr, 'shopList' . date("YmdHis") . '.csv');
  }

  public function outUser()
  {
    $list = M('user')->field('firstName,lastName,email,sex,area,score,regDate')->where("isdel=1")->select();
    foreach ($list as $key => $value) {
      if ($value['sex'] == 1) {
        $list[$key]['sex'] = "男";
      } else if ($value['sex'] == 2) {
        $list[$key]['sex'] = "女";
      }
    }
    $headerArr = array('firstName', 'lastName', 'login email', 'gender', 'area', 'points', ' add time ');
    putcsv($list, $headerArr, 'userList' . date("YmdHis") . '.csv');
  }

  public function outGoods()
  {
    $list = M('goods')->field('name,desc,price,cateId,stock,isShow,addDate')->where("isdel=1")->select();
    foreach ($list as $key => $value) {
      if ($value['isShow'] == 1) {
        $list[$key]['isShow'] = "on shelves";
      } else if ($value['isShow'] == 0) {
        $list[$key]['isShow'] = "off shelves";
      }
      $list[$key]['cateId'] = M('cate')->where(array('cateId' => $value['cateId']))->find()['name'];
    }
    $headerArr = array('name', 'introduction', 'price', 'categories', ' inventory ', 'whether stores', ' added time ');
    putcsv($list, $headerArr, 'productList' . date("YmdHis") . '.csv');
  }

  public function outYhcard()
  {
    $list = M('yhcard')->field('name,deduMoney,score,number,begDate,endDate,addDate')->where("isdel=1")->select();
    $headerArr = array('name', 'deduction amount', 'change points', 'number', ' start time ', 'end times', ' add time');
    putcsv($list, $headerArr, 'productList' . date("YmdHis") . '.csv');
  }

  public function outSign()
  {
    $where['tp_signlist.isdel'] = 1;
    $list = M('signlist')->join("tp_user on  tp_signlist.uid=tp_user.uid")->where($where)->page(I('page'), I('pagesize'))->order('tp_signlist.id desc')->field("tp_user.email,tp_user.firstName,tp_user.lastName,
          tp_signlist.huangpaiTreatment,
          tp_signlist.medicalTreatmentCourse,
          tp_signlist.medicalBeautyCourse,
          tp_signlist.otherQuestion,
          tp_signlist.addDate")->where("tp_signlist.isdel=1")->select();
    foreach ($list as $key => $value) {
    }
    $headerArr = array('email address', 'firstName', 'lastName', 'Huangpai course', 'medical treatment course', 'medical and aesthetic treatment ', 'other professional consultation', 'add time');
    putcsv($list, $headerArr, 'signList' . date("YmdHis") . '.csv');
  }
  
  public function outTour()
  {
    $list = M('goods')->field('name,place,subject,price,startDate,days,cateId,stock,isShow,addDate')->where("isdel=1")->select();
    foreach ($list as $key => $value) {
      if ($value['isShow'] == 1) {
        $list[$key]['isShow'] = "on shelves";
      } else if ($value['isShow'] == 0) {
        $list[$key]['isShow'] = "off shelves";
      }
      $list[$key]['cateId'] = M('cate')->where(array('cateId' => $value['cateId']))->find()['name'];
    }
    $headerArr = array('name', 'place', 'subject', 'price', 'startDate', 'days', 'categories', ' inventory ', 'whether stores', ' added time ');
    putcsv($list, $headerArr, 'productList' . date("YmdHis") . '.csv');
  }
  //  public function outCustomer(){
  //  $list=M('customer')->field('name,installDate,phone,address,goodsName,gdkhhm,masterPhone,isEndReceive,yinNum,orderCount,score')->where("isdel=1")->select();
  //  foreach ($list as $key => $value) {
  //      if($value['isEndReceive']==1){
  //        $list[$key]['isEndReceive']="有";
  //      }else if($value['isEndReceive']==0){
  //        $list[$key]['isEndReceive']="無";
  //      }
  //  }
  //  $headerArr=array('客戶名稱','客戶安裝日期','客戶電話','客戶地址','購買產品名稱','跟單客戶號碼','安裝師傅號碼','有無尾數收','銀碼','訂單總目','積分獎賞',);
  //  putcsv($list  , $headerArr ,'安裝客戶列表'.date("YmdHis").'.csv'  );
  // }
}
