<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 부트스크랩 -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- date picker -->
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<!-- 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
    <form class="container signup">
        <h1 class="title text-center">회원가입</h1>
        <div class="box" style="height: 100px; border: 1px solid black;">약관내용</div>
        <div class="form-group">
            <div class="form-check-inline">
                <label class="form-check-label">
                  <input type="checkbox" class="form-check-input" name="agreement">동의
                </label>
              </div>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" placeholder="아이디" name="id">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="비밀번호" name="pw">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="비밀번호 확인" name="pw2">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" placeholder="이름" name="name">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" placeholder="생념월일" name="birth" id="birth">
        </div>
        <div class="form-group">
            <div class="form-check-inline">
                <label class="form-check-label">
                  <input type="checkbox" class="form-check-input" name="gender" value="남성">남성
                </label>
              </div>
              <div class="form-check-inline">
                <label class="form-check-label">
                  <input type="checkbox" class="form-check-input" name="gender" value="여성">여성
                </label>
              </div>
        </div>
        <div class="form-group">
            <div class="form-inline mb-2">
                <input type="text" id="postcode" placeholder="우편번호" class="form-control col-6" >
                <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="form-control col-6">
            </div>
            <input type="text" id="address" placeholder="주소" class="form-control mb-2">
            <input type="text" id="detailAddress" placeholder="상세주소" class="form-control mb-2">
            <input type="hidden" name="address">
        </div>
        <button class="btn btn-outline-success col-12">회원가입</button>
    </form>
    <script>
        $(function(){
            $('form').submit(function(){
                var id = $('[name=id]').val().trim();
                var pw = $('[name=pw]').val().trim();
                var pw2 = $('[name=pw2]').val().trim();
                var name = $('[name=name]').val().trim();
                var birth = $('[name=birth]').val().trim();
                var genderObj = $('[name=gender]:checked');
                var gender = genderObj.length == 0 ? '': genderObj.val();
                var isAgree = $('[name=agreement]').is(':checked');
                //동의에 체크되지 않으면
                if(!isAgree){
                    alert('동의에 체크해야합니다.');
                    $('[name=agreement]').focus();
                    return false;
                }
                if(id == ''){
                    alert('아이디를 입력하세요.');
                    $('[name=id]').focus();
                    return false;
                }
                if(pw == ''){
                    alert('비밀번호를 입력하세요.');
                    $('[name=pw]').focus();
                    return false;
                }
                if(pw2 != pw){
                    alert('비밀번호가 일치하지 않습니다.');
                    $('[name=pw2]').focus();
                    return false;
                }
                if(name == ''){
                    alert('이름을 입력하세요.');
                    $('[name=name]').focus();
                    return false;
                }
                if(birth == ''){
                    alert('생일을 입력하세요.');
                    $('[name=birth]').focus();
                    return false;
                }
                if(gender == ''){
                    alert('성별을 선택하세요.');
                    $('[name=gender]').focus();
                    return false;
                }
                var address = $('#address').val() + ' ' + $('#detailAddress').val();
                $('[name=address]').val(address);
            });
        });

        $(function(){
            $('#birth').datepicker();
            $('#birth').datepicker('option', 'dateFormat', 'yy-mm-dd');
        });

        function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
    </script>
</body>
</html>