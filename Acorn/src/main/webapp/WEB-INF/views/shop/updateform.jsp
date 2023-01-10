<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/shop/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	textarea{
		width:768px;
		height:500px;
	}
	/* 이미지 업로드 폼을 숨긴다 */
   #imageForm{
      display: none;
   }
   #profileImage{
      width: 100px;
      height: 100px;
      border: 1px solid #cecece;
      border-radius: 50%;
   }
</style>
</head>
<body>
<div class="container">
   <h1>상점 정보 변경 요청폼</h1>
   <form action="insert" method="post" id="insertForm">
   	  <!-- 숨겨진 imageform을 통해 등록된 이미지를 폼에 제출할 수 있도록 하는 hidden input -->
  	  <input type="hidden" name="imagePath" 
     		value="${ empty dto.imagePath ? 'empty' : dto.imagePath }"/>
      <!-- 점포명 input -->
      <div class="mb-3">
         <label class="form-label" for="title">점포명</label>
         <input class="form-control" type="text" name="title" id="title" value="${dto.title }"/>
      </div>
      <!-- 카테고리 input -->
      <div class="mb-3">
         <label class="form-label" for="categorie">카테고리</label>
         <input class="form-control" type="text" name="categorie" id="categorie" value="${dto.categorie }"/>
      </div>
      <!-- 번호 input -->
      <div class="mb-3">
         <label class="form-label" for="telNum">전화번호</label>
         <input class="form-control" type="text" name="telNum" id="telNum" value="${dto.telNum }"/>
      </div>
      <!-- 주소 input -->
      <div class="mb-3">
         <label class="form-label" for="addr">주소</label>
         <input class="form-control" type="text" name="addr" id="addr" value="${dto.addr }"/>
      </div>
      <!-- smart editor를 이용하는 content input -->
      <div class="mb-3">
         <label class="form-label" for="content">내용</label>
         <textarea class="form-control"  name="content" id="content">${dto.content }</textarea>
      </div>
      <a id="profileLink" href="javascript:">
         <c:choose>
            <c:when test="${ empty dto.profile }">
               <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                 <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                 <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
               </svg>
            </c:when>
            <c:otherwise>
               <img id="profileImage" src="${pageContext.request.contextPath }${ dto.profile}">
            </c:otherwise>
         </c:choose>
      </a>
      <button class="btn btn-primary" type="submit">저장</button>
      <!-- 이미지 등록용 숨겨진 form -->
      <form id="imageForm" action="${pageContext.request.contextPath}/gallery/profile_upload" method="get" enctype="multipart/form-data">
         프로필 사진
         <input type="file" id="image" name="image" accept=".jpg, .png, .gif"/>
         <button type="submit">업로드</button>
      </form>
   </form>
</div>
	<%--
	   [ SmartEditor 를 사용하기 위한 설정 ]
	   
	   1. webapp/resources 폴더에 SmartEditor 폴더를 복사해서 붙여 넣기
	   2. WebContent 에 upload 폴더 만들어 두기
	   3. <textarea id="content" name="content"> 
	      content 가 아래의 javascript 에서 사용 되기때문에 다른 이름으로 바꾸고 
	         싶으면 javascript 에서  content 를 찾아서 모두 다른 이름으로 바꿔주면 된다. 
	   4. textarea 의 크기가 SmartEditor  의 크기가 된다.
	   5. 폼을 제출하고 싶으면  submitContents(this) 라는 javascript 가 
	         폼 안에 있는 버튼에서 실행되면 된다.
	 --%>
	<!-- SmartEditor 에서 필요한 javascript 로딩  -->
	<script src="${pageContext.request.contextPath }/resources/SmartEditor/js/HuskyEZCreator.js"></script>
	<script>
	   var oEditors = [];
	   
	   //추가 글꼴 목록
	   //var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
	   
	   nhn.husky.EZCreator.createInIFrame({
	      oAppRef: oEditors,
	      elPlaceHolder: "content",
	      sSkinURI: "${pageContext.request.contextPath}/resources/SmartEditor/SmartEditor2Skin.html",   
	      htParams : {
	         bUseToolbar : true,            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	         bUseVerticalResizer : true,      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	         bUseModeChanger : true,         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	         //aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
	         fOnBeforeUnload : function(){
	            //alert("완료!");
	         }
	      }, //boolean
	      fOnAppLoad : function(){
	         //예제 코드
	         //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	      },
	      fCreator: "createSEditor2"
	   });
	   
	   function pasteHTML() {
	      var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	      oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
	   }
	   
	   function showHTML() {
	      var sHTML = oEditors.getById["content"].getIR();
	      alert(sHTML);
	   }
	
	   
	   function setDefaultFont() {
	      var sDefaultFont = '궁서';
	      var nFontSize = 24;
	      oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	   }
	   
	   //폼에 submit 이벤트가 일어났을때 실행할 함수 등록
	   document.querySelector("#insertForm")
	      .addEventListener("submit", function(e){
	         //에디터에 입력한 내용이 textarea 의 value 값이 될수 있도록 변환한다. 
	         oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	         //textarea 이외에 입력한 내용을 여기서 검증하고 
	         const title=document.querySelector("#title").value;
	         
	         //만일 폼 제출을 막고 싶으면  
	         //e.preventDefault();
	         //을 수행하게 해서 폼 제출을 막아준다.
	         if(title.length < 5){
	            alert("제목을 5글자 이상 입력하세요!");
	            e.preventDefault();
	         }
	         
	      });
	</script>
   <script src="${pageContext.request.contextPath }/resources/js/gura_util.js"></script>
   <script>
      //프로필 이미지 링크를 클릭하면 
      document.querySelector("#profileLink").addEventListener("click", function(){
         // input type="file" 을 강제 클릭 시킨다. 
         document.querySelector("#image").click();
      });   
      
      //프로필 이미지를 선택하면(바뀌면) 실행할 함수 등록
      document.querySelector("#image").addEventListener("change", function(){
         //ajax 전송할 폼의 참조값 얻어오기
         const form=document.querySelector("#imageForm");
         //gura_util.js 에 있는 함수를 이용해서 ajax 전송하기 
         ajaxFormPromise(form)
         .then(function(response){
            return response.json();
         })
         .then(function(data){
            console.log(data);
            // input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
            document.querySelector("input[name=imagePath]").value=data.imagePath;
            
            // img 요소를 문자열로 작성한 다음 
            let img=`<img id="profileImage" 
               src="${pageContext.request.contextPath }\${data.imagePath}">`;
            //id 가 profileLink 인 요소의 내부(자식요소)에 덮어쓰기 하면서 html 형식으로 해석해 주세요 라는 의미 
            document.querySelector("#profileLink").innerHTML=img;
         });
      });      
      
   </script>
</body>
</html>