<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
</head>
<body>
			<h1>${board.typeTitle }상세</h1>
			<div class="form-group">
			  <label>제목</label>
			  <input type="text" class="form-control" value="${board.bd_title}" readonly>
			</div>
			<div class="form-group">
			  <label>작성자</label>
			  <input type="text" class="form-control" value="${board.bd_me_id}" readonly>
			</div>
			<div class="form-group">
			  <label>작성일</label>
			  <input type="text" class="form-control" value="${board.bd_reg_date_str}" readonly>
			</div>
			<div class="form-group">
			  <label>내용</label>
			  <textarea class="form-control" rows="10" readonly>${board.bd_contents}</textarea>
			</div>
			<div class="form-group">
			  <label>첨부파일</label>
			  <c:forEach items="${fileList}" var="file">
			  	<a class="form-control" href="<%=request.getContextPath()%>/board/download?fileName=${file.fi_name}">${file.fi_ori_name}</a>
			  </c:forEach>
			</div>
			<c:if test="${user.me_id == board.bd_me_id}">
				<a href="<%=request.getContextPath()%>/board/modify?bd_num=${board.bd_num}">
					<button class="btn btn-outline-success">수정</button>
				</a>
				<a href="<%=request.getContextPath()%>/board/delete?bd_num=${board.bd_num}">
					<button class="btn btn-outline-success">삭제</button>
				</a>
			</c:if>
			<!-- 현재 보고 있는 게시글이 원본 게시글인 경우 -->
			<c:if test="${(board.bd_type == 'normal' || board.bd_type == 'qna') && board.bd_num == board.bd_ori_num }">
				<a href="<%=request.getContextPath()%>/board/register?bd_ori_num=${board.bd_num}">
						<button class="btn btn-outline-success">답변</button>
				</a>
			</c:if>
			<!-- 현재 보고 있는 게시글이 답변 게시글인 경우 -->
			<c:if test="${(board.bd_type == 'normal' || board.bd_type == 'qna') && board.bd_num != board.bd_ori_num }">
				<a href="<%=request.getContextPath()%>/board/register?bd_ori_num=${board.bd_ori_num}">
						<button class="btn btn-outline-success">답변</button>
				</a>
			</c:if>
</body>
</html>