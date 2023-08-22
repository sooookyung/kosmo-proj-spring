<%@ page contentType="text/html;charset=utf-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <!DOCTYPE html>

            <html lang="ko">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>BHS.COM</title>
                <link rel="stylesheet" type="text/css" href="/css/list.css">
                <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
                <script src="/js/bootstrap.js"></script>
                <script src="/js/trim.js"></script>
                <script src="/js/star.js"></script>
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
                            <c:choose>
                                <c:when test="${empty nickname}">
                                    <button id="login_button">LOGIN</button>
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
                                                value="hYuKP8jAUKrwgQYkC41ayCRLbPEGcnfbZPSBEXLJxqIAwviUQEnBFI2GQJ22BmKF">
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
                        <a href="/map.do" class="menu-heading">지도</a>
                    </li>
                </ul>
            </nav>


            <body style="margin:0">
                <div class="list-main">
                    <div class="list-title">
                        <p>게시판</p>
                        <span></span>
                    </div>
                    <div class="col-lt">
                        <!DOCTYPE html>
                        <html lang="ko">

                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <title>Tropical Night Litchi-Root</title>
                            <link rel="stylesheet" href="/css/bootstrap.css">
                            <link rel="stylesheet" type="text/css" href="/css/search.css">
                            <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
                            <script src="/js/bootstrap.js"></script>
                            <script>
                                export function rainbowCursor(options) {
                                    let hasWrapperEl = options && options.element;
                                    let element = hasWrapperEl || document.body;

                                    let width = window.innerWidth;
                                    let height = window.innerHeight;
                                    let cursor = { x: width / 2, y: width / 2 };
                                    let particles = [];
                                    let canvas, context, animationFrame;

                                    const totalParticles = options?.length || 20;
                                    const colors = options?.colors || [
                                        "#FE0000",
                                        "#FD8C00",
                                        "#FFE500",
                                        "#119F0B",
                                        "#0644B3",
                                        "#C22EDC",
                                    ];
                                    const size = options?.size || 3;

                                    let cursorsInitted = false;

                                    const prefersReducedMotion = window.matchMedia(
                                        "(prefers-reduced-motion: reduce)"
                                    );

                                    // Re-initialise or destroy the cursor when the prefers-reduced-motion setting changes
                                    prefersReducedMotion.onchange = () => {
                                        if (prefersReducedMotion.matches) {
                                            destroy();
                                        } else {
                                            init();
                                        }
                                    };

                                    function init() {
                                        // Don't show the cursor trail if the user has prefers-reduced-motion enabled
                                        if (prefersReducedMotion.matches) {
                                            console.log(
                                                "This browser has prefers reduced motion turned on, so the cursor did not init"
                                            );
                                            return false;
                                        }

                                        canvas = document.createElement("canvas");
                                        context = canvas.getContext("2d");
                                        canvas.style.top = "0px";
                                        canvas.style.left = "0px";
                                        canvas.style.pointerEvents = "none";

                                        if (hasWrapperEl) {
                                            canvas.style.position = "absolute";
                                            element.appendChild(canvas);
                                            canvas.width = element.clientWidth;
                                            canvas.height = element.clientHeight;
                                        } else {
                                            canvas.style.position = "fixed";
                                            document.body.appendChild(canvas);
                                            canvas.width = width;
                                            canvas.height = height;
                                        }

                                        bindEvents();
                                        loop();
                                    }

                                    // Bind events that are needed
                                    function bindEvents() {
                                        element.addEventListener("mousemove", onMouseMove);
                                        window.addEventListener("resize", onWindowResize);
                                    }

                                    function onWindowResize(e) {
                                        width = window.innerWidth;
                                        height = window.innerHeight;

                                        if (hasWrapperEl) {
                                            canvas.width = element.clientWidth;
                                            canvas.height = element.clientHeight;
                                        } else {
                                            canvas.width = width;
                                            canvas.height = height;
                                        }
                                    }

                                    function onMouseMove(e) {
                                        if (hasWrapperEl) {
                                            const boundingRect = element.getBoundingClientRect();
                                            cursor.x = e.clientX - boundingRect.left;
                                            cursor.y = e.clientY - boundingRect.top;
                                        } else {
                                            cursor.x = e.clientX;
                                            cursor.y = e.clientY;
                                        }

                                        if (cursorsInitted === false) {
                                            cursorsInitted = true;
                                            for (let i = 0; i < totalParticles; i++) {
                                                addParticle(cursor.x, cursor.y);
                                            }
                                        }
                                    }

                                    function addParticle(x, y, image) {
                                        particles.push(new Particle(x, y, image));
                                    }

                                    function updateParticles() {
                                        context.clearRect(0, 0, width, height);
                                        context.lineJoin = "round";

                                        let particleSets = [];

                                        let x = cursor.x;
                                        let y = cursor.y;

                                        particles.forEach(function (particle, index, particles) {
                                            let nextParticle = particles[index + 1] || particles[0];

                                            particle.position.x = x;
                                            particle.position.y = y;

                                            particleSets.push({ x: x, y: y });

                                            x += (nextParticle.position.x - particle.position.x) * 0.4;
                                            y += (nextParticle.position.y - particle.position.y) * 0.4;
                                        });

                                        colors.forEach((color, index) => {
                                            context.beginPath();
                                            context.strokeStyle = color;

                                            if (particleSets.length) {
                                                context.moveTo(
                                                    particleSets[0].x,
                                                    particleSets[0].y + index * (size - 1)
                                                );
                                            }

                                            particleSets.forEach((set, particleIndex) => {
                                                if (particleIndex !== 0) {
                                                    context.lineTo(set.x, set.y + index * size);
                                                }
                                            });

                                            context.lineWidth = size;
                                            context.lineCap = "round";
                                            context.stroke();
                                        });
                                    }

                                    function loop() {
                                        updateParticles();
                                        animationFrame = requestAnimationFrame(loop);
                                    }

                                    function destroy() {
                                        canvas.remove();
                                        cancelAnimationFrame(animationFrame);
                                        element.removeEventListener("mousemove", onMouseMove);
                                        window.addEventListener("resize", onWindowResize);
                                    };

                                    function Particle(x, y) {
                                        this.position = { x: x, y: y };
                                    }

                                    init();

                                    return {
                                        destroy: destroy
                                    }
                                }
                            </script>
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
                            <strong>관심 있는 맛집을<br>찾아보세요</strong>
                            <div class="jobs_search_field">
                                <form name="f" action="/board/list.do" method="get">
                                    <div class="field1">
                                        <select class="field1-s" name="diner-category" id="diner-category">
                                            <option class="field1-sel" value="primary" selected>카테고리</option>

                                            <option class="field1-sel">한식</option>

                                            <option class="field1-sel">양식</option>

                                            <option class="field1-sel">중식</option>

                                            <option class="field1-sel">일식</option>

                                            <option class="field1-sel">분식</option>

                                            <option class="field1-sel">아시아</option>

                                            <option class="field1-sel">카페</option>

                                            <option class="field1-sel">기타</option>
                                        </select>
                                    </div>

                                    <button class="search-btn" type="submit" id="search" title="검색하기">검색</button>
                                </form>
                            </div>

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
                        <!-- 게시판 테이블 -->
                        <style>
                            .table-container {
                                margin: 50px;
                                width: 70%;
                            }

                            .table-bhs {
                                --bs-table-striped-bg: rgba(250, 50, 0, 0.15);
                            }

                            .table-header-button {
                                display: flex;
                                justify-content: end;
                            }

                            .btn-light {
                                --bs-btn-bg: rgb(255, 104, 40);
                                --bs-btn-border-color: rgba(0, 0, 0, 0);
                                color: white;
                                --bs-btn-hover-color: white;
                                --bs-btn-active-color: white;
                                --bs-btn-hover-bg: rgb(255, 132, 40);
                                --bs-btn-active-bg: rgb(255, 118, 40);
                            }

                            .button {
                                border: 0;
                                background-color: none;
                            }
                        </style>
                        <div class="table-container">
                            <div class="table-header-button">
                                <button class="btn btn-light"
                                    onclick="location.href='write.do'"><strong>글쓰기</strong></button>
                            </div>
                            <table class="table table-bhs table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">작성자</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">작성일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${list}" var="board">
                                        <tr>
                                            <th scope="row">${board.seq}</th>
                                            <td>${board.writer.nickname}</td>
                                            <td><a href='boardcontent.do?seq=${board.seq}'>${board.title}</a>
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${board.rdate}" pattern="M.dd HH:mm" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
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