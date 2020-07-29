<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>회원 관리</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/comm/menu.jsp"></jsp:include>
	<h1>회원정보변경</h1>
	<form action='${pageContext.request.contextPath}/member/edit.do'method='post'>
		아이디 : <input type='text' name='memId' value='${memVo.memId}' readonly /><br />   
		이름 : <input type='text' name='memName'value='${memVo.memName}' /> <br /> 
		연락처 : <input type='text' name='memPN' value='${memVo.memPN}' /> <br /> 
		<input type='submit' value='저장' /> 
		<a href='${pageContext.request.contextPath}/member/del.do?memId=${memVo.memId}'> <button type='button'>삭제</button></a><br />
	</form>


</body>
</html>