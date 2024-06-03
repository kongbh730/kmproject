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
        .main-container {
            margin-top: 30px;
            width: 1280px;
            height: 100vh;
            background-color: black;
            display: flex;
            justify-content: center;
        }
        .main-body {
            background-color: black;
            display: flex;
            justify-content: center;
        }
        .movie-info {
            background-color: #121212;
            width: 200px;
            height: 300px;
            color: white;
        }

        .movie-info__change {
            display: flex;
            float: right;
        }

        .movie-info__img {
            width: 200px;
            height: 180px;
            padding: 0;
            margin: 0;
        }

        .movie-info__title {
            padding: 8px 8px;
        }

        .movie-info__director {
            padding: 8px 8px;
        }

        .movie-info__date {
            padding: 8px 8px;
        }

        .movie-info__insert {
            display: flex;
            position: fixed;
            bottom: 10px;
            right: 10px;
        }

        a {
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="main-body">
        <div class="main-container">
            <c:forEach var="moviedto" items="${list}">
                <div class="movie-info">
                    <div class="movie-info__change">
                        <a href="../movie/updateform">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                                <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
                                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
                            </svg>
                        </a>
                    </div>
                    <div class="movie-info__img">
                        ${moviedto.poster}
                    </div>
                    <div class="movie-info__title">
                        ${moviedto.title}
                    </div>
                    <div class="movie-info__director">
                        ${moviedto.director}
                    </div>
                    <div class="movie-info__date">
                        ${moviedto.publishyear}년
                    </div>
                </div>
            </c:forEach>
            <div class="movie-info__insert">
                <a href="../movie/writeform">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
                    </svg>
                </a>
            </div>
        </div>
    </div>
</body>
</html>