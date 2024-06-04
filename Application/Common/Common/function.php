<?php

function not_empty($list){
    foreach ($list as $key => $value) {

        foreach ($value as $k => $v) {
            if($value[$k]==null){
                echo  json_encode(array('code'=>$value['code'] ,'message'=>$k."不能为空", 'data'=>array() ));exit();
            }
        }
    }
}



function _not_empty($list){
    foreach ($list as $key => $value) {

        foreach ($value as $k => $v) {
            if($value[$k]==null){
                echo  json_encode(array('code'=>$value['code'] ,'message'=>$k."不能为空", 'data'=>(object)array() ));exit();
            }
        }
    }
}




function getUserInfo($uid){

    $userInfo=M('user')->where(array('uid'=>$uid))->field('*')->find();
    unset($userInfo['password']);

    if($userInfo){
        $futureMoney=M('income')->where(array('uid'=>$uid ,'isActive'=>0,'type'=>2 ))->sum('money');
        $userInfo['futureMoney']=$futureMoney?$futureMoney:0 ;
        $userInfo['leftDays']='30天';
        $userInfo['nextLevelNumber']=M('user')->where(array('pid'=>$uid))->count();
        if($userInfo['nextLevelNumber']>0){
            $userInfo['avgFriendMoney']=floor($userInfo['friendMoney']/$userInfo['nextLevelNumber']);
        }else{
            $userInfo['avgFriendMoney']=0;
        }

        $userData=array(  'userInfo'=>$userInfo);
        return $userData;
    }else{
        return false ;
    }

}


function getAge($birthday) {


    if(!$birthday){
            return 0;
    }
        $birthday=date('Y-m-d',$birthday);


        $iage = 0;
        if (!empty($birthday)) {
            $year = date('Y',strtotime($birthday));
            $month = date('m',strtotime($birthday));
            $day = date('d',strtotime($birthday));
            
            $now_year = date('Y');
            $now_month = date('m');
            $now_day = date('d');
    
            if ($now_year > $year) {
                $iage = $now_year - $year - 1;
                if ($now_month > $month) {
                    $iage++;
                } else if ($now_month == $month) {
                    if ($now_day >= $day) {
                        $iage++;
                    }
                }
            }
        }
        return $iage;
}
function httpPost2($url = '', $post_data ) {
        if (empty($url) || empty($post_data)) {
            return false;
        }
        
        // $o = "";
        // foreach ( $post_data as $k => $v ) 
        // { 
        //     $o.= "$k=" . urlencode( $v ). "&" ;
        // }
        // $post_data = substr($o,0,-1);

        $postUrl = $url;
        $curlPost = $post_data;
        $ch = curl_init();//初始化curl
        curl_setopt($ch, CURLOPT_URL,$postUrl);//抓取指定网页
        curl_setopt($ch, CURLOPT_HEADER, 0);//设置header
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);//要求结果为字符串且输出到屏幕上
        curl_setopt($ch, CURLOPT_POST, 1);//post提交方式
        curl_setopt($ch, CURLOPT_POSTFIELDS, $curlPost);
        $data = curl_exec($ch);//运行curl
        curl_close($ch);
        
        return $data;
    }

    function curl_get($url){
        $ch = curl_init($url) ;
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);//https
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);//https
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true) ;
        curl_setopt($ch, CURLOPT_BINARYTRANSFER, true) ;
        $output = curl_exec($ch) ;
        curl_close($ch);
        return $output;
    }

function image_arr($img_json){
        $img_arr=json_decode($img_json,true);
        $arr=array();
        if(count($img_arr)){

            foreach ($img_arr as $key => $value) {
                $arr[]=$value['url'];
            }
       }

    return $arr?$arr:array();
}

