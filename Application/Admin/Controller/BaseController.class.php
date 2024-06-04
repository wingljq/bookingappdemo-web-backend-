<?php
namespace Admin\Controller;
use Think\Controller;
class BaseController extends Controller
{
    public function _initialize()
    {
        //var_dump($_SESSION['userInfo']['uid']);
        if (!$_SESSION['userInfo']['uid']) {
            //$this->redirect('Login/index');
            echo "<script>window.top.location.href = \"". C('url')."index.php/Admin/Login/index.html\";</script>";
            exit();
        }
    }

    public function addpic()
    {
        $res = uploadImg($_FILES['file'], 'banner');
        if (!$res) {
            die(json_encode(array('status' => 110, 'msg' => $upload->getError())));
        } else {
            // 上传成功 获取上传文件信息
            die(json_encode(array('status' => 111, 'msg' => 'upload success', 'path' => $res)));
        }
    }

    public function upload($image)
    {
        $upload = new \Think\Upload(); // 實例化上傳類
        $upload->maxSize   =     3145728; // 設置附件上傳大小
        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg'); // 設置附件上傳類型
        $upload->savePath  =      '/Uploads/image/'; // 設置附件上傳目錄
        $upload->rootPath  =      getcwd().'/';
        $info   =   $upload->uploadOne($image);
        if (!$info) { // 上傳錯誤提示錯誤信息
            echo json_encode(array('status' => 110, 'msg' => $upload->getError()));
            exit();
        } else { // 上傳成功
            $res = "http://" . $_SERVER['HTTP_HOST'] . $info['savepath'] . $info['savename'];
        }
        return $res;
    }

    //分類樹
    public function tree($arr, $pid = 0, $leavl = 0)
    {
        static $res = array();
        foreach ($arr as $v) {
            if ($v['pid'] == $pid) {
                $v['level'] = $leavl + 1;
                $v['html'] = str_repeat('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;', $leavl);
                $v['html2'] = str_repeat('——', $leavl);
                $res[] = $v;
                $this->tree($arr, $v['cateId'], $leavl + 1);
            }
        }
        return $res;
    }

    public  function putcsv($data = [], $header_data = [], $file_name = '')
    {
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename=' . $file_name);
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

    public  function getChildId($list, $agentId = 0, $level = 1)
    {
        $subs = array();
        foreach ($list as $item) {
            if ($item['p_agentId'] == $agentId) {
                //$item['level']=$level;
                $subs[] = $item;
                $subs = array_merge($subs, $this->getChildId($list, $item['agentId'], $level + 1));
            }
        }
        return $subs;
    }

    public function getSonIds($agentId)
    {
        $list = M('admin')->field('agentId,pid,level')->select();
        $res = $this->getChildId($list, $agentId, 1);
        return $res;
    }

    public function getTopPid($agentId)
    { //獲取頂級的
        $list = $this->getParentId($agentId);
        foreach ($list as $key => $value) {
            if ($value['level'] == 1) {
                return $value['id'];
                exit;
            }
        }
    }

    public function getParentData($arr, $uid)  //找所有的父級
    {
        //如果為0表示，沒有父級了  
        if ($uid == 0) return 0;
        foreach ($arr as $k => $v) {
            if ($v['uid'] == $uid) {
                if ($v['pid'] != 0) $GLOBALS['ids'][] = $v['pid'];
                // if($v['pid'] != 0 ) $GLOBALS['ids'][] =array( 'uid'=>$v['pid']  );  
                $this->getParentData($arr, $v['pid']);
            }
        }
        return  $GLOBALS['ids'];
    }

    public function getParentId($agentId)
    {
        $GLOBALS['ids'] = array();
        $list = M('admin')->where(array('role' => 3))->field('uid,pid')->select();
        $res = $this->getParentData($list, $agentId);
        $res[] = (string)$agentId;
        return $res;
    }
    
    public function getShopsByAgent($agentId)
    {
        $shopList = M('agent_shop')->where(array('agentId' => $agentId))->select();
    }
}
