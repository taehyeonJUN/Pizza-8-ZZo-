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
	
	<!-- 리플  -->
	<hr/>
	<div id="commentDiv"></div>
	<!-- 	로그인한 사용자가 작성한 댓글에는 삭제 버튼이 표시되도록 구현
	삭제버튼을 클릭하면 해당 댓글이 삭제되도록 구현
	로그인한 사용자가 자신이 작성하지 않은 댓글에 대해서 삭제요청을 보내면 삭제 금지 -->
	<div id="templates">
		<div id="commentTemplate">
			<div>
				<span data-id="rpUser"></span>
				<span data-id="rpDate"></span>
			</div>
			<div><pre data-id='rpText'></pre></div>
			<hr/>
		</div>
	</div>
	
	<hr />
	<form action="" id="commentForm">
		<input type="text" name="rpUser" value="${commentVo.rpUser}" /> <br/>
		<textarea name="rpText" rows="10" cols="30"></textarea>
		<input type="hidden" name="rpBbsid" value="${boardVo.bbsId}" /> 
		<input type="button" value="저장" id="saveBtn" />
	</form>

	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
	<script type="text/javascript">
		
	function refreshCommentList() 
	{
			//댓글 목록 읽어와서 출력하는 부분
			$.ajax({
				url : "${pageContext.request.contextPath}/comment/list.do",//요청주소
				method : "GET",
				data : { rpBbsid : $('[name="rpBbsid"]').val()},//요청전송시 함께 전송할 파라미터들(보낼 데이터가 얼마 없을때)
				dataType : "json"
			}).done(
					function(data) {
						console.log(data);
						$('#commentDiv').html('') //목록초기화
						
						for (var i = 0; i < data.length; i++) 
						{
							var comment = data[i];
							// 댓글 작성자, 작성일시도 출력

							
							var $cdiv = $('#commentTemplate').clone().appendTo('#commentDiv');
							for ( var p in comment) 
							{
								$cdiv.find('[data-id="' + p + '"]').html(comment[p]);
							}

							/* 풀어쓰기
							$cdiv.find('[data-id="rpText"]').html(comment.rpUser);
							//$('[data-id="rpUser"]'l, $cdiv).html(comment.rpUser) 위와 가튼 의미
							$rdiv.find('[data-id="rpDate"]').html(comment.rpDate);
							$rdiv.find('[data-id="rpText"]').html(comment.rpText); */
							//$('#commentDiv').append( $cdiv );
						}
					})
					.fail(function(jqXHR, textStatus) 
					{alert("Request failed: " + textStatus);});
		}
		$(function() // 문서 끝까지 모두 읽은 후 이 함수를 실행 
		{

			refreshCommentList()

			//댓글 입력
			$('#saveBtn').on('click', function() { //'click' 이벤트 발생시 실행될 함수

				$.ajax({
					url : "${pageContext.request.contextPath}/comment/add.do",//요청주소
					method : "POST",//요청방식, 생략시 get방식 
					data : $('#commentForm').serialize(), // 폼 또는 입력 엘리먼트들에 대해서 serialize()명령을 사용하면 선택된 폼 내부의 모든 엘리먼트들을 파라미터 문자열 형태로 변환		 		 
					dataType : "json" // 응답으로 받을 데이터의 타입(text,html,xml,json,...)
				}).done(function(data) //-> 언제든 값을 꺼내서 활용할 수 있도록 하기 위함
				{
					/* ajax요청이 dataType:"json"으로 지정하면
					제이쿼리가 응답으로 받은 json문자열을 자바스크립트로 변환하여 인자로 전달 */
					console.log(data);
					if (data.result > 0) {
						alert('댓글 저장 성공')

						$('[name="repText"]').val(''); // 자바스크립트는 게터 세터가 한 문장으로 동일해서 인자를 넣고 안넣고에 따라 다르게 받아드린다 
						 refreshCommentList()
					} else {
						alert('댓글 저장 실패')
					}
				}).fail(function(jqXHR, textStatus) {
					//요청전송이나 응답수신이 실패한 경우 실행
					alert("Request failed: " + textStatus);
				});

			});

		})
	</script>
	
	
	
	
	
</body>
</html>