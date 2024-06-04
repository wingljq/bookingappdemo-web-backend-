<?php


function https_get($url){
    $curl = curl_init(); // 启动一个CURL会话
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_HEADER, 0);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false); // 跳过证书检查
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, true);  // 从证书中检查SSL加密算法是否存在
    $tmpInfo = curl_exec($curl);     //返回api的json对象
    //关闭URL请求
    curl_close($curl);
    return $tmpInfo;    //返回json对象
}


 function randomkeys($length){
        $pattern = '1234567890';
        for($i=0;$i<$length;$i++)
        {
            $key .= $pattern{mt_rand(0,9)};    //生成php随机数
        }
        return $key;
 }
 function str_replace_once($needle, $replace, $haystack) {
    // Looks for the first occurence of $needle in $haystack
    // and replaces it with $replace.
    $pos = strpos($haystack, $needle);
    if ($pos === false) {
        // Nothing found
        return $haystack;
    }
    return substr_replace($haystack, $replace, $pos, strlen($needle));
}


 function uploadpic($image){
        
        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize   =     9999999945728 ;// 设置附件上传大小
        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
        $upload->savePath  =      'Public/Uploads/head/'; // 设置附件上传目录
        $upload->rootPath  =      getcwd().'/';
        // 上传文件 
        $info   =   $upload->uploadOne($image);
        if(!$info) {// 上传错误提示错误信息
        	echo json_encode(array('code'=>1,'message'=>$upload->getError(),'data'=>array()));exit();
        }else{// 上传成功
            $res=$info['savepath'].$info['savename'];
            $image = new \Think\Image();
            $image->open($res);
            $image->thumb(150, 150,\Think\Image::IMAGE_THUMB_CENTER)->save($res);
        }       
        
        return $res;

    }


// //获得周的开始时间和结束时间
//
//    function getWeekRange("2015-09-30"){
//	　　$ret=array();
//	　　$timestamp=strtotime($date);
//	　　$w=strftime('%u',$timestamp);
//	　　$ret['sdate']=date('Y-m-d 00:00:00',$timestamp-($w-1)*86400);
//	　　$ret['edate']=date('Y-m-d 23:59:59',$timestamp+(7-$w)*86400);
//	　　return $ret;
//　　}
//
//// //获得日期所在开始和结束时间
//function getMonthRange($date){
//　//　$ret=array();
//　　$timestamp=strtotime($date);
//　　$mdays=date('t',$timestamp);
//　　$ret['sdate']=date('Y-m-1 00:00:00',$timestamp);
//　　$ret['edate']=date('Y-m-'.$mdays.' 23:59:59',$timestamp);
//　　return $ret;
//　　}


