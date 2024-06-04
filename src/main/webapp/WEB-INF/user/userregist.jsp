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
        .regist {
            position: absolute;
            width: 500px;
            height: 400px;
            left: 50%;
            top: 40%;
            transform: translate(-50%, -50%);
            padding: 1em;
        }

        .regist h1 {
            text-align: center;
        }

        #showimg {
            width: 100px;
            height: 100px;
            border-radius: 50px;
        }

        .regist input[type="text"],
        .regist input[type="password"],
        .regist input[type="file"]{
            background: none;
            outline: none;
            padding: 10px 14px;
            width: 300px;
            display: block;
            margin: 50px auto;
            color: white;
            border: none;
            border-bottom: 2px solid white;
            border-radius: 3px;
            transition: 0.5s;
        }


        .regist button {
            width: 200px;
            border-radius: 16px;
            background: none;
            padding: 1em;
            border: 2px solid white;
            color: white;
            transition: 1s;
            margin: 5px 134px;
            cursor: pointer;

        }

        .regist input[type="text"]:focus,
        .regist input[type="password"]:focus{
            width: 350px;
            border-radius: 0px;
        }

        .regist button:hover {
            background-color: white;
            color: black;
        }
        .radio-tile-group {
            display: flex;
            justify-content: center;
            margin: 0 auto;

            .input-container {
                position: relative;
                height:  80px;
                width:  80px;
                margin: 30px;

                .radio-button {
                    opacity: 0;
                    position: absolute;
                    top: 0;
                    left: 0;
                    height: 100%;
                    width: 100%;
                    margin: 0;
                    cursor: pointer;
                }

                .radio-tile {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                    width: 100%;
                    height: 100%;
                    border: 2px solid white;
                    border-radius: 5px;
                    padding: 20px;
                    transition: transform 300ms ease;
                }

                .radio-tile .icon {
                    margin-bottom: 20px;
                    font-size: 25px;
                    color: white;
                }
                .radio-tile-label {
                    text-align: center;
                    text-transform: uppercase;
                    color: white;
                }

                .radio-button:checked + .radio-tile {
                    background-color: white;
                    border: 2px solid white;
                    color: white;
                    transform: scale(1.2, 1.2);

                    .radio-tile-label {
                        color: black;
                        background-color: white;
                    }

                    i {
                        color: black;
                    }
                }
            }
        }
    </style>
    <script>
        $(function(){
            $("#upload").change(function(){
                //console.log($(this)[0]);//type 이 file 인경우 배열타입으로 넘어온다
                let reg=/(.*?)\/(jpg|jpeg|png|gif)$/;
                let f=$(this)[0].files[0];
                if(!f.type.match(reg)){
                    alert("이미지 파일만 가능합니다");
                    return;
                }
                if(f){
                    let reader=new FileReader();
                    reader.onload=function(e){
                        $("#showimg").attr("src",e.target.result);
                    }
                    reader.readAsDataURL($(this)[0].files[0]);
                }
            });
        });
    </script>
<body>
<div class="main-body">
    <div class="main-container">
        <div class="regist">
            <h1>
                <img src="" id="showimg"
                onerror="this.src='../image/noimage2.png'">
            </h1>
            <form action="./insert" method="post" enctype="multipart/form-data">
                <input type="text" placeholder="email">
                <input type="password" placeholder="password">
                <input type="text"
                required="required" pattern="[0-9]{4}-[1-12]{2}-[1-31]{2}"
                placeholder="xxxx년-xx월-xx일">
                <input type="file" name="upload" id="upload" class="form-control">
                <div class="container">
                    <div class="radio-tile-group">

                        <div class="input-container">
                            <input id="male" class="radio-button" type="radio" name="gender" />
                            <div class="radio-tile">
                                <div class="icon">
                                    <i class="bi bi-gender-male"></i>
                                </div>
                                <label for="male" class="radio-tile-label">male</label>
                            </div>
                        </div>

                        <div class="input-container">
                            <input id="female" class="radio-button" type="radio" name="gender" />
                            <div class="radio-tile">
                                <div class="icon">
                                    <i class="bi bi-gender-female"></i>
                                </div>
                                <label for="female" class="radio-tile-label">female</label>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit">Sign Up</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>