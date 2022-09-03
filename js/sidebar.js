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

const addMember = (unorganizedMemberArray)=>{
    console.log(unorganizedMemberArray);
}