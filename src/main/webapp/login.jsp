<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/res/js/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/res/css/add.css" type="text/css" media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/res/css/bootstrap.min.css" type="text/css" media="screen" />
 <script>
//更换验证码
  function changeVerifyCode(){
  	t=new Date().getTime();
  	document.myform.verifyCodeImg.src="${pageContext.request.contextPath}/login/image?t="+t;
  }
</script>
</head>
<body>
    <div class="jumbotron">
        <div class="div_from_aoto" style="width: 500px;">
            <h3 class="text-center">欢迎使用博客管理系统</h3>
            <FORM  action="${pageContext.request.contextPath}/login/login" method="post" name="myform">
                <div class="control-group">
                    <label class="laber_from">账号</label>
                    <div  class="controls" ><input class="input_from" type=text name="userId"  ><p class=help-block></p></div>
                </div>
                <div class="control-group">
                    <label class="laber_from">密码</label>
                    <div  class="controls"><input class="input_from" type=password  name="passWord"><p class=help-block></p></div>
                </div>
                <div class="control-group">
                    <label class="laber_from">验证码</label>
                    <div  class="controls"><input class="input_from" type=text  name="verifyCode"></div>
                 </div>
                <div class="control-group">
                    <img name="verifyCodeImg" src="${pageContext.request.contextPath}/login/image">
                    <a href="javascript:changeVerifyCode()">看不清？</a>
                </div>
                <div class="control-group">
                    <label class="laber_from" ></label>
                    <button class="btn btn-lg btn-primary" type="submit">登 陆</button>
                </div>
            </FORM>
        </div>
    </div>
</body>
</html>