function putCsv($data = [], $header_data = [], $file_name = '')
    {
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename='.$file_name);
        header('Cache-Control: max-age=0');
        $fp = fopen('php://output', 'a');
        if (!empty($header_data)) {
            foreach ($header_data as $key => $value) {
                $header_data[$key] = iconv('utf-8', 'gbk', $value);
            }
            fputcsv($fp, $header_data);
        }
        $num = 0;
        $limit = 100000;
        $count = count($data);
        if ($count > 0) {
            for ($i = 0; $i < $count; $i++) {
                $num++;
                if ($limit == $num) {
                    ob_flush();
                    flush();
                    $num = 0;
                }
                $row = $data[$i];
                foreach ($row as $key => $value) {
                    $row[$key] = iconv('utf-8', 'gbk', $value);
                }
                fputcsv($fp, $row);
            }
        }
        fclose($fp);
    }

function encrypt($data, $appkey) {
    return urlencode(base64_encode(md5($data.$appkey)));
}

function kdSendPost($url, $datas) {
    $temps = array();   
    foreach ($datas as $key => $value) {
        $temps[] = sprintf('%s=%s', $key, $value);      
    }   
    $post_data = implode('&', $temps);
    $url_info = parse_url($url);
    if(empty($url_info['port']))
    {
        $url_info['port']=80;   
    }
    $httpheader = "POST " . $url_info['path'] . " HTTP/1.0\r\n";
    $httpheader.= "Host:" . $url_info['host'] . "\r\n";
    $httpheader.= "Content-Type:application/x-www-form-urlencoded\r\n";
    $httpheader.= "Content-Length:" . strlen($post_data) . "\r\n";
    $httpheader.= "Connection:close\r\n\r\n";
    $httpheader.= $post_data;
    $fd = fsockopen($url_info['host'], $url_info['port']);
    fwrite($fd, $httpheader);
    $gets = "";
    $headerFlag = true;
    while (!feof($fd)) {
        if (($header = @fgets($fd)) && ($header == "\r\n" || $header == "\n")) {
            break;
        }
    }
    while (!feof($fd)) {
        $gets.= fread($fd, 128);
    }
    fclose($fd);  
    
    return $gets;
}




       function getAccessToken() {


  
  
      $info = M('wxset')->where(array('id'=>1))->find();
      $timecha=time()-$info['get_token_time'];
      
      if($timecha>7000){
             M('wxset')->where(array('id'=>1))->setInc('get_token_cishu');

          $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wxae14fcecabb82801&secret=631311a6736895b84bdec21cc55bd61e";
           
          $res=httpGet($url);
          $res = json_decode(($res));

          $access_token = $res->access_token;

          $upddata['token']=$access_token;
          $upddata['get_token_time']=time();
          M('wxset')->where(array('id'=>1))->save($upddata);
          
      }else {
          $access_token=$info['token'];
      }
      return $access_token;     

    
  }
  


   function httpPost($url,$data=null){
          $curl=curl_init();
          curl_setopt($curl,CURLOPT_URL,$url);
          curl_setopt($curl,CURLOPT_SSL_VERIFYPEER,FALSE);
          curl_setopt($curl,CURLOPT_SSL_VERIFYHOST,FALSE);
          if(!empty($data)){
              curl_setopt($curl,CURLOPT_POST,1);
              curl_setopt($curl,CURLOPT_POSTFIELDS,$data);
          }
          curl_setopt($curl,CURLOPT_RETURNTRANSFER,1);
          $output=curl_exec($curl);
          curl_close($curl);
          

          return $output;
    }


     function httpGet($url) {
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE); //https
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE); //https
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_BINARYTRANSFER, true);
        $output = curl_exec($ch);
        curl_close($ch);
        return $output;
    }


     function sendTempMsg($openid ,$template_id  ,  $data ,$form_id){
        $token=getAccessToken();
        $senData=array(
            'access_token'=>$token,
            'touser'=>$openid,
            'template_id'=>$template_id,
            'data'=>$data,
            'form_id'=>$form_id,
        );
        $url='https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token='.$token;
        $res=httpPost( $url,  json_encode($senData)  );
        return $res;     
    }




