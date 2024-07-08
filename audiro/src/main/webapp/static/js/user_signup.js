/**
 * /user/signup.jsp 파일에 포함.
 */

document.addEventListener('DOMContentLoaded', () => {
    let idChecked = false; // 사용자 아이디 중복 체크 결과. true: 사용할 수 있는 아이디.
    let passwordHashChecked = false; // 비밀번호 필드 작성 여부 체크.
    let emailChecked = false; // 이메일 필드 작성 여부 체크.
    
    const inputid = document.querySelector('input#id');
    inputid.addEventListener('change', checkid);
    
    const inputPasswordHash = document.querySelector('input#passwordHash');
    inputPasswordHash.addEventListener('change', checkPasswordHash);
    
    const inputEmail = document.querySelector('input#email');
    inputEmail.addEventListener('change', checkEmail);
    
    /* -------------------- 함수 선언 -------------------- */
    
    // 회원 가입 버튼 활성화/비활성화
    function changeButtonState() {
        const btnSignUp = document.querySelector('button#btnSignUp');
    
        if (idChecked && passwordHashChecked && emailChecked) {
            // 버튼의 class 속성 값들 중 'disabled'를 제거 -> 버튼 활성화.
            btnSignUp.classList.remove('disabled');
        } else {
            // 버튼의 class 속성에 'disabled'를 추가 -> 버튼 비활성화.
            btnSignUp.classList.add('disabled');
        }
    }
    
    // id 입력 필드의 change 이벤트 리스너:
    // 중복 아이디 체크 Ajax 요청을 보내고, 응답을 받았을 때 처리.
    function checkid(event) {
        const id = event.target.value; // inputid.value
        //console.log(id);
        
        const uri = `./checkid?id=${id}`; // 아이디 중복 체크 REST API URI
        axios
        .get(uri)
        .then((response) => {
            const checkIdResult = document.querySelector('div#checkIdResult');
            
            if (response.data === 'Y') {
                idChecked = true;
                checkIdResult.innerHTML = '멋진 아이디입니다.';
                checkIdResult.classList.add('text-success');
                checkIdResult.classList.remove('text-danger');
            } else {
                idChecked = false;
                checkIdResult.innerHTML = '사용할 수 없는 아이디입니다.';
                checkIdResult.classList.add('text-danger');
                checkIdResult.classList.remove('text-success');
            }
            
            changeButtonState(); // 버튼 활성화 여부를 변경
        })
        .catch((error) => console.log(error));
    }
    
    // 비밀번호 입력 필드의 change 이벤트 리스너
    // input#password 비어 있는 지를 체크
    function checkPasswordHash(event) {
        if (event.target.value === '') { // inputPassword.value
            passwordHashChecked = false;
        } else {
            passwordHashChecked = true;
        }
        changeButtonState(); // 버튼의 활성화/비활성화 상태를 변경
    }
    
    // 이메일 입력 필드의 change 이벤트 리스너
    // input#email 비어 있는 지를 체크
    function checkEmail(event) {
        if (event.target.value === '') {
            emailChecked = false;
        } else {
            emailChecked = true;
        }
        changeButtonState(); // 버튼의 활성화/비활성화 상태를 변경
    }
    
});
