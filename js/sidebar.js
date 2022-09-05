//sidebar에 멤버를 정렬해서 넣어주는 함수
const addMember = (unorganizedMemberArray,userPositionNumber,userTeamCode)=>{
    const organizedMemeberArray = setAccountArray(unorganizedMemberArray);
    organizedMemeberArray.map((teamObject)=>{
        //팀 데이터
        const teamName = teamObject.teamName;
        const teamCode = teamObject.teamCode;
        
        //팀 리더 데이터
        const teamLeaderName = teamObject.memberArray[0][1];
        const teamLeaderPositionNumber = teamObject.memberArray[0][5];
        const teamLeaderId = teamObject.memberArray[0][0];
 
        //team span생성
        const teamSpan = document.createElement('span');
        teamSpan.classList.add('team_name');
        teamSpan.innerText = teamName+"-";
        
        //team leader span생성
        const teamLeaderSpan = document.createElement('span');
        teamLeaderSpan.classList.add('team_leader_name');
        teamLeaderSpan.innerText = teamLeaderName;

        //team title container에 들어갈 button 생성
        const teamLeaderBtn = document.createElement('button');
        teamLeaderBtn.append(teamSpan);
        teamLeaderBtn.append(teamLeaderSpan);
        if(userPositionNumber < teamLeaderPositionNumber || (userPositionNumber===teamLeaderPositionNumber&&userTeamCode===teamCode)){
            teamLeaderBtn.addEventListener('click',()=>{
                //세션에 데이터를 저장하던지 post로 데이터를 보내주던지 하는 거 있고 이 사람 다이어리로 이동하게 하는 그런 거
                location.href = `../page/diary_page.jsp?selectedUser=${teamLeaderId}`;
            })
        }

        //team 이름과 team leader의 이름 container 생성
        const teamTitleContainer = document.createElement('div');
        teamTitleContainer.classList.add('team_title_container');
        teamTitleContainer.append(teamLeaderBtn);

        //팀 컨테이너 생성
        const teamContainer = document.createElement('div');
        teamContainer.classList.add('team_container');
        teamContainer.append(teamTitleContainer);

        //팀 멤버 컨테이너 생성
        const teamMemberContainer = document.createElement('div');
        teamMemberContainer.classList.add('team_member_container');

        //멤버 아이템을 만들어서 팀 멤버 컨테이너에 삽입
        teamObject.memberArray.map((member,index)=>{
            //멤버의 데이터 저장
            const memberId = member[0];
            const memberName = member[1];
            const memberTeamCode = member[2];
            const memberTeamName = member[3];
            const memberPositionName = member[4];
            const memberPositionNumber = member[5];

            //멤버의 position 이름 span 생성
            const memberPositionSpan = document.createElement('span');
            memberPositionSpan.classList.add('member_position');
            memberPositionSpan.innerText = memberPositionName + "-";

            //멤버의 name span 생성
            const memberNameSpan = document.createElement('span');
            memberNameSpan.classList.add('member_name');
            memberNameSpan.innerText = memberName;

            //button 생성
            const button = document.createElement('button');
            button.append(memberPositionSpan);
            button.append(memberNameSpan);
            if(userPositionNumber < 1 || (userPositionNumber ==1 &&  memberTeamCode==userTeamCode)){
                //button에 클릭 이벤트 생성
                button.addEventListener('click',()=>{
                    location.href = `../page/diary_page.jsp?selectedUser=${memberId}`;
                });
                button.classList.add('active');
            }

            //member item div 생성
            const memberItem = document.createElement('div');
            memberItem.classList.add('team_member_item');
            memberItem.append(button);

            //팀 멤버 컨테이너에 삽입
            teamMemberContainer.append(memberItem);
        })

        //팀 컨테이너에 팀 멤버컨테이너 삽입
        teamContainer.append(teamMemberContainer);

        //팀 컨테이너를 사이드바 메인에 삽입
        document.querySelector('.sidebar_main').append(teamContainer);
    })
}

/**데이터베이스에서 가져온 2차원 acocunt데이터를 team단위로 정렬시켜 return해주는 함수
 * 
 * @param {*} unorganizedMemberArray 데이터베이스에서 가져온 2차원 account 데이터
 * @returns team단위로 정렬된 account 데이터
 */
const setAccountArray = (unorganizedMemberArray)=>{
    console.log(unorganizedMemberArray);
    const organizedMemeberArray = [];
    unorganizedMemberArray.map((member,index)=>{
        const memberTeamCode = member[2]; //팀코드가되어야함
        const memeberTeamName = member[3]; //팀코드가되어야함
        let teamIndex = -1;
        organizedMemeberArray.map((teamObject,index)=>{
            if(teamObject.teamCode === memberTeamCode){
                teamIndex=index;
            }
        })
        if(teamIndex === -1){
            const team = {
                teamCode : memberTeamCode,
                teamName : memeberTeamName,
                memberArray : [
                    member
                ]
            }
            organizedMemeberArray.push(team);
        }else{
            organizedMemeberArray[teamIndex].memberArray.push(member);
        }
    })
    return organizedMemeberArray;
}

//sidebar를 열어주는 함수
const closeSidebar = ()=>{
    document.querySelector('.sidebar_background').classList.add('unactive');
    document.querySelector('.sidebar_background').classList.remove('active');

    document.querySelector('.sidebar_container').classList.add('unactive');
    document.querySelector('.sidebar_container').classList.remove('active');

    document.body.style.overflowY = "unset";
}

//sidebar를 닫아주는 함수
const openSidebar = ()=>{   
    document.querySelector('.sidebar_background').classList.add('active');
    document.querySelector('.sidebar_background').classList.remove('unactive');

    document.querySelector('.sidebar_container').classList.add('active');
    document.querySelector('.sidebar_container').classList.remove('unactive');

    document.body.style.overflowY = "hidden";
}

//내 다이어리로 이동 버튼 클릭 이벤트
const clickMoveMydiaryBtnEvent = ()=>{
    location.href = "../page/diary_page.jsp";
}

//sidebar배경 클릭 이벤트
const clickSidebarBackgroundEvent = ()=>{
    closeSidebar();
}