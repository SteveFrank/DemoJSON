<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'jsondemo2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function createXMLHttpRequest() {
			var xmlHttp;
			try {
				return xmlHttp = new XMLHttpRequest();
			} catch (e) {
				 try {
					return xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						return xmlHttp = new ActiveXObject("Micrsoft.XMLHTTP");
					} catch (e) {
						alter("无法识别您的浏览器，将会失去异步传输功能");
						throw e;
					}
				}
			}
		}
		window.onload = function(){
			var btn = document.getElementById("btn");
			btn.onclick = function(){
				//1、得到request
				var xmlHttp = createXMLHttpRequest();
				//2、得到连接
				xmlHttp.open("GET","<c:url value='/AServlet'/>");
				//3、发送信息
				xmlHttp.send(null);
				//4、给xmlHttp的状态改变事件上添加监听
				xmlHttp.onreadystatechange = function(){
					//双重判断
					if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
						//获取Servlet传回的值
						var text = xmlHttp.responseText;
						//执行json串
						var person = eval("("+text+")");
						var s = person.name+", "+person.age+", "+"person.sex";
						document.getElementById("h3").innerHTML = s;
					}
				};
			};
		};
	</script>
  </head>
  
  <body>
    <!-- 点击按钮后，把服务器响应的数据显示到h3的元素中 -->
    <button id="btn">点击这里</button>
    <h1>JSON之Hello World</h1>
    <h3 id="h3"></h3>
  </body>
</html>
