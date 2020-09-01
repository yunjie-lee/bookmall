<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>海洋书城会员注册页面</title>
	<%@ include file="/pages/common/head.jsp"%>
	<script type="text/javascript">
		$(function () {
			$(function () {
				$("#username").blur(function () {
					var username = this.value;
					$.getJSON("http://localhost:80/book/userServlet","action=ajaxExistsUsername&username="+username,function (data) {
						if(data.existUsername){
							$("span.errorMsg").text("用户名已存在")
						}else{
							$("span.errorMsg").text("用户名可用")
						}
					});
				});
			})

			//给验证码图片添加单击事件
			$("#code_img").click(function() {
				this.src="${basePath}/kaptcha.jpg?d="+new Date();
			});

			$("#sub_btn").click(function () {
				var usernameText=$("#username").val()
				var usernamePat=/^\w{5,12}$/;
				if(!usernamePat.test(usernameText)){
					$("span.errorMsg").text("用户名不合法");
					return false;
				}

				var passwordText=$("#password").val()
				var passwordPat=/^\w{5,12}$/;
				if(!passwordPat.test(passwordText)){
					$("span.errorMsg").text("密码不合法");
					return false;
				}

				var repwdText = $("#repwd").val()
				if(repwdText != passwordText){
					$("span.errorMsg").text("确认密码不一致")
					return false;
				}

				//1 获取邮箱里的内容
				var emailText = $("#email").val();
				//2 创建正则表达式对象
				var emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
				//3 使用test方法验证是否合法
				if (!emailPatt.test(emailText)) {
					//4 提示用户
					$("span.errorMsg").text("邮箱格式不合法！");

					return false;
				}

				var codeText = $("#code").val()
				codeText=$.trim(codeText)
				if(codeText == null || codeText ==""){
					$("span.errorMsg").text("验证码不能为空")
					return false;
				}

				$("span.errorMsg").text();
			})
		})
	</script>
<style type="text/css">
	.login_form{
		height:420px;
		margin-top: 25px;
	}
	
</style>
</head>
<body>
		<div id="login_header">
			<img class="logo_img" alt="" src="" >
		</div>
		
			<div class="login_banner">
			
				<div id="l_content">
					<span class="login_word">欢迎注册</span>
				</div>
				
				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>注册海洋书城会员</h1>
								<span class="errorMsg">
									${requestScope.msg}
								</span>
							</div>
							<div class="form">
								<form action="userServlet" method="post">
									<input type="hidden" name="action" value="regist">
									<label>用户名称：</label>
									<input class="itxt" type="text" placeholder="请输入用户名"
										   value="${requestScope.username}"
										   autocomplete="off" tabindex="1" name="username" id="username" />
									<br/>
									<br/>
									<label>用户密码：</label>
									<input class="itxt" type="password" placeholder="请输入密码" autocomplete="off" tabindex="1" name="password" id="password" />
									<br/>
									<br/>
									<label>确认密码：</label>
									<input class="itxt" type="password" placeholder="确认密码" autocomplete="off" tabindex="1" name="repwd" id="repwd" />
									<br/>
									<br/>
									<label>电子邮件：</label>
									<input class="itxt" type="text" placeholder="请输入邮箱地址"
										   value="${requestScope.email}"
										   autocomplete="off" tabindex="1" name="email" id="email" />
									<br/>
									<br/>
									<label>验证码：</label>
									<input class="itxt" type="text" style="width: 80px;" id="code" name="code"/>
									<img id="code_img" alt="" src="kaptcha.jpg" style="float: right; margin-right: 40px;width: 110px;height: 30px;">
									<br/>
									<br/>
									<input type="submit" value="注册" id="sub_btn"/>
									
								</form>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		<%@include file="/pages/common/footer.jsp"%>
</body>
</html>