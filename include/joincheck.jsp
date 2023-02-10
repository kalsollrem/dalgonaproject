<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
var checkId = 0
var checkPw = 0
$(document).ready(function(){
	
	$("#User_Id").keyup(function(){

		var Id = $('#User_Id').val();
		//alert(Id)
		if(Id != ''){
			
		}
		$.ajax({
			url:'<%=request.getContextPath()%>/member/accountCheck.do?Id=' + Id,
			//data : {Id: Id},
			type: "get",
			dataType: 'html',
			success: function(data)
			{ 				
				if(data == "false"){
					checkId = 1;
					$('#Cid').html("중복 아이디가 존재합니다");
					$('#Cid').css('color', 'red');
					if(Id == '' || Id == null){
						$('#Cid').html("아이디 중복체크");
						$('#Cid').css('color', 'black');
					}
				}
				else if(data == 'true'){
					checkId = 0;
					$('#Cid').html("사용 가능한 아이디 입니다.");
					$('#Cid').css('color', '#7ACF42');
					if(Id == '' || Id == null){
						$('#Cid').html("아이디 중복체크");
						$('#Cid').css('color', 'black');
					}
				}
			}, 
			error: function()
			{ 
				alert("에러");
			} 
		});

	});
	
	$("#User_Pwc").keyup(function(){

		var Pw = $('#User_Pw').val();
		var cPw = $('#User_Pwc').val();
		if(Pw == '' || cPw == ''){
			$('#Cpw').html("비밀번호 체크");
			$('#Cpw').css('color', 'black');
		}
		else if(Pw == cPw && (Pw != null || Pw != '')){
			$('#Cpw').html("비밀번호 일치");
			$('#Cpw').css('color', '#7ACF42');
		}else if(Pw != cPw && Pw != null || Pw != ''){
			$('#Cpw').html("비밀번호 미일치");
			$('#Cpw').css('color', 'red');
			checkPw = 1;
		}
	});
	
	$("#User_Pw").keyup(function(){

		var Pw = $('#User_Pw').val();
		var cPw = $('#User_Pwc').val();
		if(Pw == '' || cPw == ''){
			$('#Cpw').html("비밀번호 체크");
			$('#Cpw').css('color', 'black');
		}
		else if(Pw == cPw && (Pw != null || Pw != '')){
			$('#Cpw').html("비밀번호 일치");
			$('#Cpw').css('color', '#7ACF42');
		}else if(Pw != cPw && Pw != null || Pw != ''){
			$('#Cpw').html("비밀번호 미일치");
			$('#Cpw').css('color', 'red');
			checkPw = 1;
		}
	});
	
});
</script>
<script src="js/joincheck.js"></script>