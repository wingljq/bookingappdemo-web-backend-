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

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<title><?php echo L('booking');?></title>
<div class="container">
    <div class="row align-items-center" style="padding: 5%;align-items: center;display: flex;justify-content: center;">
        <div id="app1" class="col-md-8">
            <h3><?php echo L('booking');?></h3>
            <form>
                <div class="form-group">
                    <input id="firstName" type="text" style="display: block;
                    width: 100%;
                    padding: 0.375rem 0.75rem;
                    font-size: 1rem;
                    line-height: 1.5;
                    background-clip: padding-box;
                    border: 1px solid #ced4da;
                    border-radius: 0.25rem;
                    transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
                " id="exampleInputEmail1"
                        aria-describedby="emailHelp" placeholder="<?php echo L('YourName');?>" v-model="firstName">
                </div>
                <div class="form-group">
                    <input id="phone" type="tel" style="display: block;
                    width: 100%;
                    padding: 0.375rem 0.75rem;
                    font-size: 1rem;
                    line-height: 1.5;
                    background-clip: padding-box;
                    border: 1px solid #ced4da;
                    border-radius: 0.25rem;
                    transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
                " name="phone" placeholder="<?php echo L('YourPhone');?>"
                        v-model="phone">
                </div>
                <div class="form-group">
                    <input id="email" type="email" style="display: block;
                    width: 100%;
                    padding: 0.375rem 0.75rem;
                    font-size: 1rem;
                    line-height: 1.5;
                    background-clip: padding-box;
                    border: 1px solid #ced4da;
                    border-radius: 0.25rem;
                    transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
                " name="email" placeholder="<?php echo L('YourEmail');?>"
                        v-model="email">
                </div>
                <div class="form-group">
                    <input id="date" type="datetime-local" style="display: block;
                    width: 100%;
                    padding: 0.375rem 0.75rem;
                    font-size: 1rem;
                    line-height: 1.5;
                    background-clip: padding-box;
                    border: 1px solid #ced4da;
                    border-radius: 0.25rem;
                    transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
                " name="date"
                        placeholder="<?php echo L('BookingDate');?>" v-model="booking_time">
                </div>
                <div class="form-group">
                    <textarea id="desc" rows="4" type="text" style="display: block;
                    width: 100%;
                    padding: 0.375rem 0.75rem;
                    font-size: 1rem;
                    line-height: 1.5;
                    background-clip: padding-box;
                    border: 1px solid #ced4da;
                    border-radius: 0.25rem;
                    transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
                " name="desc"
                        placeholder="<?php echo L('request');?>" v-model="desc"></textarea>
                </div>

                <!--    <small class="form-text text-muted mt-3">We don't span customers. Check our <a href="#">Privacy Policy</a></small> -->
            </form>
            <button @click="orderPay(2)" type="submit" class="btn btn-primary btn-block"
                style="margin: 55px 0px 8px;">Book Now</button>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    new Vue({
        el: '#app1',
        data: {
            desc: '',
            booking_time: '',
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
                    alert('請填寫電郵地址');
                    return false;
                }

                if (!this.booking_time) {
                    alert('請選擇預約日期');
                    return false;
                }
                $.ajax({
                    url: "<?php echo U('booking/addUserBooking');?>",
                    data: {
                        desc: this.desc,
                        booking_time: this.booking_time,
                        firstName: this.firstName,
                        phone: this.phone,
                        email: this.email,
                    },
                    type: "post",
                    dataType: "json",

                    success: function (res) {
                        console.log(res);
                        if (res.status == 200) {
                            alert(res.msg)
                            setTimeout(function() {
                                location.href = "<?php echo C('url');?>";
                            }, 1000);
                        }else{
                            alert(res.msg)
                        }
                        // if (res.code == 0) {
                        //     fresh();
                        // } else if (res.code == 1) {

                        //     var para = "";
                        //     para += "out_trade_no=" + res.data.out_trade_no;
                        //     para += " &money=" + res.data.money;
                        //     para += " &return_url=" + res.data.return_url;
                        //     para += " &body=" + res.data.body;
                        //     var url = " /beautyappdemo/pay/index.php?" + para;
                        //     console.log(url);
                        //     location.href = {
                        //         url
                        //     };
                        // }
                    }
                })
            },
        }
    })
</script>
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
                <p>Copyright &copy; 2022.<?php echo ($pcset["companyName1"]); ?>.</p>
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