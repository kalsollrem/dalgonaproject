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
	
		<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
		<style>
			div{			
				border: 1px solid;
			}
		</style>
		
	</head>
	<script>
	 	 $(document).ready(function()
	      {
	    	  
	    	  const modal = document.querySelector('.modal');
	    	  const allBG = document.querySelector('.allBG');
	    	  const btnOpenPopup = document.querySelector('.btn-open-popup');
	    	  
	          btnOpenPopup.addEventListener('click', () => 
	          {
				  divBG.style.display = "block";
	        	  divModal.style.display = "block";
	        	  $('.modal').animate({width:150}, 170);
			  });  
	          
	          allBG.addEventListener('click', () => 
	          {
				  divBG.style.display = "none";
	        	  divModal.style.display = "none";
	        	  $('.modal').animate({width:0});
			  });
	          
	          $("#hamburg").click(function(){
	        	  list(); 
	          });
	          
	      });
	 	 function list()
	 	 {
		 	$.ajax({				
				type : "get",
				url : "<%=request.getContextPath()%>/room/stafflist.do",
				dataType : "html",
				error:function(xhr,status,e){
	                 alert('Error');
	         	 },
				success : function(data)
				{
					$("#sss").html(data);
				}
			});
	 	 }
	 	 
 	  </script>
 	   <style>
	       .modal {
			  position:absolute;
			  top: 50px;;
			  left: 10px;
	          width: 0px;
	          height: 550px;				
		      text-align: center;
		      background-color: rgb(255, 255, 255);
		      border-radius: 10px;
		      box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
			  z-index:100;	  
			  display:none;     
			  font-size:20px;

	       }
	       
	       .allBG
	       {
	       	  position : fixed;
	       	  top: 7px;
	       	  left: 7px;
	       	  width: 350px;
	       	  height: 600px;
	       	  background-color: black;
	       	  opacity: 0.5;	  
	       	  z-index:100;	  
			  display:none
	       }
	       
    </style>
 	  
	<body>
	<div style="width:350px; height:600px;border:none">
		<div style="width:100%;height:50px; display:flex;background-color:#5A7DAF;border:none">
			<a href="#" class="btn-open-popup"><img id="hamburg" style="width:60%; margin-top:10%; margin-left:5px" src="<%=request.getContextPath() %>/image/menu.png"></a>
		    <div class="allBG" id="divBG"></div>   
			
			<div class="modal" id="divModal">
			
			<%@ include file="invite2.jsp" %>
			
			</div>

			<img style="width:5%; height:40%;margin-top:10px; margin-left: 270px"src="image/close.png">				
		</div>
		
		<div style=" width:100%; height: 92%; display:flex;background-color:#DBE4F1;border:none; align-items:center; flex-direction:column">			
		<%
			ArrayList<RoomVO> list = (ArrayList<RoomVO>) request.getAttribute("list");
			for(RoomVO rv : list)
			{
			%>
				<div id="chatbang" style="width:80%;background-color:#F7F7F7;border:none; height:100px;margin-top:20px; cursor: pointer;" onclick="location.href='<%=request.getContextPath() %>/chat/View.do?uno=<%=rv.getROOM_PP()%>&title=<%= rv.getROOM_TITLE()%>&rno=<%= rv.getROOM_NO()%>'">
					<%=rv.getROOM_TITLE() %>				
				</div>
			<%
			}
			%>
			
		</div>
	</div>
	</body>
</html>