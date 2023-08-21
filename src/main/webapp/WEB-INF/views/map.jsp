<%@ page contentType="text/html;charset=utf-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!DOCTYPE html>

    <html lang="ko">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>BHS.COM</title>
      <link
        href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
        rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500;700&display=swap" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@300;400&display=swap" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="/css/index.css" />
      <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ob7vum39z8&submodules=geocoder"></script>
    </head>

    <link rel="stylesheet" type="text/css" href="/css/nav.css" />

    <nav class="nav-main">
      <header class="nav-header" id="header">
        <h1 class="nav-header-heading">
          <a href="/" title="메인 화면"><img src="/css/imgs/main_logo.png" class="nav-image"></a>
        </h1>

      </header>
      <ul class="nav-menu">
        <li class="nav-menu-item">
          <a href="/introduce.do" class="menu-heading">ABOUT BHS</a>
        </li>
        <li class="nav-menu-item">
          <a href="/board/list.do" class="menu-heading">게시판</a>
        </li>
        <li class="nav-menu-item">
          <a href="#" class="menu-heading">지도</a>
        </li>
      </ul>
    </nav>


    <body style="margin:0">
      <main class="index-main">
        <div id="map" style="width:100%;height:80%;"></div>
        <div id="diner-data" style="display: none;">
          <c:forEach items="${list}" var="diner">
            <div class="diner-row">
              <div class="diner-seq">${diner.seq}</div>
              <div class="diner-category">${diner.category}</div>
              <div class="diner-name">${diner.name}</div>
              <div class="diner-location">${diner.location}</div>
            </div>
          </c:forEach>
        </div>
        <script src="/js/map.js"></script>
      </main>
    </body>

    <link rel="stylesheet" type="text/css" href="/css/footer.css" />

    <footer class="footer-main">
      <ul class="footer-corp">
        <li><a href="#">홈페이지 이용약관 및 개인정보 처리방침</a></li>
      </ul>
      <ul class="footer-info">
        <li><a href="#">찾아오시는 길</a></li>
        <li><a href="#">계열사</a></li>
      </ul>
      <address class="footer-address">
        <span>사업자등록번호 : 123-45-67890</span>
        <span>(주)BHS COMPANY 대표 : 솔서ㄴ수범</span>
        <span>TEL : 1234-1234</span>
        <span>개인정보 책임자 : 배솔반</span>
      </address>
      <small class="footer-copyringt">&copy; BHS Company. All Rights Reserved.</small>
    </footer>

    </html>