<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "DalgoUtill.*" %>
<%@ page import = "DalgoVO.*" %>
<%@ page import="java.util.*" %>
<%
String rno = request.getParameter("rno");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			var test = $("input[name=msg]").val();
			var msg;
			setInterval(function()
			{
				GetMsg()
			}, 500);
		  });

		function send(){								
			if($("#msg").val() == "")
			{
				alert("발송 메시지 입력 바람");
				$("#msg").focus();
				GetMsg()
			}
			else{
				msg = $("#msg").val();
				$.ajax({				
					type : "get",
					url : "<%=request.getContextPath()%>/chat/ChatSend.do?rno=" + <%= rno %>,
					dataType : "html",
					data: { msg: msg},
					error:function(xhr,status,e){
						 alert('Error');
	             	 },
					success : function(data)
					{
						$("#msg").val("");
						$("#msg").focus();
						GetMsg(data);
					}
				});
			}
		};	
		
		function GetMsg(data)
		{
			$('#scroll').animate({ scrollTop: $('#scroll')[0].scrollHeight }, 1000);
			var cno = 0;
			$.ajax({	
				type : "get",
				url : "<%=request.getContextPath()%>/chat/ChatGet.do?rno=" + data,
				dataType : "html",
				success : function(data)
				{
					$('#getmsg').html(data);
				}
			});			
		}	
		function GetMsg()
		{
			$('#scroll').animate({ scrollTop: $('#scroll')[0].scrollHeight }, 1000);
			var cno = 0;
			$.ajax({	
				type : "get",
				url : "<%=request.getContextPath()%>/chat/ChatGet.do?roomno=" + <%=rno%>,
				dataType : "html",
				success : function(data)
				{
					$('#getmsg').html(data);
				}
			});			
		}
		function enterkey() {
		    if (window.event.keyCode == 13) {
		         // 엔터키가 눌렸을 때 실행할 내용
		         send();
		    }
		}
		function closeTabClick() { window.close(); }

		</script>
		
		<style>
			div{			
				border: 1px solid;
			}
			a{
				text-decoration:none
			}
			#scroll{
				overflow:auto;
				display:block; 
				width:100%; 
				height: 100%; 
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
		</style>
	</head>
	<body>
	<div style="width:350px;border:0" >		
		<div style="width:100%;height:50px;border:0; background-color:#A9BDCE">
			<a href="<%=request.getContextPath() %>/chat/chat.do"><span style="margin-left:7px">목록이동</span></a>
			<span style="margin-left:330px; cursor:pointer"onclick="closeTabClick();">x</span>				
		</div>
		<div id="scroll" class="scroll" style="border:none;background-color:#B2C6DE; width:100%; height: 500px; display:flex; align-items:center; flex-direction:column;border:0">							
		
			<div  style="width:100%; height:80px; border:none; ">					
				<span id="getmsg" name="getmsg"></span>
			</div>
			<div style="width:352px; margin-right:-1px; margin-top:500px; position:fixed; display:flex;border:0">			
				<div style="width:100%;border:0">
					<input type="text" id="msg" name="msg" style="width:100%; height:70px" onkeyup="enterkey();">
				</div>
				<div style="width:65px; border:0">
					<input type="button" value="전송"  style="height:100%;width:82%;margin-left:8px; background-color:#F6DE00; border:0" onclick="send() ">
				</div>		
			</div>	
		</div>	
	</div>
	</body>
</html>
