<?php


namespace Home\Controller;

use Think\Controller;

class CrmController extends Controller
{

    public function _initialize(){
        if(!C("crm_enable")){
            $this->jsonError("未啟用CRM同步配置");
        }
    }

    /**
     * 同步账号信息
     */
    public function syncAccounts(){
        try {

            $uids = M('user')->where(array('isdel' => 0))->field('uid')->select();
            if(!empty($uids)){
                foreach($uids as $uid){
                    crm_accounts_sync($uid['uid']);
                }
            }

            $this->succJson();
        }catch (\Exception $e){
            $this->jsonError($e->getMessage());
        }
    }

    /**
     * 同步产品信息
     */
    public function syncProduct(){
        try {

            //同步分类
            $cateIds =M('cate')->where(array('isdel' => 1))->field("cateId")->select();
            foreach($cateIds as $cateId){
                crm_product_categories_sync($cateId['cateId']);
            }

            //同步产品
            $goodsIds = M("goods")->where(array("isdel" => 1))->field("id")->select();
            foreach($goodsIds as $goodsId){
                crm_product_sync($goodsId['id']);
            }

            $this->succJson();
        }catch (\Exception $e){
            $this->jsonError($e->getMessage());
        }
    }

    /**
     * 同步产品信息
     */
    public function syncReports()
    {
        try {

            crm_reports_sync();

            $this->succJson();
        }catch (\Exception $e){
            $this->jsonError($e->getMessage());
        }
    }

    private function succJson(){
        die(json_encode(['status' => 0], JSON_UNESCAPED_UNICODE));
    }

    private function jsonError($msg){
        die(json_encode(['status' => -1, "msg" => $msg], JSON_UNESCAPED_UNICODE));
    }
}
