<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index.jsp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
</head>
<style>
.container {
	display: grid;
	grid-template-areas: 
	"header header header" 
	"banner banner banner"
	"search main main" 
	"  bot   bot   bot  ";
	grid-template-columns: 1fr 2fr 1fr;
	box-shadow: 0px 5px 20px 0px grey;
	border-right: thin;
	z-index: 1;
	min-width: 1320px;
}
.main_content{
	grid-area : main;
}
.header {
	grid-area: header;
	text-align: right;
	display: block;
}

.main_banner {
	grid-area: banner;
	text-align: center;
	height: 200px;
	background-color: skyblue;
}

.side_menu_a {
	grid-area: search;
	width: 100%;
	text-align: center;
	background-color: lightgray;
}

.search_menu {
	grid-area: search;
	box-shadow: 2px 2px 3px 0px grey;
	background-color: white;
	z-index: 3;
	position: relative;
}

.search_result {
	grid-area: main;
	width: 100%;
	height: 680px;
	text-align: center;
}

.side_menu_b {
	grid-area: b;
	width: 100%;
	text-align: center;
	background-color: lightgray;
}

.footer {
	padding-left: 10px;
	padding-right: 10px;
	margin-top: 0px;
	background-color: white;
	grid-area: footer;
	bottom: 0px;
	width: 100%;
	position: fixed;
	z-index: 5;
}

.bottom {
	grid-area: bot;
}

.search_bar {
	border: 3px solid;
	border-color: rgb(64, 219, 43);
	border-radius: 5px;
	margin: 10px;
	width: 290px;
}

.search_bar>form>input {
	width: 250px;
	margin: 10px;
	border: none;
	font-size: large;
}

.suggest_menu>.card {
	margin-left: 10px;
}

#map {
	z-index: 2;
}

.suggest_menu {
	height: 600px;
	overflow: scroll;
	-ms-overflow-style: none;
}

.suggest_menu::-webkit-scrollbar {
	display: none;
}

.fold_btn {
	position: absolute;
	left: 300px;
	top: 150px;
	z-index: 5;
}

.open_btn {
	position: absolute;
	left: 200px;
	top: 150px;
	z-index: 5;
}

