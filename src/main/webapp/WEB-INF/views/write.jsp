<%@ page contentType="text/html;charset=utf-8" %>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
		<!DOCTYPE html>
		<html lang="ko">

		<head>
			<meta charset="UTF-8">
			<title>Tropical Night Litchi-Root</title>
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<link rel="stylesheet" type="text/css" href="/css/apply_ask_myPage.css" />
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script src="/js/trim.js"></script>
			<!-- <script src=""></script> 로그인 js 넣기-->
			<style>


			</style>
			<script>
				function check() {
					var companyVal = f.company.value;
					if (companyVal.length == 0) {
						alert("회사를 선택해 주세요.");
						return false;
					}
					var recruitmentVal = f.recruitment.value;
					if (recruitmentVal.length == 0) {
						alert("직종을 선택해 주세요.");
						return false;
					}
					var titleVal = f.title.value;
					titleVal = trim(titleVal);
					if (titleVal.length == 0) {
						alert("제목을 입력해 주세요.");
						f.title.value = "";
						f.title.focus();
						return false;
					}
					var contextVal = f.context.value;
					contextVal = trim(contextVal);
					if (contextVal.length == 0) {
						alert("내용을 입력해 주세요.");
						f.context.value = "";
						f.context.focus();
						return false;
					}
					if (confirm("문의하시겠습니까? 문의한 내용과 답변은 로그인한 이메일로 전송됩니다.")) {
						f.submit();
					}
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
												value="PGcbvGv2t07gw7xUD9y0LGm3cHrMXQRQxxA2kvXb6GokMMRuRJUrSMxYRBP8mPmk">
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


			<div class="main">
				<div class="ask-title">
					<p>1:1문의</p>
					<span>답변 및 처리 과정은 이메일로 확인 할 수 있습니다.</span>
				</div>
				<div class="selected-items">
					<div class="select-wrapper-company">
						<div class="select-company">
							<div class="select__trigger-company"><span>회사</span>
								<div class="arrow"></div>
							</div>
							<div class="custom-options-company">
								<span class="custom-option-company selected mustDelete" data-value="">회사</span>

								<span class="custom-option-company" data-value="1">Bang SOFT</span>


								<span class="custom-option-company" data-value="2">IDLE</span>


								<span class="custom-option-company" data-value="3">Tuna Salad</span>


								<span class="custom-option-company" data-value="4">Fantastic 4</span>


								<span class="custom-option-company" data-value="5">TN World Legend Bomi</span>


								<span class="custom-option-company" data-value="0">기타</span>
							</div>
						</div>
					</div>
					<div class="select-wrapper-recruitment">
						<div class="select-recruitment">
							<div class="select__trigger-recruitment"><span>직종</span>
								<div class="arrow"></div>
							</div>
							<div class="custom-options-recruitment">

							</div>
						</div>
					</div>
				</div>
				<div class="select-wrapper-content">
					<form name="f" action="ask_ok" method="post" enctype="multipart/form-data">
						<input type="hidden" name="csrfmiddlewaretoken"
							value="PGcbvGv2t07gw7xUD9y0LGm3cHrMXQRQxxA2kvXb6GokMMRuRJUrSMxYRBP8mPmk">
						<input type="hidden" name="company" id="company" value="">
						<input type="hidden" name="recruitment" id="recruitment" value="">
						<input type="text" name="title" class="input-title" placeholder="제목입력"></br></br>
						<textarea name="context" class="input-context"
							placeholder="내용입력&#13;&#10;답변 및 처리 과정은 이메일로 확인 할 수 있습니다."></textarea></br></br>
						<input type="button" class="select-wrapper-button" value="문의하기" onclick="check()" />
						</from>
				</div>
			</div>

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
		</body>
		<script>
			$(document).click(function (e) {
				if ($(e.target).hasClass("select__trigger-company")) {
					document.querySelector('.select-recruitment').classList.remove('open');
					$('.select-company').toggleClass('open');
				} else if ($(e.target).hasClass("select__trigger-recruitment")) {
					if ($(".custom-options-recruitment").children().length == 0) {
						alert("회사 먼저 선택해 주세요.");
						return false;
					}
					document.querySelector('.select-company').classList.remove('open');
					$('.select-recruitment').toggleClass('open');
				} else {
					document.querySelector('.select-company').classList.remove('open');
					document.querySelector('.select-recruitment').classList.remove('open');
				}
			})
			for (const option of document.querySelectorAll(".custom-option-company")) {
				option.addEventListener('click', function () {
					if (!this.classList.contains('selected')) {
						this.parentNode.querySelector('.custom-option-company.selected').classList.remove('selected');
						this.classList.add('selected');
						if (document.querySelector('.mustDelete') != null) {
							document.querySelector('.mustDelete').remove();
						}
						document.getElementById('company').value = this.textContent;
						this.closest('.select-company').querySelector('.select__trigger-company span').textContent = this.textContent;
						let spanNode = document.createElement("span");
						spanNode.className = "custom-option-recruitment selected";
						spanNode.textContent = "직종";
						document.querySelector('.custom-options-recruitment').appendChild(spanNode);
						if (this.getAttribute("data-value") == 0) {
							const boxes = document.querySelectorAll('.custom-option-recruitment');
							boxes.forEach(box => {
								box.remove();
							});
							let list = ['로그인오류 관련', '보안차단 관련', '기타'];
							console.log(list[0])
							for (var i = 0; i < list.length; i++) {
								let spanNode = document.createElement("span");
								spanNode.className = "custom-option-recruitment";
								spanNode.textContent = list[i];
								document.querySelector('.custom-options-recruitment').appendChild(spanNode);
							};
							document.querySelector('.select__trigger-recruitment span').textContent = "직종";
							recruitmentRefresh();
						} else {
							$.ajax({
								type: 'GET',
								url: '/selectCompany/' + this.getAttribute("data-value"),
								success: function (json) {
									console.log(document.querySelector('.custom-option-recruitment'));
									const boxes = document.querySelectorAll('.custom-option-recruitment');
									boxes.forEach(box => {
										box.remove();
									});
									json_data = JSON.parse(json)
									for (var i = 0; i < json_data.length; i++) {
										let spanNode = document.createElement("span");
										spanNode.className = "custom-option-recruitment";
										spanNode.textContent = json_data[i].fields.re_sector;
										spanNode.setAttribute("data-value", json_data[i].pk);
										document.querySelector('.custom-options-recruitment').appendChild(spanNode);
									};
									document.querySelector('.select__trigger-recruitment span').textContent = "직종";
									recruitmentRefresh()
								},
								error: function (xhr, errmsg, err) {
									console.log(xhr.status + ": " + xhr.responseText);
								}
							});
						}
					}
				})
			}

			if (document.querySelector('.custom-option-recruitment.selected') != null) {
				document.querySelector('.select__trigger-recruitment span').textContent = document.querySelector('.custom-option-recruitment.selected').textContent;
			};
			function recruitmentRefresh() {
				for (const option of document.querySelectorAll(".custom-option-recruitment")) {
					option.addEventListener('click', function () {
						if (!this.classList.contains('selected')) {
							if (this.parentNode.querySelector('.custom-option-recruitment.selected') != null) {
								this.parentNode.querySelector('.custom-option-recruitment.selected').classList.remove('selected');
							};
							this.classList.add('selected');
							document.getElementById('recruitment').value = this.textContent;
							this.closest('.select-recruitment').querySelector('.select__trigger-recruitment span').textContent = this.textContent;
						}
					})
				}
			}
			recruitmentRefresh()
		</script>

		</html>