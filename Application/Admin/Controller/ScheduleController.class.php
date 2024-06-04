<?php

namespace Admin\Controller;

use Home\Controller\BookingController;
use Think\Controller;

require_once 'vendor/autoload.php';

use Twilio\Rest\Client;

class ScheduleController extends BaseController
{

    public function index_data()
    {
        $where = array();
        $where['isdel'] = 1;
        $list = M('schedule')->where($where)->page(I('page'), I('pagesize'))->order('id desc')->select();
        $count = M('schedule')->where($where)->count();
        echo json_encode(array('status' => 111, 'data' => $list, 'count' => (int) $count));
    }
    public function index_schedule()
    {
        $where = array();
        $where['isdel'] = 1;
        $list = M('schedule')->where($where)->page(I('page'), I('pagesize'))->order('id desc')->select();
        $count = M('schedule')->where($where)->count();
        echo json_encode(array('status' => 111, 'data' => $list, 'count' => (int) $count));
    }

    public function addshow()
    {
        if (I('id')) {
            $info = M('schedule')->where(array('id' => I('id')))->field('*')->find();
            $twoArr = json_decode($info['allData'], true);
            //  dump($twoArr);
            $this->assign('twoArr', $twoArr);
            $this->assign('info', $info);
            $this->display();
        } else {
            $oneArr = array('amBegHour' => '', 'amEndHour' => '', 'pmBegHour' => '', 'pmEndHour' => '', 'isOpen' => 0);
            for ($i = 0; $i < 7; $i++) {
                $twoArr[] = $oneArr;
            }
            $this->assign('twoArr', $twoArr);
            $this->display();
        }
    }
    public function addshow1()
    {
        if (I('id')) {
            $info = M('user_booking')->where(array('id' => I('id')))->field('*')->find();
            //dump($info);
            $twoArr = json_decode($info['allData'], true);
            //  dump($twoArr);
            $this->assign('twoArr', $twoArr);
            $this->assign('info', $info);
            $this->display();
        } else {
            $oneArr = array('amBegHour' => '', 'amEndHour' => '', 'pmBegHour' => '', 'pmEndHour' => '', 'isOpen' => 0);
            for ($i = 0; $i < 7; $i++) {
                $twoArr[] = $oneArr;
            }
            $this->assign('twoArr', $twoArr);
            $this->display();
        }
    }
    public function addshow2()
    {
        if (I('id')) {
            $info = M('package_record')->where(array('id' => I('id')))->field('*')->find();
            //dump($info);
            $twoArr = json_decode($info['allData'], true);
            //  dump($twoArr);
            $this->assign('twoArr', $twoArr);
            $this->assign('info', $info);
            $this->display();
        } else {
            $oneArr = array('amBegHour' => '', 'amEndHour' => '', 'pmBegHour' => '', 'pmEndHour' => '', 'isOpen' => 0);
            for ($i = 0; $i < 7; $i++) {
                $twoArr[] = $oneArr;
            }
            $this->assign('twoArr', $twoArr);
            $this->display();
        }
    }
    public function userbooking()
    {
        $userInfo = $_SESSION['userInfo'];
        $staffName = $userInfo['name'];

        // $where = array();

        // $where['stylist_id'] = 125;

        // // Print out the generated SQL query
        // var_dump(M('user_booking')->where($where)->_sql());
        if ($userInfo['userName'] = 'admin') {
            $where = array();
            $list = M('user_booking')->where($where)->page(I('page'), I('pagesize'))->order('booking_start_time')->select();
            $list_count = M('user_booking')->where($where)->select();
            foreach ($list as $key => $value) {
                $where['uid'] = $list[$key]['uid'];
                $username = M('user')->where($where)->field('name')->select();
                $list[$key]['name'] = $username[0]['name'];
            }
        } else {
            $list = M('user_booking')->where(array('stylist_name' => $staffName))->page(I('page'), I('pagesize'))->order('booking_start_time')->select();

            $list_count = M('user_booking')->where(array('stylist_name' => $staffName))->select();
            foreach ($list as $key => $value) {
                $where['uid'] = $list[$key]['uid'];
                $username = M('user')->where($where)->field('name')->select();
                $list[$key]['name'] = $username[0]['name'];
            }
        }

        echo json_encode(array('status' => 111, 'data' => $list, 'count' => count($list_count)));
    }

    public function userpackage()
    {

        $where = array();
        $list = M('package_record')->where($where)->page(I('page'), I('pagesize'))->order('id')->select();
        $list_count = M('package_record')->where($where)->select();
        foreach ($list as $key => $value) {
            $where['uid'] = $list[$key]['uid'];
            $username = M('user')->where($where)->field('name')->select();
            $list[$key]['clientName'] = $username[0]['name'];
        }

        echo json_encode(array('status' => 111, 'data' => $list, 'count' => count($list_count)));
    }

