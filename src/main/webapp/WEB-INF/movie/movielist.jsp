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
            justify-content: space-between;
            flex-wrap: wrap;
        }
        .main-body {
            background-color: black;
            display: flex;
            justify-content: center;
        }
        .movie-info {
            background-color: #121212;
            width: 18%;
            height: 500px;
            color: white;
        }

        .movie-info__change {
        	font-size: 20px;
            cursor: pointer;
            position: relative;
            top: -59%;
            left: 82%;
        }
        
        .movie-info__change svg {
    		fill: black; /* svg 요소에 색상을 적용 */
    		opacity: 0.7;
		}

        .movie-info__img {
        	position: relative;
            top: 0%;
            width: 230px;
            height: 300px;
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
            bottom: 50px;
            right: 50px;
        }

        a {
            color: white;
            text-decoration: none;
        }
    </style>
</head>

<!-- NCP사용을 위해 추가 -->
<c:set var="stpath" value="https://kr.object.ncloudstorage.com/bitcamp-kbh-37/duoproject"></c:set>
<body>
    <div class="main-body">
        <div class="main-container">
            <c:forEach var="moviedto" items="${list}">
                <div class="movie-info">
                	<div class="movie-info__img">
                        <img src="${stpath}/${moviedto.poster}" style="width:100%; height:100%;">
                    </div>
                    <div class="movie-info__change">
                        <a href="../movie/updateform?movienum=${moviedto.movienum}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-bookmark-plus-fill" viewBox="0 0 16 16">
  								<path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5m6.5-11a.5.5 0 0 0-1 0V6H6a.5.5 0 0 0 0 1h1.5v1.5a.5.5 0 0 0 1 0V7H10a.5.5 0 0 0 0-1H8.5z"/>
							</svg>
                        </a>
                    </div>
                    <div class="rating">
                        <span style="color:gold;">★</span>
                       	<span style="color:gray;">8.9(총 평점 계산)</span>
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
                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
                    </svg>
                </a>
            </div>
            
        </div>
    </div>
</body>
</html>