<%@ page language="java" contentType="text/html;charset=UTF-8"
		 pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<%@include file="../include/static-head.jsp"%>
	<title>커피 수정 | Starbucks Korea</title>
	<link rel="stylesheet" type="text/css" href="/css/menuAdd.css">



</head>
<body>
<%@include file="../include/header.jsp"%>
<main class="container-wrapper">
	<form id="form" action="/menu/update" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
		<div class="container">
			<div class="container-name">
				<h2>스타벅스 원두 추가</h2>
			</div>
			<div class="context-top">
				<div class="coffee-img">
					<div class="image">
						<img src="${menu.image}"/>
					</div>
					<input type="file" name="file">
					<input type="hidden" name="image">
				</div>

				<div class="coffee-description">
					<div class="name">
						<div class="name-left">
							<h3>한글이름</h3><input type="text" name="nameKr" value="${menu.nameKr}" />
							<h3>영어이름</h3><input type="text" name="nameEn" value="${menu.nameEn}" />
						</div>
						<div class="name-right" >
							<p>음료 카테고리</p>
							<select class="form-select type" aria-label="Default select example" name="kind" onchange="categoryChange(this)">
								<option value="">선택안함</option>
								<option value="category">음료 카테고리</option>
								<option value="theme">음료 테 마</option>
							</select>
							<p>음료 종류</p>
							<select class="form-select type" aria-label="Default select example" name="type" id="good" onchange="typeChange(this)">
								<option>선택안됨</option>
							</select>
							<div style="display: none">
								<p>에스프레소 종류</p>
								<select class="form-select type" aria-label="Default select example" name="espressoKind">
									<option>선택안됨</option>
									<option value="americano">아메리카노</option>
									<option value="cappuccino">카푸치노</option>
									<option value="mocha">모카</option>
								</select>
							</div>
						</div>
					</div>
					<div class="description-sum">
						<h3>제품 설명란</h3>
						<textarea name="descriptionSummary">${menu.descriptionSummary}</textarea>
					</div>

					<div class="weight">
						<h3>ml</h3>
						<input type="text" name="weight" value="${menu.weight}"/>
					</div>
					<div class="weight2">
						<h3>fl oz</h3>
						<input type="text" name="weight2" value="${menu.weight2}"/>
					</div>
					<c:if test="${empty menu.calorie1}">
					<div class="weight">
						<h3>1회 제공량 (kcal)</h3>
						<input type="text" name="calorie1" value="${menu.calorie1}"/>
					</div>
					</c:if>
					<div class="weight2">
						<h3>나트륨 (mg)</h3>
						<input type="text" name="calorie2" value="${menu.calorie2}"/>
					</div>
					<div class="weight">
						<h3>포화지방 (g)</h3>
						<input type="text" name="calorie3" value="${menu.calorie3}"/>
					</div>
					<div class="weight2">
						<h3>당류 (g)</h3>
						<input type="text" name="calorie4" value="${menu.calorie4}"/>
					</div>
					<div class="weight">
						<h3>단백질 (g)</h3>
						<input type="text" name="calorie5" value="${menu.calorie5}" />
					</div>
					<div class="weight2">
						<h3>카페인 (mg)</h3>
						<input type="text" name="calorie6" value="${menu.calorie6}" />
					</div>

				</div>
			</div>
			<div class="context-description-bottom">
				<div class="description-bottom-left">
					<div class="description-bottom-left-top">
						<h3>상세 설명</h3>
						<textarea name=descriptionDetail >${menu.descriptionDetail}</textarea>
					</div>

				</div>

			</div>
			<div>
				<input type="hidden" name="sid" value="${menu.id}">
			</div>
			<div class="context-bottom" >
				<a href="javascript:void(0)"><button id="edit" class="btn btn-primary submit" type="button">수정</button></a></a>
				<a href="/menu/menuListDetail?id=${menu.id}"><button id="cancel" class="btn btn-primary submit" type="button">취소</button></a>
			</div>

		</div>
	</form>

</main>


