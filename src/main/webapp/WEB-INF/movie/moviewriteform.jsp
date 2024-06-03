<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
body * {
	font-family: 'Jua';
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 50px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#movieposter").change(function() {
			//console.log($(this)[0]); //type이 file인 경우 배열타입으로 넘어옴
			let reg = /(.*?)\/(jpg|jpeg|png|gif)$/;
			let f = $(this)[0].files[0];
			if (!f.type.match(reg)) {
				alert("이미지 파일만 가능합니다.");
				return;
			}
			if (f) {
				let reader = new FileReader();
				reader.onload = function(e) {
					$("#showposter").attr("src", e.target.result);
				}
				reader.readAsDataURL($(this)[0].files[0]);
			}
		});
	});
</script>
</head>

<body>
	<div class="container" style="width: 1100px;">
		<body>
			<div class="header">
				<tiles:insertAttribute name="header" />
			</div>
			<div>
				<form action="./insert" method="post" enctype="multipart/form-data">

					<div>
						<table class="table table-bordered" style="width: 100%;">
							<tr>
								<td style="width: 100px;">제목</td>
								<td style="width: 600px;"><input type="text" name="title"
									id="title" class="form-control" required="required"></td>
								<td rowspan="7" style="width: 400px;"><img src=""
									id="showposter" style="width: 100%"
									onerror="this.src='../image/noimage2.png'" /></td>
							</tr>
							<tr>
								<td>포스터</td>
								<td><input type="file" name="movieposter" id="movieposter"
									class="form-control" required="required"></td>
							</tr>
							<tr>
								<td>예고편 주소</td>
								<td><input type="text" name="youtubeURL" id="youtubeURL"
									class="form-control" required="required"></td>
							</tr>
							<tr>
								<td>장르</td>
								<td><input type="text" name="genre" id="genre"
									class="form-control" required="required"></td>
							</tr>
							<tr>
								<td>감독</td>
								<td><input type="text" name="director" id="director"
									class="form-control" required="required"></td>
							</tr>
							<tr>
								<td>출연</td>
								<td><input type="text" name="actor" id="actor"
									class="form-control" required="required"></td>
							</tr>
							<tr>
								<td>개봉년도</td>
								<td><input type="number" name="publishyear"
									id="publishyear" class="form-control" required="required">
								</td>
							</tr>
							<tr>
								<td colspan="3" align="center">
									<button type="submit">영화 저장</button>
									<button type="reset">초기화</button>
									<button type="buttton" onclick="history.back()">취소</button>
								</td>
							</tr>
						</table>
					</div>

				</form>
			</div>
		</body>
</html>
