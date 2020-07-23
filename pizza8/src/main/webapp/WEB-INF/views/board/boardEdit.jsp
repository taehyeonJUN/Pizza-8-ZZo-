<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
</head>
<body align="center">
	<h1>글 수정</h1>
	<form action="${pageContext.request.contextPath}/board/edit.do" method="post">
	<input type="hidden" name="bbsId" value="${boardVo.bbsId}"/>
	<table align="center" >
		<tbody>
			<tr><th>제목</th> <td><input type="text" name="bbsTitle" value="${boardVo.bbsTitle}"/></td></tr> 
			<tr><th>내용</th> <td><textarea rows="10" cols="30" name="bbsText" value="${boardVo.bbsText}">${boardVo.bbsText}</textarea></td></tr>
			<tr><th>글쓴이</th> <td><input type="text" name="bbsUser" value="${boardVo.bbsUser}"/></td></tr>
			<%-- <tr><th>작성자</th> <td><input type="text" value="${loginUser.memId}" readonly="readonly"></td></tr> --%>
			<!-- <tr><th>첨부파일</th> <td><input type="file" name="upfileList" /></td></tr> -->
			<!-- 보안은 백앤드(자바)에서 처리해야한다. --> 
		</tbody>
	</table>
		<input type = "submit" value="발행">
		<a href='${pageContext.request.contextPath}/board/del.do?bbsId=${boardVo.bbsId}'>
		<button type='button'>삭제</button>
		</a><br>
	</form>
	
		<hr/>
	<form action="" id="replyForm">
		<textarea name="repContent" rows="10" cols="30"></textarea>
		<input type = "hidden" name="repBbsNo" value="${boardVo.bbsId}"/>
		<input type = "button" value="저장" id="saveBtn"/>
	</form>
	
	
	<!-- 리플  -->
	<hr/>
	<div id="replyDiv"></div>
<!-- 	로그인한 사용자가 작성한 댓글에는 삭제 버튼이 표시되도록 구현
	삭제버튼을 클릭하면 해당 댓글이 삭제되도록 구현
	로그인한 사용자가 자신이 작성하지 않은 댓글에 대해서 삭제요청을 보내면 삭제 금지 -->
	<div id="templates">
		<div id="replyTemplate">
			<div>
				<span data-id="repWriter"></span>
				<span data-id="repDate"></span>
			</div>
			<div><pre data-id='repContent'></pre></div>
			<hr/>
		</div>
	</div>
	
</body>
</html>