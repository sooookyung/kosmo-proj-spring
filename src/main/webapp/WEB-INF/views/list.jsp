<%@ page contentType="text/html;charset=utf-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>

        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Tropical Night Litchi-Root</title>
            <link rel="stylesheet" type="text/css" href="/css/list.css">
            <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
            <script src="/js/bootstrap.js"></script>
            <script src="/js/trim.js"></script>
            <script language="javascript">
                function check_apply(co, co_no, re_no) {
                    var is_apply = confirm('[ ' + co + ' ] 사로 지원하시겠습니까?');
                    if (is_apply) {
                        location.href = "../apply/" + co_no + "/" + re_no;
                        return true;
                    }
                    return false;
                }
            </script>
        </head>


        <link rel="stylesheet" type="text/css" href="/css/nav.css" />

        <nav class="nav-main">
            <header class="nav-header" id="header">
                <h1 class="nav-header-heading">
                    <a href="/" title="메인 화면"><img src="/css/imgs/main_logo.png" class="nav-image"></a>
                </h1>
                <div class="nav-sign">
                    <ul class="nav-sign nav-sign-list">

                        <button onclick="location.href='/logout'">LOGOUT</button>
                        <button onclick="location.href='/info/'">INFO</button>


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
                                        <img src="/css/imgs/logo.png" class="image-login">
                                    </div>
                                    <p></p>
                                    <form name="lf" action="/login_ok/" method="post">
                                        <input type="hidden" name="csrfmiddlewaretoken"
                                            value="hYuKP8jAUKrwgQYkC41ayCRLbPEGcnfbZPSBEXLJxqIAwviUQEnBFI2GQJ22BmKF">
                                        <label class="login-label" for="email">EMAIL</label>
                                        <input class="login-input" type="email" id="login-email" name="login-email"
                                            title="이메일" placeholder="이메일을 입력하세요" required="required">
                                        <label class="login-label"></label>
                                        <label class="login-label" for="password">PASSWORD</label>
                                        <input class="login-input" type="password" id="login-pwd" name="login-pwd"
                                            title="비밀번호" placeholder="비밀번호를 입력하세요" required="required" maxlength='12'>
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
            <div class="list-main">
                <div class="list-title">
                    <p>모집공고</p>
                    <span>당신의 도전이 새로운 미래를 만듭니다.</span>
                </div>
                <div class="col-lt">































                    <span> 15 개의 모집공고가 있습니다.</span>



                    <!DOCTYPE html>

                    <html lang="ko">

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Tropical Night Litchi-Root</title>
                        <link rel="stylesheet" type="text/css" href="/css/search.css">
                        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                        <script>
                            function onchange_fun(no) {
                                var companyId = document.getElementById("company");
                                var sectorId = document.getElementById("sector");
                                var item_company = companyId.options[companyId.selectedIndex].value;
                                var item_sector = sectorId.options[sectorId.selectedIndex].value;

                                if (no == 1) {
                                    if (item_company == "primary") {
                                        onreset_fun()
                                    } else {
                                        check_ajax(".field1-sel", "#company", ".field2-sel", ".field2-s", "직무")
                                    }
                                } else if (no == 2) {
                                    if (item_sector == "primary") {
                                        onreset_fun()
                                    } else {
                                        check_ajax(".field2-sel", "#sector", ".field1-sel", ".field1-s", "회사")
                                    }
                                }
                            }

                            function check_ajax(basic, basic_sharp, change, selec, val) {
                                get_data = $(basic_sharp).val();
                                $.ajax({
                                    type: 'post',
                                    url: '../search/',
                                    headers: {
                                        'X-CSRFTOKEN': 'hYuKP8jAUKrwgQYkC41ayCRLbPEGcnfbZPSBEXLJxqIAwviUQEnBFI2GQJ22BmKF'
                                    },
                                    data: {
                                        'get_data': get_data,
                                    },
                                    success: function (json) {
                                        const boxes = document.querySelectorAll(change);
                                        boxes.forEach(box => {
                                            box.style.display = "none";
                                        });
                                        json_data = JSON.parse(json)
                                        if (basic == ".field1-sel") {
                                            for (var i = 0; i < json_data.length; i++) {

                                                let changeStyle = document.querySelectorAll(change);
                                                changeStyle.forEach((userItem) => {
                                                    value = userItem.getAttribute("value")
                                                    if (value == json_data[i].fields.re_sector || value == "primary") {
                                                        userItem.style.display = "block";
                                                    }
                                                });
                                            }
                                        } else if (basic == ".field2-sel") {
                                            for (var i = 0; i < json_data.length; i++) {

                                                let changeStyle = document.querySelectorAll(change);
                                                changeStyle.forEach((userItem) => {
                                                    value = userItem.getAttribute("value")
                                                    if (value == json_data[i].fields.re_affiliate || value == "primary") {
                                                        userItem.style.display = "block";
                                                    }
                                                });
                                            }
                                        }
                                    },
                                    error: function (xhr, errmsg, err) {
                                        alert("실패");
                                        console.log(xhr.status + ": " + xhr.responseText);
                                    }
                                });
                            }

                            function onreset_fun() {
                                let changeStyle1 = document.querySelectorAll(".field1-sel");
                                changeStyle1.forEach((userItem) => {
                                    if (userItem.style.display == "none") {
                                        userItem.style.display = "block";
                                    }
                                });
                                let changeStyle2 = document.querySelectorAll(".field2-sel");
                                changeStyle2.forEach((userItem) => {
                                    if (userItem.style.display == "none") {
                                        userItem.style.display = "block";
                                    }
                                });
                                $('#company').val("primary");
                                $('#sector').val("primary");
                                $('#career').val("primary");
                            }
                        </script>
                    </head>

                    <div class="jobs_search_box">
                        <strong>관심 있는 공고를<br> 편리하게 찾아보세요.</strong>
                        <div class="jobs_search_field">
                            <form name="f" action="/list/" method="post">
                                <input type="hidden" name="csrfmiddlewaretoken"
                                    value="hYuKP8jAUKrwgQYkC41ayCRLbPEGcnfbZPSBEXLJxqIAwviUQEnBFI2GQJ22BmKF">
                                <div class="field1">
                                    <select class="field1-s" name="company" id="company" title="관계사 선택"
                                        onchange="onchange_fun(1)">
                                        <option class="field1-sel" value="primary" selected>회사</option>


                                        <option class="field1-sel" value="1">Bang SOFT</option>

                                        <option class="field1-sel" value="2">IDLE</option>

                                        <option class="field1-sel" value="3">Tuna Salad</option>

                                        <option class="field1-sel" value="4">Fantastic 4</option>

                                        <option class="field1-sel" value="5">TN World Legend Bomi</option>


                                    </select>
                                </div>
                                <div class="field2">
                                    <select class="field2-s" name="sector" id="sector" title="관계사 선택"
                                        onchange="onchange_fun(2)">
                                        <option class="field2-sel" value="primary" selected>직무</option>


                                        <option class="field2-sel" value="프론트엔드">프론트엔드</option>

                                        <option class="field2-sel" value="DB관리자">DB관리자</option>

                                        <option class="field2-sel" value="퍼블리셔">퍼블리셔</option>

                                        <option class="field2-sel" value="SI, SM">SI, SM</option>

                                        <option class="field2-sel" value="SM">SM</option>

                                        <option class="field2-sel" value="퍼블리셔, UI/UX디자인">퍼블리셔, UI/UX디자인</option>

                                        <option class="field2-sel" value="SI">SI</option>

                                        <option class="field2-sel" value="백엔드 개발">백엔드 개발</option>

                                        <option class="field2-sel" value="프론트엔드 개발">프론트엔드 개발</option>


                                    </select>
                                </div>
                                <div class="field3">
                                    <select class="field3-s" name="career" id="career" title="영입유형 선택">
                                        <option class="field3-sel selected" value="primary">영입유형</option>
                                        <option value="신입">신입</option>
                                        <option value="경력">경력</option>
                                    </select>
                                </div>
                                <button class="search-btn" type="submit" id="search" title="검색하기">검색</button>
                            </form>
                        </div>
                        <button class="reset-btn" onclick="onreset_fun()" title="검색조건 초기화">검색조건
                            초기화<!--검색조건 초기화--></button>
                    </div>





                    <script>
                        $(document).ready(function () {
                            stickyjobsSearch(); //sticky job search box
                        });

                        $(window).resize(function () {
                            if (this.resizeTO) {
                                clearTimeout(this.resizeTO);
                            }
                            this.resizeTO = setTimeout(function () {
                                $(this).trigger('resizeEnd');
                            }, 0);
                        });

                        $(window).on('resizeEnd', function () {
                            stickyjobsSearch();
                        });

                        function stickyjobsSearch() {
                            var windowW = $(window).width();
                            if ($('.jobs_search_box').length > 0) {
                                if (windowW > 900) {
                                    $(window).scroll(function () {
                                        var windowST = $(window).scrollTop();
                                        var windowSclHt = windowST + $(window).height();
                                        var ftTop = $('.footer-main').offset().top + 125;
                                        var jobslistTop = $('.accordion').offset().top - 300;

                                        if (windowSclHt > jobslistTop) {
                                            $('.jobs_search_box').addClass('sticky');
                                        }
                                        if (windowST < jobslistTop || windowSclHt > ftTop) {
                                            $('.jobs_search_box').removeClass('sticky');
                                        }
                                    });
                                } else {
                                    $(window).scroll(function () {
                                        $('.jobs_search_box').removeClass('sticky');
                                    });
                                }
                            }
                        }
                    </script>
                </div>
                <div class="col-rt">
                    <ul class="accordion" id="accordionExample">
                        <li class="accordion-item">
                            <h2 class="accordion-item accordion-header" id="headingone"></h2>
                            <div id="collapseone" class="accordion-collapse collapse show" aria-labelledby="headingone"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body"></div>
                            </div>
                        </li>


                        <li class="accordion-item">
                            <h2 class="accordion-item accordion-header" id="heading4">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapse4" aria-expanded="false" aria-controls="collapse4">
                                    <strong class="code-head-strong">IDLE</strong>
                                    <div class="code-head-div">프론트엔드</div>
                                    <span class="code-head-span">D--157</span>
                                    <div class="arrow"></div>
                                </button>
                            </h2>
                            <div id="collapse4" class="accordion-collapse collapse" aria-labelledby="heading4"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>경력 2년 이상</strong><br><br>
                                    <code>관련학과 전공 또는 수료자, 프로젝트 경험 또는 포트폴리오 다수 보유자, PPT가능자</code><br><br>
                                    2023. 02. 22 ~ 2023. 03. 10<br><br>
                                    <button style="display:block-inline"
                                        onclick="check_apply('IDLE', '2', '4')">지원하기</button><br><br>
                                </div>
                            </div>
                        </li>

                        <li class="accordion-item">
                            <h2 class="accordion-item accordion-header" id="heading1">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapse1" aria-expanded="false" aria-controls="collapse1">
                                    <strong class="code-head-strong">Bang SOFT</strong>
                                    <div class="code-head-div">SI</div>
                                    <span class="code-head-span">D--147</span>
                                    <div class="arrow"></div>
                                </button>
                            </h2>
                            <div id="collapse1" class="accordion-collapse collapse" aria-labelledby="heading1"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>경력 5년 이상(팀장급)</strong><br><br>
                                    <code>관련 프로젝트 다수 경험자, 영어가능자, 팀장급 의사소통 가능한 분</code><br><br>
                                    2023. 02. 13 ~ 2023. 03. 20<br><br>
                                    <button style="display:block-inline"
                                        onclick="check_apply('Bang SOFT', '1', '1')">지원하기</button><br><br>
                                </div>
                            </div>
                        </li>

                        <li class="accordion-item">
                            <h2 class="accordion-item accordion-header" id="heading9">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapse9" aria-expanded="false" aria-controls="collapse9">
                                    <strong class="code-head-strong">Tuna Salad</strong>
                                    <div class="code-head-div">백엔드 개발</div>
                                    <span class="code-head-span">D--147</span>
                                    <div class="arrow"></div>
                                </button>
                            </h2>
                            <div id="collapse9" class="accordion-collapse collapse" aria-labelledby="heading9"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>경력 5년 이상(팀장급)</strong><br><br>
                                    <code>개발 및 팀 운영 경력 보유한 분, JAVA/Python 언어 능통한 분</code><br><br>
                                    2023. 02. 22 ~ 2023. 03. 20<br><br>
                                    <button style="display:block-inline"
                                        onclick="check_apply('Tuna Salad', '3', '9')">지원하기</button><br><br>
                                </div>
                            </div>
                        </li>

                        <li class="accordion-item">
                            <h2 class="accordion-item accordion-header" id="heading10">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapse10" aria-expanded="false" aria-controls="collapse10">
                                    <strong class="code-head-strong">Fantastic 4</strong>
                                    <div class="code-head-div">프론트엔드 개발</div>
                                    <span class="code-head-span">D--147</span>
                                    <div class="arrow"></div>
                                </button>
                            </h2>
                            <div id="collapse10" class="accordion-collapse collapse" aria-labelledby="heading10"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>신입/경력</strong><br><br>
                                    <code>관련학과 전공/수료자, MBTI &quot;E&quot;성향이신 분</code><br><br>
                                    2023. 02. 22 ~ 2023. 03. 20<br><br>
                                    <button style="display:block-inline"
                                        onclick="check_apply('Fantastic 4', '4', '10')">지원하기</button><br><br>
                                </div>
                            </div>
                        </li>

                        <li class="accordion-item">
                            <h2 class="accordion-item accordion-header" id="heading3">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
                                    <strong class="code-head-strong">Bang SOFT</strong>
                                    <div class="code-head-div">백엔드 개발</div>
                                    <span class="code-head-span">D--140</span>
                                    <div class="arrow"></div>
                                </button>
                            </h2>
                            <div id="collapse3" class="accordion-collapse collapse" aria-labelledby="heading3"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>신입/경력</strong><br><br>
                                    <code>관련학과 전공/수료자, 프로젝트 유경험자, 한글/워드 등 문서작업 가능한 분</code><br><br>
                                    2023. 03. 02 ~ 2023. 03. 27<br><br>
                                    <button style="display:block-inline"
                                        onclick="check_apply('Bang SOFT', '1', '3')">지원하기</button><br><br>
                                </div>
                            </div>
                        </li>

                        <li class="accordion-item">
                            <h2 class="accordion-item accordion-header" id="heading5">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapse5" aria-expanded="false" aria-controls="collapse5">
                                    <strong class="code-head-strong">IDLE</strong>
                                    <div class="code-head-div">퍼블리셔</div>
                                    <span class="code-head-span">D--140</span>
                                    <div class="arrow"></div>
                                </button>
                            </h2>
                            <div id="collapse5" class="accordion-collapse collapse" aria-labelledby="heading5"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>경력 5년 이상(팀장급)</strong><br><br>
                                    <code>경력 필수사항, 발표 및 토의에 능한 분, 해외출장에 결격사유가 없는 분</code><br><br>
                                    2023. 02. 01 ~ 2023. 03. 27<br><br>
                                    <button style="display:block-inline"
                                        onclick="check_apply('IDLE', '2', '5')">지원하기</button><br><br>
                                </div>
                            </div>
                        </li>

                        <li class="accordion-item">
                            <h2 class="accordion-item accordion-header" id="heading12">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapse12" aria-expanded="false" aria-controls="collapse12">
                                    <strong class="code-head-strong">Fantastic 4</strong>
                                    <div class="code-head-div">백엔드 개발</div>
                                    <span class="code-head-span">D--140</span>
                                    <div class="arrow"></div>
                                </button>
                            </h2>
                            <div id="collapse12" class="accordion-collapse collapse" aria-labelledby="heading12"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>경력 5년 이상</strong><br><br>
                                    <code>JAVA/Python 가능한 분, 관련 프로젝트 경험 다수 보유한 분</code><br><br>
                                    2023. 02. 27 ~ 2023. 03. 27<br><br>
                                    <button style="display:block-inline"
                                        onclick="check_apply('Fantastic 4', '4', '12')">지원하기</button><br><br>
                                </div>
                            </div>
                        </li>

                        <li class="accordion-item">
                            <h2 class="accordion-item accordion-header" id="heading2">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
                                    <strong class="code-head-strong">Bang SOFT</strong>
                                    <div class="code-head-div">SM</div>
                                    <span class="code-head-span">D--136</span>
                                    <div class="arrow"></div>
                                </button>
                            </h2>
                            <div id="collapse2" class="accordion-collapse collapse" aria-labelledby="heading2"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>신입/경력</strong><br><br>
                                    <code>관련학과 전공/수료자, 영어가능자, 한글/워드 등 문서작업 가능한 분</code><br><br>
                                    2023. 03. 02 ~ 2023. 03. 31<br><br>
                                    <button style="display:block-inline"
                                        onclick="check_apply('Bang SOFT', '1', '2')">지원하기</button><br><br>
                                </div>
                            </div>
                        </li>

                        <li class="accordion-item">
                            <h2 class="accordion-item accordion-header" id="heading7">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapse7" aria-expanded="false" aria-controls="collapse7">
                                    <strong class="code-head-strong">Tuna Salad</strong>
                                    <div class="code-head-div">SI, SM</div>
                                    <span class="code-head-span">D--133</span>
                                    <div class="arrow"></div>
                                </button>
                            </h2>
                            <div id="collapse7" class="accordion-collapse collapse" aria-labelledby="heading7"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>경력 2년 이상</strong><br><br>
                                    <code>관련 학과 전공/수료자, 문서작업에 능통한 분, 발표에 능한 분, 팀원과 의사소통이 원활한 분</code><br><br>
                                    2023. 03. 02 ~ 2023. 04. 03<br><br>
                                    <button style="display:block-inline"
                                        onclick="check_apply('Tuna Salad', '3', '7')">지원하기</button><br><br>
                                </div>
                            </div>
                        </li>

                        <li class="accordion-item">
                            <h2 class="accordion-item accordion-header" id="heading8">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapse8" aria-expanded="false" aria-controls="collapse8">
                                    <strong class="code-head-strong">Tuna Salad</strong>
                                    <div class="code-head-div">프론트엔드 개발</div>
                                    <span class="code-head-span">D--133</span>
                                    <div class="arrow"></div>
                                </button>
                            </h2>
                            <div id="collapse8" class="accordion-collapse collapse" aria-labelledby="heading8"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>신입/경력</strong><br><br>
                                    <code>관련 학과 전공/수료자, 팀원과 의사소통이 원활한 분, MBTI 성향 &quot;E&quot; 이신분</code><br><br>
                                    2023. 03. 02 ~ 2023. 04. 03<br><br>
                                    <button style="display:block-inline"
                                        onclick="check_apply('Tuna Salad', '3', '8')">지원하기</button><br><br>
                                </div>
                            </div>
                        </li>

                        <li class="accordion-item">
                            <h2 class="accordion-item accordion-header" id="heading11">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapse11" aria-expanded="false" aria-controls="collapse11">
                                    <strong class="code-head-strong">Fantastic 4</strong>
                                    <div class="code-head-div">백엔드 개발</div>
                                    <span class="code-head-span">D--133</span>
                                    <div class="arrow"></div>
                                </button>
                            </h2>
                            <div id="collapse11" class="accordion-collapse collapse" aria-labelledby="heading11"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>신입/경력</strong><br><br>
                                    <code>JAVA/Python/Kotlin/Django/SQL/JAVAscript/Spring</code><br><br>
                                    2023. 03. 02 ~ 2023. 04. 03<br><br>
                                    <button style="display:block-inline"
                                        onclick="check_apply('Fantastic 4', '4', '11')">지원하기</button><br><br>
                                </div>
                            </div>
                        </li>

                        <li class="accordion-item">
                            <h2 class="accordion-item accordion-header" id="heading6">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapse6" aria-expanded="false" aria-controls="collapse6">
                                    <strong class="code-head-strong">IDLE</strong>
                                    <div class="code-head-div">SI</div>
                                    <span class="code-head-span">D--108</span>
                                    <div class="arrow"></div>
                                </button>
                            </h2>
                            <div id="collapse6" class="accordion-collapse collapse" aria-labelledby="heading6"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>경력 7년 이상(팀장급)</strong><br><br>
                                    <code>JAVA/Python/Django 프로젝트 다수 경험자, 팀원들과 원활한 소통이 가능한 분, 해외출장에 결격사유가 없는 분</code><br><br>
                                    2023. 03. 02 ~ 2023. 04. 28<br><br>
                                    <button style="display:block-inline"
                                        onclick="check_apply('IDLE', '2', '6')">지원하기</button><br><br>
                                </div>
                            </div>
                        </li>

                        <li class="accordion-item">
                            <h2 class="accordion-item accordion-header" id="heading13">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapse13" aria-expanded="false" aria-controls="collapse13">
                                    <strong class="code-head-strong">TN World Legend Bomi</strong>
                                    <div class="code-head-div">퍼블리셔, UI/UX디자인</div>
                                    <span class="code-head-span">D--75</span>
                                    <div class="arrow"></div>
                                </button>
                            </h2>
                            <div id="collapse13" class="accordion-collapse collapse" aria-labelledby="heading13"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>경력 15년 이상(PM급)</strong><br><br>
                                    <code>개발 경험 다수 보유한 분, 팀원과 원활한 소통이 가능한 분, 해당분야 교육이 가능한 분</code><br><br>
                                    2023. 02. 22 ~ 2023. 05. 31<br><br>
                                    <button style="display:block-inline"
                                        onclick="check_apply('TN World Legend Bomi', '5', '13')">지원하기</button><br><br>
                                </div>
                            </div>
                        </li>

                        <li class="accordion-item">
                            <h2 class="accordion-item accordion-header" id="heading14">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapse14" aria-expanded="false" aria-controls="collapse14">
                                    <strong class="code-head-strong">TN World Legend Bomi</strong>
                                    <div class="code-head-div">백엔드 개발</div>
                                    <span class="code-head-span">D--75</span>
                                    <div class="arrow"></div>
                                </button>
                            </h2>
                            <div id="collapse14" class="accordion-collapse collapse" aria-labelledby="heading14"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>경력 10년 이상(팀장급)</strong><br><br>
                                    <code>Python/Java/JavaScript/C++/PHP/TypeScript/C/Go/Shell/Ruby/C#/Assembly language/SQL/Visual Basic/Delphi/Object Pascal/MATLAB/Fortran/Swift 중 최소 7개 이상 가능한 분</code><br><br>
                                    2023. 02. 22 ~ 2023. 05. 31<br><br>
                                    <button style="display:block-inline"
                                        onclick="check_apply('TN World Legend Bomi', '5', '14')">지원하기</button><br><br>
                                </div>
                            </div>
                        </li>

                        <li class="accordion-item">
                            <h2 class="accordion-item accordion-header" id="heading15">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapse15" aria-expanded="false" aria-controls="collapse15">
                                    <strong class="code-head-strong">TN World Legend Bomi</strong>
                                    <div class="code-head-div">DB관리자</div>
                                    <span class="code-head-span">D--14</span>
                                    <div class="arrow"></div>
                                </button>
                            </h2>
                            <div id="collapse15" class="accordion-collapse collapse" aria-labelledby="heading15"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>경력 20년 이상</strong><br><br>
                                    <code>DB관리 경험 다수 보유자, Select문 1000줄 이상 가능한 분</code><br><br>
                                    2023. 02. 22 ~ 2023. 07. 31<br><br>
                                    <button style="display:block-inline"
                                        onclick="check_apply('TN World Legend Bomi', '5', '15')">지원하기</button><br><br>
                                </div>
                            </div>
                        </li>


                    </ul>
                </div>
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

        </html>