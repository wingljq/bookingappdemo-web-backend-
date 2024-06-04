<?php

function uploadImg($image,$fileName){
        
    $upload = new \Think\Upload();// 实例化上传类
    $upload->maxSize   =     31457280 ;// 设置附件上传大小
    $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg', 'mp4');// 设置附件上传类型
    $upload->savePath  =      'Public/Uploads/'.$fileName.'/'; // 设置附件上传目录
    $upload->rootPath  =      getcwd().'/';
    $info   =   $upload->uploadOne($image);

    if(!$info) {// 上传错误提示错误信息
        echo json_encode(array('status'=>110,'msg'=>$upload->getError()));exit();
    }else{// 上传成功
        $res= './'.$info['savepath'].$info['savename'];
        // $res="https://".$_SERVER['HTTP_HOST']."/". $info['savepath'].$info['savename'];
    }
    
    return $res;
}
function uploadImages($file,$fileName){
    $upload = new \Think\Upload();// 实例化上传类
    $upload->maxSize   =     31457280 ;// 设置附件上传大小
    $upload->exts      =     array('jpg', 'png', 'jpeg');// 设置附件上传类型
    $upload->savePath  =      'Public/Uploads/'.$fileName.'/'; // 设置附件上传目录
    $upload->rootPath  =      getcwd().'/';

    // 上传文件 
    $info = $upload->upload();
    $res= [];
    if(!$info) {// 上传错误提示错误信息
        echo json_encode(array('status'=>110,'msg'=>$upload->getError()));exit();
    }else{// 上传成功
        foreach($info as $file){
            array_push($res,'./'.$file['savepath'].$file['savename']);

            // array_push($res,"https://".$_SERVER['HTTP_HOST']."/".$file['savepath'].$file['savename']);
        }
    }

    return json_encode($res);

}


