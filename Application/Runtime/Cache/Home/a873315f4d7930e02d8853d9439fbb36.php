<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="zxx">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/beautyappdemo/Public/css/bootstrap.min.css?v=1.0">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="/beautyappdemo/Public/css/animate.min.css">
    <!-- Meanmenu CSS -->
    <link rel="stylesheet" href="/beautyappdemo/Public/css/meanmenu.css">
    <!-- Boxicons CSS -->
    <link rel="stylesheet" href="/beautyappdemo/Public/css/boxicons.min.css">
    <!-- Flaticon CSS -->
    <link rel="stylesheet" href="/beautyappdemo/Public/css/flaticon.css?v=1.0">
    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="/beautyappdemo/Public/css/owl.carousel.min.css">
    <!-- Owl Theme Default CSS -->
    <link rel="stylesheet" href="/beautyappdemo/Public/css/owl.theme.default.min.css">
    <!-- Odometer CSS -->
    <link rel="stylesheet" href="/beautyappdemo/Public/css/odometer.min.css">
    <!-- Nice Select CSS -->
    <!-- <link rel="stylesheet" href="/beautyappdemo/Public/css/nice-select.min.css"> -->
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="/beautyappdemo/Public/css/magnific-popup.min.css">
    <!-- Imagelightbox CSS -->
    <link rel="stylesheet" href="/beautyappdemo/Public/css/imagelightbox.min.css">
    <!-- Style CSS -->
    <link rel="stylesheet" href="/beautyappdemo/Public/css/style.css?v=3.0">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="/beautyappdemo/Public/css/responsive.css?v=1.7">
    <link rel="stylesheet" href="/beautyappdemo/Public/css/config.css">
    <style>
        @media only screen and (max-width: 767px) {
            .col-lg-2 {
                display: none;
            }

            /*     .col-lg-5{
        display: none;
    } */
        }
    </style>

    <!--     <link rel="stylesheet" href="/beautyappdemo/Public/css/mainu.css"> -->
    <script src="https://kit.fontawesome.com/b65333c839.js" crossorigin="anonymous"></script>
    <script src="/beautyappdemo/Public/js/vue.js"></script>

    <!--Start of Tawk.to Script-->
    <script type="text/javascript">
        var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
        (function () {
            var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
            s1.async = true;
            s1.src = 'https://embed.tawk.to/6307442454f06e12d890ac98/1gba64bnu';
            s1.charset = 'UTF-8';
            s1.setAttribute('crossorigin', '*');
            s0.parentNode.insertBefore(s1, s0);
        })();

        function addOrUpdateUrlParam(name, value) {
            var l = window.location;

            /* build params */
            var params = {};
            var x = /(?:\??)([^=&?]+)=?([^&?]*)/g;
            var s = l.search;
            for (var r = x.exec(s); r; r = x.exec(s)) {
                r[1] = decodeURIComponent(r[1]);
                if (!r[2]) r[2] = '%%';
                params[r[1]] = r[2];
            }

            /* set param */
            params[name] = encodeURIComponent(value);

            /* build search */
            var search = [];
            for (var i in params) {
                var p = encodeURIComponent(i);
                var v = params[i];
                if (v != '%%') p += '=' + v;
                search.push(p);
            }
            search = search.join('&');

            /* execute search */
            l.search = search;
        }
        function goCart() {

            $.ajax({
                url: "<?php echo U('cart/getAllCart');?>",
                type: 'post',
                data: {},
                dataType: 'json',
                success: function (data) {
                    console.log(data.data)
                    if (data.data) {
                        window.location.href = "<?php echo U('index/cart');?>"
                    } else {
                        alert('Please add something into cart first')
                    }
                }
            })
        }
    </script>
    <!--End of Tawk.to Script-->


    <title><?php echo C('title');?></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="icon" type="image/png" href="/beautyappdemo/Public/image/favicon.ico">
</head>

