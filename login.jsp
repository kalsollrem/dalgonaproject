<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		 
		 <script src="js/jquery-3.6.0.js"></script>
		 <script src="js/logincheck.js" charset="utf-8"></script>
		 <script src="js/mainview.js"></script>
		 <script type="text/javascript">
		 if(aValue != null && aValue != 2){
			 alert("출근 후 프로그램을 종료하려면 퇴근 버튼을 눌러야 합니다");
			 window.history.forward();
			 function noBack(){
				 window.history.forward();
			 }
		 }
		</script>

		<meta charset="UTF-8">
		<title>로그인</title>
	</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">	
	<center>
		<div style="width:500px; height:500px; margin-top:5%">
			<form id=login method="post" action="<%=request.getContextPath()%>/member/loginaciton.do" onsubmit="return FormCheck()">
				<div style="width:350px; height:160px; margin-bottom:50px">
					<a href="login.jsp"><img src="<%=request.getContextPath()%>/image/logo.png" style="height:250px; width:220px"></a>
				</div>
				<div>
					<input type="text" id="USER_ID" name="USER_ID" placeholder="아이디" value="kingdalgona" style="width:80%; height:50px; font-size:20px;margin-top:25px">
				</div>
				<div>
					<input type="password" id="USER_PW" name="USER_PW" placeholder="비밀번호" value="dalgona123" style="width:80%; height:50px; font-size:20px;margin-top:25px">
				</div>
				<div style="margin-top:20px">
					<input type="submit" style="width:80%; height:50px; margin-bottom:10px; background-color:#31B5FF" value="로그인" onclick="popup()">
				</div>
			</form>
			<div style="margin-left:250px;padding:10px">
				<span><a href="join.jsp">직원등록은 하셨나요?</span>
			</div>
		</div>
	</center>	
</body>
</html>