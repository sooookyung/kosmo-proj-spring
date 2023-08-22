<%@ page contentType="text/html;charset=utf-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!DOCTYPE html>

    <html lang="ko">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>BHS.COM</title>
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">
      <link
        href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
        rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500;700&display=swap" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@300;400&display=swap" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Barriecito&family=Luckiest+Guy&display=swap"
        rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="/css/index.css" />
      <link rel="stylesheet" href="/css/bootstrap.css">
      <script src="/js/bootstrap.js"></script>
    </head>

    <link rel="stylesheet" type="text/css" href="/css/nav.css" />

    <nav class="nav-main">
      <header class="nav-header" id="header">
        <h1 class="nav-header-heading">
          <a href="/" title="메인 화면"><img src="/css/imgs/main_logo.png" class="nav-image"></a>
        </h1>
        <div class="nav-sign">
          <ul class="nav-sign nav-sign-list">

            <c:choose>
              <c:when test="${empty nickname}">
                <button id="login_button">LOGIN</button>
                <button onclick="location.href='/join.do'">SIGN UP</button>
              </c:when>
              <c:otherwise>
                <button id="logout_button" onclick="location.href='/logout.do'">LOGOUT</button>
              </c:otherwise>
            </c:choose>


            <html lang="ko">

            <head>
              <meta charset="UTF-8">
              <title>Tropical Night Litchi-Root : login</title>
              <link rel="stylesheet" type="text/css" href="/css/login_join.css">
              <script src="/js/trim.js"></script>
              <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
              <script>
                function check_login() {
                  var loginEmailFoc = document.getElementById('login-email');
                  var loginEmailVal = loginEmailFoc.value;

                  if (loginEmailVal.length == 0) {
                    alert("Email을 입력해 주세요");
                    loginEmailFoc.focus();
                    return false;
                  } else if (!CheckEmail(loginEmailVal)) {
                    alert('Email 형식을 맞춰주세요 ex)"--@--.--"');
                    loginEmailFoc.focus();
                    return false;
                  } else if (check_login_pwd()) {
                    lf.submit();
                  }
                }

                // 비밀번호 체크(retrurn boolean)
                function check_login_pwd() {
                  var loginPwdFoc = document.getElementById('login-pwd');
                  var loginPwdVal = loginPwdFoc.value;

                  if (loginPwdVal.length == 0) {
                    alert("Password를 입력해 주세요");
                    loginPwdFoc.focus();
                    return false;
                  } else {
                    return true;
                  }
                }

                // 이메일 형식 체크 기능
                function CheckEmail(str) {
                  var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
                  if (!reg_email.test(str)) {
                    return false;
                  } else {
                    return true;
                  }
                }
              </script>
            </head>

            <!--로그인 팝업창 레이어-->

            <body>
              <div class="login-body">
                <div class="login-content">
                  <span class="login-close-button">&times;</span>
                  <div class="login-header">
                    <img src="/css/imgs/main_logo.png" class="image-login">
                  </div>
                  <p></p>
                  <form name="lf" action="/login.do" method="post">
                    <input type="hidden" name="csrfmiddlewaretoken"
                      value="RWqB2slcMopejijsEhpp9b0BvchuFb4WzNOsRhNlp4GizXD2SRLQghbwa6FQ4azq">
                    <label class="login-label" for="email">EMAIL</label>
                    <input class="login-input" type="email" id="login-email" name="login-email" title="이메일"
                      placeholder="이메일을 입력하세요" required="required">
                    <label class="login-label"></label>
                    <label class="login-label" for="password">PASSWORD</label>
                    <input class="login-input" type="password" id="login-pwd" name="login-pwd" title="비밀번호"
                      placeholder="비밀번호를 입력하세요" required="required" maxlength='12'>
                    <div class="login-btn-group">
                      <input class="login_submit" type="button" id="login-submit" value="로그인" onclick="check_login()">
                      <input class="login_cancel" type="button" id="login-cancel" value="취소"
                        onclick="javascript:history.go(0)" />
                    </div>
                  </form>
                </div>
              </div>
            </body>
            <script type="text/javascript">
              // <![CDATA[
              var sparks = 75; // how many sparks per clicksplosion
              var speed = 33; // how fast - smaller is faster
              var bangs = 5; // how many can be launched simultaneously (note that using too many can slow the script down)
              var colours = new Array('#03f', '#f03', '#0e0', '#93f', '#0cf', '#f93', '#f0c');
              //                     blue    red     green   purple  cyan    orange  pink

              /****************************
              *   Clicksplosion Effect    *
              *(c)2012-3 mf2fm web-design *
              *  http://www.mf2fm.com/rv  *
              * DON'T EDIT BELOW THIS BOX *
              ****************************/
              var intensity = new Array();
              var Xpos = new Array();
              var Ypos = new Array();
              var dX = new Array();
              var dY = new Array();
              var stars = new Array();
              var decay = new Array();
              var timers = new Array();
              var swide = 800;
              var shigh = 600;
              var sleft = sdown = 0;
              var count = 0;

              function addLoadEvent(funky) {
                var oldonload = window.onload;
                if (typeof (oldonload) != 'function') window.onload = funky;
                else window.onload = function () {
                  if (oldonload) oldonload();
                  funky();
                }
              }

              addLoadEvent(clicksplode);

              function clicksplode() {
                if (document.getElementById) {
                  var i, j;
                  window.onscroll = set_scroll;
                  window.onresize = set_width;
                  document.onclick = eksplode;
                  set_width();
                  set_scroll();
                  for (i = 0; i < bangs; i++) for (j = sparks * i; j < sparks + sparks * i; j++) {
                    stars[j] = createDiv('*', 13);
                    document.body.appendChild(stars[j]);
                  }
                }
              }

              function createDiv(char, size) {
                var div, sty;
                div = document.createElement('div');
                sty = div.style;
                sty.font = size + 'px monospace';
                sty.position = 'absolute';
                sty.backgroundColor = 'transparent';
                sty.visibility = 'hidden';
                sty.zIndex = '101';
                div.appendChild(document.createTextNode(char));
                return (div);
              }

              function bang(N) {
                var i, Z, A = 0;
                for (i = sparks * N; i < sparks * (N + 1); i++) {
                  if (decay[i]) {
                    Z = stars[i].style;
                    Xpos[i] += dX[i];
                    Ypos[i] += (dY[i] += 1.25 / intensity[N]);
                    if (Xpos[i] >= swide || Xpos[i] < 0 || Ypos[i] >= shigh + sdown || Ypos[i] < 0) decay[i] = 1;
                    else {
                      Z.left = Xpos[i] + 'px';
                      Z.top = Ypos[i] + 'px';
                    }
                    if (decay[i] == 15) Z.fontSize = '7px';
                    else if (decay[i] == 7) Z.fontSize = '2px';
                    else if (decay[i] == 1) Z.visibility = 'hidden';
                    decay[i]--;
                  }
                  else A++;
                }
                if (A != sparks) timers[N] = setTimeout('bang(' + N + ')', speed);
              }

              function eksplode(e) {
                var x, y, i, M, Z, N;
                set_scroll();
                y = (e) ? e.pageY : event.y + sdown;
                x = (e) ? e.pageX : event.x + sleft;
                N = ++count % bangs;
                M = Math.floor(Math.random() * 3 * colours.length);
                intensity[N] = 5 + Math.random() * 4;
                for (i = N * sparks; i < (N + 1) * sparks; i++) {
                  Xpos[i] = x;
                  Ypos[i] = y - 5;
                  dY[i] = (Math.random() - 0.5) * intensity[N];
                  dX[i] = (Math.random() - 0.5) * (intensity[N] - Math.abs(dY[i])) * 1.25;
                  decay[i] = 16 + Math.floor(Math.random() * 16);
                  Z = stars[i].style;
                  if (M < colours.length) Z.color = colours[i % 2 ? count % colours.length : M];
                  else if (M < 2 * colours.length) Z.color = colours[count % colours.length];
                  else Z.color = colours[i % colours.length];
                  Z.fontSize = '13px';
                  Z.visibility = 'visible';
                }
                clearTimeout(timers[N]);
                bang(N);
              }

              function set_width() {
                var sw_min = 999999;
                var sh_min = 999999;
                if (document.documentElement && document.documentElement.clientWidth) {
                  if (document.documentElement.clientWidth > 0) sw_min = document.documentElement.clientWidth;
                  if (document.documentElement.clientHeight > 0) sh_min = document.documentElement.clientHeight;
                }
                if (typeof (self.innerWidth) == 'number' && self.innerWidth) {
                  if (self.innerWidth > 0 && self.innerWidth < sw_min) sw_min = self.innerWidth;
                  if (self.innerHeight > 0 && self.innerHeight < sh_min) sh_min = self.innerHeight;
                }
                if (document.body.clientWidth) {
                  if (document.body.clientWidth > 0 && document.body.clientWidth < sw_min) sw_min = document.body.clientWidth;
                  if (document.body.clientHeight > 0 && document.body.clientHeight < sh_min) sh_min = document.body.clientHeight;
                }
                if (sw_min == 999999 || sh_min == 999999) {
                  sw_min = 800;
                  sh_min = 600;
                }
                swide = sw_min - 7;
                shigh = sh_min - 7;
              }

              function set_scroll() {
                if (typeof (self.pageYOffset) == 'number') {
                  sdown = self.pageYOffset;
                  sleft = self.pageXOffset;
                }
                else if (document.body && (document.body.scrollTop || document.body.scrollLeft)) {
                  sdown = document.body.scrollTop;
                  sleft = document.body.scrollLeft;
                }
                else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
                  sleft = document.documentElement.scrollLeft;
                  sdown = document.documentElement.scrollTop;
                }
                else {
                  sdown = 0;
                  sleft = 0;
                }
              }
              // ]]>
            </script>
            <script type="text/javascript">
              let loginButton = document.querySelector("#login_button");
              var godal = document.querySelector(".login-body");
              var closeButton = document.querySelector(".login-close-button");
              var cancelButton = document.querySelector("#login-cancel");

              function togglegodal() {
                godal.classList.toggle("show-login");
                console.log(1);
              }

              function windowOnClick(event) {
                if (event.target === godal) {
                  togglegodal();
                }
              }
              $(document).keyup(function (event) {
                var loginEmailFoc = document.getElementById('login-email');
                var loginEmailVal = loginEmailFoc.value;
                if (event.which === 13) {
                  if (loginEmailVal.length != 0) {
                    check_login();
                  }
                }
              });
              loginButton.addEventListener("click", togglegodal);
              closeButton.addEventListener("click", togglegodal);
              cancelButton.addEventListener("click", togglegodal);
              window.addEventListener("click", windowOnClick); 
            </script>
          </ul>
        </div>
        <script>
          function checkLoginThenGo(url) {
            if ("${empty email}" === "false") {
              location.href = url;
            } else {
              togglegodal();
            }
          }

        </script>
      </header>
      <ul class="nav-menu">
        <li class="nav-menu-item">
          <a href="/introduce.do" class="menu-heading">ABOUT BHS</a>
        </li>
        <li class="nav-menu-item">
          <a onclick="checkLoginThenGo('/board/list.do')" class="menu-heading">게시판</a>
        </li>
        <li class="nav-menu-item">
          <a onclick="checkLoginThenGo('/map.do')" class="menu-heading">지도</a>
        </li>
      </ul>
    </nav>


    <body style="margin:0">
      <main class="index-main">
        <style>
          * {
            box-sizing: border-box;
          }

          body {
            font-family: Verdana, sans-serif;
          }

          .mySlides {
            display: none;
          }

          img {
            vertical-align: middle;
          }

          /* Slideshow container */
          .slideshow-container {
            max-width: 1000px;
            position: relative;
            margin: auto;
          }

          /* Caption text */
          .text {
            color: #f2f2f2;
            font-size: 15px;
            padding: 8px 12px;
            position: absolute;
            bottom: 8px;
            width: 100%;
            text-align: center;
          }

          /* Number text (1/3 etc) */
          .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
          }

          /* The dots/bullets/indicators */
          .dot {
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
          }

          .active {
            background-color: #717171;
          }

          /* Fading animation */
          .fade {
            animation-name: fade;
            animation-duration: 1.5s;
          }

          @keyframes fade {
            from {
              opacity: .4
            }

            to {
              opacity: 1
            }
          }

          /* On smaller screens, decrease text size */
          @media only screen and (max-width: 300px) {
            .text {
              font-size: 11px
            }
          }

          .introduce_bhs span {
            font-family: 'Jua', sans-serif;
          }

          .introduce_bhs p {
            color: white;
            font-family: 'Barriecito', cursive;
            font-family: 'Luckiest Guy', cursive;
            font-size: 50px;
            letter-spacing: 3px;

          }
        </style>

        <div class="introduce_bhs">
          <div style="vertical-align: middle;">

            <p style="position: relative; z-index: 1; text-align : center">
              INTRODUCE BHS
            </p>

            <div style="text-align : center;">
              <button class="btn" id="login_button" data-bs-toggle="modal" data-bs-target="#exampleModal"><img
                  src="/css/imgs/bhs_introduce3.png"></button>
              <div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h1 class="modal-title fs-5" id="exampleModalLabel">배솔반</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                      모두가 행복한 세상이 왔으면 좋겠습니다.
                    </div>
                  </div>
                </div>
              </div>
              <span style="vertical-align:middle;font-size:100px;">B</span>
            </div>


            <div style="text-align : center;">
              <button class="btn" id="login_button" data-bs-toggle="modal" data-bs-target="#exampleModal3"><img
                  src="/css/imgs/bhs_introduce.png"></button>
              <div class="modal" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h1 class="modal-title fs-5" id="exampleModalLabel3">홍수경</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      NO PAIN NO GAIN.
                    </div>
                  </div>
                </div>
              </div>
              <span style="vertical-align:middle;font-size:100px;">H</span>
            </div>

            <div style="text-align : center;">
              <button class="btn" id="login_button" data-bs-toggle="modal" data-bs-target="#exampleModal2"><img
                  src="/css/imgs/bhs_introduce2.png"></button>
              <div class="modal" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h1 class="modal-title fs-5" id="exampleModalLabel2">서상록</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      인생은 한방이다.
                    </div>
                  </div>
                </div>
              </div>
              <span style="vertical-align:middle;font-size:100px;">S</span>
            </div>


          </div>
        </div>


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