<body>


    <div id="loading">
        <div id="loading-center">
            <div id="loading-center-absolute">
                <div class="object" id="object_one"></div>
                <div class="object" id="object_two"></div>
                <div class="object" id="object_three"></div>
                <div class="object" id="object_four"></div>
            </div>
        </div>
    </div>
    <!-- End Preloader Area -->

    <!-- Start Top Header Area -->
    <div class="top-header-area" style="display:none">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-12">
                    <ul class="top-header-information">
                        <li>
                            <i class="flaticon-pin"></i> <?php echo ($shop["address"]); ?>
                        </li>
                        <li>
                            <i class="flaticon-clock"></i> <?php echo ($shop["workDate"]); ?>
                        </li>
                    </ul>
                </div>

                <div class="col-lg-6 col-md-12">
                    <ul class="top-header-optional">
                        <li>Currency: <b>HKD</b></li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Top Header Area -->

    <!-- Start Middle Header Area -->
    <div class="middle-header-area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-2">
                    <div class="middle-header-logo">
                        <a href="<?php echo U('index/index');?>"><img src="/beautyappdemo/Public/image/favicon.ico" alt="logo"></a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <ul class="middle-header-optional" style="">
                        <li><i class="fas fa-globe" style="color: #0C0717;"></i>
                            <a onclick="addOrUpdateUrlParam('l','zh-tw')" onmouseover="this.style.color='orange';"
                                onmouseout="this.style.color='';"><?php echo L('language1');?></a>
                            <a onclick="addOrUpdateUrlParam('l','zh-cn')" onmouseover="this.style.color='orange';"
                                onmouseout="this.style.color='';"><?php echo L('language2');?></a>
                            <a onclick="addOrUpdateUrlParam('l','en-us')" onmouseover="this.style.color='orange';"
                                onmouseout="this.style.color='';"><?php echo L('language3');?></a>
                        </li>
                        <li>
                            <a href="<?php echo U('account/wishlist');?>">
                                <?php echo L('wishlist');?>
                            </a>
                        </li>
                        <li>
                        <li class="nav-item">
                            <?php if($_SESSION['uid']): ?><a href="#" onclick="goCart()">
                                    <?php echo L('cart');?>
                                </a>

                                <?php else: ?>
                                <a href="<?php echo U('account/login');?>" onclick="alert('Please login first')">
                                    <?php echo L('cart');?>
                                </a><?php endif; ?>
                        </li>
                        </li>
                        <?php if($_SESSION['uid']): ?><li>
                                <a href="<?php echo U('account/logOut');?>" class="user-btn logout"><i
                                        class='flaticon-enter'></i><?php echo L('logout');?></a>
                            </li>
                            <?php else: ?>
                            <li>
                                <a href="<?php echo U('account/login');?>" class="user-btn"><i
                                        class='flaticon-enter'></i><?php echo L('login');?> / <?php echo L('register');?></a>
                            </li><?php endif; ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Middle Header Area -->

    <!-- Start Navbar Area -->
    <div class="navbar-area">
        <div class="main-responsive-nav">
            <div class="container">
                <div class="main-responsive-menu" style="
                display: flex;
                flex-direction: row;
                flex-wrap: nowrap;
                justify-content: space-around;
                align-content: center;
                align-items: flex-end;
                width: 100%;
            ">
                    <div class="logo">
                        <a href="<?php echo U('index/index');?>">
                            <img src="/beautyappdemo/Public/image/favicon.ico" alt="image">
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="main-navbar">
            <div class="container">
                <nav class="navbar navbar-expand-md navbar-light">
                    <div class="collapse navbar-collapse mean-menu" id="navbarSupportedContent">
                        <ul class="navbar-nav m-auto">
                            <li class="nav-item">
                                <a href="<?php echo U('index/index');?>" class="nav-link">
                                    <?php echo L('home');?>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="<?php echo U('index/booking');?>" class="nav-link">
                                    <?php echo L('booking');?>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="<?php echo U('index/about');?>" class="nav-link">
                                    <?php echo L('about');?>
                                </a>
                            </li>


                            <li class="nav-item">
                                <a href="<?php echo U('index/cate');?>" class="nav-link">
                                    <?php echo L('cate');?>
                                    <i class='bx bx-chevron-down'></i>
                                </a>

                                <ul class="dropdown-menu">
                                    <?php if(is_array($cate)): $i = 0; $__LIST__ = $cate;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li class="nav-item">
                                            <a href="<?php echo U('index/cate');?>?id=<?php echo ($vo["cateId"]); ?>" class="nav-link">
                                                <?php echo ($vo["name"]); ?>
                                            </a>
                                        </li><?php endforeach; endif; else: echo "" ;endif; ?>

                                </ul>
                            </li>


                            <li class="nav-item">
                                <a href="<?php echo U('index/contact');?>" class="nav-link">
                                    <?php echo L('contactUs');?>
                                </a>
                            </li>
                            <?php if($_SESSION['uid']): ?><li class="nav-item">
                                    <a href="<?php echo U('account/account');?>" class="nav-link">
                                        <?php echo L('userCenter');?>
                                    </a>
                                </li>
                                <?php else: endif; ?>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

        <div class="others-option-for-responsive">
            <div class="container">
                <div class="dot-menu">
                    <div class="inner">
                        <div class="circle circle-one"></div>
                        <div class="circle circle-two"></div>
                        <div class="circle circle-three"></div>
                    </div>
                </div>
                <div class="container">
                    <div class="option-inner">
                        <div class="others-option d-flex align-items-center">
                            <div class="option-item">
                                <span>
                                    <?php echo L('tel');?>:
                                    <a href="tel:852<?php echo ($pcset["phone"]); ?>"><?php echo ($pcset["phone"]); ?> </a>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- End Navbar Area -->
