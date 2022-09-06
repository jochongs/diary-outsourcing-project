//윈도우 로드시
window.onload = ()=>{
    const form = document.querySelector('.signup_form');
    form.addEventListener('submit',(e)=>{
        e.preventDefault();
        
        const id = document.querySelector('.hidden_id_input').value;
        const pw = document.querySelector('.pw_input').value;
        const name = document.querySelector('.name_input').value;
        const phoneNumber = document.querySelector('.phone_number_input').value;
        
        const teamSelect = document.querySelector('.team_select');
        const team_code = teamSelect.options[teamSelect.selectedIndex].value;

        const positionSelect = document.querySelector('.position_select');
        const position_code = positionSelect.options[teamSelect.selectedIndex].value;

        const pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$/;
        const phoneNumberReg = /^[0-9]+$/;
        if(id==='none'){
            alert("아이디 중복확인을 눌러주세요");
            return 0;
        }
        if(pwReg.length === 0){
            alert("비밀번호를 입력해야합니다.");
            return 0;
        }
        if(!pwReg.test(pw)){
            alert('비밀번호는 영문자와 특수기호,숫자가 섞인 8~12자 문자여야 합니다.');
            return 0;
        }
        if(name.length === 0){
            alert('이름을 입력해주세요');
            return 0;
        }
        if(phoneNumber.length !== 11){
            alert('핸드폰 번호를 정확하게 입력해주세요. -없이 11자리입니다.');
            return 0;
        }
        if(!phoneNumberReg.test(phoneNumber)){
            alert("핸드폰번호는 숫자만 입력할 수 있습니다.");
        }
        if(position_code.length===0){
            alert('직급을 선택해주세요');
            return 0;
        }
        if(team_code.length === 0){
            alert("팀을 선택해주세요");
            return 0;
        }
        
        form.submit();
    })
}

//아이디 체크 버튼 클릭 이벤트
const clickCheckIdBtnEvent = ()=>{
    const check_id = document.querySelector('.check_id_input').value;
    if(check_id.length === 0){
        alert("아이디를 입력한 후 중복확인을 할 수 있습니다.");
    }else{
        const idReg = /^[a-z]+[a-z0-9]{5,13}$/g;
        if(idReg.test(check_id)){
            window.open(`../page/id_check_page.jsp?id=${check_id}`, '아이디 만들기', 'width=700px,height=800px,resizeable=no');       
        }else{
            alert('아이디는 영문자로 시작하는 6~12자의 영문자와 숫자이어야 합니다.');
        }
    }
}

