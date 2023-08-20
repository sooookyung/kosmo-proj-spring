<%@ page contentType="text/html;charset=utf-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>

        <html lang="ko">

        <head>
            meta charset="UTF-8">
            <title>BHS.COM : sign-up</title>
            <link rel="stylesheet" type="text/css" href="/css/login_join.css">
            <script src="/js/trim.js"></script>
            <script languege="javascript">
                const regExp = /[!?@#$%^&*():;+-=~{}<>\_\[\]\|\\\"\'\,\.\/\`\₩]/g; //전체에서 특수문자 찾기
                const blankExp = /\s/g; //전체에서 공백찾기 
                // 이메일 체크(트랜젝션 스타트)

                function check_email() {
                    var emailFoc = document.getElementById('email');
                    var emailVal = emailFoc.value;
                    emailVal = trim(emailVal); //공백제거

                    if (emailVal.length == 0) { //emailval의 길이가 0이라면 
                        alert("Email을 입력해 주세요");
                        emailFoc.focus(); //focus() : 해당 요소에 포커스를 부여하여 텍스트창의 경우 커서를 위치시켜 바로 입력할 수 있게 함
                        return false;
                    } else if (!checkEmail(emailVal)) { //emailval값이 checkEmail이 아니라면
                        alert('Email 형식을 맞춰주세요 ex)"--@--.--"');
                        emailFoc.focus();
                        return false;
                    } else if (blankExp.test(emailVal)) {
                        alert("Email은 공백을 포함할 수 없습니다");
                        emailFoc.focus();
                        return false;
                    } else if (check_pwd()) {
                        jf.submit();
                    } else {
                        return false;
                    }
                }

                // 비밀번호 체크(retrurn boolean)
                function check_pwd() {
                    var pwdFoc = document.getElementById('pwd');
                    var pwdVal = pwdFoc.value;
                    var checkPwdFoc = document.getElementById('check_pwd');
                    var checkPwdVal = checkPwdFoc.value;


                    if (pwdVal.length == 0) {
                        alert("Password를 입력해 주세요");
                        pwdFoc.focus();
                        return false;
                        // } else if (!checkPwd(pwdVal)) {
                        //     alert("Password는 영문,숫자,특수문자를 혼합하여 6~60자로 입력해 주세요");
                        //     pwdVal = "";
                        //     pwdFoc.focus();
                        //     return false;
                    } else if (blankExp.test(pwdVal)) {
                        alert("Password는 공백이 포함될 수 없습니다");
                        pwdVal = "";
                        pwdFoc.focus();
                        return false;
                    } else if (checkPwdVal.length == 0) {
                        alert("2차 Password를 입력해 주세요");
                        checkPwdFoc.focus();
                        return false;
                    } else if (pwdVal != checkPwdVal) {
                        alert("2차 Password를 확인해 주세요");
                        checkPwdVal = "";
                        checkPwdFoc.focus();
                        return false;
                    } else if (check_name()) {
                        return true;
                    } else {
                        return false;
                    }
                }

                // 이름 체크(retrurn boolean)
                function check_name() {
                    var nameFoc = document.getElementById('name');
                    var nameVal = nameFoc.value;
                    if (nameVal.length == 0) {
                        alert("이름을 입력해 주세요");
                        nameFoc.focus();
                        return false;
                    } else if (regExp.test(nameVal) | blankExp.test(nameVal)) {
                        alert("이름은 공백이나 특수문자가 포함될 수 없습니다");
                        nameVal = "";
                        nameFoc.focus();
                        return false;
                    } else if (nameVal.search(/[0-9]/g) > -1) {
                        alert("이름은 숫자는 포함할 수 없습니다");
                        nameVal = "";
                        nameFoc.focus();
                        return false;
                    } else if (nameVal.length < 2) {
                        alert("이름이 너무 짧습니다.");
                        nameVal = "";
                        nameFoc.focus();
                        return false;
                    } else if (check_byte(nameVal) > 30) {
                        alert("이름이 너무 깁니다");
                        nameVal = "";
                        nameFoc.focus();
                        return false;
                    } else if (check_phone()) {
                        return true;
                    } else {
                        return false;
                    }
                }

                // 휴대전화 체크(retrurn boolean)
                function check_phone() {
                    var phoneFoc = document.getElementById('ph');
                    var phoneVal = phoneFoc.value;
                    if (phoneVal.length == 0) {
                        alert("휴대전화를 입력해 주세요");
                        phoneFoc.focus();
                        return false;
                    } else if (phoneVal.length != 11) {
                        alert("휴대전화는 11자리만 입력해 주세요");
                        phoneVal = "";
                        phoneFoc.focus();
                        return false;
                    } else if (isNaN(phoneVal)) {
                        alert('휴대전화는 숫자로만 입력해 주세요("-"미포함)');
                        phoneVal = "";
                        phoneFoc.focus();
                        return false;
                    } else {
                        return true;
                    }
                }

                // 이메일 형식 체크 기능
                function checkEmail(str) {
                    var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
                    if (!reg_email.test(str)) {
                        return false;
                    } else {
                        return true;
                    }
                }

                // 비밀번호 형식 체크 기능
                // function checkPwd(str) {
                //     var regExp = /^.*(?=^.{6,60}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
                //     if (!regExp.test(str)) {
                //         return false;
                //     } else {
                //         return true;
                //     }
                // }

                // 바이트 체크 기능(모델 Max-length 제한치 적용)
                function check_byte(str) {
                    stringByteLength = (function (s, b, i, c) {
                        for (b = i = 0; c = s.charCodeAt(i++); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
                        return b
                    })(str)
                    return stringByteLength
                }
            </script>
        </head>

        <body style="margin:0">

            <link rel="stylesheet" type="text/css" href="/css/nav.css" />

            <nav class="nav-main">
                <header class="nav-header" id="header">
                    <h1 class="nav-header-heading">
                        <a href="/" title="메인 화면"><img src="/css/imgs/main_logo.png" class="nav-image"></a>
                    </h1>
                    <div class="nav-sign">
                        <ul class="nav-sign nav-sign-list">

                            <button id="login_button">LOGIN</button>
                            <button onclick="location.href='/join/'">SIGN UP</button>


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
                                    function maxLengthCheck(object) {
                                        if (object.value.length > object.maxLength) {
                                            object.value = object.value.slice(0, object.maxLength);
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
                                        <form name="lf" action="/login_ok/" method="post">
                                            <input type="hidden" name="csrfmiddlewaretoken"
                                                value="VkkZagUmeEvZXBUt1fR1wxyfpb1Z0BjUDbIQZ5mvRkM3dge3fPdsDDJa45plpAOo">
                                            <label class="login-label" for="email">EMAIL</label>
                                            <input class="login-input" type="email" id="login-email" name="login-email"
                                                title="이메일" placeholder="이메일을 입력하세요" required="required">
                                            <label class="login-label"></label>
                                            <label class="login-label" for="password">PASSWORD</label>
                                            <input class="login-input" type="password" id="login-pwd" name="login-pwd"
                                                title="비밀번호" placeholder="비밀번호를 입력하세요" required="required"
                                                maxlength='12'>
                                            <div class="login-btn-group">
                                                <input class="login_submit" type="button" id="login-submit" value="로그인"
                                                    onclick="check_login()">
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
                        <a href="/board/list.do" class="menu-heading">게시판</a>
                    </li>
                    <li class="nav-menu-item">
                        <a href="/apply/0/0" class="menu-heading">지도</a>
                    </li>
                    <li class="nav-menu-item">
                        <a href="/myPage/" class="menu-heading">지원목록</a>
                    </li>
                    <li class="nav-menu-item">
                        <a href="/ask/" class="menu-heading">1:1문의</a>
                    </li>
                </ul>
            </nav>


            <div class="signup-body">
                <header>
                    <div class="signup-logo">
                        <img src="/css/imgs/sign_up.png" class="signup-image">
                    </div>
                </header>
                <form name="jf" action="join.do" method="POST">
                    <input type="hidden" name="csrfmiddlewaretoken"
                        value="VkkZagUmeEvZXBUt1fR1wxyfpb1Z0BjUDbIQZ5mvRkM3dge3fPdsDDJa45plpAOo">
                    <div class="signup-first">
                        <h3>이메일</h3>
                        <span class="signup-input">
                            <input name="email" id="email" type="text" title="이메일" placeholder="이메일을 입력하세요"
                                maxlength="60" required="required">
                        </span>

                        <h3>닉네임</h3>
                        <span class="signup-input">
                            <input name="nickname" id="nickname" type="text" title="닉네임" placeholder="닉네임를 입력하세요"
                                maxlength="30" required="required">
                            <span class="signup-nickname-image"></span>
                        </span>

                        <h3>비밀번호</h3>
                        <span class="signup-input">
                            <input name="pwd" id="pwd" type="password" title="비밀번호" placeholder="비밀번호를 입력하세요"
                                maxlength="60" required="required">
                            <span class="signup-pwd-image"></span>
                        </span>

                        <h3>비밀번호 재확인</h3>
                        <span class="signup-input">
                            <input name="check_pwd" id="check_pwd" title="비밀번호 확인" placeholder="비밀번호 확인을 입력하세요"
                                type="password" maxlength="60" required="required">
                            <span class="signup-pwd-image"></span>
                        </span>
                    </div>

                    <div class="signup-select">
                        <h3>이름</h3>
                        <span class="signup-input">
                            <input name="name" id="name" type="text" title="이름" placeholder="이름을 입력하세요" maxlength="30"
                                required="required">
                        </span>
                    </div>

                    <div class="signup-select">
                        <h3>휴대전화</h3>
                        <span class="signup-input">
                            <input name="ph" id="ph" type="text" title="전화번호" placeholder="전화번호를 입력하세요" maxlength="11">
                        </span>
                    </div>

                    <div class="signup-select">
                        <h3>나이</h3>
                        <span class="signup-input">
                            <input name="age" id="age" type="number" title="나이" placeholder="나이를 입력하세요" maxlength="3"
                                required="required" oninput="maxLengthCheck(this)">
                        </span>
                    </div>

                    <div class="signup-join">
                        <button type="button" class="signup-btn" onclick="check_email()">가입하기</button>
                    </div>
                </form>
            </div>
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