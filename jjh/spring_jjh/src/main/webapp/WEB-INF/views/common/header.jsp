<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- 외부에서 제공하는 c태그 사용하겠다는 코드-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <!-- Brand/logo -->
	  <a class="navbar-brand" href="<%=request.getContextPath()%>">HOME</a>
	  
	  <!-- Links -->
	  <ul class="navbar-nav">
	  <!-- 로그인되어 있지 않으면 보이는 거 =>세션에 user가 없으면-->
	  <!-- 중괄호 밖에 " 와 } 사이에 공백이 있으면 정상 동작하지 않음 -->
	  <c:if test="${user == null }">
		    <li class="nav-item">
		      <a class="nav-link" href="<%=request.getContextPath()%>/login">로그인</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="<%=request.getContextPath()%>/signup">회원가입</a>
		    </li>
	    </c:if>
	    <!-- 로그인 되어 있으면 => 세션에 user가 있으면 => user가 null이 아니면 -->
	    <c:if test="${user != null }">
		    <li class="nav-item">
			   <a class="nav-link" href="<%=request.getContextPath()%>/logout">로그아웃</a>
				</li>
				<li class="nav-item">
			   <a class="nav-link" href="<%=request.getContextPath()%>/mypage">마이페이지</a>
				</li>
	    </c:if>
	    <li class="nav-item">
		      <a class="nav-link" href="<%=request.getContextPath()%>/board/list?type=notice">공지사항</a>
		</li>
		<li class="nav-item">
		      <a class="nav-link" href="<%=request.getContextPath()%>/board/list">게시글</a>
		</li>
		<c:if test="${user.me_authority =='super admin' }">
			<li class="nav-item">
		      <a class="nav-link" href="<%=request.getContextPath()%>/admin/member/list">회원관리</a>
		</li>
		</c:if>
	  </ul>
	</nav>
</body>
</html>