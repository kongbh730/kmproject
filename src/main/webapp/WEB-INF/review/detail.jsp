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
        body * {
            font-family: 'Jua';
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
</style>
</head>
<body>
<!-- The Modal -->
<form action="./reviewinsert" class="review-input" name="reviewform" id="reviewform" method="post">
<input type="hidden" name="movienum" value="${moviedto.movienum}">
<input type="hidden" name="movietitle" value="${moviedto.title}">
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
    
    <div>
    	<button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#reviewModal">후기작성</button>
    </div>
    
</body>
</html>