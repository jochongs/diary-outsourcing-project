//수정버튼 클릭시
const clickModifyScheduleBtnEvent = (e)=>{
    //schedule의 idx값
    const idx = e.target.dataset.idx;
    const date = new Date(e.target.dataset.date);

    //hidden처리 
    const scheduleItem = document.querySelector(`.schedule${idx}`);
    console.log(scheduleItem);
    [...scheduleItem.querySelectorAll('div')].map((div)=>{
        div.classList.add('hidden');
    });
    // [...document.querySelectorAll('.diary_container button')].map((button)=>{
    //     button.classList.add('hidden');
    // })

    //수정완료 버튼 생성
    const modifyBtn = document.createElement('button');
    modifyBtn.classList.add('modify_schedule_btn');
    modifyBtn.innerText = "수정완료";
    modifyBtn.type = "submit";
    modifyBtn.dataset.idx = idx;
    
    //취소 버튼 생성
    const deleteBtn = document.createElement('button');
    deleteBtn.classList.add('delete_schedule_btn');
    deleteBtn.innerText = "취소";
    deleteBtn.type = "button";
    deleteBtn.dataset.idx = idx;
    deleteBtn.addEventListener('click',(e)=>{
        scheduleItem.querySelector('form').remove();
        //hidden 풀어줌
        [...scheduleItem.querySelectorAll('div')].map((div)=>{
            div.classList.remove('hidden');
        });
    });
    
    //schedule_btn_container 생성
    const scheduleBtnContainer = document.createElement('div');
    scheduleBtnContainer.classList.add('schedule_btn_container');
    scheduleBtnContainer.append(modifyBtn);
    scheduleBtnContainer.append(deleteBtn);

    //textarea 생성
    const textarea = document.createElement('textarea');
    textarea.name = "contents"
    textarea.value = scheduleItem.querySelector('.schedule_contents_container p').innerText;
    
    //textarea contents container 생성
    const scheduleContentsTextareaContainer = document.createElement('div');
    scheduleContentsTextareaContainer.classList.add('schedule_contents_container');
    scheduleContentsTextareaContainer.append(textarea);

    //datetime input 생성
    const datetimeInput = document.createElement('input');
    datetimeInput.classList.add("datetime_input");
    datetimeInput.name = "datetime";
    datetimeInput.setAttribute('required',true);
    datetimeInput.type = "datetime-local";
    datetimeInputValue = `${date.getFullYear()}-${(date.getMonth()+1).toString().padStart(2,0)}-${date.getDate().toString().padStart(2,0)}T${date.getHours().toString().padStart(2,0)}:${date.getMinutes().toString().padStart(2,0)}`;
    datetimeInput.value = datetimeInputValue;
                   //datetimeInput.value = "";
 
    //datetime input  container 생성
    const scheduleTimeContainer = document.createElement('div');
    scheduleTimeContainer.classList.add('schedule_time_container');
    scheduleTimeContainer.append(datetimeInput);

    //hidden input 생성
    const hiddenIdxInput = document.createElement('input');
    hiddenIdxInput.value = idx;
    hiddenIdxInput.name = "idx";
    hiddenIdxInput.type = "hidden";

    //form 생성
    const form = document.createElement('form');
    form.action="../module/modify_schedule.jsp";
    form.append(scheduleTimeContainer);
    form.append(scheduleContentsTextareaContainer);
    form.append(scheduleBtnContainer);
    form.append(hiddenIdxInput);

    //form 삽입
    scheduleItem.append(form);
}

const clickDeleteScheduleBtnEvent = (e)=>{
    if(confirm("정말 삭제하시겠습니까?")){
        location.href = `../module/delete_schedule.jsp?date=${e.target.dataset.date}&idx=${e.target.dataset.idx}`;
    }
}

const setSheduleArray = (unorganizedScheduleArray)=>{
    const organizedScheduleArray = [];

    for(let i = 0;i<31;i++){
        organizedScheduleArray.push([]);
    }

    unorganizedScheduleArray.map((schedule)=>{
        const date = new Date(schedule[1]);
        organizedScheduleArray[date.getDate()-1].push(schedule);
    })
    return organizedScheduleArray;
}

const addSchedule = (unorganizedScheduleArray)=>{
    const year = (new Date(unorganizedScheduleArray[0][1]).getFullYear());
    const month = (new Date(unorganizedScheduleArray[0][1]).getMonth())+1;
    const scheduleArray = setSheduleArray(unorganizedScheduleArray);
    scheduleArray.map((dateScheduleArray,date)=>{
        if(dateScheduleArray.length !== 0){
            //schedule date title container 생성
            const scheduleDateTitleContainer = document.createElement('div');
            scheduleDateTitleContainer.classList.add('schedule_date_title_container');
            scheduleDateTitleContainer.innerText = `${year}년 ${month}월 ${date+1}일`;

            //schedule date container 생성
            const scheduleDateContainer = document.createElement('div');
            scheduleDateContainer.classList.add('schedule_date_container');
            scheduleDateContainer.appendChild(scheduleDateTitleContainer);

            //schedule item 생성
            dateScheduleArray.map((schedule,index)=>{
                //수정 버튼 생성
                const modifyBtn = document.createElement('button');
                modifyBtn.classList.add('modify_schedule_btn');
                modifyBtn.innerText = "일정수정";
                modifyBtn.dataset.idx = schedule[0];
                modifyBtn.dataset.date = schedule[1];
                modifyBtn.addEventListener('click',clickModifyScheduleBtnEvent);
                
                //삭제 버튼 생성
                const deleteBtn = document.createElement('button');
                deleteBtn.classList.add('delete_schedule_btn');
                deleteBtn.innerText = "일정삭제";
                deleteBtn.dataset.idx = schedule[0];
                deleteBtn.dataset.date = schedule[1];
                deleteBtn.addEventListener('click',clickDeleteScheduleBtnEvent);

                //button container 생성
                const scheduleBtnContainer = document.createElement('div');
                scheduleBtnContainer.classList.add('schedule_btn_container');
                scheduleBtnContainer.append(modifyBtn);
                scheduleBtnContainer.append(deleteBtn);

                //schedule contents 생성
                const contentsP = document.createElement('p');
                contentsP.innerText = schedule[2];

                //schedule contents container 생성
                const scheduleContentsContainer = document.createElement('div');
                scheduleContentsContainer.classList.add('schedule_contents_container');
                scheduleContentsContainer.append(contentsP);

                //넣어줄 시간 값 생성
                const scheduleDate = new Date(schedule[1]);
                let timeString = "오전";
                let hour = scheduleDate.getHours();
                const minutes = scheduleDate.getMinutes();
                if(hour >12){
                    timeString = "오후";
                    hour -= 12;
                }

                //schedule time container 생성
                const scheduleTimeContainer = document.createElement('div');
                scheduleTimeContainer.innerText = `${timeString} ${hour}시 ${minutes}분`;
                scheduleTimeContainer.classList.add('schedule_time_container');

                //schedule item 생성
                const scheduleItem = document.createElement('div');
                scheduleItem.classList.add('schedule_item');
                scheduleItem.classList.add(`schedule${schedule[0]}`);
                scheduleItem.append(scheduleTimeContainer);
                scheduleItem.append(scheduleContentsContainer);
                scheduleItem.append(scheduleBtnContainer);

                //item넣어주기
                scheduleDateContainer.append(scheduleItem);
            });
            
            //schedule container에 schedule date container 넣어주기
            const scheduleContainer = document.querySelector('.schedule_container');
            scheduleContainer.append(scheduleDateContainer);
        }
    })
}