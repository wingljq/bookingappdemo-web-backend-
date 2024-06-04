<?php

namespace Home\Controller;

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
            $list = M('user_booking')->where(array('uid' => I('uid')))->select();
            //build an array of results and then encode it to JSON outside of the loop.
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
                    $goodslist[$key]['coverImg'] = C('url') . json_decode($value['coverImg'])[0];
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
     public function getUserPackage()
    {
        if (I('uid')) {
            $list = M('package_record')->where(array('uid' => I('uid')))->select();
            //build an array of results and then encode it to JSON outside of the loop.
            $result = array();

            // for each booking
            foreach ($list as $package) {
                $where['id'] = array('in', $package['goodsId']);
                //select goods from goods table where id = goodsid in booking
                $goodslist = M('goods')->where($where)->select();
                //store selected item in goodslist in $booking
                //$stroe booking in $result
                foreach ($goodslist as $key => $value) {
                    //shape coverimg into a url form
                    //example:"coverImg":"https:\/\/eshkhk.com\/.\/Public\/Uploads\/goods\/2022-09-14\/6321a2c08cdfb.jpg"
                    $goodslist[$key]['coverImg'] = C('url') . json_decode($value['coverImg'])[0];
                }

                $package['goodslist'] = $goodslist;

                $result[] = $package;

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

    public function addUserBooking()
    {
        $data['firstName'] = $_POST['firstName'];
        $data['phone'] = $_POST['phone'];
        $data['email'] = $_POST['email'];
        $data['booking_time'] = $_POST['booking_time'];
        $data['desc'] = $_POST['desc'];
        $data['scheduleId'] = 0;

        $res = M('user_booking')->add($data);

        if ($res) {

            echo json_encode(array('status' => 200, 'msg' => 'success'));
            exit();
        } else {
            echo json_encode(array('status' => 401, 'msg' => 'fail'));
            exit();
        }
    }
    
    public function bookingSchedule()
    {
        // Add this line to check if the function is being called and the method used
        if ($_SERVER['REQUEST_METHOD'] != 'POST') {
            echo json_encode(array('status' => 400, 'msg' => 'Invalid request method'));
            exit;
        }

        //   echo json_encode(array('status' => 400, 'msg' =>$_POST['uid'] ));
        //     exit;
        if (!isset($_POST['uid']) || !isset($_POST['booking_start_time'])) {

            exit;
        }

        $havePackageArray = $_POST['isPackage']; // An array with 0s and 1s indicating package products

        $data['good_id'] = $_POST['goodId']; // An array containing goods ID

        $packageExists = in_array(1, $havePackageArray);
        if ($packageExists) {
            // Check if the user has purchased all the package products
            foreach ($havePackageArray as $index => $hasPackage) {
                if ($hasPackage == 1) {
                    $goodIds = explode(",", $data['good_id']);
                    $goodId = $goodIds[$index];
                    
                     $result = M('goods')->where(array('id' => $goodId ))->find();
                    $goodsName = $result['name'];
                
                    
                    //  echo json_encode(array('status' => 112, 'msg' => $result ));
                    //     exit();
                 
                 $list = M('package_record')->where(array('uid' => $_POST['uid'], 'goodsId' => $goodId , 'numberOfTime' => array('gt', 0)))->find();
                  
                    if (!$list) {
                       echo json_encode(array('status' => 112, 'msg' => "You didn't purchase this package: $goodsName"));
                        exit();
                    } 
                    else {
                      $data['havePackage'] = "1";
                    }
                }
            }
        }

        // Continue with saving the booking as before
        $data['user_name'] = $_POST['userName'];
        $data['uid'] = $_POST['uid'];
        $data['user_phone'] = $_POST['userPhone'];
        $data['branch_phone'] = $_POST['branchTel'];
        $data['booking_start_time'] = $_POST['booking_start_time'];
        $data['booking_end_time'] = $_POST['booking_end_time'];
        $data['branchId'] = $_POST['branchId'];
        $data['stylist_id'] = $_POST['stylist_id'];
        $data['stylist_name'] = $_POST['stylist_name'];
        $data['amount'] = $_POST['amount'];
        $data['memberId'] = $_POST['MemberId'];
        $data['appointmentDetail'] = $_POST['appintDetail'];
        //$data['havePackage'] = '1';
        // echo json_encode(array('status' => 200, 'msg' => 'success', 'data' => $data));
        // exit();
        

        if (isset($_POST['do']) && $_POST['do'] == 'edit' && isset($_POST['id'])) {
            $res = M('user_booking')->where(array('id' => $_POST['id']))->save($data);
        } elseif (isset($_POST['do']) && $_POST['do'] == 'add') {
            // If adding a record successfully, it returns the id
            $res = M('user_booking')->add($data);
            // echo $res;
            // exit();
        } else {
            echo json_encode(array('status' => 400));
            exit;
        }

        if ($res) {
            // Step 3: Remove the goods from the cart when finished booking
            $id_arr = explode(",", $data['good_id']);
            foreach ($id_arr as $v) {
                $list = M('cart')->where(array('goodsId' => $v))->save(array('status' => 1));
            }

            echo json_encode(array('status' => 200, 'msg' => 'success', 'data' => $res));
            exit();
        } else {
            echo json_encode(array('status' => 401, 'msg' => 'fail'));
            exit();
        }
    }
    // public function del()
    // {
    //     $where =$_GET['id'];

    //     $res = M('user_booking')->where('id' => $where)->save(array('status' => 2));

    //     if ($res) {
    //         echo json_encode(array('status' => 111, 'msg' => 'success'));
    //         exit();
    //     } else {
    //         echo json_encode(array('status' => 110, 'msg' => 'fail'));
    //         exit();
    //     }
    // }

    public function getBranch()
    {
        $where['isdel'] = 1;
        $list = M('branch')->where($where)->select();

        echo json_encode(array('data' => $list));
    }

    public function getStylists()
    {

        $where['branchId'] = I('branchId');

        $list = M('stylist')->where($where)->select();
        echo json_encode(array('data' => $list));
    }

    public function getAllBooking()
    {
        $where['status'] != 2;
        //based on the onpress function in bookingscreen line 524, when a stylist icon is onpress
        //call function  getStylistBookingTime() by stylist's sid

        $where['stylist_id'] = I('sid');
        $list = M('user_booking')->where($where)->select();
        echo json_encode(array('data' => $list));

    }

    public function cancelBooking()
    {
        $where['id'] = $_GET['bookingId'];

        $res = M('user_booking')->where($where)->save(array('status' => 2));

        if ($res) {
            echo json_encode(array('status' => 111, 'msg' => 'success'));
            exit();
        } else {
            echo json_encode(array('status' => 110, 'msg' => 'fail'));
            exit();
        }
    }

}