<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/main.jsp" %>
 <%
//페이지타입 1: 메인 , 2: 플랜,  3: 사원리스트,  4: 출퇴근
String pagetype = request.getParameter("page");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>팀장 뷰1</title>
		<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main_view.css">
	</head>
	<body>
		<div style="width:1480px; height:720px; border:solid 1px; background-color:#F1F0F0">
			<div  style="width:250px; height:720px; display:inline-block; border:solid 1px;">
				<!-- 버튼 경로 이동 -->	
				
					<div style="width:250px;display:inline-block;; height:250px; background-color:#E1E6F6;">
						<div style="display:inline-block;width:90px;">
							<button style="width:100px; height:35px; margin-top:70px; margin-left:20px;color:#f0f0f0; background-color:#244263;" onclick="main();">메인화면</button>
						</div>
						<div style="display:inline-block;width:100px;">
							<button style="width:100px; height:35px; margin-top:70px; margin-left:30px;color:#f0f0f0; background-color:#244263;" onclick="work();">출퇴근관리</button>
						</div>
						<div style="display:inline-block;width:90px;">
							<button style="width:100px; height:35px; margin-top:10px; margin-left:20px;color:#f0f0f0; background-color:#244263;" onclick="plan();">일정표</button>
						</div>
						<div style="display:inline-block;width:100px;">
							<button style="width:100px; height:35px; margin-top:10px; margin-left:30px;color:#f0f0f0; background-color:#244263;" onclick="staff('<%=uvo.getUSER_NO() %>');">사원리스트</button>
						</div>
					</div>
				
					<!-- 버튼 경로 이동 -->
				
				<!-- 사용자 정보 -->
				<div style="height:469px; display:flex; justify-content:center">
					<table STYLE="TEXT-ALIGN:CENTER; width:100%; margin-top:15px; background-color:#E1E6F6; border-bottom:solid 1px; border-top:solid 1px">						
						<tr style=" border-bottom:solid 1px rgba(000, 0, 0, .2);">
							<td style="color:#46709C; font-weight:bold; ">사원 정보</td>
							<td id = "select_now">
								<select id="now" onchange='state()'>
									<option>근무상태</option>
									<option>근무</option>
									<option>자택근무</option>
									<option>방해금지</option>
									<option>외근 중</option>
									<option>출장 중</option>
									<option>회의 중</option>
								</select>
							</td>
						</tr>
						<tr style=" border-bottom:solid 1px rgba(000, 0, 0, .2);">
							<td style="width:135px; height:154px;"><img style="width:135px; height:154px;" src="<%=request.getContextPath() + "/image/" + uvo.getPho_Ph() %>">
							</td>
							<td>
								<input id="uno" type="hidden" value="<%=uvo.getUSER_NO() %>">
								<input type="button"style="background-color:#0076B8;color:#f0f0f0; width:90%; height:70px" id="office" value="출근" onclick="inoffice('<%=uvo.getUSER_NO() %>')"><br>
								<input type="button"style="background-color:#5FC41F;color:#f0f0f0; width:90%; height:70px;" value="퇴근" id=home onclick="outoffice('<%=uvo.getUSER_NO() %>')">
							</td>
						</tr>
						<tr style=" border-bottom:solid 1px rgba(000, 0, 0, .2);">
							<td style="color:#46709C;">이름</td>
							<td><%= uvo.getUSER_KR() %></td>
						</tr>
						<tr style=" border-bottom:solid 1px rgba(000, 0, 0, .2);">
							<td style="color:#46709C;">구분</td>
							<td>개발예정</td>
						</tr>
						<tr style=" border-bottom:solid 1px rgba(000, 0, 0, .2);">
							<td style="color:#46709C;">부서</td>
							<td><%=DP %></td>
						</tr>
						<tr style=" border-bottom:solid 1px rgba(000, 0, 0, .2);">
							<td style="color:#46709C;">직위</td>
							<td><%=TYPE %></td>
						</tr>
						<tr style=" border-bottom:solid 1px rgba(000, 0, 0, .2);">
							<td style="color:#46709C;">번호</td>
							<td>개발예정</td>
						</tr>
						<tr style=" border-bottom:solid 1px rgba(000, 0, 0, .2);">
							<td id="staff" colspan="2" style="width:100%;">
								<input style="color:#f0f0f0; width:100%; background-color:#1F5A6F;" type="button" value="인사카드" onclick="card()">
							</td>
						</tr>
					</table>										
				</div>
				<!-- 사용자 정보 -->
			</div>
				<div  style="width:1200px; height:717px; display:inline-block; float:right; background-color:#EDECEC; border:solid 2px;">
					<table style=" display:none; width:100%; height:50px" id="staffmanageA">
						<tr>
							<td style="text-align:left">
								<select>
									<option>부서정보</option>
								</select>
							</td>
							<td style="text-align:right">
								<input type="button"style="background-color:#49395F;color:#f0f0f0" value="수정">
								<input type="button"style="background-color:#49395F;color:#f0f0f0" value="삭제">
								
							</td>
						</tr>
					</table>
					<%
					if(pagetype.equals("4")){
					%>
					<!----------------------- 출퇴근 태그 ------------------------->
					<div style="width:100%; height:100%; overflow:auto" id="scroll" class="scroll">
						<form name="work" method="get" action="/work/CommuteList.do">
							<table border="1" style="width:100%;" id="work">
								<tr>
									<td colspan="6" style="background-color:#5A7DAF;">
										<span style="font-size:25px; font-weight:bold; color:white">출퇴근 관리</span>
									</td>
								</tr>
								<tr style="font-weight:bold;background-color:#DBE4F1; text-align:center;">									
									<td style="width:60px;">
										No
									</td>
									<td>이름</td>
									<td>날짜</td>
									<td>출근 시간</td>
									<td>퇴근시간</td>
									<td>비고</td>
								</tr>
								<%
									if ((int)request.getAttribute("flag") == 4) {								
										ArrayList<WorkVO> alist = (ArrayList<WorkVO>)request.getAttribute("alist");
										int CommuteNo = 1;
										for(WorkVO cvo : alist) 
									{
								%>
									<tr id="row">
										<td style="text-align:center">
											<%=CommuteNo %>
										</td>
										<td style="text-align:center">
											<%=cvo.getUser_kr() %>
										</td>
										<td style="text-align:center">
											<%=cvo.getCo_Md() %>
										</td>
										<td style="text-align:center">
											<%=cvo.getCo_Start() %>
										</td>
										<td style="text-align:center">
											<%=cvo.getCo_End() %>
										</td>		
										<td style="text-align:center">
											<%=cvo.getComments() %>
										</td>		
									</tr>
									<%
									CommuteNo = CommuteNo+1;
									}%>
								<%}%>
							</table>
						</form>
					</div>
					<%
					}
					%>
					<!----------------------- 출퇴근 태그 ------------------------->
					<%
					if(pagetype.equals("3")) {
					%>
					<!----------------------- 사원리스트 태그 ------------------------->
					<div style="width:100%; height:100%; overflow:auto" id="scroll" class="scroll">
					<table border="1" style="width:100%;" id="staffmanage">
						<tr>
							<%
							if(request.getAttribute("USER_POWER").equals("O")) {
								%>	
								<td colspan="7" style="background-color:#5A7DAF;"><span style="font-size:25px; font-weight:bold; color:white">사원 리스트</span></td> 
								<%
							}else {
								%> 
								<td colspan="6" style="background-color:#5A7DAF;"><span style="font-size:25px; font-weight:bold; color:white">사원 리스트</span></td>
								 
								<%
							}
							%>						</tr>
						<tr style="font-weight:bold;background-color:#DBE4F1; text-align:center;">
							<td style="width:13%;">부서</td>
							<td style="width:13%;">직급</td>
							<td>이름</td>
							<td style="width:13%;">직원상태</td>
							<td style="width:13%;">채팅</td>
							<td style="width:13%;">인사카드</td>
							<%
							if(request.getAttribute("USER_POWER").equals("O"))	{
								%>
								<td style="width:13%;">수정</td>
								<%
							} 
							%>
						</tr>
						<%
						if ((int)request.getAttribute("flag") == 3) 
						{			

							ArrayList<MemberVO> alist = (ArrayList<MemberVO>)request.getAttribute("alist");
							//String User_State = request.getParameter("User_State");
							
							System.out.println(request.getAttribute("USER_POWER"));
														
								int Snum = 1;
								for(MemberVO mvo : alist) 
								{ 
									System.out.println("상태: 번호 => " + mvo.getUSER_STATE());
								%>						
								<tr class="Staff_List" id="row">
									<td id = "Sf_Dp_<%=Snum%>" style="text-align:center"><%= mvo.getUSER_DP() %></td>
									<td id = "Sf_Type_<%=Snum%>" style="text-align:center"><%= mvo.getUSER_TYPE() %></td>
									<td id = "Sf_Kr_<%=Snum%>" style="text-align:center"><%= mvo.getUSER_KR() %></td>
									<td id = "Sf_State_<%=Snum%>" style="text-align:center"><%= mvo.getUSER_STATE() %></td> 
									<td id = "Sf_Chat_<%=Snum%>" style="text-align:center">
										<input type="button" style="background-color:#CDC42E; color:#f0f0f0;" value="채팅" onclick="chat(<%=mvo.getUSER_NO()%>)">
									</td>
									<td id = "Sf_Card_<%=Snum%>" style="text-align:center;">
										<%
										if(uvo.getUSER_TYPE().equals("O")) {
											%>
											<input style="color:#f0f0f0; background-color:#1F5A6F;" type="button" value="인사카드" onclick="staffcard_UP('<%=mvo.getUSER_NO()%>')">
											<%
										}
									%>
									</td>
									<%
									if(request.getAttribute("USER_POWER").equals("O"))
									{
									%>
										<td id=Sf_Change_button_<%=Snum %>>
											<input type="button" id="Sf_BN_<%=Snum%>" style="background-color:#0076B8;color:#f0f0f0;" value="수정" onclick="Sf_Change('<%=Snum%>','<%= mvo.getUSER_DP() %>', '<%= mvo.getUSER_TYPE() %>', '<%= mvo.getUSER_STATE() %>')">
											<input type="button" class="Sf_BY_<%=Snum%>" style="background-color:#5FC41F;color:#f0f0f0; display:none;" value="확인" onclick="UPDATE_YES('<%=Snum%>', '<%=mvo.getUSER_NO()%>')">
											<input type="button" class="Sf_BY_<%=Snum%>" style="background-color:#D0A93B;color:#f0f0f0; display:none;" value="취소" onclick="UPDATE_NO('<%=Snum%>','<%= mvo.getUSER_DP()%>','<%= mvo.getUSER_TYPE()%>','<%= mvo.getUSER_STATE() %>')">
										</td>
									<%
									}
									%>
								</tr>
																 
								<% Snum = Snum + 1;	
								}
								%>
						<%} %>
					</table>
					</div>
					<%
					}
					%>
					<!----------------------- 사원리스트 태그 ------------------------->
					
												
					<!----------------------- 일정표 태그 ------------------------->									
				<%
				if(pagetype.equals("2")){
				%>				
					<input type="hidden" id="address" name="address" value="/plan/planUp.do">
					<div id="scroll" class="scroll" >									
						<table style="width:100%;" id="plan">																					
							<tr>
								<td colspan="7" style="background-color:#5A7DAF;"><span style="font-size:25px; font-weight:bold; color:white">일정관리</span></td>
							</tr>
							<tr>
							<td>
							<iframe id="iframe1" name="iframe1" style="display:none"></iframe>
							<form name="workplan" action="<%= request.getContextPath()%>/plan/planUpdate.do" method="get" id="planUp"  target="iframe1">							
								<table border="1" style="width:100%">
									<thead  id="my-thead">
										<tr>
											<td style="width:40PX">
												N
											</td>
											<td style="width:70%">
												<h3>내용</h3>
											</td>
											<td>시작일</td>
											<td>마감일</td>	
											<td style="text-align:center"> 
												<input type="button" style="background-color:#63B4DC; color:#f0f0f0; height:60px" value="신규등록" onclick="plan_insert()">												
											</td>
											<td>
												<input type="button" style="background-color:#AB6065; color:#f0f0f0; height:60px; width:63px;" value="일정정리" onclick="plan_DelAll()">
											</td>																																					
										</tr>
									</thead>
									
								<!-- 실질적 데이터 삽입 부분 -->
									<tbody id="my-tbody">
									<%
										if ((int)request.getAttribute("flag") == 1){								
											ArrayList<PlanVO>  list = (ArrayList<PlanVO>)request.getAttribute("list");
									%>
										
									<%
									int array = 1;
									for(PlanVO wvo : list) {
									%>				
										<tr id="row" style="text-align:center;">
											<td style="width:40PX" id="Wp_No">
												<%=array %>
											</td>
											<td style="width:65%; text-align:left" id="Content<%=array%>">
												<%=wvo.getWp_Note()%>
											</td>
											<td id="StartDate_<%=array%>" style="width:100px">
												<%=wvo.getWp_StartDate()%>
											</td>
											<td id="EndDate_<%=array%>" style="width:100px">
												<%=wvo.getWp_EndDate()%>
											</td>							
												<td id="modi<%=array %>"><input type='button'  style='background-color:#0076B8; color:#f0f0f0; width:100%' value='수정' onclick='plan_modify(<%=wvo.getWp_No() %>,"<%=wvo.getWp_Note() %>", "<%=wvo.getWp_StartDate()%>", "<%=wvo.getWp_EndDate()%>", "Content<%=array%>", "StartDate_<%=array%>", "EndDate_<%=array%>", "modi<%=array %>", "save<%=array %>", "cancle<%=array %>", "del<%=array %>")'></td>
												<td id="del<%=array %>"><input type='button' style='background-color:#71292D; color:#f0f0f0; width:100%' value='삭제' onclick='plan_delete(<%=wvo.getWp_No() %>)'></td>
												
												<!-- 히든 버튼 -->
												<td id="save<%=array %>" style=" display:none"><input type='button' style='background-color:#5FC41F; color:#f0f0f0; width:100%' value='저장'></td>
												<td id="cancle<%=array %>" style=" display:none"><input type='button' style='background-color:#D0A93B; color:#f0f0f0; width:100%' value='취소'></td>						
											</tr>											
										<%
										array = array + 1;
										}
									}
									%>
									</tbody>
								</table>
								</form>
								<!-- 실질적 데이터 삽입 부분 -->
							</td>
						</tr>							
					</table>
					</div>
					<%
					}
					%>

				<%
				if(pagetype.equals("1"))
				{
					int dayOfWeek = (int)request.getAttribute("dayOfWeek");
					int end		  = (int)request.getAttribute("end");
					int today 	  = (int)request.getAttribute("today");
					int month 	  = (int)request.getAttribute("month")*100; 
					
					System.out.println("dayOfWeek: " + dayOfWeek);
					System.out.println("end: " + end);
					System.out.println("today: " + today);
					System.out.println("month: " + month);
					
					ArrayList<PlanVO> list = (ArrayList<PlanVO>)request.getAttribute("list");
					
					int emptyDay = 1;
					int workcount = 0;
					int otherCount = 0;
					%>
<!-- 일정표 -->
					<div id="foot" style="font:0px; border:0px solid black; margin-top:40px;">
					<div align="center" style="margin-right:300px"><h1><%= month/100%></h1></div>
						<div style="width:784px; height:530px; margin-top:0px; margin-left:45px; background-color:#f3f3f3; display:inline-block; font-size: 0px; border:0px solid black;">
							<div id="dotw">월</div>
							<div id="dotw">화</div>
							<div id="dotw">수</div>
							<div id="dotw">목</div>
							<div id="dotw">금</div>
							<div id="dotw">토</div>
							<div id="dotw">일</div>
							
							<%for(int i=1; i<=end; i++) 
							{
								if(i==1) 
								{
									for(int j=1; j<dayOfWeek; j++) 
									{
									%>
										<div id="day" style="font-coler:gray;" >&nbsp;</div>
									<%
									emptyDay++;
									} 
								}
								if((emptyDay+i)%7 == 1)
								{%>
								<div id="day"><span style="color:red;"><%=i%></span><br>
									<%
									for(PlanVO wvo : list)
									{
										if(Integer.parseInt(wvo.getWP_Cstart()) <= (i+month) && (i+month) <= Integer.parseInt(wvo.getWP_Cend()) )
										{%>
										<span style="color:#ffc2dd;">◎</span><%=wvo.getWp_LittleNote() %><br>
										<%}	
									}%>
								</div>
								<%}
								else
								{
									if(i == today)
									{%>
										<div id="day" style="background-color:#dff0f5;">
											<%=i%><br>
											<%for(PlanVO wvo : list)
											{
												if(workcount < 3 && Integer.parseInt(wvo.getWP_Cstart()) <= (i+month) && (i+month) <= Integer.parseInt(wvo.getWP_Cend())) 
												{%> 
													<div style="margin-top:1px;"><span style="color:#3CDD6C;">◎</span><%=wvo.getWp_LittleNote() %></div> 
												<%workcount++;
												otherCount++;
												}
											}
											if(workcount == 3)
											{%>
												<div style="margin-top:1px;"><span style="color:#ffc2dd;">◎</span> 그 외 일정 <%=otherCount-2 %>개</div>
											<%}%> 
										</div>
									<%}
									else
									{%>
										<div id="day"><%=i%> <br>
										<%
										for(PlanVO wvo : list)
										{
											if(Integer.parseInt(wvo.getWP_Cstart()) <= (i+month) && (i+month) <= Integer.parseInt(wvo.getWP_Cend()) )
											{%>
											<span style="color:#ffc2dd;">◎</span><%=wvo.getWp_LittleNote() %><br>
											<%}	
										}%>
										</div>
									<%}
								}
								dayOfWeek++; 
							}%>
						</div>
						<div style="width:300px; height:400px; margin-right:45px; background-color:#f6f6f6; display:inline-block; float:right; ">
							<div style="width:100%; height:40px; line-height:40px; overflow: auto; text-align:center; font-size:20px; color:white; background-color:#ffc2dd;"> <b>오늘의 일정</b> </div>
							<div id="scroll" class="scroll" style="width:100%; height:360px;">
							<%
							for(PlanVO wvo : list)
							{
								if(Integer.parseInt(wvo.getWP_Cstart()) <= (today+month) && (today+month) <= Integer.parseInt(wvo.getWP_Cend()))
								{%>
									<div style="width:270px; height:30px; line-height:30px; border-bottom: 2px solid pink; font-size:15px; margin: 7px 15px 7px 15px;">
										<%if(wvo.getWp_Note().length() > 17) {%><MarQuee width="270px;"> <%=wvo.getWp_Note()%></MarQuee><%} 
										else {%> <%=wvo.getWp_Note()%> <%} %>
									</div>
								<%
								}
							}%>
						</div>
						<div style="margin-left:170px; margin-top:50px;">
							<img id="imo" src="<%=request.getContextPath()%>/image/chat2.png" style="height:150px; width:120px; cursor:pointer" onclick="window.open('<%=request.getContextPath() %>/chat/chat.do', 'chat', 'width=380, height=650, left=1170px, top=80px')">
						</div>
					</div>					
				</div>
				<%
				}
				%>
				<!-- 일정표 -->		
			</div>				
			</div>
	</body>
</html>