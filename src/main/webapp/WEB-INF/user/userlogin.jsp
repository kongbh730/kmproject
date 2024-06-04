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
            align-items: center;
            justify-content: space-evenly;
        }
        .main-body {
            background-color: black;
            display: flex;
            justify-content: center;
        }
        .login {
            width: 500px;
            height: 400px;
            padding: 1em;
        }
        .login h1 {
            color: white;
            font-size: 2.5em;
            text-align: center;
        }
        .login input[type="text"],
        .login input[type="password"] {
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
        .login button {
            width: 200px;
            border-radius: 16px;
            background: none;
            padding: 1em;
            border: 2px solid white;
            color: white;
            transition: 1s;
            margin: 5px 150px;
            cursor: pointer;
        }
        .login input[type="text"]:focus,
        .login input[type="password"]:focus {
            width: 350px;
            border-radius: 0px;
        }
        .login button:hover {
            background-color: white;
        }
    </style>
    <c:set var="root" value="<%=request.getContextPath()%>"/>
    <script type="text/javascript">
        $(function(){
            $("#loginfrm").submit(function(e){
                e.preventDefault();
                let fdata=$(this).serialize();
                //alert(fdata);
                $.ajax({
                    type:"get",
                    dataType:"json",
                    url:`${root}/user/login`,
                    data:fdata,
                    success:function(data){
                        if(data.status=='success'){
                            location.href=`${root}/movie/list`;
                        }else {
                            alert("아이디 또는 비밀번호가 맞지 않습니다");
                        }
                    }
                });
            });
            $("#alogout").click(function(){
                $.ajax({
                    type: "get",
                    dataType: "text",
                    url:`${root}/user/logout`,
                    success:function(){
                        location.href=`${root}/movie/list`;
                    }
                })
            })
        });//close function

    </script>
<body>
    <div class="main-body">
        <div class="main-container">
            <div class="randomposter" style="color: white">
                <img src=""
            </div>
            <div class="login">
                <h1>
                    <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="currentColor" class="bi bi-person-fill-lock" viewBox="0 0 16 16">
                        <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0m-9 8c0 1 1 1 1 1h5v-1a2 2 0 0 1 .01-.2 4.49 4.49 0 0 1 1.534-3.693Q8.844 9.002 8 9c-5 0-6 3-6 4m7 0a1 1 0 0 1 1-1v-1a2 2 0 1 1 4 0v1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-4a1 1 0 0 1-1-1zm3-3a1 1 0 0 0-1 1v1h2v-1a1 1 0 0 0-1-1"/>
                    </svg>
                </h1>
                <form id="loginfrm">
                    <input type="text" name="loginemail" placeholder="email">
                    <input type="password" name="pass" placeholder="password">
                    <button type="submit">Log In</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>