<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="static/jquery/1.8.1/jquery-1.8.1.min.js"></script>	
<script type="text/javascript">
	function checkName(){
		var name = document.getElementById("username").value;
		var xmlhttp;
		if (window.XMLHttpRequest)
		{
		    //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		    xmlhttp=new XMLHttpRequest();
		}
		else
		{
		    // IE6, IE5 浏览器执行代码
		    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.open("post","checkname?username="+name,true);	
		xmlhttp.send();
		xmlhttp.onreadystatechange=function(){/* 回调函数，请求响应回来调用 */
		    if (xmlhttp.readyState==4 && xmlhttp.status==200){
				var res = xmlhttp.responseText;/* 会获取open中servlet返回值，不要用println，有换行符 */
				if(res=="ok"){
					document.getElementById("msg").innerHTML="您的名字可用";
				}else{
					document.getElementById("msg").innerHTML="您的名字不可用";
				}
		    }
		}
	}
	
	function searchWord(){
		$.get("search",{searchword:$("#txtSearch").val()},
			function(data){
				var msg=eval(data);
				var res="";
				for(var i=0;i<msg.length;i++){
					res=res+"<p>"+msg[i]+"</p>";				
				}
				document.getElementById("searchmsg").innerHTML=res;
		});
		
		
	}
</script>
</head>
<body>
	<form action="regist" method="post">
		<input id="username" type="text" name ="username"	onblur="checkName()"/><span id="msg"> </span><br>
		<input type="password" name="pwd"/><br>
		<input type="submit" value="regist"/> 
	</form>
	
	
	===============================<br>
	
	<from action="" method="post">
		<input type="text" name="search" id="txtSearch" onkeypress="searchWord()"/><br>
		<div id="searchmsg"></div>
		<input type="submit" value="search"/>
	</from>
	
	
	
	
	
</body>
</html>