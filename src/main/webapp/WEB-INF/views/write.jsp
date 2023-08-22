<%@ page contentType="text/html;charset=utf-8" %>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
		<!DOCTYPE html>
		<html lang="ko">

		<head>
			<meta charset="UTF-8">
			<title>BHS.COM</title>
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<link rel="stylesheet" type="text/css" href="/css/apply_ask_myPage.css" />
			<link rel="stylesheet" href="/css/bootstrap.css">
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script src="/js/trim.js"></script>
			<script src="/js/star.js"></script>
			<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
			<script src="/js/bootstrap.js"></script>
			<script src="/js/util.js"></script>
			<!-- <script src=""></script> 로그인 js 넣기-->
			<style>


			</style>
			<script>
				function check() {
					if (f.title.value.trim() === "") {
						alert("제목을 입력하세요");
						return;
					} else if (f.diner_name.value.trim() === "") {
						alert("맛집을 선택하세요.")
						return;
					} else if (f.content.value.trim() === "") {
						alert("내용을 입력하세요");
						return;
					} else {
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
								$("document").ready(() => {
									const confirmButton = document.querySelector("#modal-confirm-button");
									const radioClickHandler = () => {
										confirmButton.disabled = false;
									}
									confirmButton.addEventListener("click", () => {
										const dinerNameInput = document.querySelector("input[name=diner_name]");
										const dinerSeqInput = document.querySelector("input[name=diner_seq]");
										if (document.querySelector("#search-tab").classList.contains("active")) {
											const selectedRadio = document.querySelector("input[name=dinerRadio]:checked");
											const selectedRow = selectedRadio.parentElement.parentElement;
											const selectedRowChildren = selectedRow.children;
											const category = selectedRowChildren[1].innerText;
											const name = selectedRowChildren[2].innerText;
											const location = selectedRowChildren[3].innerText;
											// console.log("category: " + category + ", name: " + name + ", location: " + location);
											dinerSeqInput.value = selectedRowChildren[4].innerText;
											dinerNameInput.value = name;
										} else {
											const category = document.querySelector("#input-diner-category").value;
											const name = document.querySelector("#input-diner-name").value;
											const location = document.querySelector("#input-diner-location").value;
											fetch("/diner/insert.do?" + new URLSearchParams({
												category: category,
												name: name,
												location: location,
											}), { method: "POST" }).then((response) => {
												if (response.ok) {
													showToast("맛집을 등록하였습니다.", "success");
													dinerNameInput.value = name;
													return response.text();
												} else {
													console.error(response);
													showToast("맛집 등록에 실패하였습니다.", "danger");
												}

											}).then((text) => {
												dinerSeqInput.value = text;
											}).catch(() => {
												console.error(response);
												showToast("맛집 등록에 실패하였습니다.", "danger");
											})
										}
									})
									const searchField = document.querySelector("#search-diner");
									searchField.addEventListener("keydown", (event) => {
										if (event.keyCode === 13) {
											event.preventDefault();
											const query = event.target.value; // 검색어
											fetch("/search/diner.do?q=" + query, { method: "GET" }).then((response) => {
												return response.json();
											}).then((json) => {
												const tbody = document.querySelector("#search-result");
												tbody.innerHTML = "";
												confirmButton.disabled = true;
												for ([index, diner] of json.entries()) {
													console.log(diner);
													const tr = document.createElement("tr");
													const th = document.createElement("th");
													const td1 = document.createElement("td");
													const td2 = document.createElement("td");
													const td3 = document.createElement("td");
													const td4 = document.createElement("td");
													th.scope = "row";
													const radio = document.createElement("input");
													radio.type = "radio";
													radio.classList.add("form-check-input");
													radio.name = "dinerRadio";
													radio.id = "dinerRadio" + index;
													radio.addEventListener("click", radioClickHandler);
													th.appendChild(radio);
													tr.appendChild(th);
													td1.innerText = diner.category;
													tr.appendChild(td1);
													td2.innerText = diner.name;
													tr.appendChild(td2);
													td3.innerText = diner.location;
													tr.appendChild(td3);
													td4.innerText = diner.seq;
													td4.style["display"] = "none";
													tr.appendChild(td4);

													tbody.appendChild(tr);
												}
											})
										}
									});
									// 					<tr>
									// 					<th scope="row"><input class="form-check-input" type="radio" name="dinerRadio" id="dinerRadio0"></th>
									// 	<td>인도</td>
									// 	<td>카레</td>
									// 	<td>성북구</td>
									// </tr>

									const locationField = document.querySelector("#input-diner-location");
									const handlePostcode = (data) => {
										console.log(data);
										locationField.value = data.address;
										confirmButton.disabled = false;
									}
									locationField.addEventListener("click", (event) => {
										new daum.Postcode({
											oncomplete: handlePostcode,
										}).open();
									});

									const setConfirmableBySearchTab = () => {
										confirmButton.disabled = document.querySelector("input[name=dinerRadio]:checked") === null;
									}

									const setConfirmableByCreateTab = () => {
										confirmButton.disabled = document.querySelector("#input-diner-location").value === "" || document.querySelector("#input-diner-name").value === "";
									};

									document.querySelector("#search-tab").addEventListener("shown.bs.tab", setConfirmableBySearchTab);
									document.querySelector("#create-tab").addEventListener("shown.bs.tab", setConfirmableByCreateTab);
									document.querySelector("#input-diner-name").addEventListener("keyup", setConfirmableByCreateTab);
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


			<div class="main">
				<div class="ask-title">
					<p>게시글 작성</p>
				</div>


				<div class="select-wrapper-content">
					<form name="f" action="write.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="nickname" value="${nickname}">
						<input type="hidden" name="email" value="${email}">
						<input type="hidden" name="csrfmiddlewaretoken"
							value="PGcbvGv2t07gw7xUD9y0LGm3cHrMXQRQxxA2kvXb6GokMMRuRJUrSMxYRBP8mPmk">
						<input type="text" name="title" class="input-title" placeholder="제목입력" required></br></br>
						<input type="hidden" name="diner_seq">
						<input type="text" name="diner_name" class="input-title" placeholder="맛집입력"
							data-bs-toggle="modal" data-bs-target="#exampleModal" readonly required></br></br>
						<textarea name="content" class="input-content"
							placeholder="내용입력&#13;&#10;답변 및 처리 과정은 이메일로 확인 할 수 있습니다."></textarea></br></br>
						<input type="button" class="select-wrapper-button" value="작성하기" onclick="check()" />
					</form>
				</div>
				<style>
					/* .btn-primary {
						--bs-btn-bg: rgb(255, 104, 40);
						--bs-btn-border-color: rgba(0, 0, 0, 0);
						color: white;
						--bs-btn-hover-color: white;
						--bs-btn-active-color: white;
						--bs-btn-hover-bg: rgb(255, 132, 40);
						--bs-btn-active-bg: rgb(255, 118, 40);
					} */
				</style>
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">맛집 입력</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<ul class="nav nav-pills nav-fill">
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="search-tab" data-bs-toggle="tab"
											data-bs-target="#search-tab-pane" type="button" role="tab"
											aria-controls="search-tab-pane" aria-selected="true">검색</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="create-tab" data-bs-toggle="tab"
											data-bs-target="#create-tab-pane" type="button" role="tab"
											aria-controls="create-tab-pane" aria-selected="false">등록</button>
									</li>
								</ul>
								<div class="tab-content" id="myTabContent">

									<div class="tab-pane fade show active" id="search-tab-pane" role="tabpanel"
										aria-labelledby="search-tab" tabindex="0">
										<form>
											<div class="mb-3">
												<label for="search-diner" class="form-label">맛집 이름 검색</label>
												<input type="text" class="form-control" id="search-diner"
													aria-describedby="searchHelp">
												<div id="searchHelp" class="form-text">맛집의 이름을 입력해 주세요!</div>
												<table class="table table-diner-search">
													<thead>
														<tr>
															<th scope="col"></th>
															<th scope="col">카테고리</th>
															<th scope="col">이름</th>
															<th scope="col">위치</th>
														</tr>
													</thead>
													<tbody id="search-result">

													</tbody>
												</table>
											</div>
										</form>
									</div>

									<div class="tab-pane fade" id="create-tab-pane" role="tabpanel"
										aria-labelledby="create-tab" tabindex="0">
										<div class="mb-3">
											<label for="input-diner-category" class="form-label">카테고리</label>
											<select class="form-select" id="input-diner-category">
												<option>한식</option>
												<option>양식</option>
												<option>일식</option>
												<option>중식</option>
												<option>분식</option>
												<option>아시아</option>
												<option>카페</option>
												<option>기타</option>
											</select>
										</div>
										<div class="mb-3">
											<label for="input-diner-name" class="form-label">맛집 이름</label>
											<input type="text" class="form-control" id="input-diner-name">
										</div>
										<div class="mb-3">
											<label for="input-diner-location" class="form-label">위치</label>
											<input type="text" class="form-control" id="input-diner-location"
												placeholder="주소 검색" readonly>
										</div>
										<div class="mb-3">
											<input type="text" class="form-control" id="input-diner-location-detail"
												placeholder="상세주소">
										</div>
									</div>
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary" id="modal-confirm-button"
									data-bs-dismiss="modal" disabled>확인</button>
							</div>
						</div>
					</div>
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