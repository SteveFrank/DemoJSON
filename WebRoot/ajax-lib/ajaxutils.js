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
/**
 * 以下内容同样可以进行对象的一个包装
 * @param method 请求方式
 * @param url 请求的url链接
 * @param asynchronous 是否会异步
 * @param params 请求体
 * @param callback 回调参数
 * @param type 服务器响应类型
 */
function ajax(method,url,asynchronous,params,callback,type) {
	/**
	 * 1、得到xmlHttp
	 */
	var xmlHttp = createRequest();
	/**
	 * 2、打开连接
	 */
	xmlHttp(method,url,asynchronous);
	/**
	 * 3、判断是否为post请求
	 */
	if("POST" == method){
		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	}
	/**
	 * 4、发送请求
	 */
	xmlHttp.send(params);
	/**
	 * 5、注册监听
	 */
	xmlHttp.onreadystatechange = function() {
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
			var data;
			//获取服务器的响应数据，进行转换
			if(type == xml) {
				data = xmlHttp.responseXML;
			} else if(type == "text"){
				data = xmlHttp.responseText;
			} else if(type == "json"){
				var text = xmlHttp.responseText;
				data = eval("("+text+")");
			} 
			
			//调用回调方法
			callback(data);
		}
	};
}