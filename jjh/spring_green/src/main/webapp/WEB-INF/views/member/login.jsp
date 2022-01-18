<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<div class="body">
	<div class="container">
		<h1 class="text-center">로그인</h1>
		<form action="<%=request.getContextPath()%>/login" method="post">
			<div class="form-group">
			  <input type="text" class="form-control" name="me_id">
			</div>
			<div class="form-group">
			  <input type="password" class="form-control" name="me_pw">
			</div>
			<button class="btn btn-outline-success col-12">로그인</button>
		</form>
	</div>
</div>
</body>
</html>