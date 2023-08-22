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
              <script type="text/javascript">
                // <![CDATA[
                var colour = "random"; // in addition to "random" can be set to any valid colour eg "#f0f" or "red"
                var sparkles = 50;

                /****************************
                *  Tinkerbell Magic Sparkle *
                *(c)2005-13 mf2fm web-design*
                *  http://www.mf2fm.com/rv  *
                * DON'T EDIT BELOW THIS BOX *
                ****************************/
                var x = ox = 400;
                var y = oy = 300;
                var swide = 800;
                var shigh = 600;
                var sleft = sdown = 0;
                var tiny = new Array();
                var star = new Array();
                var starv = new Array();
                var starx = new Array();
                var stary = new Array();
                var tinyx = new Array();
                var tinyy = new Array();
                var tinyv = new Array();

                window.onload = function () {
                  if (document.getElementById) {
                    var i, rats, rlef, rdow;
                    for (var i = 0; i < sparkles; i++) {
                      var rats = createDiv(3, 3);
                      rats.style.visibility = "hidden";
                      rats.style.zIndex = "999";
                      document.body.appendChild(tiny[i] = rats);
                      starv[i] = 0;
                      tinyv[i] = 0;
                      var rats = createDiv(5, 5);
                      rats.style.backgroundColor = "transparent";
                      rats.style.visibility = "hidden";
                      rats.style.zIndex = "999";
                      var rlef = createDiv(1, 5);
                      var rdow = createDiv(5, 1);
                      rats.appendChild(rlef);
                      rats.appendChild(rdow);
                      rlef.style.top = "2px";
                      rlef.style.left = "0px";
                      rdow.style.top = "0px";
                      rdow.style.left = "2px";
                      document.body.appendChild(star[i] = rats);
                    }
                    set_width();
                    sparkle();
                  }
                }

                function sparkle() {
                  var c;
                  if (Math.abs(x - ox) > 1 || Math.abs(y - oy) > 1) {
                    ox = x;
                    oy = y;
                    for (c = 0; c < sparkles; c++) if (!starv[c]) {
                      star[c].style.left = (starx[c] = x) + "px";
                      star[c].style.top = (stary[c] = y + 1) + "px";
                      star[c].style.clip = "rect(0px, 5px, 5px, 0px)";
                      star[c].childNodes[0].style.backgroundColor = star[c].childNodes[1].style.backgroundColor = (colour == "random") ? newColour() : colour;
                      star[c].style.visibility = "visible";
                      starv[c] = 50;
                      break;
                    }
                  }
                  for (c = 0; c < sparkles; c++) {
                    if (starv[c]) update_star(c);
                    if (tinyv[c]) update_tiny(c);
                  }
                  setTimeout("sparkle()", 40);
                }

                function update_star(i) {
                  if (--starv[i] == 25) star[i].style.clip = "rect(1px, 4px, 4px, 1px)";
                  if (starv[i]) {
                    stary[i] += 1 + Math.random() * 3;
                    starx[i] += (i % 5 - 2) / 5;
                    if (stary[i] < shigh + sdown) {
                      star[i].style.top = stary[i] + "px";
                      star[i].style.left = starx[i] + "px";
                    }
                    else {
                      star[i].style.visibility = "hidden";
                      starv[i] = 0;
                      return;
                    }
                  }
                  else {
                    tinyv[i] = 50;
                    tiny[i].style.top = (tinyy[i] = stary[i]) + "px";
                    tiny[i].style.left = (tinyx[i] = starx[i]) + "px";
                    tiny[i].style.width = "2px";
                    tiny[i].style.height = "2px";
                    tiny[i].style.backgroundColor = star[i].childNodes[0].style.backgroundColor;
                    star[i].style.visibility = "hidden";
                    tiny[i].style.visibility = "visible"
                  }
                }

                function update_tiny(i) {
                  if (--tinyv[i] == 25) {
                    tiny[i].style.width = "1px";
                    tiny[i].style.height = "1px";
                  }
                  if (tinyv[i]) {
                    tinyy[i] += 1 + Math.random() * 3;
                    tinyx[i] += (i % 5 - 2) / 5;
                    if (tinyy[i] < shigh + sdown) {
                      tiny[i].style.top = tinyy[i] + "px";
                      tiny[i].style.left = tinyx[i] + "px";
                    }
                    else {
                      tiny[i].style.visibility = "hidden";
                      tinyv[i] = 0;
                      return;
                    }
                  }
                  else tiny[i].style.visibility = "hidden";
                }

                document.onmousemove = mouse;
                function mouse(e) {
                  if (e) {
                    y = e.pageY;
                    x = e.pageX;
                  }
                  else {
                    set_scroll();
                    y = event.y + sdown;
                    x = event.x + sleft;
                  }
                }

                window.onscroll = set_scroll;
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

                window.onresize = set_width;
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
                  swide = sw_min;
                  shigh = sh_min;
                }

                function createDiv(height, width) {
                  var div = document.createElement("div");
                  div.style.position = "absolute";
                  div.style.height = height + "px";
                  div.style.width = width + "px";
                  div.style.overflow = "hidden";
                  return (div);
                }

                function newColour() {
                  var c = new Array();
                  c[0] = 255;
                  c[1] = Math.floor(Math.random() * 256);
                  c[2] = Math.floor(Math.random() * (256 - c[1] / 2));
                  c.sort(function () { return (0.5 - Math.random()); });
                  return ("rgb(" + c[0] + ", " + c[1] + ", " + c[2] + ")");
                }
                // ]]>
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
              let loginButton = document.querySelector("#login_button");
              var godal = document.querySelector(".login-body");
              var closeButton = document.querySelector(".login-close-button");
              var cancelButton = document.querySelector("#login-cancel");

              function checkLoginThenGo(url) {
                if ("${empty email}" === "false") {
                  location.href = url;
                } else {
                  togglegodal();
                }
              }

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
        </style>
        <div class="slideshow-container">
          <div class="index-title">
            <p style="position:relative; right:150px;">
              <span>FOOD</span>
              THAT<br>
              TELLS
              A <span>STORY</span>
            </p>

            <div class="mySlides fade">
              <img src="css/imgs/bhs_main_img3.png" style="width:100%">
            </div>

            <div class="mySlides fade">
              <img src="css/imgs/bhs_main_img.png" style="width:100%">
            </div>

            <div class="mySlides fade">
              <img src="css/imgs/bhs_main_img2.png" style="width:100%">
            </div>

            <div class="mySlides fade">
              <img src="css/imgs/bhs_main_img4.jpg" style="width:100%">
            </div>

            <div class="mySlides fade">
              <img src="css/imgs/bhs_main_img5.jpg" style="width:100%">
            </div>

            <div class="mySlides fade">
              <img src="css/imgs/bhs_main_img6.png" style="width:100%">
            </div>

            <div class="mySlides fade">
              <img src="css/imgs/bhs_main_img7.jpg" style="width:100%">
            </div>

            <div class="mySlides fade">
              <img src="css/imgs/bhs_main_img8.jpg" style="width:100%">
            </div>

            <div class="mySlides fade">
              <img src="css/imgs/bhs_main_img9.jpg" style="width:100%">
            </div>

            <div class="mySlides fade">
              <img src="css/imgs/bhs_main_img10.jpg" style="width:100%">
            </div>

            <div class="mySlides fade">
              <img src="css/imgs/bhs_main_img11.jpg" style="width:100%">
            </div>
            <br>
          </div>
        </div>
        <div style="text-align:center">
          <span class="dot"></span>
          <span class="dot"></span>
          <span class="dot"></span>
          <span class="dot"></span>
          <span class="dot"></span>
          <span class="dot"></span>
          <span class="dot"></span>
          <span class="dot"></span>
          <span class="dot"></span>
          <span class="dot"></span>
          <span class="dot"></span>
        </div>
        <script>
          let slideIndex = 0;
          showSlides();

          function showSlides() {
            let i;
            let slides = document.getElementsByClassName("mySlides");
            let dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
              slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1 }
            for (i = 0; i < dots.length; i++) {
              dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
            setTimeout(showSlides, 6000); // Change image every 2 seconds
          }
        </script>
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