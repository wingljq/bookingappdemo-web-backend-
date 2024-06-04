jQuery(document).ready(function($){  
$(".gallery-icon a").attr("rel", "prettyPhoto[gallery]");
$("a[rel^='prettyPhoto']").prettyPhoto({
	overlay_gallery: false, social_tools: '', 'theme': 'light_square' 
});
$("a[rel^='prettyPhoto']").prettyPhoto();
$(".image_lightbox img, .flickr_wrap img, .candy-clearfix a").addClass("tip");			
$("#title_box a img, #title_box_full a img, .alignleft img, .alignright img, #vertical-ticker a img, .single_thumbnail a img, .post img, .car_image a img, .widget_recent_posts_two img, .banners img, #banner-header img, #banner_header_728 img, .image_lightbox img, .widget_thumbnail img, .flickr_wrap img, .similar_posts img, #archive li a img").hover(function() {
	$(this).stop().animate({
		opacity: 0.8
	}, 200);
},function() {
	$(this).stop().animate({
		opacity: 1
	}, 200);
});		
//$(".tip").tipTip({
//	maxWidth: "auto", 
//	edgeOffset: 10,
//	defaultPosition: "top"
//});	
$("body").eqHeight(".EqHeightDiv", {equalize_interval: 100});
equalheight = function(container){
var currentTallest = 0,
     currentRowStart = 0,
     rowDivs = new Array(),
     $el,
     topPosition = 0;
 $(container).each(function() {
   $el = $(this);
   $($el).height('auto')
   topPostion = $el.position().top;
   if (currentRowStart != topPostion) {
     for (currentDiv = 0 ; currentDiv < rowDivs.length ; currentDiv++) {
       rowDivs[currentDiv].height(currentTallest);
     }
     rowDivs.length = 0; // empty the array
     currentRowStart = topPostion;
     currentTallest = $el.height();
     rowDivs.push($el);
   } else {
     rowDivs.push($el);
     currentTallest = (currentTallest < $el.height()) ? ($el.height()) : (currentTallest);
  }
   for (currentDiv = 0 ; currentDiv < rowDivs.length ; currentDiv++) {
     rowDivs[currentDiv].height(currentTallest);
   }
 });
}
$(window).load(function() {
  equalheight('.products li, #single_recent_posts li, .home_video_post');
});
$(window).resize(function(){
  equalheight('.products li, #single_recent_posts li, .home_video_post');
});
var ink, d, x, y;
  $(".ripplelink").click(function(e){
    if($(this).find(".ink").length === 0){
      $(this).prepend("<span class='ink'></span>");
    }
    ink = $(this).find(".ink");
    ink.removeClass("animate");
    if(!ink.height() && !ink.width()){
      d = Math.max($(this).outerWidth(), $(this).outerHeight());
      ink.css({height: d, width: d});
    }
    x = e.pageX - $(this).offset().left - ink.width()/2;
    y = e.pageY - $(this).offset().top - ink.height()/2;
    ink.css({top: y+'px', left: x+'px'}).addClass("animate");
});
});	
(function($){ 
$(window).load(function(){ 
$("#featured_area").css({ visibility: "visible" });
$(".bxslider").css({ visibility: "visible" });
$(".showbiz-container").css({ visibility: "visible" });
$(".home_blog_posts").css({ visibility: "visible" });
$(".home_masonry_posts").css({ visibility: "visible" });
$(".home_main_posts").css({ visibility: "visible" });
$(".home_video_post").css({ visibility: "visible" });
$(".post, .product").css({ visibility: "visible" });
$("#example2").css({ visibility: "visible" });
$("#single_content").css({ visibility: "visible" });
$("#footer_box").css({ visibility: "visible" });
})
})(jQuery);