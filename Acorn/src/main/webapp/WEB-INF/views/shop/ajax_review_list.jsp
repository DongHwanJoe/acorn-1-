<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="tmp" items="${reviewList }">
	<c:choose>
		<c:when test="${tmp.deleted eq 'yes' }">
			<dt class="row" style="border-top: 1px solid #f2f2f2; height : 75px; item-align : center; text-align:center; align-items: center;">
				<li>삭제된 리뷰 입니다.</li>
			</dt>
		</c:when>
		<c:otherwise>
			<c:if test="${tmp.num eq tmp.review_group }">
				<li id="reli${tmp.num }" class="page-${pageNum }">
			</c:if>

			<dl>
				<dt class="row">
					<div class="comment_box">											
					<!-- 유저 프로필 -->
						<div class="review_profile col">
							<c:if test="${ empty tmp.profile }">
								<svg class="profile-image"
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-person-circle"
									viewBox="0 0 16 16">
	                               <path
										d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
	                               <path fill-rule="evenodd"
										d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
	                             </svg>
							</c:if>
							<c:if test="${not empty tmp.profile }">
								<img class="profile-image"
									src="${pageContext.request.contextPath}/shop/images/${tmp.profile }" />
							</c:if>
						</div>
						<span class="col">${tmp.writer }</span>
						<span class="bg_bar"></span>
						<span style="font-weight: 100; font-size : 13px; color : gray;">${tmp.regdate }</span>
						<c:choose>
							<c:when
								test="${ (id ne null) and (tmp.writer eq id) }">
								<a data-num="${tmp.num }"
									class="update-link btn btn-warning"
									href="javascript:" style="font-size : 13px; padding:0 1px;">EDIT</a>
								<a data-num="${tmp.num }"
									class="delete-link btn btn-danger"
									href="javascript:" style="font-size : 13px; padding:0 1px;">DELETE</a>
							</c:when>
							<c:when test="${id eq 'admin' }">
								<a data-num="${tmp.num }"
									class="delete-link btn btn-danger"
									href="javascript:" style="font-size : 13px; padding:0 1px;">DELETE</a>
							</c:when>
						</c:choose>
							<div class="startRadio" style="pointer-events: none;">																			
								<c:forEach var="i" begin="0" end="9">
									<label class="startRadio__box" > 
									<input type="radio" name="grade_number" value=${i }
										${tmp.grade eq (i/2+0.5) ? 'class="point"' : ''} >
										<span class="startRadio__img"> <span
											class="blind">별 ${(i/2+0.5) }개</span>
									</span>
									</label>
								</c:forEach>
							</div>
						<div class="comment_box" id="pre${tmp.num }">
							<input class="review_title_box" type="text"
								name="title" id="spt${tmp.num }" value="${tmp.title}"
								disabled />
							<textarea class="review_content_box"
							id="spc${tmp.num }" name="content" disabled>${tmp.content}</textarea>
						</div>
	
						<!-- 수정폼 -->
						<c:if test="${tmp.writer eq id }">
							<form id="updateForm${tmp.num }"
								class="review-form update-form"
								action="review_update" method="post">
								<input type="hidden" name="num" value="${tmp.num }" />
								<div class="startRadio">
									<c:forEach var="i" begin="0" end="9">
										<label class="startRadio__box" hidden> <input
											type="radio" name="grade_number" value=${i }
											${tmp.grade eq (i/2+0.5) ? 'checked' : '' }
											disabled> <span class="startRadio__img">
												<span class="blind">별 ${(i/2+0.5) }개</span>
										</span>
										</label>
									</c:forEach>
								</div>
	
								<textarea name="content">${tmp.content }</textarea>
								<button type="submit" id="ur${tmp.num }"
									class=comment_edit_btn>수정</button>
							</form>
						</c:if>
					</div>
	
					
				</dt>
				<div class="col-2">
					<c:choose>
						<c:when
							test="${empty tmp.imagePath or tmp.imagePath eq 'empty' }">
						</c:when>
						<c:otherwise>
							<img class="review_img"
								src="${pageContext.request.contextPath}/shop/images/${tmp.imagePath}" />
						</c:otherwise>
					</c:choose>
				</div>
			</dl>
		</c:otherwise>
	</c:choose>
</c:forEach>