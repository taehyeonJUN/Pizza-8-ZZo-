<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!DOCTYPE html>
		<html>
	<head>
	<meta charset="UTF-8">
	<title>회원관리</title>
		</head>
		<body align = 'center'>
		<jsp:include page="/WEB-INF/views/comm/menu.jsp"></jsp:include>
		<h1>회원추가</h1>
		<form action = "${pageContext.request.contextPath}/member/add.do" method="post">
		아이디 : <input type="text" name="memId"/> <br />
		 이름 : <input type="text" name="memName"/> <br />
	   	비밀번호 : <input type="text" name="memPW"/> <br />
		 연락처 : <input type="text" name="memPN"/> <br />
		 <input type="hidden" name="ROL" value="USER" readonly/> <br />
	    <input type="submit" value="저장" />
		</form>
		
		
		</body>
		</html>