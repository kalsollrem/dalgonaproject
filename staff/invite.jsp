<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DalgoUtill.*" %>
<%@ page import = "DalgoVO.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>
		function create(){
			 var chkArray = new Array();
			 var runo = $('input[name=box]:checked').val();
				$('input[name=box]:checked').each(function() { 
					 var tmpVal = $(this).val(); 
				      chkArray.push(tmpVal);
				});
				 if( chkArray.length < 1 ){
				      alert("값을 선택해주시기 바랍니다.");
				      return;
				 }
			var title = prompt("방 제목을 입력해주세요");
			if(title == null){
				alert("방 제목을 입력해주세요")
			}else if(title != null){
				alert("만들었습니다");
			}
			location.href = "<%= request.getContextPath()%>/room/generation.do?runo=" + runo + "&title=" + title;
		}
		</script>
		<style>
#scroll{
	overflow:auto;
	display:block; 
	width:100%; 
	height: 510PX; 
	border-radius:10px;
	border:none;
}
.scroll::-webkit-scrollbar{
	width:0px;
	height:0px;
	background-color: #BFCBD1;
	border-radius:10px;
}
.scroll::-webkit-scrollbar-thumb{
	background-color: #35517C;
	border-radius:10px;
}
.row:hover{
	background-color:rgba(0, 0, 0, 0.1);
}
		</style>
	</head>
	<body>
	<div style="BORDER:NONE">
		<div style="BORDER:NONE">
			<div style="display:fixed;BORDER:NONE" >
				<input type="button" value="초대" onclick="create()" style="width:100%; height:40px; background-color:#AED4AE; font-weight:bold; font-size:20px">
			</div>
			<div style="display:flex;">
				<div id="scroll" class="scroll">
				<%
				ArrayList<MemberVO> list = (ArrayList<MemberVO>) request.getAttribute("list");
				if (list != null) {
				//	for(UserVO uv : list)
					for (int i = 1;i < list.size();i++){
					%>
						<div style="display:flex;BORDER:NONE" class="row">
							<div >
								<input type="checkbox" id = "box" name="box" value="<%=list.get(i).getUSER_NO()%>">
							</div>
							<div style="width:100%; ">
								<span><%=list.get(i).getUSER_KR()%></span><%//= uv.getUSER_KR() %>
								<span style="font-size:7px"><%=list.get(i).getUSER_DP()%></span><br><%//= uv.getUSER_DP() %>
							</div>
						</div>
					<%
					}
				}
				%>
				</div>	
			</div>	
			</div>		
		</div>
	</body>
</html>