<!-- Start Page Banner -->
<style>
    @media only screen and (max-width: 767px) {
        .row{
            display: flex;
            flex-direction: column;
        }
    }
</style>


<div class="page-banner">
    <div class="row">
        <div class="col-lg-12 col-md-12" style="padding: 0 0 0 0;">
            <div class="home-slides owl-carousel owl-theme">
                <?php if(is_array($pagebanner)): $i = 0; $__LIST__ = $pagebanner;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="page-banner-area" style="background-image:url(<?php echo ($vo["image"]); ?>);
                        background-position: center center;
                        background-size: cover;
                        background-repeat: no-repeat;
                        padding-top: 100px;
                        padding-bottom: 100px;
                        position: relative;
                        z-index: 1;
                    ">
                    <div class="container">
                        <div class="page-banner-content">
                            <h2><?php echo L('contactUs');?></h2>
                            <ul>
                                <li>
                                    <a href="index.html" style="color: #F4EC00;"><?php echo L('home');?></a>
                                </li>
                                <li><i class="fa fa-chevron-right" style="color: #ffff"></i></li>
                                <li style="color: #ffff"><?php echo L('contactUs');?></li>
                            </ul>
                        </div>
                    </div>
                    </div><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
        </div>
    </div>
</div>
<!-- End Page Banner -->

<!-- Start Contact Info Area -->
<section class="contact-info-area pt-100 pb-70">
<!--     <div class="logo" style="width: 100%;
    display: flex;
    align-content: center;
    justify-content: center;
    align-items: center;padding-bottom: 5%;">
        <img src="/beautyappdemo/Public/image/favicon.ico" alt="">
    </div> -->
   <!--  <div class="container"> -->
        <div class="row" >
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="contact-info-box">
                    <div class="icon">
                        <i class='bx bxs-phone-call'></i>
                    </div>
                    <p><a href="tel:<?php echo ($pcest["phone"]); ?>"><?php echo ($pcset["phone"]); ?></a></p>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="contact-info-box">
                    <div class="icon">
                        <i class='fa fa-clock-o'></i>
                    </div>
                    <p><?php echo ($pcset["workTime"]); ?></p>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="contact-info-box">
                    <div class="icon">
                        <i class='bx bx-map'></i>
                    </div>
                    <p><?php echo ($pcset["address1"]); ?></p>
                </div>
            </div>

        </div>
  <!--   </div> -->
