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

        console.log(id,pw,name,phoneNumber,position_code,team_code);
    })
}

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

