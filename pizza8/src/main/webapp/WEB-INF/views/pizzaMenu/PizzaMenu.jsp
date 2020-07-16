<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴정보</title>
</head>
<body>
	<c:forEach var="vo" items="${seletList}">
	<c:out value='${vo.meName}'></c:out>
	<c:out value='${vo.mePrice}'></c:out>

	</c:forEach>


</body>
</html>