    public function edit()
    {

        if ($_GET['do'] == 'edit') {
            $res = M('user_booking')->where(array('id' => $_GET['id']))->save($_POST);
        }
        if ($res) {
            echo json_encode(array('status' => 111, 'msg' => 'success'));
            exit();
        } else {
            echo json_encode(array('status' => 110, 'msg' => 'fail'));
            exit();
        }
    }
    public function editPackage()
    {

        if ($_GET['do'] == 'edit') {
            $_POST['lastUpdatedTime'] = date('Y-m-d H:i:s');
            $res = M('package_record')->where(array('id' => $_GET['id']))->save($_POST);
            if ($res) {
                echo json_encode(array('status' => 111, 'msg' => 'success'));
                exit();
            } else {
                echo json_encode(array('status' => 110, 'msg' => 'fail'));
                exit();
            }
        } else {
            $list = M('user')->where(array('uid' => $_POST['uid']))->find();
            $list2 = M('goods')->where(array('id' => $_POST['goodsId'], 'isdel' => 1, 'isPackage' => 1))->find();
            // if($list){
            //       echo json_encode(array('status' => 115, 'msg' => $list));
            //         exit();
            // } else {
            //       echo json_encode(array('status' => 114, 'msg' => $_POST['goodsId']));
            //         exit();
            // }
            if ($list && $list2) {
                $_POST['lastUpdatedTime'] = date('Y-m-d H:i:s');
                $res = M('package_record')->add($_POST);
                if ($res) {
                    echo json_encode(array('status' => 112, 'msg' => 'success'));
                    exit();
                } else {
                    echo json_encode(array('status' => 110, 'msg' => 'fail'));
                    exit();
                }
            } else {
                echo json_encode(array('status' => 113, 'msg' => 'this client/package dose not exist'));
                exit();
            }

        }

    }
    public function save()
    {
        if (I('name')) {
            $data['name'] = I('name');
        }
        $twoArr = array();
        foreach ($_POST['amBegHour'] as $key => $value) {
            $oneArr = array();
            $isOpen = $_POST['isOpen' . ($key + 1)];
            if ($isOpen == null) {
                $isOpen = 0;
            }
            $oneArr = array(
                'amBegHour' => $_POST['amBegHour'][$key], 'amEndHour' => $_POST['amEndHour'][$key], 'pmBegHour' => $_POST['pmBegHour'][$key],
                'pmEndHour' => $_POST['pmEndHour'][$key], 'isOpen' => $isOpen,
            );
            $twoArr[] = $oneArr;
        }
        //var_dump($twoArr);exit;
        if (count($twoArr)) {
            $data['allData'] = json_encode($twoArr);
        } else {
            echo json_encode(array('status' => 110, 'msg' => ' Please enter a valid schedule '));
            exit();
        }
        if ($_GET['do'] == 'edit') {
            $data['rand'] = rand(1, 9999);
            $res = M('schedule')->where(array('id' => $_GET['id']))->save($data);
        } else if ($_GET['do'] == 'add') {

            $res = M('schedule')->add($data);
        }
        if ($res) {
            echo json_encode(array('status' => 111, 'msg' => 'success'));
            exit();
        } else {
            echo json_encode(array('status' => 110, 'msg' => 'fail'));
            exit();
        }
    }
    public function del()
    {
        $id_arr = explode(",", $_GET['id']);
        foreach ($id_arr as $v) {
            $res = M('schedule')->where(array('id' => $v))->save(array('isdel' => 0));
        }
        if ($res) {
            echo json_encode(array('status' => 111, 'msg' => 'success'));
            exit();
        } else {
            echo json_encode(array('status' => 110, 'msg' => 'fail'));
            exit();
        }
    }

    public function confirm()
    {
        $id_arr = explode(",", $_GET['id']);
        foreach ($id_arr as $v) {
            $res = M('user_booking')->where(array('id' => $v))->save(array('status' => 1));
        }

        if ($res) {

            //发送邮件
            $booking = M('user_booking')->where(array('id' => $_GET['id']))->field("uid")->find();
            $pcset = M('pcset')->where('')->select()[0];
            $this->assign("phone", $pcset['phone']);
            $this->assign("siteUrl", rtrim(C("url")));
            $subject = "閣下的預約已確認！";
            $sendHtml = $this->fetch("Common/booking_confirm_email.tpl");
            $user = M('user')->where(array('uid' => $booking['uid']))->field('email')->find();
            if ($user && !empty($user['email'])) {
                BookingController::sendEmail($user['email'], $subject, $sendHtml);
            }

            echo json_encode(array('status' => 111, 'msg' => 'success'));
            exit();
        } else {
            echo json_encode(array('status' => 110, 'msg' => 'fail'));
            exit();
        }
    }
    public function finish()
    {
        $id_arr = explode(",", $_GET['id']);
        foreach ($id_arr as $v) {
            $res = M('user_booking')->where(array('id' => $v))->save(array('status' => 3));
        }
        if ($res) {
            echo json_encode(array('status' => 111, 'msg' => 'success'));
            exit();
        } else {
            echo json_encode(array('status' => 110, 'msg' => 'fail'));
            exit();
        }
    }

    public function cancel()
    {
        $id_arr = explode(",", $_GET['id']);
        foreach ($id_arr as $v) {
            $res = M('user_booking')->where(array('id' => $v))->save(array('status' => 2));
        }
        if ($res) {
            echo json_encode(array('status' => 111, 'msg' => 'success'));
            exit();
        } else {
            echo json_encode(array('status' => 110, 'msg' => 'fail'));
            exit();
        }
    }

    public function sendSMSmsg()
    {
        $where['isVerified'] = 1;
        $users = M('user')->where($where)->select();
        $subscribers = array();
        foreach ($users as $user) {
            $phone = json_encode(['binding_type' => "sms", 'address' => "+852" . $user['tel']]);
            array_push($subscribers, $phone);
        }

        // Your Account SID and Auth Token from twilio.com/console
        $account_sid = C('twilioId');
        $auth_token = C('twilioToken');
        $serviceSid = C('serviceSid');

        // In production, these should be environment variables. E.g.:
        // A Twilio number you own with SMS capabilities
        $client = new Client($account_sid, $auth_token);

        // Create a binding
        $notification = $client
            ->notify->services($serviceSid)
            ->notifications->create([
                "toBinding" => $subscribers,
                'body' => $_GET['msg'],
            ]);
    }
}