<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="../css/style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style>
        .main-container {
            width: 1280px;
            height: 100vh;
            background-color: black;
            display: flex;
            justify-content: center;
            color: white;
        }
        .main-body {
            background-color: black;
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
<div class="main-body">
    <div class="main-container"> 
        <%-- <c:forEach var="moviedto" items="${list}">
            환영합니다
        </c:forEach> --%>
        <a href="../movie/list">
        	<img src="../image/MKCINEMALOGO.jpg" height="100%">
        </a>
    </div>
</div>
</body>
</html>