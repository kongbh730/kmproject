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
            align-items: flex-start;
            width: 100%;
            padding-bottom: 20px;
        }
        .movie-detail-footer-genre button {
            margin: 5px;
        }
        
#reviewform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#reviewform fieldset legend{
    text-align: right;
}
#reviewform input[type=radio]{
    display: none;
}
#reviewform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#reviewform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#content {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}

.movie-detail-review-button {
    border: none;
    background-color: #1A1A1A;
    color: white;
    font-size: 50px;
}
</style>
    <script>
        $(document).ready(function() {
            var genreString = "${moviedto.genre}";

            var genres = genreString.split(',');

            var container = $('#genre-buttons-container');

            genres.forEach(function(genre) {
                var button = $('<button></button>')
                    .text(genre.trim())
                    .addClass('btn btn-outline-secondary');
                container.append(button);
            });
        });
    </script>
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
                <div>
                    <button type="button" class="movie-detail-review-button" data-bs-toggle="modal" data-bs-target="#reviewModal">
                        <svg xmlns="http://www.w3.org/2000/svg" width="66" height="66" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                        <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"/>
                    </svg> 후기작성</button>
                </div>            
            </div>
        </div>
        <div class="movie-detail-body">
            <div class="movie-detail-body-media">
                <div class="movie-detail-body-poster">
                    <img src="${stpath}/${moviedto.poster}">
                </div>
                <div class="movie-detail-body-url">
                    <%-- ${moviedto.youtubeURL} --%>
                    <div style="display: flex; justify-content: center; align-items: center;">
						<!-- 예고편 자동재생 -->
						<iframe width="100%" height="410px"
							src="${moviedto.youtubeURL}?autoplay=1&mute=1"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
							referrerpolicy="strict-origin-when-cross-origin" allowfullscreen>
						</iframe>
					</div>
                </div>
            </div>
        </div>
        <div class="movie-detail-footer">
            <div class="movie-detail-footer-genre" id="genre-buttons-container">

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
    <input type="hidden" name="movienum" value="${reviewdto.movienum}">
    <input type="hidden" name="movietitle" value="${reviewdto.title}">

<h1>리뷰 나열 위치</h1>

</div> 
  <c:forEach var="review" items="${reviews}">
            <div class="review">
                <h3>${review.title}</h3>
                <p>${review.content}</p>
                <p><strong>Rating:</strong> ${review.rating}</p>
            </div>
        </c:forEach>
</div>

<!-- The Modal -->
<form action="./reviewinsert" class="review-input" name="reviewform" id="reviewform" method="post">

<input type="hidden" name="movienum" value="${moviedto.movienum}">
<input type="hidden" name="movietitle" value="${moviedto.title}">
<input type="hidden" name="email" value="${userdto.email}">

<div class="modal" id="reviewModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">REVIEW</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        <table>
        	<tr>
        		<td>
        			<span align="center"><h3>${moviedto.title}</h3></span>
        		</td>
        	</tr>
        	<tr>
        		<td>
					<textarea class="col-auto form-control" style="width:460px; height:200px;" type="text" name="content" id="content" placeholder="후기" required="required"></textarea>
					<span style="align: right">최대 1000자</span>
        		</td>
        	</tr>
        	<tr>
        		<td>
        			<link href="/assets/css/star.css" rel="stylesheet"/>
						<fieldset>
							<input type="radio" name="rating" value="5" id="rate1"><label for="rate1">★</label>
							<input type="radio" name="rating" value="4" id="rate2"><label for="rate2">★</label>
							<input type="radio" name="rating" value="3" id="rate3"><label for="rate3">★</label>
							<input type="radio" name="rating" value="2" id="rate4"><label for="rate4">★</label>
							<input type="radio" name="rating" value="1" id="rate5"><label for="rate5">★</label>
						</fieldset>
        		</td>
        	</tr>
        </table>
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="submit" class="btn btn-danger" data-bs-dismiss="modal">저장</button>
      </div>
    </div>
  </div>
</div>
</form>
</form>	
</body>
</html>