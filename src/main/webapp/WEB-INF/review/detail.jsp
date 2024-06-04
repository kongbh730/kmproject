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
        .later {
            padding: 500px;
        }
        .main-body {
            background-color: #1A1A1A;
            display: flex;
            flex-direction: column;
            align-items: center;
            /*justify-content: center;*/
            height: 1000px;
        }
        .review-body {
            background-color: white;
            display: flex;
            height: 1000px;
        }
        .main-container {
            margin-top: 48px;
            width: 1280px;
            height: 100vh;
            background-color: #1A1A1A;
            color: white;
            text-align: center;
        }
        .main-body__inline {
            background-color: black;
            display: flex;
            height: 32px;
            width: 100%;
        }
        .movie-detail-header {
            display: flex;
            justify-content: space-between;
            padding: 0 24px;
            height: 100px;
        }
        .movie-detail-header-container {
            width: 500px;
            height: 60px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        .movie-detail-header-title {
            font-size: 48px;
            display: inline-block;
        }
        .movie-detail-header-publish {
            font-size: 14px;
            opacity: 0.7;
        }
        .movie-detail-body-media {
            width: 100%;
            height: 430px;
            padding: 0 24px;
            display: flex;
        }
        .movie-detail-body-poster img {
            width: 300px;
            height: 414px;
        }
        .movie-detail-body-url {
            width: 980px;
            height: 414px;
        }
        .movie-detail-footer {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 0 24px;
            width: 800px;
            height: 300px;
        }
        .movie-detail-footer-people {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            width: 100%;
        }
        .movie-detail-footer-actor {
            border-top: 1px solid;
            border-bottom: 1px solid;
            border-color: rgba(255,255,255,0.2);
            padding: 16px 0;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        .movie-detail-footer-director {
            border-bottom: 1px solid;
            border-color: rgba(255,255,255,0.2);
            padding: 16px 0;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        .movie-detail-footer-genre {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            width: 100%;
            padding-bottom: 20px;
        }
    </style>
</head>
<c:set var="stpath" value="https://kr.object.ncloudstorage.com/bitcamp-kbh-37/duoproject"></c:set>
<body>
<div class="main-body">
    <div class="main-body__inline">
    </div>
    <div class="main-container">
        <div class="movie-detail-header">
            <div class="movie-detail-header-container">
                <div class="movie-detail-header-title">
                    ${moviedto.title}
                </div>
                <div class="movie-detail-header-publish">
                    ${moviedto.publishyear}
                </div>
            </div>
            <div class="movie-detail-review">
                후기작성
            </div>
        </div>
        <div class="movie-detail-body">
            <div class="movie-detail-body-media">
                <div class="movie-detail-body-poster">
                    <img src="${stpath}/${moviedto.poster}">
                </div>
                <div class="movie-detail-body-url">
                    ${moviedto.youtubeURL}
                </div>
            </div>
        </div>
        <div class="movie-detail-footer">
            <div class="movie-detail-footer-genre">
                ${moviedto.genre}
            </div>
            <div class="movie-detail-footer-people">
                <div class="movie-detail-footer-actor">
                    영화 감독 : ${moviedto.director}
                </div>
                <div class="movie-detail-footer-director">
                    배우 : ${moviedto.actor}
                </div>
            </div>
        </div>
    </div>
</div>
<div class="review-body">

</div>
</body>
</html>