</section>
<!-- End Contact Info Area -->

<!-- Start Contact Area -->
<!-- <section class="contact-area pb-100">
    <div class="container" id="app">
        <div class="section-title">
            <h2>Ready To take Booking?</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        </div>

        <div class="contact-form">
            <form>
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="form-group">
                            <label>Name</label>
                            <input id="firstName" v-model="firstName" type="text" name="name" class="form-control" required data-error="Please enter your name">
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6">
                        <div class="form-group">
                            <label>Email</label>
                            <input id="email" v-model="email" type="email" name="email" class="form-control" required data-error="Please enter your email">
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6">
                        <div class="form-group">
                            <label>Phone</label>
                            <input id="phone" v-model="phone" type="text" name="phone_number" id="phone_number" required data-error="Please enter your number" class="form-control">
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6">
                        <div class="form-group">
                            <label>Booking date</label>
                            <input id="booking_time" v-model="booking_time" type="datetime-local" class="form-control" required placeholder="yyyy-mm-dd" autocomplete="off">
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>

                    <div class="col-lg-12 col-md-12">
                        <div class="form-group">
                            <label>Message</label>
                            <input id="desc" v-model="desc" name="message" class="form-control" id="message" cols="30" rows="6" required data-error="Write your message">
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>


                </div>
            </form>
            <div class="col-lg-12 col-md-12">
                <button type="submit" @click="orderPay(2)" class="default-btn">
                                    Send Message
                                </button>


                <div class="clearfix"></div>
            </div>
            <div id="msgSubmit" class="h3 text-center hidden"></div>
        </div>
    </div>
</section>
 -->



<script type="text/javascript">
    new Vue({
        el: '#app',
        data: {

            desc: '',
            booking_time: '',
            /*   time: '', */
            firstName: '',
            phone: '',
            email: '',

        },


        methods: {


            orderPay: function (payType) {

                if (!this.firstName) {
                    alert('請填寫名稱');
                    return false;
                }

                if (!this.phone) {
                    alert('請填寫手機號碼');
                    return false;
                }
                if (!this.email) {
                    alert('請填寫電郵');
                    return false;
                }
                if (!this.booking_time) {
                    alert('請選擇預約日期');
                    return false;
                }


                $.ajax({

                    url: "<?php echo U('booking/getUserBooking');?>",

                    data: {

                        desc: this.desc,
                        booking_time: this.booking_time,
                        /*  time: this.time, */
                        firstName: this.firstName,
                        phone: this.phone,
                        email: this.email,

                    },

                    type: "post",

                    dataType: "json",

                    success: function (res) {

                        //   layer.closeAll();

                        if (res.code == 0) {
                            fresh();
                        } else if (res.code == 1) {

                            var para = "";
                            para += "out_trade_no=" + res.data.out_trade_no;
                            para += "&money=" + res.data.money;
                            para += "&return_url=" + res.data.return_url;
                            para += "&body=" + res.data.body;
                            var url = "/beautyappdemo/pay/index.php?" + para;
                            console.log(url);
                            location.href = {
                                url
                            };

                        }
                    }
                })


            },






        }

    })
</script>
<!-- End Contact Area -->

<!-- Start Map Area -->
<!-- <div id="map">
            <iframe src="https://ditu.google.cn/maps/embed?pb=!1m18!1m12!1m3!1d3022.9476519598093!2d-73.99185268459418!3d40.74117737932881!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c259a3f81d549f%3A0xb2a39bb5cacc7da0!2s175%205th%20Ave%2C%20New%20York%2C%20NY%2010010%2C%20USA!5e0!3m2!1sen!2sbd!4v1588746137032!5m2!1sen!2sbd"></iframe>
        </div> -->
