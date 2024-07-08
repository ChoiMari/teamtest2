<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>회원 가입</title>
<c:url var="css" value="/css/home.css" />
<link href="${css}" rel="stylesheet">
</head>
<body>
    <div class="container">
        <c:set var="pageTitle" value="회원가입" />
        <%@ include file="../fragments/header.jspf" %>
        <%@ include file="../fragments/header2.jspf" %>
        <main>
        <div class="card mt-5">
            <div class="card card-header">
                <h2 style="text-align: center;">회원가입</h2>
            </div>
            <div class="my-2 card card-body">
                <c:url var="signUpPage" value="/user/signup" />
                <form action="${signUpPage}" method="post">
                    <div class="my-2">
                        <input type="text" class="form-control" id="id"
                            name="id" placeholder="사용자 아이디" required autofocus />
                    </div>
                    
                    <!-- id 중복 체크 결과 표시할 영역 -->
                    <div id="checkIdResult"></div>
                    
                    <div class="my-2">
                        <input type="password" class="form-control" id="passwordHash"
                            name="passwordHash" placeholder="비밀번호" required />
                    </div>
                    <div class="my-2">
                        <input type="text" class="form-control" id="userName"
                            name="userName" placeholder="이름" required />
                    </div>   
                    <div class="my-2">
                        <input type="text" class="form-control" id="nickname"
                            name="nickname" placeholder="닉네임" required />
                    </div> 
                    <div class="my-2">
                        <input type="text" class="form-control" id="phone"
                            name="phone" placeholder="전화번호" required />
                    </div>                
                    <div class="my-2">
                        <input type="email" class="form-control" id="email"
                            name="email" placeholder="이메일" required />
                    </div>
                    
                    <div class="my-2">
                        <button id="btnSignUp"
                            class="form-control btn btn-outline-success disabled">작성 완료</button>
                    </div>
                </form>
            </div>
            </div>
        </main>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
    
    <!-- Axio JS 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    
    <!-- 우리가 만드는 JS 파일 -->
    <c:url var="userSignUpJS" value="/js/user_signup.js" />
    <script src="${userSignUpJS}"></script>
</body>
</html>
