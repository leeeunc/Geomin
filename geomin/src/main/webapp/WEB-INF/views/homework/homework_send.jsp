<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/homework_send.css">
<link rel="stylesheet" href="../resources/css/modal.css">
<link rel="stylesheet" href="../resources/css/study_group_join.css">
<script src="../resources/js/homework_send.js"></script>
<script src="../resources/js/modal.js"></script>

</head>
<%@include file = "../common/header.jsp" %>
<body>
<div class = "intro-box">
        <div class = "location">
            <ul class = "clearFix">
                <li class = "home">
                    <a href = "#">
                        <img src="../resources/image/homeicon.png" alt=""> /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        학습 서비스 /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        숙제 제출
                    </a>
                </li>
            </ul>
        </div>
        <div class = "left-sideBar">
            <ul>
                <li class = "group_add"><a href = "/homework/study_group_join?user_id=${userId}" id = "group_add">학습그룹 가입신청</a></li>
                <li class = "work_send"><a href = "/homework/homework_send?user_id=${userId}" id = "work_send">숙제 제출</a></li>
            </ul>
        </div>
        
        <div class = "name-content">
            <p>학습자 : ${user.user_name}
            </p><hr>
        </div>

        <div class = "request-content">
            <table>
                <tr class = "table_menu">
                    <td class = "check_box"></td>
                    <td>학습 콘텐츠</td>
                    <td>학습지도자</td>
                    <td>숙제 내용</td>
                    <td>제출기한</td>
                    <td>학습내용</td>
                </tr>
                
                <c:forEach items = "${list}" var="worklist">
                <tr>
                    <td class = "check_box"><input type="checkbox" name="checkbox" id="checkbox" onclick = 'checkOne(this)'>
                    <button type = "button" id = "open">작성 하기</button>
                    	<div id = "modal-box">
                    		<div id = "modal-contents">
                    			<button id = "close">&times;</button>
                    			<h2 id ="title">학습 내용 작성</h2>
                    			<div id = "profile">
                    				<div id = "desc">
                    				<div id = "content-box1">
                    					<p class = "user">학습자 : ${worklist.user_name }</p>
                    					<p class = "user">학습지도자 : ${worklist.user_id_leader }</p>
                    					<p class = "user">숙제 내용 : ${worklist.homework_content_leader }</p>
                    					<p class = "user">제출기한 : ${worklist.homework_deadline }</p>
                    				</div>
                    				<div id = "content-box2">
                    					<strong>학습내용</strong> <input type="text" name="" id="studytext">
                    				</div>
                    					<div class = "sendbtn-box">
								                <button type = "submit" id = "send_button">숙제 제출</button>
                    					</div>	
                    				</div>
                    				
                    			</div>
                    		</div>
                    	</div>
                    </td>
     
                    <td class = "contentName"><c:out value="${worklist.content_name }"/></td>
                    <td class = "readerName"><c:out value="${worklist.user_id_leader }"/></td>
                    <td class = "workContent"><c:out value="${worklist.homework_content_leader }"/></td>
                    <td class = "sendDate" style = "color: red; font-weight: bold;"><c:out value="${worklist.homework_deadline }"/></td>
                    <td class = "studyContent">
                    <c:choose>
                    <c:when test="${not empty worklist.homework_content_learner }">
                   		<c:out value="${worklist.homework_content_learner }"/>
                    </c:when>
                    <c:otherwise>
                    <form action="/homework/homework_sendAction" method="post">
                    	<input type="text" name="content_send_box" id="content_send_box" placeholder = '학습 내용을 입력해주세요.'>
                    	<input type="hidden" name="group_id" value="${worklist.group_id }">
                    	<button type ="submit" onclick = "send()">제출</button>
                    </form>
                    </c:otherwise>
                    </c:choose>
                    </td>
                    <!-- <td class = "studyContent"><c:out value="${worklist.homework_content_learner }"/></td> -->
                    </a>
                </tr>
                </c:forEach>
            </table>
            
        </div>

    </div>
<script>
	function send(){
    	alert('학습 내용 등록이 완료되었습니다.');
	}
</script>

</body>
<%@include file = "../common/footer.jsp" %>
</html>