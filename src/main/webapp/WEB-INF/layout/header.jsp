<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style>
        .header__list {
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            align-items: center;
            background-color: #121212;
            height: 56px;
            width: 1300px;
            margin: 0 auto;
        }


        .header-info__project {
            position: relative;
            color: white;
            margin : 10px;
            text-decoration:none;
        }

        .header-info__login {
            position: relative;
            color: white;
            align-content: center;
        }

        .header-info__regist {
            position: relative;
            color: white;
            align-content: center;
        }

        .header-info__block {
            color: white;
        }

        .header-body {
            background-color: #121212;
        }
    </style>
</head>
<body>
<div class="header-body">
    <div class="header__list">
       <span class="header-info__project">
           <a href="../movie/list" style="text-decoration: none;color: white">
               MKCINEMA
           </a>
       </span>
       <span class="header-info__user">
           <span class="header-info__login">
           <a href="../user/login" style="text-decoration: none;color: white">
               Sign In
           </a>
       </span>
       <span class="header-info__block">
           |
       </span>
       <span class="header-info__regist">
           <a href="../user/regist" style="text-decoration: none;color: white" class="">
               Sign Up
           </a>
       </span>
       </span>
    </div>
</div>
</body>
</html>