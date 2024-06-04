<?php

namespace Home\Controller;

use PHPMailer\PHPMailer\PHPMailer;
use Think\Controller;


class BookingController extends Controller
{
    public function getAVBooking()
    {
        $where = array();
        $where['isdel'] = 1;
        $list = M('schedule')->where($where)->page(I('page'), I('pagesize'))->order('id desc')->select();
        echo json_encode(array('status' => 111, 'data' => $list));
    }
    public function getUserBooking()
    {
        if (I('uid')) {
            $list = M('user_booking')->where(array('uid' => I('uid')))->find();
            if ($list) {
                echo json_encode(array('status' => 200, 'data' => $list));
            }else echo json_encode(array('status' => 200, 'data' => []));
            exit();
        }
        echo json_encode(array('status' => 400));
    }

    public function getUserBooking1()
    {
        if (I('uid')) {
            $list = M('user_booking')->where(array('uid' => I('uid')))->select();
            if ($list) {
                echo json_encode(array('status' => 200, 'data' => $list));
            }else echo json_encode(array('status' => 200, 'data' => []));
            exit();
        }
        echo json_encode(array('status' => 400));
    }

    public static function sendEmail($email, $subject, $body){
        try {
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
            $mail->addAddress($email, 'User');     //Add a recipient
            // $mail->addAddress('ellen@example.com');               //Name is optional
            // $mail->addReplyTo('info@example.com', 'Information');
            // $mail->addCC('cc@example.com');
            // $mail->addBCC('bcc@example.com');

            //Attachments
            // $mail->addAttachment('/var/tmp/file.tar.gz');         //Add attachments
            // $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name

            //Content
            $mail->isHTML(true);                                  //Set email format to HTML
            $mail->Subject = $subject;
            $mail->Body    = $body;
            // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

            $mail->send();

        } catch (\Exception $e) {
            echo $e->getMessage();
            exit;
        }
    }

    public function addUserBooking()
    {
        try {
            $data['status'] =  1;
            $data['uid']=(int)$_SESSION['uid'];
            $data['firstName'] = $_POST['firstName'];
             $data['referrer'] = $_POST['referrer'];

            $data['phone'] = $_POST['phone'];
            if(I('type')){
                $data['type']=I('type');
            }
            if($_POST['email']){
                $data['email'] = $_POST['email'];
            }else{
                $user = M('user')->where(array('uid' => $data['uid']))->field('email')->find();
                $data['email'] = $user ? $user['email'] : "";
            }

            $data['booking_time'] = $_POST['booking_time'];
            $data['desc'] = $_POST['desc'];
            $data['scheduleId'] = 0;


            if(I('recommender')){
                $data['recommender']=I('recommender');
            }

            if(isset($_POST['invitor'])){
                $data['invitor'] = $_POST['invitor'];
            }


            if(!empty($_POST['personNumber'])){
                $data['personNumber'] = $_POST['personNumber'];
            }

            if(!empty($_POST['productType'])){
                $data['productType'] = $_POST['productType'];
            }

            $res = M('user_booking')->add($data);
            file_put_contents('1.txt',$res);
            if ($res) {

                //发送邮件
                if(C("booking_email") && $data['email']){
                    $pcset = M('pcset')->select()[0];
                    $this->assign("title", $_POST['desc']);
                    $this->assign("phone", $pcset['phone']);
                    $this->assign("firstName", $data['firstName']);
                    $this->assign("email", $data['email']);
                    $this->assign("desc", $_POST['desc']);
                    $this->assign("booking_phone", $data['phone']);
                    $this->assign("booking_time", $data['booking_time']);
                    $this->assign("data", $data);
                    $this->assign("siteUrl", rtrim(C("url")));
                    $subject = $pcset['companyName1'] . " has received your appointment request!";
                    $sendHtml = $this->fetch("Common/booking_email.tpl");
                    static::sendEmail($_POST['email'], $subject, $sendHtml);
                }

                echo json_encode(array('status' => 200, 'msg' => 'success'));
                exit();
            } else {
                echo json_encode(array('status' => 401, 'msg' => 'fail'));
                exit();
            }
        } catch(\Exception $e){
            echo json_encode(array('status' => 401, 'msg' => $e->getMessage()));
            exit();
        }
    }


    public function bookingSchedule()
    {
        if (!I('uid') && !I('scheduleId') && !I('booking_time')) {
            echo json_encode(array('status' => 400));
            exit;
        }


        /*$time = date("H:i", strtotime(I('booking_time')));
        if($time < "11:00" || $time > "23:00"){
            echo json_encode(array('status' => 400, 'msg' => 'Appointments are not allowed during non-working hours (11:00 - 23:00)'));
            exit;
        }*/



        $data['uid'] = I('uid');
        $data['scheduleId'] = I('scheduleId');
        $data['booking_time'] = I('booking_time');

        if ($_GET['do'] == 'edit' && isset($_GET['id'])) {
            $res = M('user_booking')->where(array('id' => $_GET['id']))->save($data);
        } else if ($_GET['do'] == 'add') {
            $res = M('user_booking')->add($data);
        } else {
            echo json_encode(array('status' => 400));
            exit;
        }

        $email=M('user')->where(array('uid'=>I('uid')))->find()['email'];
        $user=M('user')->where(array('uid'=>I('uid')))->find();
        if(C("booking_email") && $email){
            $pcset = M('pcset')->select()[0];
            $this->assign("user", $user);
            $this->assign("firstName", $user['name']);
            $this->assign("booking_phone", $user['tel']);
            $this->assign("booking_time", $data['booking_time']);
            $this->assign("title", '手機預約');
            $this->assign("phone", $pcset['phone']);
            $this->assign("siteUrl", rtrim(C("url")));
            $subject = $pcset['companyName1'] . " has received your appointment request!";
            $sendHtml = $this->fetch("Common/booking_email.tpl");
            static::sendEmail($email, $subject, $sendHtml);
        }

        if ($res) {
            // $pcset = M('pcset')->select()[0];
            // $user = M('user')->where(array('uid'=>I('uid')))->find();

            // $subject = $pcset['companyName1'] . " has received your appointment request!";
            // $sendHtml = $this->fetch("Common/booking_email.tpl");

            // static::sendEmail($user['email'], $subject, $sendHtml);
            echo json_encode(array('status' => 200, 'msg' => 'success'));
            exit();
        } else {
            echo json_encode(array('status' => 401, 'msg' => 'fail'));
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
}
