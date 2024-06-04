<?php
class fukuan {
private $pay_code;
private $openid;
private $name;
private $money;
  public function __construct($pay_code, $openid,$name,$money) {
    //var_dump($openid);exit;
    $this->pay_code = $pay_code;
    $this->openid = $openid;
    $this->name = $name;
    $this->money = $money;
  } 
public  function fukuan(){
    header('content-type:text/html;charset=utf-8');
    //结算
    $data=array(
        'mch_appid'=>'wx672857f4113b5e8a',//商户账号appid
        'mchid'=>'1503039221',//商户号
        'nonce_str'=>'61651651611111111',//随机字符串
        'partner_trade_no'=>$this->pay_code,//商户订单号
        'openid'=>$this->openid,//用户openid
        'check_name'=>'NO_CHECK',//校验用户姓名选项,
        're_user_name'=>$this->name,//收款用户姓名
        'amount'=>$this->money*100,//金额
        'desc'=>'罗拉智电提成付款',//企业付款描述信息
        'spbill_create_ip'=>$_SERVER['SERVER_ADDR'],
    );
    $secrect_key='b9334ded4fd551f78701295be3cb61a8';///这个就是个API密码。32位的。。随便MD5一下就可以了
    $data=array_filter($data);
    ksort($data);
    $str='';
    foreach($data as $k=>$v) {
        $str.=$k.'='.$v.'&';
    }
    $str.='key='.$secrect_key;
    $data['sign']=$this->MakeSign($data);
    $xml=$this->arraytoxml($data);
    $url='https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers';
    $res=$this->curl($xml,$url);
    $return=$this->xmltoarray($res);
    if($return['return_code']=="SUCCESS"  &&  $return['result_code']=="SUCCESS" ){
            return json_encode(array( 'status'=>111 ,'msg'=>$return['return_msg'] ));
    }else{
            return json_encode(array( 'status'=>110 ,'msg'=>$return['err_code_des'] ));
    }
}
    public  function unicode() {
        $str = uniqid(mt_rand(),1);
        $str=sha1($str);
    return md5($str);
    }
    public  function arraytoxml($data){
        $str='<xml>';
        foreach($data as $k=>$v) {
            $str.='<'.$k.'>'.$v.'</'.$k.'>';
        }
        $str.='</xml>';
        return $str;
    }
    public  function xmltoarray($xml) { 
        //禁止引用外部xml实体 
        libxml_disable_entity_loader(true); 
        $xmlstring = simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA); 
        $val = json_decode(json_encode($xmlstring),true); 
        return $val;
    } 
    public  function curl($param="",$url) {
        $postUrl = $url;
        $curlPost = $param;
        $ch = curl_init();                                      //初始化curl
        curl_setopt($ch, CURLOPT_URL,$postUrl);                 //抓取指定网页
        curl_setopt($ch, CURLOPT_HEADER, 0);                    //设置header
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);            //要求结果为字符串且输出到屏幕上
        curl_setopt($ch, CURLOPT_POST, 1);                      //post提交方式
        curl_setopt($ch, CURLOPT_POSTFIELDS, $curlPost);           // 增加 HTTP Header（头）里的字段 
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);        // 终止从服务端进行验证
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        $zs1="/www/wwwroot/luola.app198.com/wxpay/cert/apiclient_cert.pem";//注意：填写的路径必须为绝对路径，不可以填写相对路径
        $zs2="/www/wwwroot/luola.app198.com/wxpay/cert/apiclient_key.pem";
        curl_setopt($ch,CURLOPT_SSLCERT,$zs1);
        curl_setopt($ch,CURLOPT_SSLKEY,$zs2);
        $data = curl_exec($ch);                                 //运行curl
        curl_close($ch);
        return $data;
    }
    public  function MakeSign($arr){
    //签名步骤一：按字典序排序参数
    ksort($arr);
    $string=$this->ToUrlParams($arr);
    //签名步骤二：在string后加入KEY
    $string = $string . "&key=b9334ded4fd551f78701295be3cb61a8";
    //签名步骤三：MD5加密
    $string = md5($string);
    //签名步骤四：所有字符转为大写
    $result = strtoupper($string);
    return $result;
}
public  function ToUrlParams($arr)
{
    $buff = "";
    foreach ($arr as $k => $v)
    {
        if($k != "sign" && $v != "" && !is_array($v)){
            $buff .= $k . "=" . $v . "&";
        }
    }
    $buff = trim($buff, "&");
    return $buff;
}
}
?>