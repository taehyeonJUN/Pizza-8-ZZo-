<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>글목록</title>

	<!--     부트스트랩 <link href="css/bootstrap.min.css" rel="stylesheet"> -->
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    
     <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    
	<!--     모든 컴파일된 플러그인을 포함합니다, 원하지 않는다면 필요한 각각의 파일을 포함하세요 <script src="js/bootstrap.min.js"></script> -->
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Pizza8zo</a>
          </div>

          <c:if test="${loginUser==null}"> <!-- 로그인 안했을때 -->
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/home.do">Home</a></li>
              </ul>
              <ul class="nav navbar-nav navbar-right">
                
              <li><a href="${pageContext.request.contextPath}/member/add.do">Join</a></li>
              
              <li><a href="${pageContext.request.contextPath}/member/login.do">Login</a></li>
              </ul>
            </div><!-- /.navbar-collapse -->
          </c:if>  
          
        <c:if test="${loginUser!=null}"> <!--로그인한경우-->
          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
              <li><a href="${pageContext.request.contextPath}/home.do">Home</a></li>
              <li><a href="${pageContext.request.contextPath}/board/list.do">Board<span class="sr-only">(current)</span></a></li>
              <li><a href="${pageContext.request.contextPath}/student/list.do">Order</a></li>
            </ul>
            
            <ul class="nav navbar-nav navbar-right">
    
            <li><a href="${pageContext.request.contextPath}/member/logout.do">Logout</a></li>
            
            <li class="dropdown">
                <a href="${pageContext.request.contextPath}/member/list.do" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><c:out value="${loginUser.memName} "/><span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="${pageContext.request.contextPath}/member/list.do">MemberList</a></li>
                  <li><a href="#">MenuList</a></li>
                  <li class="divider"></li>
                  <li><a href="#">탈퇴</a></li>
                </ul>
              </li>
            </ul>
          </div><!-- /.navbar-collapse -->
        </c:if>
        </div><!-- /.container-fluid -->
        
      </nav>


  </body>
</html>