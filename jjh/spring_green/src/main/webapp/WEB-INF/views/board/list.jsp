<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>
</head>
<body>
	<div class="body container">
	<h1>게시글</h1>
	<form class="input-group mb-3" action="<%=request.getContextPath()%>/board/list">       <!-- 검색어 유지 -->
	  <input type="text" class="form-control" name="search" placeholder="검색어를 입력하세요" value="${pm.criteria.search }">
	  <div class="input-group-append">
	    <button class="btn btn-success" type="submit">검색</button>
	  </div>
  </form>
	<table class="table table-warning table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${list}" var="board">
	      <tr>
	        <td>${board.bd_num}</td>                           <!-- ?는 정보전달 -->
	        <td><a href="<%=request.getContextPath()%>/board/detail?bd_num=${board.bd_num}">${board.bd_title}</a></td>
	        <td>${board.bd_me_id}</td>
	        <td>${board.bd_reg_date_str}</td>
	      </tr>  
      </c:forEach>    
      </tbody>
      </table>
      <c:if test="${pm.criteria.page == i}">active</c:if>
		  <ul class="pagination justify-content-center">
		    <li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
		    	<a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pm.startPage-1}&search=${pm.criteria.search}">이전</a>
		   	</li>
		   	<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			    <li class="page-item <c:if test="${pm.criteria.page == i}">active</c:if>">
			    	<a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${i}&search=${pm.criteria.search}">${i}</a>
			   	</li>
		   	</c:forEach>
		    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
		    	<a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pm.endPage+1}&search=${pm.criteria.search}">다음</a>
		   	</li>
		  </ul>
      <c:if test="${user != null}">
      <a href="<%=request.getContextPath()%>/board/register">
      <button class="btn btn-outline-success">글쓰기</button>
      </a>
      </c:if>
      </div>
</body>
</html>