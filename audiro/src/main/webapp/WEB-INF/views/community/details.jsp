<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>커뮤니티</title>
<link href="../css/community.css" rel="stylesheet" />
<style>
.flex-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.image-hover {
    transition: transform 1.5s;
}

.image-hover:hover {
    transform: scale(2.0);
}
</style>
</head>
<body>
    <div class="container">
        <!-- **** row 클래스를 사용하여 두 섹션을 가로로 배치합니다. **** -->
        <div class="row">
            <!-- 사이드 메뉴 -->
            <!-- **** col-md-4와 col-lg-3 클래스를 사용하여 반응형 너비를 설정합니다. **** -->
            <div class="col-md-4 col-lg-3 mb-3">
                <div class="card mb-3">
                    <c:choose>
                        <c:when test="${p.postTypeId == 20}">
                            <h3 class="card-header"
                                style="background-color: #8baddc; text-align: center;">AUDIRO🤍COMMUNITY</h3>
                            <div class="card-body">
                                <h5 class="card-title m-1"
                                    style="text-align: center;">travel
                                    mate</h5>
                                <h6 class="card-subtitle text-muted p-2"
                                    style="text-align: center;">Looking
                                    for a travel mate!</h6>
                                <img
                                    style="display: block; margin: 0 auto; width: 100%;"
                                    src="../images/mate.png" alt="여행메이트">
                            </div>
                            <div class="card-body">
                                <p class="ps-3 pe-3"
                                    style="text-align: center;">
                                    “여행 계획 있으신가요? 어디로, 누구랑 뭐 하러 가고
                                    싶으세요?”<br />#친구
                                </p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <h3 class="card-header"
                                style="background-color: #f39ca2; text-align: center;">AUDIRO🖤COMMUNITY</h3>
                            <div class="card-body">
                                <h5 class="card-title m-1"
                                    style="text-align: center;">Free
                                    Board</h5>
                                <h6 class="card-subtitle text-muted p-2"
                                    style="text-align: center;">Feel
                                    free to write 😁</h6>
                                <img
                                    style="display: block; margin: 0 auto; width: 100%;"
                                    src="../images/free.png" alt="여행메이트">
                            </div>
                            <div class="card-body">
                                <p class="ps-3 pe-3"
                                    style="text-align: center;">"여행을
                                    즐기러 떠나요!"</p>
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">커뮤니티 메인</li>
                        <li class="list-group-item">여행 메이트</li>
                        <li class="list-group-item">자유 게시판</li>
                        <li class="list-group-item">글쓰기</li>
                    </ul>
                    <div class="card-body">
                        <a href="#" class="card-link p-2">#어디로 메인</a> <a
                            href="#" class="card-link p-2">#여행지 찾기</a> <br />
                        <a href="#" class="card-link p-2">#여행
                            계획&nbsp;&nbsp;&nbsp;</a> <a href="#"
                            class="card-link p-2">#여행 후기</a>
                    </div>
                    <div class="card-footer text-muted">검색기능</div>
                </div>
                <!-- 랭킹 시작 -->
                <c:choose>
                    <c:when test="${p.postTypeId == 20}">
                        <div class="card">
                            <div class="card-header m-1">
                                <h4 class="card-title"
                                    style="text-align: center;">Community
                                    Ranking</h4>
                            </div>
                            <div class="card-body">
                                <p style="text-align: center;">💗
                                    LIKE USER TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">닉네임</th>
                                            <th class="text-center">💘</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="like"
                                        items="${userLikeTop3List}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${like.rank == 1}">
                                                    <tr
                                                        class="table-info">
                                                        <td
                                                            class="text-center">&#129351;</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${like.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129352;</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129353;</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- post 순위 -->
                                <p class="mt-3 pt-2"
                                    style="text-align: center;">👍🏻
                                    POST TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">제목</th>
                                            <th class="text-center">👍🏻</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="pg"
                                        items="${postGoodTop3List}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${pg.rank == 1}">
                                                    <tr
                                                        class="table-info">
                                                        <td
                                                            class="text-center">&#129351;</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${pg.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129352;</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129353;</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- post 순위 끝 -->
                                <!-- comment 순위 -->
                                <p class="mt-3 pt-2"
                                    style="text-align: center;">💬
                                    COMMENT TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">닉네임</th>
                                            <th class="text-center">👍🏻</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="cu"
                                        items="${commentsUserTop3}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${cu.rank == 1}">
                                                    <tr
                                                        class="table-info">
                                                        <td
                                                            class="text-center">&#129351;</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${cu.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129352;</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129353;</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- comment 순위 끝-->
                            </div>
                        </div>
                        <!-- 랭킹 끝 -->
                    </c:when>
                    <c:otherwise>
                        <div class="card">
                            <div class="card-header m-1">
                                <h4 class="card-title"
                                    style="text-align: center;">Community
                                    Ranking</h4>
                            </div>
                            <div class="card-body">
                                <p style="text-align: center;">💗
                                    LIKE USER TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">닉네임</th>
                                            <th class="text-center">💘</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="like"
                                        items="${userLikeTop3List}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${like.rank == 1}">
                                                    <tr
                                                        class="table-danger">
                                                        <td
                                                            class="text-center">&#129351;</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${like.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129352;</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129353;</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- post 순위 -->
                                <p class="mt-3 pt-2"
                                    style="text-align: center;">👍🏻
                                    POST TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">제목</th>
                                            <th class="text-center">👍🏻</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="pg"
                                        items="${postGoodTop3List}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${pg.rank == 1}">
                                                    <tr
                                                        class="table-danger">
                                                        <td
                                                            class="text-center">&#129351;</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${pg.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129352;</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129353;</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- post 순위 끝 -->
                                <!-- comment 순위 -->
                                <p class="mt-3 pt-2"
                                    style="text-align: center;">💬
                                    COMMENT TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">닉네임</th>
                                            <th class="text-center">👍🏻</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="cu"
                                        items="${commentsUserTop3}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${cu.rank == 1}">
                                                    <tr
                                                        class="table-danger">
                                                        <td
                                                            class="text-center">&#129351;</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${cu.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129352;</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129353;</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- comment 순위 끝-->
                            </div>
                        </div>
                        <!-- 랭킹 끝 -->
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- 상세보기 -->
            <!-- **** col-md-8와 col-lg-9 클래스를 사용하여 반응형 너비를 설정합니다. **** -->
            <div class="col-md-8 col-lg-9">
                <main>
                    <div class="card border-light mb-3">
                        <div class="card-header">
                            <!-- 글 타입 시작-->
                            <c:choose>
                                <c:when test="${p.postTypeId == 20}">
                                    <p class="mt-3 ms-2">
                                        🌳 <span
                                            class="text-body-secondary">여행
                                            메이트 구해요</span>
                                    </p>
                                </c:when>
                                <c:otherwise>
                                    <p class="mt-3 ms-2">
                                        🍭 <span
                                            class="text-body-secondary">자유
                                            게시판</span>
                                    </p>
                                </c:otherwise>
                            </c:choose>
                            <!-- 글 타입 끝 -->
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="mt-4 py-2"
                                    style="border-bottom: 1px solid grey;">
                                    <p
                                        style="font-size: 220%; text-align: center;">${p.title}</p>
                                    <div class="flex-container">
                                        <p class="m-2 p-2"
                                            style="font-size: 105%;">${p.nickname}</p>
                                        <p class="m-2 p-2 mt-3 me-3"
                                            style="color: grey; font-size: 90%;">작성
                                            시간 : ${p.createdTime}</p>
                                    </div>
                                </div>
                                <div class="container mt-3 m-4 p-5">
                                    <div>
                                        <p>${p.content}</p>
                                    </div>
                                </div>
                                <div class="mt-2 mb-1">
                                    <p class="me-4"
                                        style="color: grey; font-size: 90%; text-align: right;">수정
                                        시간 : ${p.createdTime}</p>
                                </div>
                            </form>
                        </div>

                        <div class="card-footer">
                            <div class="container">
                                <img class="image-hover" alt="good1"
                                    src="../images/good1.png"
                                    style="width: 5%;">
                            </div>
                            <c:url var="postModifyPage"
                                value="/post/modify">
                                <c:param name="id" value="${p.postId}" />
                            </c:url>
                            <a class="btn btn-outline-primary"
                                href="${postModifyPage}">수정하기</a>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </div>
    <!-- 부트스트랩 js라이브러리 -->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <!-- 우리가 만드는 js파일 앞에 두어야 함 순서중요! -->
    <!-- Axio JS 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <!-- 우리가 만드는 js파일 -->
    <!-- <c:url var="commentsJS" value="/js/comments.js" /> -->
    <!-- <script src="${commentsJS}"></script> -->
</body>
</html>