.content_photo_1>img, .content_photo_2>img {
	width: 200px;
	margin: 0.5px;
	margin-right: -5px;
}
.main_table{
	width : 900px;
	
}
td>img{
	width:200px;
}
</style>
<body>

    <div class="container">
        
        <div class="header">
			<c:choose>
				<c:when test="${ empty sessionScope.id}">
					<a href="${pageContext.request.contextPath}/users/loginform">로그인</a>
					<a href="${pageContext.request.contextPath}/users/signup_form">회원가입</a>
				</c:when>
				<c:otherwise>
					<p>
						<a href="${pageContext.request.contextPath}/users/info">${sessionScope.id }</a>
						로그인중... <a href="${pageContext.request.contextPath}/users/logout">로그아웃</a>
					</p>
				</c:otherwise>
			</c:choose>
		</div>
        <div class="main_banner">메인 배너 표시</div>
        <div class="search_menu">
            <div class="search_bar">
                <form action="">
                    <input type="text" placeholder="가게 명을 입력하세요...">
                </form>
            </div>
            
            
            <hr>
            <div class="suggest_menu">
				<c:choose>
					<c:when test="${ empty sessionScope.id}">
						<h5>회원님을 위한 오늘의 추천</h5>
					</c:when>
					<c:otherwise>
						<h5>${sessionScope.id }님을 위한 오늘의 추천</h5>
					</c:otherwise>
				</c:choose>
				<c:forEach var="tmp" items="${list }">
					<div class="card" style="width: 18rem;">
	                    <img src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220310_48%2F1646883669558peXxc_JPEG%2F20220310_124026.jpg&type=f&size=340x180" class="card-img-top" alt="...">
	                    <div class="card-body">
	                    	<h5 class="card-title">${tmp.title }</h5>
	                    	<p class="card-text">${tmp.content} }</p>
	                    	<a href="${pageContext.request.contextPath}/shop/detail?num=${tmp.num}" class="btn btn-primary">가게 정보 보기</a>
	                    </div>
	                </div>
                <br>
				</c:forEach>
            </div>
        </div>
        <div class="search_result">
                <div class="main_content">
		            <div class="content_images">
		                <div class="content_photo_1">
		                    <img src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201702/27/117f5b49-1d09-4550-8ab7-87c0d82614de.jpg" alt="">
		                    <img src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201702/27/117f5b49-1d09-4550-8ab7-87c0d82614de.jpg" alt="">
		                    <img src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201702/27/117f5b49-1d09-4550-8ab7-87c0d82614de.jpg" alt="">
		                </div>
		                <div class="content_photo_2">
		                    <img src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201702/27/117f5b49-1d09-4550-8ab7-87c0d82614de.jpg" alt="">
		                    <img src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201702/27/117f5b49-1d09-4550-8ab7-87c0d82614de.jpg" alt="">
		                    <img src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201702/27/117f5b49-1d09-4550-8ab7-87c0d82614de.jpg" alt="">
		                </div>


						<div class="main_title">
							<div id="map"
								style="width: 200px; height: 150px; margin: auto; float: right; margin-right: 20px;"></div>
	
							<br>
							<br> <Strong>${dto.title }</Strong>
							<p>리뷰 ${dto.reviewCount } 회</p>
							<p>좋아요 : ${dto.likeCount}, 싫어요 : ${dto.dislikeCount }</p>
							<p style="margin: 0px;"></p>
						</div>
						<div class=btn_box>
							<button type="button" id="btn_1">가게 소개</button>
							<button type="button" id="btn_2">메뉴</button>
							<button type="button" id="btn_3">리뷰</button>
							<button type="button" id="btn_4">사진</button>
						</div>
					<div class="table_1">
						<table>
							<tbody>
								<tr class=shopInfo>
									<td colspan="5">&nbsp; 가게 소개 : ${dto.content }</td>
								</tr>
								<tr class=shopInfo>
									<td colspan="5">&nbsp; 전화 번호 : ${dto.telNum}</td>
								</tr>
								<tr class=shopInfo>
									<td colspan="5">&nbsp; 영업 시간 :</td>
								</tr>
								<tr class=shopInfo>
									<td colspan="5">&nbsp; 주소 : ${dto.addr }</td>
								</tr>
								<tr class=shopInfo>
									<td colspan="5">&nbsp; 단체 손님 환영</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="table_2">
						<table>
							<tbody>
								<tr>
									<td>메뉴 1 : 10,000원</td>
								</tr>
								<tr>
									<td>메뉴 2 : 20,000원</td>
								</tr>
								<tr>
									<td>메뉴 3 : 30,000원</td>
								</tr>
								<tr>
									<td>메뉴 4 : 40,000원</td>
								</tr>
								<tr>
									<td>메뉴 5 : 50,000원</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="table_3">
						<table>
							<tbody>
								<tr>
									<td>리뷰</td>
								</tr>
								<tr>
									<td>5점  :  N명</td>
								</tr>
								<tr>
									<td>4점  :  N명</td>
								</tr>
								<tr>
									<td>3점  :  N명</td>
								</tr>
								<tr>
									<td>2점  :  N명</td>
								</tr>
								<tr>
									<td>1점  :  N명</td>
								</tr>
								<tr>
									<td>리뷰 : "~~~~~~~~~~~~~~~~~~"</td>
								</tr>
								<tr>
									<td>리뷰 : "~~~~~~~~~~~~~~~~~~"</td>
								</tr>
								<tr>
									<td>리뷰 : "~~~~~~~~~~~~~~~~~~"</td>
								</tr>
								
							</tbody>
						</table>
					</div>
					<div class="table_4">
						<table>
							<tbody>
								<tr>
									<td> <img src="https://www.newiki.net/w/images/thumb/8/8f/Grilled_porterhouse_steak.jpg/450px-Grilled_porterhouse_steak.jpg" alt="" /></td>
									<td> <img src="https://www.newiki.net/w/images/thumb/8/8f/Grilled_porterhouse_steak.jpg/450px-Grilled_porterhouse_steak.jpg" alt="" /></td>
									<td> <img src="https://www.newiki.net/w/images/thumb/8/8f/Grilled_porterhouse_steak.jpg/450px-Grilled_porterhouse_steak.jpg" alt="" /></td>
								</tr>
									<td> <img src="https://www.newiki.net/w/images/thumb/8/8f/Grilled_porterhouse_steak.jpg/450px-Grilled_porterhouse_steak.jpg" alt="" /></td>
									<td> <img src="https://www.newiki.net/w/images/thumb/8/8f/Grilled_porterhouse_steak.jpg/450px-Grilled_porterhouse_steak.jpg" alt="" /></td>
									<td> <img src="" alt="" /></td>
								</tr>
								
							</tbody>
						</table>
					</div>

				</div>
		        </div>    
        </div>
        <div class="bottom">　</div>


        
    </div>        
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9xl3ekksy5"></script>
	<script>

		window.onload = function() {
			$("#table_1").show();
			$("#table_2").hide();
			$(".table_3").hide();
			$(".table_4").hide();
		}
		$(document).ready(function() {
			$("#btn_1").click(function() {

				$(".table_1").show();
				$(".table_2").hide();
				$(".table_3").hide();
				$(".table_4").hide();
			})
			$("#btn_2").click(function() {

				$(".table_1").hide();
				$(".table_2").show();
				$(".table_3").hide();
				$(".table_4").hide();
			})
			$("#btn_3").click(function() {

				$(".table_1").hide();
				$(".table_2").hide();
				$(".table_3").show();
				$(".table_4").hide();
			})
			$("#btn_4").click(function() {
				$(".table_1").hide();
				$(".table_2").hide();
				$(".table_3").hide();
				$(".table_4").show();
			})
		})
		let lat = $
		{
			dto.latitude
		};
		let lng = $
		{
			dto.longitude
		};

		let map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(lat, lng),
			zoom : 18
		});

		let marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(lat, lng),
			map : map
		});
	</script>
	<div class="footer">
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
          <symbol id="bootstrap" viewBox="0 0 118 94">
            <title>Bootstrap</title>
            <path fill-rule="evenodd" clip-rule="evenodd"
                d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
          </symbol>
          <symbol id="facebook" viewBox="0 0 16 16">
            <path
                d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
          </symbol>
          <symbol id="instagram" viewBox="0 0 16 16">
              <path
                d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z" />
          </symbol>
          <symbol id="twitter" viewBox="0 0 16 16">
            <path
                d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z" />
          </symbol>
        </svg>
    
    
    
    
        <footer
            class="d-flex flex-wrap justify-content-between align-items-center py-3 border-top">
            <div class="col-md-4 d-flex align-items-center">
                <a href="/"
                    class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
                    <svg class="bi" width="30" height="24">
                        <use xlink:href="#bootstrap" /></svg>
                </a> <span class="mb-3 mb-md-0 text-muted">&copy; 2023 Acorn, Team 1</span>
            </div>
    
            <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
                <li class="ms-3"><a class="text-muted" href="#"><svg
                            class="bi" width="24" height="24">
                            <use xlink:href="#twitter" /></svg></a></li>
                <li class="ms-3"><a class="text-muted" href="#"><svg
                            class="bi" width="24" height="24">
                            <use xlink:href="#instagram" /></svg></a></li>
                <li class="ms-3"><a class="text-muted" href="#"><svg
                            class="bi" width="24" height="24">
                            <use xlink:href="#facebook" /></svg></a></li>
            </ul>
        </footer>
    
    </div>
</body>
</html>