<jsp:include page="../include/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
	function typeChange(e){
		if(e.value == "espresso") {
			e.nextElementSibling.lastElementChild.removeAttribute('disabled');
			e.nextElementSibling.style.display = "block";
		}else{
			e.nextElementSibling.lastElementChild.disabled = true;
			e.nextElementSibling.style.display = "none";
		}
	}
	function categoryChange(e) {
		let d;
		const good_a = ["", "espresso", "coldbrew", "brewedcoffee"];
		const good_b = ["theme"];
		const good_c = ["선택없음"];

		const target = document.getElementById("good");

		if(e.value == "category") {
			d = good_a;
		}else if(e.value == "theme") {
			d = good_b;
		}else if(e.value == "") {
			d = good_c;
		}

		target.options.length = 0;

		for (const x of d) {
			const opt = document.createElement("option");
			opt.value = x;
			console.info("x  ",x);
			if(x == ""){
				opt.textContent = "선택없음";
			}
			else if(x == "espresso"){
				opt.textContent = "에스프레소";
			}else if(x == "coldbrew"){
				opt.textContent = "콜드브루";
			}else if(x == "brewedcoffee"){
				opt.textContent = "브루드커피";
			}
			if(x == "theme") {
				opt.textContent = "테마";
			}
			target.appendChild(opt);
		}
	}

	function defaultKinds(){
		const list = [...document.querySelector('select[name="kind"]').children];
		for(const k of list){
			if(k.value === "${menu.kind}"){
				k.setAttribute("selected","");
				break;
			}
		}
	}
	function defaultTypes(){
		const list = [...document.querySelector('select[name="type"]').children];
		for(const k of list){
			if(k.value === "${menu.type}"){
				k.setAttribute("selected","");
				break;
			}
		}
	}

	function defaultEspressokind(){
		if(${menu.espressoKind != null}){
			const list = [...document.querySelector('select[name="espressoKind"]').children];
			for(const k of list){
				if(k.value === "${menu.espressoKind}"){
					k.setAttribute("selected","");
					break;
				}
			}
		}
	}

	function valueOfKinds(){
		const kinds = [...document.querySelector('select[name="kind"]').children];
		for(const k of kinds){
			if(k.value === "${menu.kind}"){
				k.classList.add('selected');
				break;
			}
		}
	}
	function valueOfTypes(){
		const kinds = [...document.querySelector('select[name="type"]').children];
		for(const k of kinds){
			if(k.value === "${menu.type}"){
				k.classList.add('selected');
				break;
			}
		}
	}



	function uploadImg(){

		// 기존에 있던 파일 이름 가져오기 - 파일을 재선택시 기존의 전송된 파일 삭제 및 수정시 기존 이미지경로 저장
		const oldFileName = document.querySelector(".image").firstElementChild.getAttribute("src");
		console.log(oldFileName);
		document.querySelector("input[name='image']").value = oldFileName;

		document.querySelector("input[name='file']").addEventListener("change",  e => {
			e.preventDefault();
			// 1. 드롭된 파일 데이터 읽기
			console.log(e);
			const file = e.target.files[0];
			console.log('file data: ', file);

			// 2. 파일 데이터를 전송하기 위해 FormData객체필요
			const formData = new FormData();

			// 3. 전송할 파일을 formData안에 포장(form 태그로 submit 을 하지않고 보낼때)
			formData.append('file',file);

			// 4. 비동기 요청 전송
			const reqInfo = {
				method: 'POST',
				body: formData
			};
			fetch('/menu/ajax-upload?type=drink', reqInfo)
					.then(res => {
						//console.log(res.status);
						return res.text();
					})
					.then(fileName => {
						console.log(fileName);
						// 선택한 이미지를 보여주는 함수
						showFileData(fileName);
						// DB에 파일경로 저장을 위해 input 태그에 파일 경로 저장.
						document.querySelector("input[name='image']").value = fileName;
					});

			// 기존의 이미지파일 삭제 비동기 요청
			const reqInfoDel = {
				method: 'DELETE',
				body: oldFileName
			};
			fetch('/menu/deleteFile',reqInfoDel)
					.then(res => res.text())
					.then(msg =>{
						console.log(msg);
					})
		})
	}
	// 파일을 화면에 보여주는 함수
	function showFileData(fileName) {

		//원본 파일 명 추출
		let originFileName = fileName.substring(fileName.lastIndexOf("_") + 1);


		// 이미지면 썸네일을 렌더링
		const $img = document.querySelector('.image').firstElementChild;
		// 단순히 src 에 파일경로만 적으면 이미지를 불러오지 못함.
		// 이미지렌더링을 위해 서버로 파일 전송 비동기 요청을 하고 파일을 로드하던지,
		// 이미지 src의 경로를 적어주고, 스프링에서 WebConfig.java 에서 리소스 경로 매칭을 해주면
		// 이미지를 불러올 수 있음.
		$img.setAttribute('src', fileName);
		$img.setAttribute('alt', originFileName);
	}

	function submitData(){
		document.querySelector('.context-bottom').addEventListener('click', e=>{

			if(e.target.matches('#edit')) {
				e.preventDefault();
				document.querySelector('input[name="file"]').setAttribute("disabled", "");
				// = document.querySelector('input[name="file"]').disabled=true;
				const $form = document.getElementById('form');
				$form.submit();
			}

		})
	}

	// 우클릭 드래그 방지 함수
	function noDragAndRightClick(){
		const $body = document.querySelector('body');
		$body.setAttribute("oncontextmenu", "return false");
		$body.setAttribute("onselectstart", "return false");
		$body.setAttribute("ondragstart", "return false");

	}

	(function (){
		valueOfKinds();
		valueOfTypes();
		noDragAndRightClick();
		uploadImg();
		submitData();
		defaultKinds();
		defaultTypes();
		defaultEspressokind();
		categoryChange();
		typeChange();
	})();
</script>
</body>
</html>