
function FormCheck()
{
	//색맹여부
	if($("#User_Color").val() == "") 
	{
		alert('색맹여부를 작성해주세요.');
		$("#User_Color").focus();            
		return false;
	}
	//최종 학력
	if($("#User_Fs").val() == "") 
	{
		alert('최종학력을 입력헤주세요.');
		$("#User_Fs").focus();            
		return false;
	}
}
	
function necceary01(){
	if($("#User_Id").val() == "")
	{
		alert('아이디를 입력해주세요.');
		$("#User_Id").focus();
		return false;
	}
	if($("#User_Id").val().length < 7){
		alert("아이디는 7자리 이상이어야 합니다");
		$("#User_Id").focus();
		return false;
	}
	if(checkId == 1){
		alert("중복 아이디가 존재합니다");
		$('#User_Id').focus();
		return false;
	}
	//PW 공란 체크
	if($("#User_Pw").val() == "") 
	{
		alert('비밀번호를 확인 해주세요');
		$("#User_Pw").focus();
		return false;
	}
	if($("#User_Pw").val().length < 10){
		alert("비밀번호는 10자리 이상이어야 합니다");
		$("#User_Pw").focus();
		return false;
	}
	//PW 확인 공란 체크
	if($("#User_Pwc").val() == "") 
	{
		alert('비밀번호 확인란을 입력해주세요.');
		$("#User_Pwc").focus();
		return false;
	}
	if($("#User_Pw").val() != $("#User_Pwc").val()){
		alert("비밀번호가 일치 하지 않습니다");
		$("#User_Pw").focus();
		return false;
	}
	
}

function necceary02(){
	//이름(국문)
	if($("#User_Kr").val() == "") 
	{
		alert('이름(국문)을 입력해주세요.');
		$("#User_Kr").focus();            
		return false;
	}

	//이름(한문)
	if($("#User_Ch").val() == "") 
	{
		alert('이름(한문)을 입력해주세요.');
		$("#User_Ch").focus();            
		return false;
	}
	
	//주민번호
	if($("#User_Pno").val() == "") 
	{
		alert('생년월일을 입력해주세요.');
		$("#User_Pno").focus();            
		return false;
	}else if($("#User_Pno").val().length != 6){
		alert('형식에 맞지 않습니다');
		$("#User_Pno").focus();
		return false;
	}

	//성별 체크
	if($('input[name=User_Gen]').is(':checked') == false) 
	{
		alert('성별을 선택해주세요.');          
		return false;
	}
		
	//주소 체크
	if($(".User_Add").val() == "") 
	{
		alert('주소를  입력해주세요.');
		$("#User_Add").focus();            
		return false;
	}
	//상세주소 체크
	if($(".User_Addin").val() == "") 
	{
		alert('상세주소를 입력해주세요.');
		$("#User_Addin").focus();            
		return false;
	}
	//신장 체크
	if($("#User_Cm").val() == "") 
	{
		alert('신장을 입력주세요.');
		$("#User_Cm").focus();            
		return false;
	}
	//체중 체크
	if($("#User_Kg").val() == "") 
	{
		alert('체중을 입력해주세요.');
		$("#User_Kg").focus();            
		return false;
	}
	
	//시력 체크
	if($("#User_Sh").val() == "") 
	{
		alert('시력을 입력해주세요.');
		$("#User_Sh").focus();            
		return false;
	}
	
	//혈액형 체크
	if($("#User_Bt").val() == "") 
	{
		alert('혈액형을 입력헤주세요.');
		$("#User_Bt").focus();            
		return false;
	}
	
}
