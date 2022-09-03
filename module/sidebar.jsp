<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%  
    //sql준비
    String sidebarSql = "SELECT * FROM account JOIN position ON position_code=code JOIN team ON account.team_code=team.code ORDER BY team_code,position.number";
    PreparedStatement sidebarQuery = connect.prepareStatement(sidebarSql);

    //sql문 전송    
    ResultSet sidebarResult = sidebarQuery.executeQuery();
     
    //2차원 결과 배열 생성
    ArrayList<ArrayList<String>> sidebarAccountData = new ArrayList<ArrayList<String>>();  //2차원 배열의 껍데기 생성
    while(sidebarResult.next()){
        ArrayList<String> tmpData = new ArrayList<String>(); //2차원 배열에 들어갈 배열 생성
        tmpData.add("\""+sidebarResult.getString(1)+"\"");
        tmpData.add("\""+sidebarResult.getString(2)+"\"");
        tmpData.add("`"+sidebarResult.getString(3)+"`");
        tmpData.add("\""+sidebarResult.getString(4)+"\"");
        sidebarAccountData.add(tmpData);
    }
%> 
<div class="sidebar_background" onclick="clickSidebarBackgroundEvent()"></div>
<div class="sidebar_container">
    <div class="sidebar_header">
        <div class="sidebar_close_btn_container">
            <button class="sidebar_close_btn" onclick="clickSidebarBackgroundEvent()">X</button>
        </div>
    </div>
    <div class="sidebar_main">
        <div class="move_my_diary_btn_container">
            <button class="move_my_diary_btn">내 다이어리 보기</button>
        </div>
        <div class="team_container">
            <div class="team_title_container">
                <button><span class="team_name">개발1팀</span>-<span class="team_leader_name">홍길동</span></button>
            </div>
            <div class="team_member_container">
                <div class="team_member_item">
                    <button ><span class="member_position">대리</span>-<span class="member_name">민경찬</span></button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../js/sidebar.js"></script>
<script>
    addMember(<%=sidebarAccountData%>);
</script>