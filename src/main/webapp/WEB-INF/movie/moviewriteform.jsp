<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
   <style>
   
       body *{
           font-family: 'Jua';
       }
       
       #showimg{
       		position: absolute;
       		left:430px;
       		top:50px;
       		max-width: 200px;
       		border: 2px solid gray;
       }
       
   </style>
   <script type="text/javascript">
   	$(function(){
   		$("#upload").change(function(){
   	        //console.log($(this)[0]); //type이 file인 경우 배열타입으로 넘어옴
   	        let reg=/(.*?)\/(jpg|jpeg|png|gif)$/;
   	        let f = $(this)[0].files[0];
   	        if(!f.type.match(reg)){
   	            alert("이미지 파일만 가능합니다.");
   	            return;
   	        }
   	        if(f)
   	        {
   	            let reader = new FileReader();
   	            reader.onload = function(e){
   	                $("#showimg").attr("src", e.target.result);
   	            }
   	            reader.readAsDataURL($(this)[0].files[0]);
   	        }
   	    });
   	});//end of function
   	
   </script>
</head>

	<!-- admin이 아니라면???? -->
	<c:if test="">
		<script type="text/javascript">
			alert("먼저 로그인 후 글을 작성해 주세요");
			history.back();
		</script>
	</c:if>
	
<body>4
<div class="header">
	<tiles:insertAttribute name="header"/>
</div>
<div>
	<form action="./insert" method="post" enctype="multipart/form-data">
	
	<div>
		<table>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" class="form-control" required="required">
				</td>
				<td colspan="7">
					입력사진 들어갈 곳
				</td>
			</tr>
			<tr>
				<td>포스터</td>
				<td>
					<input type="file" class="form-control" required="required">
				</td>
			</tr>
			<tr>
				<td>예고편 주소</td>
				<td>
					<input type="class="form-control" required="required">
				</td>
			</tr>
			<tr>
				<td>장르</td>
				<td>
				
				</td>
			</tr>
			<tr>
				<td>감독</td>
				<td>
				
				</td>
			</tr>
			<tr>
				<td>출연</td>
				<td>
				
				</td>
			</tr>
			<tr>
				<td>개봉년도</td>
				<td>
				
				</td>
			</tr>
		</table>
	</div>
	
		
	</form>
</div>
</body>
</html>