<!-- End Map Area -->

<!-- Start Footer Area -->
<!-- <section class="footer-area pt-100 pb-70">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="single-footer-widget">
                            <a href="index.html">
                                <img src="assets/img/logo-2.png" alt="image">
                            </a>

                            <p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>

                            <ul class="footer-social">
                                <li>
                                    <a href="#" target="_blank">
                                        <i class='bx bxl-facebook'></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" target="_blank">
                                        <i class='bx bxl-twitter'></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" target="_blank">
                                        <i class='bx bxl-pinterest-alt'></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" target="_blank">
                                        <i class='bx bxl-linkedin'></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                        <div class="single-footer-widget">
                            <h2>Recent Post</h2>

                            <div class="footer-post">
                                <article class="item">
                                    <a href="#" class="thumb">
                                        <span class="fullimage cover bg1" role="img"></span>
                                    </a>
                                    <div class="info">
                                        <h4 class="title usmall">
                                            <a href="#">Electronic Car Protect Air Pollution</a>
                                        </h4>
                                        <span>24 Dec 2020</span>
                                    </div>
                                </article>

                                <article class="item">
                                    <a href="#" class="thumb">
                                        <span class="fullimage cover bg2" role="img"></span>
                                    </a>
                                    <div class="info">
                                        <h4 class="title usmall">
                                            <a href="#">Automotive Advancements to Look Forward</a>
                                        </h4>
                                        <span>25 Dec 2020</span>
                                    </div>
                                </article>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                        <div class="single-footer-widget pl-5">
                            <h2>Quick Links</h2>

                            <ul class="quick-links">
                                <li>
                                    <i class='bx bxs-chevrons-right'></i>
                                    <a href="#">About Company</a>
                                </li>
                                <li>
                                    <i class='bx bxs-chevrons-right'></i>
                                    <a href="#">Services</a>
                                </li>
                                <li>
                                    <i class='bx bxs-chevrons-right'></i>
                                    <a href="#">Shop</a>
                                </li>
                                <li>
                                    <i class='bx bxs-chevrons-right'></i>
                                    <a href="#">FAQ</a>
                                </li>
                                <li>
                                    <i class='bx bxs-chevrons-right'></i>
                                    <a href="#">Blog</a>
                                </li>
                                <li>
                                    <i class='bx bxs-chevrons-right'></i>
                                    <a href="#">Gallery</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                        <div class="single-footer-widget">
                            <h2>Information</h2>

                            <ul class="footer-contact-info">
                                <li>
                                    <i class='bx bxs-phone'></i>
                                    <span>Phone</span>
                                    <a href="tel:882569756">882-569-756</a>
                                </li>
                                <li>
                                    <i class='bx bx-envelope'></i>
                                    <span>Email</span>
                                    <a href="mailto:hello@maxon.com">hello@maxon.com</a>
                                </li>
                                <li>
                                    <i class='bx bx-map'></i>
                                    <span>Address</span>
                                    175 5th Ave Premium Area, New York
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section> -->
<!-- Start Footer Area -->
<section class="footer-area pt-100 pb-70">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-sm-3">
                <div class="single-footer-widget">
                    <a href="<?php echo U('index/index');?>">
                        <img src="/beautyappdemo/Public/image/favicon.ico" alt="image" style="    height: 100px;">
                    </a>
                    <!-- <p><?php echo L('workingdate');?>: <?php echo ($pcset["workDate"]); ?></p> -->
                    <p><?php echo L('officehour');?>: <?php echo ($pcset["workDate"]); ?> <?php echo ($pcset["workTime"]); ?></p>
                    </br>
                    <p><?php echo ($pcset["address1"]); ?></p>
                    <br />
                    <div class="mapouter">
                        <div class="gmap_canvas"><iframe width="213" height="164" id="gmap_canvas"
                                src="<?php echo ($pcset["googleMapHtml"]); ?>" frameborder="0" scrolling="no" marginheight="0"
                                marginwidth="0"></iframe><a href="https://putlocker-is.org"></a><br>
                            <style>
                                .mapouter {
                                    position: relative;
                                    text-align: right;
                                    height: 164px;
                                    width: 213px;
                                }
                            </style>embedgooglemap.net</a>
                            <style>
                                .gmap_canvas {
                                    overflow: hidden;
                                    background: none !important;
                                    height: 164px;
                                    width: 213px;
                                }
                            </style>
                        </div>
                    </div>
                    <br /><br />


                    <!-- <ul class="footer-social">
                        <li>
                            <a href="<?php echo ($shop["facebook"]); ?>" target="_blank">
                                <i class='bx bxl-facebook'></i>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo ($shop["instagram"]); ?>" target="_blank">
                                <i class='bx bxl-instagram'></i>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo ($shop["wechat"]); ?>" target="_blank">
                                <i class="fa fa-weixin"></i>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo ($shop["pinterest"]); ?>" target="_blank">
                                <i class='bx bxl-pinterest-alt'></i>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo ($shop["youtube"]); ?>" target="_blank">
                                <i class='bx bxl-youtube'></i>
                            </a>
                        </li>
                    </ul> -->
                </div>
            </div>

            <!-- <div class="col-lg-3 col-sm-6">
				<div class="single-footer-widget">
					<h2>Recent Post</h2>

					<div class="footer-post">
						<article class="item">
							<a href="#" class="thumb">
								<span class="fullimage cover bg1" role="img"></span>
							</a>
							<div class="info">
								<h4 class="title usmall">
									<a href="#">Electronic Car Protect Air Pollution</a>
								</h4>
								<span>24 Dec 2020</span>
							</div>
						</article>

						<article class="item">
							<a href="#" class="thumb">
								<span class="fullimage cover bg2" role="img"></span>
							</a>
							<div class="info">
								<h4 class="title usmall">
									<a href="#">Automotive Advancements to Look Forward</a>
								</h4>
								<span>25 Dec 2020</span>
							</div>
						</article>
					</div>
				</div>
			</div> -->


            <div class="col-lg-3 col-sm-3" style="justify-content: flex-end;">
                <div class="single-footer-widget pl-5">
                    <h2><?php echo L('quicklinks');?></h2>

                    <ul class="quick-links">
                        <li>
                            <i class='bx bxs-chevrons-right'></i>
                            <a href="<?php echo U('index/about');?>"><?php echo L('about');?></a>
                        </li>
                        <li>
                            <i class='bx bxs-chevrons-right'></i>
                            <a href="<?php echo U('index/contact');?>"><?php echo L('contactus');?></a>
                        </li>
                        <li>
                            <i class='bx bxs-chevrons-right'></i>
                            <a href="<?php echo U('index/cate');?>"><?php echo L('shop');?></a>
                        </li>
                        <li>
                            <i class='bx bxs-chevrons-right'></i>
                            <a href="<?php echo U('index/tandc');?>"><?php echo L('tandc');?></a>
                        </li>
                        <li>
                            <i class='bx bxs-chevrons-right'></i>
                            <a href="<?php echo U('index/privacy_policy');?>"><?php echo L('pp');?></a>
                        </li>
                        <!-- <li>
							<i class='bx bxs-chevrons-right'></i>

						</li> -->
                    </ul>
                </div>
                <!-- <div class="single-footer-widget pl-5">
                    <h2><?php echo L('contactUs');?></h2>

                 
                </div> -->
            </div>

            <!-- <div class="col-lg-3 col-sm-3">
               
            </div> -->
        </div>
    </div>
    <div class="container" style="border-top: 1px solid #ABABAB;">
        <div class="row align-items-center">
            <div class="col-lg-7 col-md-7">
                <p>Copyright &copy; 2024.DemoBeautyApp.</p>
            </div>

            <div class="col-lg-5 col-md-5">
                <ul class="footer-contact-info"
                    style="display: flex; flex-direction: row;gap: 1em; justify-content: flex-end;">
                    <li>
                        <a href="tel:<?php echo ($pcset["phone"]); ?>">

                            <i class='bx bxs-phone'></i>
                        </a>
                    </li>
                    <li>
                        <a href="https://wa.me/<?php echo ($pcset["whatsapp"]); ?>" target="_blank" title="WhatsApp">
                            <i class="fa fa-whatsapp"></i>

                        </a>
                    </li>

                    <li>
                        <a href="<?php echo ($pcset["instagram"]); ?>">

                            <i class='fab fa-instagram'></i>
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo ($pcset["facebook"]); ?>">

                            <i class='fa fa-facebook'></i>
                        </a>
                    </li>

                </ul>
            </div>
        </div>
    </div>

