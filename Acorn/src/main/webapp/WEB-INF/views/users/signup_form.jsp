<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
</head>
<body>
	<div class="container">
	   <h1>회원 가입 폼 입니다.</h1>
	   <form action="${pageContext.request.contextPath}/users/signup" method="post" id="myForm">
	      <div>
	         <label class="control-label" for="id">아이디</label>
	         <input class="form-control" type="text" name="id" id="id"/>      
	      </div>
	      <div>
	         <label class="control-label" for="pwd">비밀번호</label>
	         <input class="form-control" type="password" name="pwd" id="pwd"/>   
	      </div>
	      <div>
	         <label class="control-label" for="pwd2">비밀번호 확인</label>
	         <input class="form-control" type="password" name="pwd2" id="pwd2"/>
	      </div>
	      <div>
	         <label class="control-label" for="email">이메일</label>
	         <input class="form-control" type="email" name="email" id="email"/>
	      </div>
	      <button class="btn btn-primary" type="submit">가입</button>
	   </form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> 
<script>
	let isEmailValid=false;
	
	$("#email").on("input", function(){   
        //두개의 클래스 제거하기
        $(this).removeClass("is-valid is-invalid");
        
        //입력한 이메일
        const inputEmail=$(this).val();
        //이메일을 검증할 정규 표현식  
        const reg=/@/;
        //만일 입력한 이메일이 정규표현식 검증을 통과 하지 못했다면
        if(!reg.test(inputEmail)){
           $(this).addClass("is-invalid");
           isEmailValid=false;
        }else{//통과 했다면 
           $(this).addClass("is-valid");
           isEmailValid=true;
        }
     });   
	
	//폼에 submit 이벤트가 일어 났을때 실행할 함수 등록
    $("#signupForm").on("submit", function(){   
       
       //아래의 코드는 아이디, 비밀번호, 이메일 유효성 검증결과를 고려해서 조건부로 실행되도록 해야 한다.
       //폼 전체의 유효성 여부
       const isFormValid = isIdValid && isPwdValid && isEmailValid;
       //만일 폼이 유효하지 않으면
       if(!isFormValid){
          return false; //폼 전송을 막는다.(jQuery 에서 submit 이벤트 리스너 함수 안에서 폼전송 막는 방법)
       }
    });
</script>
</body>
</html>