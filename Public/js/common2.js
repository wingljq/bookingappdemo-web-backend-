var baseUrl = "http://"+window.location.host+"/durian/public_html/insmile/index.php/Home/";


function  fresh(){
	setTimeout(function(){
		location.reload();
	},1000)
}
function  relaod(){
	setTimeout(function(){
		location.reload();
	},1000)
}




function getUser(){
	var userInfo=JSON.parse(localStorage.getItem("userInfo"));
	if(userInfo){
		return userInfo;
	}else{
		return "";
	}
}


function getUrlData(paraName) {
	var url = document.location.toString();
	var arrObj = url.split("?");

	if (arrObj.length > 1) {
		var arrPara = arrObj[1].split("&");
		var arr;

		for (var i = 0; i < arrPara.length; i++) {
			arr = arrPara[i].split("=");

			if (arr != null && arr[0] == paraName) {
				return arr[1];
			}
		}
		return "";
	} else {
		return "";
	}
}



function setCookie(name, value) {
	var exp = new Date();
	exp.setTime(exp.getTime() + 60 * 60 * 24);
	document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString() + ";path=/";
}


//读取cookies 
function getCookie(name) {
	
	

			try {
				var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");

				if (arr = document.cookie.match(reg)){
					//return unescape(arr[2]);
					var res=unescape(arr[2]);
					if(name=="userInfo"){
						res=JSON.parse(res);
					}
					return res;
				}else{
					//location.href="{:U('account/login')}";
					return '';
				}
			}catch(err){
				//location.href="login.html";
			return '';
}

 // var allcookies = document.cookie;
	// 	//索引长度，开始索引的位置
 //        var cookie_pos = allcookies.indexOf(cookie_name);

 //        // 如果找到了索引，就代表cookie存在,否则不存在
 //        if (cookie_pos != -1) {
 //            // 把cookie_pos放在值的开始，只要给值加1即可
 //            //计算取cookie值得开始索引，加的1为“=”
 //            cookie_pos = cookie_pos + cookie_name.length + 1; 
 //            //计算取cookie值得结束索引
 //            var cookie_end = allcookies.indexOf(";", cookie_pos);
            
 //            if (cookie_end == -1) {
 //                cookie_end = allcookies.length;

 //            }
 //            //得到想要的cookie的值
 //            var value = unescape(allcookies.substring(cookie_pos, cookie_end)); 
 //        }

 //        if(cookie_name=='userInfo'){
	// 		if(value){
	// 			value=JSON.parse(value);
	// 		}else{
	// 			value={};
	// 		}
 //        }

 //        if(value==undefined){
 //        	value='';
 //        }
        	
 //        return value;
        

		// var strcookie = document.cookie;//获取cookie字符串
		// var arrcookie = strcookie.split("; ");//分割
		// //遍历匹配
		// for ( var i = 0; i < arrcookie.length; i++) {
		// 	var arr = arrcookie[i].split("=");
		// 	if (arr[0] == name){
		// 		if(name=='userInfo'){
		// 				return JSON.parse(arr[1]);
		// 		}else{
		// 			return arr[1];
		// 		}
		// 	}
		// }
		// return "";
		
	
		
}

//删除cookies 
function delCookie(name) {
	var exp = new Date();
	exp.setTime(exp.getTime() - 60 * 60 * 1000);
	var cval = getCookie(name);
	if (cval != null)
		document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString() + ";path=/";
}
//删除时只能删除对应路径下的cookie， 不指定路径， 默认删除的是页面所对应的路径下的cookie。



			function getUserInfo() {

				
				$.ajax({
					url: baseUrl + "/user/getUserInfo" + "?uid=" + getCookie('userInfo').uid,
					dataType: "json",
					type: "get",
					success: function(res) {
						
						setCookie('userInfo', JSON.stringify(res.data.userInfo));

					}
				})
			}




			function jia(num1,num2){
            var r1,r2,m,n;
            try{r1=num1.toString().split(".")[1].length}catch(e){r1=0}
            try{r2=num2.toString().split(".")[1].length}catch(e){r2=0}
            m = Math.pow(10,Math.max(r1,r2));
            n = (r1>=r2)?r1:r2;
            return ((num1*m + num2*m)/m).toFixed(n);
        }
        function jian(num1,num2){
            var r1,r2,m,n;
            try{r1=num1.toString().split(".")[1].length}catch(e){r1=0}
            try{r2=num2.toString().split(".")[1].length}catch(e){r2=0}
            n = (r1>=r2)?r1:r2;
            m = Math.pow(10,Math.max(r1,r2));
            return ((num1*m - num2*m)/m).toFixed(n);
        }
        function chen(num1,num2){
            var m = 0;
            try{m+=num1.toString().split(".")[1].length}catch(e){}
            try{m+=num2.toString().split(".")[1].length}catch(e){}
            return (Number(num1.toString().replace(".",""))*Number(num2.toString().replace(".","")))/Math.pow(10,m)
        }
        function chu(arg1,arg2){
            var t1=0,t2=0,r1,r2;
            try{t1=arg1.toString().split(".")[1].length}catch(e){}
            try{t2=arg2.toString().split(".")[1].length}catch(e){}
            r1=Number(arg1.toString().replace(".",""));
            r2=Number(arg2.toString().replace(".",""));
            return (r1/r2)*Math.pow(10,t2-t1);
        }

        function getWeekByDay(dayValue){ //dayValue=“2014-01-01”
 var day = new Date(Date.parse(dayValue.replace(/-/g, '/'))); //将日期值格式化
    var today = new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六"); //创建星期数组
    return today[day.getDay()];  //返一个星期中的某一天，其中0为星期日
}


       function getWeekNum(dayValue){ //dayValue=“2014-01-01”
 var day = new Date(Date.parse(dayValue.replace(/-/g, '/'))); //将日期值格式化
    var today = new Array(0,1,2,3,4,5,6); //创建星期数组
    return today[day.getDay()];  //返一个星期中的某一天，其中0为星期日
}


//得到某一日期的前一天 后一天 n可以正负数
function dateAdd(dd,n){
 var strs= new Array();
 strs = dd.split("-");
 var y = strs[0];
 var m = strs[1];
 var d = strs[2];
 var t = new Date(y,m-1,d);
 var str = t.getTime()+n*(1000*60*60*24);
 var newdate = new Date();
 newdate.setTime(str);
 var strYear=newdate.getFullYear();  
    var strDay=newdate.getDate();
    if(strDay < 10){
     strDay = "0"+strDay;
    }  
    var strMonth=newdate.getMonth()+1;  
    if(strMonth < 10){  
        strMonth = "0"+strMonth;  
    }  
    var strdate=strYear+"-"+strMonth+"-"+strDay;  
    return strdate;
}