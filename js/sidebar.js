const closeSidebar = ()=>{
    document.querySelector('.sidebar_background').classList.add('unactive');
    document.querySelector('.sidebar_background').classList.remove('active');

    document.querySelector('.sidebar_container').classList.add('unactive');
    document.querySelector('.sidebar_container').classList.remove('active');

    document.body.style.overflowY = "unset";
}

const openSidebar = ()=>{   
    document.querySelector('.sidebar_background').classList.add('active');
    document.querySelector('.sidebar_background').classList.remove('unactive');

    document.querySelector('.sidebar_container').classList.add('active');
    document.querySelector('.sidebar_container').classList.remove('unactive');

    document.body.style.overflowY = "hidden";
}

const clickSidebarBackgroundEvent = ()=>{
    closeSidebar();
}

const addMember = (unorganizedMemberArray,userPositionNumber,userTeamCode)=>{
    console.log(userPositionNumber,userTeamCode);
    const organizedMemeberArray = setAccountArray(unorganizedMemberArray);
    console.log(organizedMemeberArray);
    organizedMemeberArray.map((teamObject)=>{
        //팀 데이터
        const teamName = teamObject.teamName;
        const teamCode = teamObject.teamCode;
        
        //팀 리더 데이터
        const teamLeaderName = teamObject.memberArray[0][1];
        const teamLeaderPositionNumber = teamObject.memberArray[0][5];
 
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
            const memeberId = member[0];
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

const Array = [
    {
        teamCode : "",
        teamMember : [],
    }
]