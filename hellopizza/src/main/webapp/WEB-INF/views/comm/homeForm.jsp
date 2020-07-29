<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>메인</title>
<style>
	body {
		font-size: .8em;
		text-align: center;
		margin: 0;
		padding: 0;
	}
	
	.slider {
		width: 100%;
		position: relative;
	}
	
	.slider_item {
		width: 100%;
		height: 400px;
		overflow: hidden;
		position: absolute;
		z-index: 0;
		opacity: 0;
		transition: all .7s ease-in-out;
		transform: scale(.8);
	}
	
	img {
		width: 100%;
	}
	
	.showing {
		opacity: 1;
		z-index: 1;
		transform: none;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/comm/menu.jsp"></jsp:include>

	<h1>Pizza8zo</h1>
	<p>로그인 기능을 기반으로 피자 주문 및 게시판 사용이 가능하도록 구현</p>
	<p>전태현 오수현 배범수</p>

	<!-- Slider -->
	<div class="slider">
		<!-- items -->
		<div class="slider_item">
			<img src="${pageContext.request.contextPath}/img/pizza.jpg">
		</div>
		<div class="slider_item">
			<img src="${pageContext.request.contextPath}/img/pizza2.jpg">
		</div>
		<div class="slider_item">
			<img src="${pageContext.request.contextPath}/img/pizza3.jpg">
		</div>

	</div>

	<script type="text/javascript">
		const showing_class = "showing";
		const firstSlide = document.querySelector(".slider_item:first-child");
		function slide() {
			const currentSlide = document.querySelector('.'+showing_class); // showing 클래스가  있는 엘리먼트를 찾는다.
			if (currentSlide) {
				// 지금 shwoing 클래스를 가진 엘리먼트 다음 엘리먼트에 클래스를 추가 한다. 
				currentSlide.classList.remove(showing_class);
				const nextSlide = currentSlide.nextElementSibling;
				// 다음 엘리먼트가 있는지 없는지 체크 후 처리 
				if (nextSlide) {
					console.log(currentSlide);
					nextSlide.classList.add(showing_class);
				} else {//마지막이면(그다음 형제 엘리먼트가 없으니까) 첫 슬라이드에 추가 함.
					firstSlide.classList.add(showing_class);
				}

			} else { // showing 클래스가 지정된 엘리먼트가 없으면 첫번째에 추가해 준다.(페이지 시작시)
				firstSlide.classList.add(showing_class);
			}
		}

		slide();
		setInterval(slide, 2000); // 1000은 1초
	</script>
</body>
</html>