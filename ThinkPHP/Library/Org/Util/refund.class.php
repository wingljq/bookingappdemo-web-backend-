<?php
class refund
{
private $appid;
private $sign_key;
private $mch_id;
private $out_trade_no;
private $out_refund_no;
private $total_fee;
private $refund_fee;
private $refund_desc;
public  function __construct($appid ,$sign_key,$mch_id,$out_trade_no,$out_refund_no,$total_fee,$refund_fee,$refund_desc){
    $this->appid=$appid;
    $this->sign_key=$sign_key;
    $this->mch_id=$mch_id;
    $this->out_trade_no=$out_trade_no;
    $this->out_refund_no=$out_refund_no;
    $this->total_fee=$total_fee;
    $this->refund_fee=$refund_fee;
    $this->refund_desc=$refund_desc;
}
public function tuikuan(){
    //退款详情
    $srcData = array(
        "appid"=>$this->appid,
        "mch_id"=>$this->mch_id,
        "nonce_str"=>"1bdcf1b810955ef1d1e17103329abca9",//随机数
        "out_trade_no"=>$this->out_trade_no,//平台订单号
        "out_refund_no"=>$this->out_refund_no,//退款订单号，根据自己平台订单规则生成
        "total_fee"=>$this->total_fee,
        "refund_fee"=>$this->refund_fee,
        "refund_desc"=>$this->refund_desc,
    );
   $res=$this->refund($srcData);
   return $res;
}
//退款
public function  refund($srcData){
        ksort($srcData);
        $srcStr = '';
        foreach ($srcData as $key => $val) {
            if ( $key!='key' && $val != '') {
                $srcStr .= '&' . $key . '=' . $val;
            }
        }
        $srcStr = substr($srcStr, 1);
        $signKey = $this->sign_key;
        $str = $srcStr . '&key=' .$signKey;
        $signResult = strtoupper(md5($str));
        $params = "<xml>
<appid>{$srcData['appid']}</appid>
<mch_id>{$srcData['mch_id']}</mch_id>
<nonce_str>{$srcData['nonce_str']}</nonce_str>
<out_trade_no>{$srcData['out_trade_no']}</out_trade_no>
<out_refund_no>{$srcData['out_refund_no']}</out_refund_no>
<total_fee>{$srcData['total_fee']}</total_fee>
<refund_fee>{$srcData['refund_fee']}</refund_fee>
<refund_desc>{$srcData['refund_desc']}</refund_desc>
<sign>$signResult</sign>
</xml>";
        //微信退款需要双向证书
        $res = $this->curl_post_ssl('https://api.mch.weixin.qq.com/secapi/pay/refund', $params);
        $res = $this->xml2array($res);
        return $res;
    }
//微信支付证书,申请通过后，微信会将证书通过邮件发到申请邮箱
public function curl_post_ssl($url, $vars, $second=30,$aHeader=array())
{
    $ch = curl_init();
    //超时时间
    curl_setopt($ch,CURLOPT_TIMEOUT,$second);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER, 1);
    //这里设置代理，如果有的话
    //curl_setopt($ch,CURLOPT_PROXY, '10.206.30.98');
    //curl_setopt($ch,CURLOPT_PROXYPORT, 8080);
    curl_setopt($ch,CURLOPT_URL,$url);
    curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,false);
    curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,false);
    //以下两种方式需选择一种
    //微信支付证书
    $path ="/www/wwwroot/jianglefu/Public/cert";
    //第一种方法，cert 与 key 分别属于两个.pem文件
    //默认格式为PEM，可以注释
    curl_setopt($ch,CURLOPT_SSLCERTTYPE,'PEM');
    curl_setopt($ch,CURLOPT_SSLCERT,$path.'/apiclient_cert.pem');
    //默认格式为PEM，可以注释
    curl_setopt($ch,CURLOPT_SSLKEYTYPE,'PEM');
    curl_setopt($ch,CURLOPT_SSLKEY,$path.'/apiclient_key.pem');
    //第二种方式，两个文件合成一个.pem文件
    //curl_setopt($ch,CURLOPT_SSLCERT,getcwd().'/all.pem');
    if( count($aHeader) >= 1 ){
        curl_setopt($ch, CURLOPT_HTTPHEADER, $aHeader);
    }
    curl_setopt($ch,CURLOPT_POST, 1);
    curl_setopt($ch,CURLOPT_POSTFIELDS,$vars);
    $data = curl_exec($ch);
    if($data){
        curl_close($ch);
        return $data;
    }
    else {
        $error = curl_errno($ch);
        echo "call faild, errorCode:$error\n";
        curl_close($ch);
        return false;
    }
}
    //XML转为数组
    public function xml2array($xml){
        return json_decode(json_encode((array) simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
    }
}