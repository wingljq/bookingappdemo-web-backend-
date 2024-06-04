<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en" class="js cssanimations">

<head>
    <link rel="icon" href="/beautyappdemo/Public/image/favicon.ico" type="image/png" sizes="16x16">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="/beautyappdemo/Public/css/amazeui.css">
    <link rel="stylesheet" href="/beautyappdemo/Public/css/adminPage.css">
    <link rel="stylesheet" href="/beautyappdemo/Public/css/iconfont.css">
    <link rel="stylesheet" href="/beautyappdemo/Public/css/layui.css">
</head>

<body>
    <!-- menu_left -->
    <nav class="menu_left_box">
        <div class="logobox">
            <img src="/beautyappdemo/Public/image/favicon.ico">
        </div>

        <div class="menu_content">
            <div class="menulistbox">
                <ul class="menulist_ul">
                    <li class="menulist_li">
                        <div class="menulist_title">
                            <span class="iconfont icon-zhuye1" style="font-size: 18px"></span> Homepage
                        </div>
                        <div class="menuzilist_box">
                            <ul>
                                <!-- <li class="menuzilist_li">
                                    <a target="right" href="<?php echo U('shop/index');?>">
                                        <div class="menuzilist_content">shopList</div>
                                    </a>
                                </li> -->
                                <li class="menuzilist_li">
                                    <a target="right" href="<?php echo U('Banner/index');?>">
                                        <div class="menuzilist_content">Home Banner</div>
                                    </a>
                                </li>
                                <li class="menuzilist_li">
                                    <a target="right" href="<?php echo U('Appbanner/index');?>">
                                        <div class="menuzilist_content">App Banner</div>
                                    </a>
                                </li>
                                <li class="menuzilist_li">
                                    <a target="right" href="<?php echo U('Promote/index');?>">
                                        <div class="menuzilist_content">Promote</div>
                                    </a>
                                </li>
                                <li class="menuzilist_li">
                                    <a target="right" href="<?php echo U('Pagebanner/index');?>">
                                        <div class="menuzilist_content">Page Banner</div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="menulist_li">
                        <div class="menulist_title">
                            <span class="iconfont icon-gerenzhongxin2"></span> Customers
                        </div>
                        <div class="menuzilist_box">
                            <ul>
                                <li class="menuzilist_li">
                                    <a target="right" href="<?php echo U('user/index');?>">
                                        <div class="menuzilist_content">CustomersList</div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="menulist_li">
                        <div class="menulist_title">
                            <span class="iconfont icon-shujuku"></span> Product
                        </div>
                        <div class="menuzilist_box">
                            <ul>
                                <li class="menuzilist_li">
                                    <a target="right" href="<?php echo U('cate/index');?>">
                                        <div class="menuzilist_content">CategoryList</div>
                                    </a>
                                    <a target="right" href="<?php echo U('goods/index');?>">
                                        <div class="menuzilist_content">ProductList</div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <!-- <li class="menulist_li">
                        <div class="menulist_title">
                            <span class="iconfont icon-icon"></span> Orders
                        </div>
                        <div class="menuzilist_box">
                            <ul>
                                <li class="menuzilist_li">
                                    <a target="right" href="<?php echo U('order/index');?>">
                                        <div class="menuzilist_content">OrderList</div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li> -->
                    <li class="menulist_li">
                        <div class="menulist_title">
                            <span class="iconfont icon-youhuiquan1"></span> Coupon
                        </div>
                        <div class="menuzilist_box">
                            <ul>
                                <li class="menuzilist_li">
                                    <a target="right" href="<?php echo U('yhcard/index');?>">
                                        <div class="menuzilist_content">CouponList</div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="menulist_li">
                        <div class="menulist_title">
                            <span class="iconfont icon-lipin1" style="font-weight: 18px"></span> Integral
                        </div>
                        <div class="menuzilist_box">
                            <ul>
                                <li class="menuzilist_li">
                                    <a target="right" href="<?php echo U('score/index');?>">
                                        <div class="menuzilist_content">IntegralRecord</div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="menulist_li">
                        <!-- <div class="menulist_title active"> -->
                        <div class="menulist_title">
                            <span class="iconfont icon-shezhi"></span> Setting
                        </div>
                        <div class="menuzilist_box">
                            <ul>
                                <li class="menuzilist_li">
                                    <a target="right">
                                        <a target="right" href="<?php echo U('admin/index');?>">
                                            <div class="menuzilist_content">AdminList</div>
                                        </a>
                                    </a>
                                    <a target="right">
                                        <a target="right" href="<?php echo U('Staff/index');?>">
                                            <div class="menuzilist_content">Staff</div>
                                        </a>
                                    </a>
                                    <a target="right">
                                        <a target="right" href="<?php echo U('Branch/index');?>">
                                            <div class="menuzilist_content">Branch</div>
                                        </a>
                                    </a>
                                    <a target="right" href="<?php echo U('system/chinese');?>">
                                        <div class="menuzilist_content">Info</div>
                                    </a>
                                    <a target="right" href="<?php echo U('system/aboutSet');?>?lang=1">
                                        <div class="menuzilist_content">About Page Set</div>
                                    </a>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="menulist_li">
                        <div class="menulist_title">
                            <span class="iconfont icon-richeng1" style="font-weight: 18px"></span> Reservation
                        </div>
                        <div class="menuzilist_box">
                            <ul>
                                <li class="menuzilist_li">
                                    <a target="right" href="<?php echo U('Schedule/booking');?>">
                                        <div class="menuzilist_content">Booking</div>
                                    </a>
                                    <a target="right" href="<?php echo U('Schedule/index');?>">
                                        <div class="menuzilist_content">ScheduleList</div>
                                    </a>
                                    <a target="right" href="<?php echo U('Schedule/package');?>">
                                        <div class="menuzilist_content">PackageRecord</div>
                                    </a>
                                    <!-- <a target="right" href="<?php echo U('Schedule/SMSnotifications');?>">
                                        <div class="menuzilist_content">SMS message</div>
                                    </a>  -->
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <span class="logout adminDoBtn"
            style="bottom: 20px;background: #ffffff;border-radius: 30px; margin-left: 32px;color: #7c83a3 " ;><i
                class="iconfont icon-tuichu" style="position: relative;top: 2px;font-size: 18px"></i> Log out</span>
    </nav>
    <!-- menu_left  end -->
    <div class="rightCon">
        <iframe scrolling="auto" rameborder="0" src="<?php echo U('user/index');?>" name="right" width="100%" height="100%"
            style="margin: 0;"></iframe>
    </div>
</body>

</html>
<script src="/beautyappdemo/Public/js/jquery.min.js"></script>
<script src="/beautyappdemo/Public/js/layer.js"></script>
<script>
    $(document).ready(function () {
        $(".menulist_li").on("click", function () {
            $(".menuzilist_box").css("display", "none");
            $(".menulist_li").removeClass("active");
            $(".menulist_title").removeClass("active");
            $(this).addClass("active");
            $(this).find(".menulist_title").addClass("active");
            $(this).find(".menuzilist_box").css("display", "block");
        });
    });
    $('.logout').click(function () {
        $.ajax({
            url: "<?php echo U('login/out');?>",
            dataType: "json",
            success: function (res) {
                location.href = "<?php echo U('login/index');?>";
            }
        })
    })
</script>