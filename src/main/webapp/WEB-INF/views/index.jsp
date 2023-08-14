<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sql" uri="jakarta.tags.sql" %> 
<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tropical Night Litchi-Root</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/static/css/index.css" />
</head>

<link rel="stylesheet" type="text/css" href="/static/css/nav.css" />

<nav class="nav-main">
  <header class="nav-header" id="header">
    <h1 class="nav-header-heading">
      <a href="/" title="메인 화면"><img src="/static/css/imgs/logo.png" class="nav-image"></a>
    </h1>
    <div class="nav-sign">
      <ul class="nav-sign nav-sign-list">
        
        <button id="login_button">LOGIN</button>
        <button onclick="location.href='/join/'">SIGN UP</button >
        
        
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Tropical Night Litchi-Root : login</title>
    <link rel="stylesheet" type="text/css" href="/static/css/login_join.css">
    <script src="/static/js/trim.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function check_login(){
            var loginEmailFoc = document.getElementById('login-email');
            var loginEmailVal = loginEmailFoc.value;

            if(loginEmailVal.length==0){
                alert("Email을 입력해 주세요");
                loginEmailFoc.focus();
                return false;
            }else if(!CheckEmail(loginEmailVal)){
                alert('Email 형식을 맞춰주세요 ex)"--@--.--"');
                loginEmailFoc.focus();
                return false;
            }else if(check_login_pwd()){
                lf.submit();
            }
        }

        // 비밀번호 체크(retrurn boolean)
        function check_login_pwd(){
            var loginPwdFoc = document.getElementById('login-pwd');
            var loginPwdVal = loginPwdFoc.value;

            if(loginPwdVal.length == 0){
                alert("Password를 입력해 주세요");
                loginPwdFoc.focus();
                return false;
            }else{
                return true;
            }
        }

        // 이메일 형식 체크 기능
        function CheckEmail(str){                                                 
            var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
            if(!reg_email.test(str)) {
                return false;
            }else{
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
                <img src="/static/css/imgs/logo.png" class="image-login">
            </div>
            <p></p>    
            <form name="lf" action="/login_ok/" method="post">
            <input type="hidden" name="csrfmiddlewaretoken" value="RWqB2slcMopejijsEhpp9b0BvchuFb4WzNOsRhNlp4GizXD2SRLQghbwa6FQ4azq">
                <label class = "login-label" for="email">EMAIL</label> 
                <input class = "login-input" type="email" id="login-email" name="login-email" title="이메일" placeholder="이메일을 입력하세요" required="required"> 
                <label class = "login-label" ></label> 
                <label class = "login-label" for="password">PASSWORD</label>
                <input class = "login-input" type="password" id="login-pwd" name="login-pwd" title="비밀번호" placeholder="비밀번호를 입력하세요" required="required" maxlength='12'>
                <div class="login-btn-group">
                    <input class = "login_submit" type="button" id="login-submit" value="로그인" onclick="check_login()">
                    <input class = "login_cancel" type="button" id="login-cancel" value="취소" onclick="javascript:history.go(0)"/>
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

    function togglegodal() { 
        godal.classList.toggle("show-login"); 
        console.log(1);
    }

   function windowOnClick(event) { 
        if (event.target === godal) { 
            togglegodal(); 
        } 
    }
    $(document).keyup(function(event) {
        var loginEmailFoc = document.getElementById('login-email');
        var loginEmailVal = loginEmailFoc.value;
        if (event.which === 13) {
            if(loginEmailVal.length!=0){
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
      <a href="/introduce/" class="menu-heading">LITCHI ROOT</a>
    </li>
    <li class="nav-menu-item">
      <a href="/list/" class="menu-heading">모집공고</a>
    </li>
    <li class="nav-menu-item">
        <a href="/apply/0/0" class="menu-heading">입사지원</a>
      </li>
    <li class="nav-menu-item">
      <a href="/myPage/" class="menu-heading">지원목록</a>
    </li>
    <li class="nav-menu-item">
      <a href="/ask/" class="menu-heading">1:1문의</a>
    </li>
  </ul>
</nav>


<body style="margin:0">
  <main class="index-main">
    <div class="index-title">
      <p>
        TROPICAL
        <span>NIGHT.</span>
        LITCHI
        <span>ROOT.</span>
      </p>
      <video class="index-video" src="/static/css/imgs/video.mp4" muted autoplay loop></video>
    </div>
    <figcaption class="index-detail">
      <span>세상에 없는 기술과</span>
      <span>새로운 세계를 &nbsp; 향한 도전</span>
    </figcaption>
  </main>
</body>

<link rel="stylesheet" type="text/css" href="/static/css/footer.css" />

<footer class="footer-main">
  <ul class="footer-corp">
    <li><a href="/terms">홈페이지 이용약관 및 개인정보 처리방침</a></li>
  </ul>
  <ul class="footer-info">
    <li><a href="/map/">찾아오시는 길</a></li>
    <li><a href="/subsidiary/">계열사</a></li>
    <li><a href="/list/">모집 공고</a></li>
  </ul>
  <address class="footer-address">
    <span>사업자등록번호 : 123-45-67890</span>
    <span>(주)TN COMPANY 대표이사 : 이보미</span>
    <span>TEL : 1234-1234</span>
    <span>개인정보 책임자 : 우해인</span>
  </address>
  <small class="footer-copyringt">&copy; TN Company. All Rights Reserved.</small>
</footer>

</html>