<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "DalgoVO.*" %>
<%@ page import = "DalgoDAO.*" %>
<%
	StaffCardDAO sd = new StaffCardDAO();

	MemberVO    svo	= new MemberVO();

	String uno = request.getParameter("uno");
	System.out.println(uno);
	
	svo = sd.StaffCard(uno);
%>

<!DOCTYPE html>
<html>
<head>

		<meta charset="EUC-KR">
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
					�λ� ��� ī��
				</td>
			</tr>
			<span style="margin-right:-20%"></span>
			<tr>
				<td class="first" rowspan="2">�� &nbsp;��</td>
				<td>����</td>
				<td><%= svo.getUSER_KR() %></td>
				<td>����</td>
				<td style="height:50px;"><%= svo.getUSER_GEN() %></td>
				<td rowspan="3"><img style="width:85%; height:75%;" src="<%=request.getContextPath() + "/image/" + svo.getPho_Ph() %>"></td>
			</tr>
				<tr>
				<td style="height:50px;">�ѹ�</td>
				<td><%= svo.getUSER_CH() %></td>
				<td>�ֹε�Ϲ�ȣ</td>
				<td><%= svo.getUSER_PNO() %></td>
			</tr>
			<tr>
				<td colspan="2">���ּ�</td>
				<td colspan="3"><%= svo.getUSER_ADD() %></td>
			</tr>
			<tr>
				<td class="first" style="width:5%" rowspan="2">��&nbsp;ü</td>
				<td style="width:19%">����</td>
				<td style="width:19%">ü��</td>
				<td style="width:19%">�÷�</td>
				<td style="width:19%">������</td>
				<td style="width:19%">����</td>
			</tr>
			<tr>
				<td  style="height:40px"><%= svo.getUSER_CM() %></td>
				<td><%= svo.getUSER_KG() %></td>
				<td><%= svo.getUSER_SH() %></td>
				<td><%= svo.getUSER_BT() %></td>
				<td><%= svo.getUSER_COLOR() %></td>
			</tr>
			<tr>
				<td class="first" rowspan="2">&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;</td>
			</tr>
			<tr	>
				<td style="height:40px" colspan="5"><%= svo.getUSER_FS() %></td>
			</tr>
			<tr>
				<td class="first" style="height:50px" rowspan="2">��&nbsp;��</td>
				<td colspan="5"><%= svo.getUSER_CAA() %></td>
			</tr>
			<tr>
				<td colspan="5"><%= svo.getUSER_CAB() %></td>
			</tr>
			<tr>
				<td class="first" style="height:50px" rowspan="2">��&nbsp;��&nbsp;��</td>
				<td colspan="5"><%= svo.getUSER_LIA() %></td>
			</tr>
			<tr>
				<td colspan="5"><%= svo.getUSER_LIB() %></td>
			</tr>
		</table>
	</body>
</html>