</section>

<!-- End Footer Area -->

<!-- Start Copy Right Area -->
<div class="copyright-area">
    <div class="container">
        <div class="copyright-area-content">

        </div>
    </div>
</div>
<!-- End Copy Right Area -->

<!-- Start Go Top Area -->
<div class="go-top">
    <i class='bx bx-up-arrow-alt'></i>
</div>
<!-- End Go Top Area -->

<!-- Jquery Slim JS -->
<script src="/beautyappdemo/Public/js/vue.js"></script>
<script src="/beautyappdemo/Public/js/layer.js"></script>
<script src="/beautyappdemo/Public/js/jquery.min.js"></script>
<!-- Popper JS -->
<script src="/beautyappdemo/Public/js/popper.min.js"></script>
<!-- Bootstrap JS -->
<!-- <script src="/beautyappdemo/Public/js/bootstrap.min.js"></script> -->
<!-- Meanmenu JS -->
<script src="/beautyappdemo/Public/js/jquery.meanmenu.js"></script>
<!-- Owl Carousel JS -->
<script src="/beautyappdemo/Public/js/owl.carousel.min.js"></script>
<!-- Magnific Popup JS -->
<script src="/beautyappdemo/Public/js/jquery.magnific-popup.min.js"></script>
<!-- Imagelightbox JS -->
<script src="/beautyappdemo/Public/js/imagelightbox.min.js"></script>
<!-- Odometer JS -->
<script src="/beautyappdemo/Public/js/odometer.min.js"></script>
<!-- Jquery Nice Select JS -->
<!-- <script src="/beautyappdemo/Public/js/jquery.nice-select.min.js"></script> -->
<!-- Jquery Appear JS -->
<script src="/beautyappdemo/Public/js/jquery.appear.min.js"></script>
<!-- Ajaxchimp JS -->
<script src="/beautyappdemo/Public/js/jquery.ajaxchimp.min.js"></script>
<!-- Form Validator JS -->
<script src="/beautyappdemo/Public/js/form-validator.min.js"></script>
<!-- Contact JS -->
<script src="/beautyappdemo/Public/js/contact-form-script.js"></script>
<!-- Wow JS -->
<script src="/beautyappdemo/Public/js/wow.min.js"></script>
<!-- Custom JS -->
<script src="/beautyappdemo/Public/js/main.js"></script>

<!-- new for ubeauty -->
<script src="/beautyappdemo/Public/js/wowu.min.js"></script>
<script src="/beautyappdemo/Public/js/jquery.magnific-popupu.min.js"></script>
<script src="/beautyappdemo/Public/js/owl.carouselu.min.js"></script>
<!-- <script src="/beautyappdemo/Public/js/bootstrapu.min.js"></script> -->
<script src="/beautyappdemo/Public/js/jquery-3.5.0.min.js"></script>
<script src="/beautyappdemo/Public/js/slick.min.js"></script>
<!-- new for ubeauty -->

</body>

</html>