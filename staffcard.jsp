<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DalgoVO.*" %>
<%
	MemberVO uvo = (MemberVO) session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<style>
	table{
	border-collapse: collapse;
	}
	
</style>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			.first{
				writing-mode: vertical-rl;
			}
		</style>
	</head>
	<body  style="padding-left:22%" align=center>
		<table border=1; width=850px; height=900px;>
			<tr>
				<td colspan="6">
					인사 기록 카드
				</td>
			</tr>
			<span style="margin-right:-20%"></span>
			<tr>
				<td class="first" rowspan="2">성 &nbsp;명</td>
				<td>국문</td>
				<td><%= uvo.getUSER_KR() %></td>
				<td>성별</td>
				<td style="height:50px;"><%= uvo.getUSER_GEN() %></td>
				<td rowspan="3"><img style="width:85%; height:60%;" src="<%=request.getContextPath() + "/image/" + uvo.getPho_Ph() %>"></td>
			</tr>
				<tr>
				<td style="height:50px;">한문</td>
				<td><%= uvo.getUSER_CH() %></td>
				<td>주민등록번호</td>
				<td><%= uvo.getUSER_PNO() %></td>
			</tr>
			<tr>
				<td colspan="2">현주소</td>
				<td colspan="3"><%= uvo.getUSER_ADD() %></td>
			</tr>
			<tr>
				<td class="first" style="width:5%" rowspan="2">신&nbsp;체</td>
				<td style="width:19%">신장</td>
				<td style="width:19%">체중</td>
				<td style="width:19%">시력</td>
				<td style="width:19%">혈액형</td>
				<td style="width:19%">색맹</td>
			</tr>
			<tr>
				<td  style="height:40px"><%= uvo.getUSER_CM() %></td>
				<td><%= uvo.getUSER_KG() %></td>
				<td><%= uvo.getUSER_SH() %></td>
				<td><%= uvo.getUSER_BT() %></td>
				<td><%= uvo.getUSER_COLOR() %></td>
			</tr>
			<tr>
				<td class="first" rowspan="2">&nbsp;최&nbsp;종&nbsp;학&nbsp;력&nbsp;</td>
			</tr>
			<tr	>
				<td style="height:40px" colspan="5"><%= uvo.getUSER_FS() %></td>
			</tr>
			<tr>
				<td class="first" style="height:50px" rowspan="2">경&nbsp;력</td>
				<td colspan="5"><%= uvo.getUSER_CAA() %></td>
			</tr>
			<tr>
				<td colspan="5"><%= uvo.getUSER_CAB() %></td>
			</tr>
			<tr>
				<td class="first" style="height:50px" rowspan="2">자&nbsp;격&nbsp;증</td>
				<td colspan="5"><%= uvo.getUSER_LIA() %></td>
			</tr>
			<tr>
				<td colspan="5"><%= uvo.getUSER_LIB() %></td>
			</tr>
		</table>
	</body>
</html>