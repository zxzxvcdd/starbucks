<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <%@include file="../include/static-head.jsp"%>
    <link rel="stylesheet" type="text/css" href="/css/menuAdd.css">



</head>
<body>
<%@include file="../include/header.jsp"%>
<main class="container-wrapper">
    <form id="form" action="/menu/addMenu" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
        <div class="container">
            <div class="container-name">
                <h2>스타벅스 원두 추가</h2>
            </div>
            <div class="context-top">
                <div class="coffee-img">
                    <div class="image">
                        <img src="/images/logo.png"/>
                    </div>
                    <input type="file" name="file">
                    <input type="hidden" name="image">
                </div>

                <div class="coffee-description">
                    <div class="name">
                        <div class="name-left">
                            <h3>한글이름</h3><input type="text" name="nameKr" />
                            <h3>영어이름</h3><input type="text" name="nameEn" />
                        </div>
                        <div class="name-right" >
                            <p>음료 카테고리</p>
                            <select class="form-select type" aria-label="Default select example" name="kind"  onchange="categoryChange(this)">
                                <option value="">선택안함</option>
                                <option value="bean">카테고리</option>
                                <option value="via">테 마</option>


                            </select>
                            <p>음료 종류</p>
                            <select class="form-select type"aria-label="Default select example" name="type" id="good">
<%--                                class="form-select type"--%>
<%--                                <option value="">선택안함</option>--%>
<%--                                <option value="blond_roast">아메리카노</option>--%>
<%--                                <option value="cold_brew">콜드블루</option>--%>
<%--                                <option value="dark_roast">다크로스트</option>--%>

<%--                                <option value="tema1">테마상품</option>--%>
                                <option>선택안됨</option>
                            </select>
                        </div>
                    </div>
                    <div class="description-sum">
                        <h3>제품 설명란</h3>
                        <textarea name="descriptionSummary" ></textarea>
                    </div>

                    <div class="weight">
                        <h3>ml</h3>
                        <input type="text" name="weight" />
                    </div>
                    <div class="weight2">
                        <h3>fl oz</h3>
                        <input type="text" name="weight2" />
                    </div>
                    <div class="weight">
                        <h3>1회 제공량 (kcal)</h3>
                        <input type="text" name="calorie1" />
                    </div>
                    <div class="weight2">
                        <h3>나트륨 (mg)</h3>
                        <input type="text" name="calorie2" />
                    </div>
                    <div class="weight">
                        <h3>포화지방 (g)</h3>
                        <input type="text" name="calorie3" />
                    </div>
                    <div class="weight2">
                        <h3>당류 (g)</h3>
                        <input type="text" name="calorie4" />
                    </div>
                    <div class="weight">
                        <h3>단백질 (g)</h3>
                        <input type="text" name="calorie5" />
                    </div>
                    <div class="weight2">
                        <h3>카페인 (mg)</h3>
                        <input type="text" name="calorie6" />
                    </div>

                </div>
            </div>
            <div class="context-description-bottom">
                <div class="description-bottom-left">
                    <div class="description-bottom-left-top">
                        <h3>상세 설명</h3>
                        <textarea name=descriptionDetail ></textarea>
                    </div>

                </div>

            </div>

            <div class="context-bottom" >
                <a href="javascript:void(0)"><button id="addData" class="btn btn-primary submit" type="button">추가</button></a></a>
                <a href="/menu/list"><button id="cancel" class="btn btn-primary submit" type="button">취소</button></a>
            </div>

        </div>
    </form>

</main>

<jsp:include page="../include/footer.jsp"></jsp:include>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>--%>
<script>
    function categoryChange(e) {
        var good_a = ["americano", "coldbrew", "darkroast"];
        var good_b = ["theme"];

        var good_c = ["선택없음"];

        var target = document.getElementById("good");

        if(e.value == "bean") var d = good_a;
        else if(e.value == "via") var d = good_b;

        else if(e.value == "") var d = good_c;


        target.options.length = 0;

        for (x in d) {
            var opt = document.createElement("option");
            opt.value = d[x];
            if(d[x] == "americano"){
                opt.innerHTML = "아메리카노";
            }else if(d[x] == "coldbrew"){
                opt.innerHTML = "콜드브루";
            }else if(d[x] == "darkroast"){
                opt.innerHTML = "다크로스트";
            }
            if(d[x] == "theme") {
                opt.innerHTML = "테마";
            }
            target.appendChild(opt);
        }
    }

    function uploadImg(){
        document.querySelector("input[name='file']").addEventListener("change",  e => {
            e.preventDefault();
            // 1. 드롭된 파일 데이터 읽기
            console.log(e);
            const file = e.target.files[0];
            console.log('file data: ', file);

            // 기존에 있던 파일 이름 가져오기 - 파일을 재선택시 기존의 전송된 파일 삭제를 위해
            const oldFileName = document.querySelector(".image").firstElementChild.getAttribute("src");
            console.log(oldFileName);

            // 2. 파일 데이터를 전송하기 위해 FormData객체필요
            const formData = new FormData();

            // 3. 전송할 파일을 formData안에 포장(form 태그로 submit 을 하지않고 보낼때)
            formData.append('file',file);

            // 4. 비동기 요청 전송
            const reqInfo = {
                method: 'POST',
                body: formData
            };
            fetch('/menu/ajax-upload', reqInfo)
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

            if(e.target.matches('#addData')) {
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
        noDragAndRightClick();
        uploadImg();
        submitData();
    })();
</script>
</body>
</html>