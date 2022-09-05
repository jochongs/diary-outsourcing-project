//아이디를 체크해주는 함수
const checkIdFunc = (checkId,id)=>{
    if(checkId){
        //아이디를 사용할 수 있으면
        const title = document.querySelector('.id_check_title_container');
        title.innerText = "사용가능한 아이디입니다.";

        const otherIdBtn = document.createElement('button');
        otherIdBtn.classList.add('use_other_id_btn');
        otherIdBtn.innerText = "다른 아이디 사용하기";
        otherIdBtn.addEventListener('click',()=>{
            window.close();
        })

        const useIdBtn = document.createElement('button');
        useIdBtn.classList.add('use_id_btn');
        useIdBtn.innerText = "사용하기";
        useIdBtn.addEventListener('click',()=>{
            //hidden input에 데이터를 넣음
            window.opener.document.querySelector(".hidden_id_input").value = id;

            //임시로 id를 입력하는 input에 값을 넣고 고정시킴
            window.opener.document.querySelector(".check_id_input").value = id;
            window.opener.document.querySelector(".check_id_input").setAttribute('readOnly',true);

            //중복확인 버튼 삭제
            window.opener.document.querySelector('.check_id_btn').remove();

            /*
            //다른 아이디 사용 버튼 듦
            const button = document.createElement('button');
            button.innerText = '다른 아이디';
            button.type = "button";
            button.classList.add('check_id_btn');
            
            //다른 아이디 사용 버튼의 클릭 이벤트를 만들어줌
            button.addEventListener('click',()=>{
                //아이디 input을 사용가능하게 만듦
                window.opener.document.querySelector(".check_id_input").value = "";
                window.opener.document.querySelector(".check_id_input").setAttribute('readOnly',false);

                //hidden input의 value를 none으로 바꿈
                window.opener.document.querySelector('.hidden_id_input').value = "none";

                //중복확인 버튼을 만듦
                const checkIdBtn = document.createElement('button');
                checkIdBtn.classList.add('check_id_btn');
                checkIdBtn.type = "button";
                checkIdBtn.onclick = clickCheckIdBtnEvent();
                checkIdBtn.innerText = "중복확인";

                //중복확인 버튼을 넣어줌
                window.opener.document.querySelector('.id_input_container').append(checkIdBtn);
                
                다른 아이디 사용버튼을 삭제
            })

            다른 아이디 사용 버튼을 넣어줌
            window.opener.document.querySelector('.id_input_container').append(button);
            */

            //창 닫기
            window.close();
        })

        const div = document.querySelector('.id_check_btn_container');
        div.append(otherIdBtn);
        div.append(useIdBtn);

        const p = document.createElement('p');
        p.innerText = id;
        title.append(p);
    }else{
        //아이디를 사용할 수 없으면
        alert('사용이 불가능한 아이디입니다.');
        window.close();
    }
}
