<%@ page  contentType="text/html; charset=UTF-8" 
	import  = "java.util.*, model.*" %>
<%
	@SuppressWarnings("unchecked")//unchecked 노란줄 경고 무시
	ArrayList<StudentDO> list = (ArrayList<StudentDO>) session.getAttribute("list");
	String result = "";

	for(StudentDO sDO : list){
		result += "<tr><td>" + Integer.toString(sDO.getNum()) +"</td><td>" +  sDO.getName() +"</td><td>"+  sDO.getGender() + "</td><td>" + 
				Integer.toString(sDO.getKorScore()) +"</td><td>" + Integer.toString(sDO.getEngScore()) +"</td><td>"+ 
						Integer.toString(sDO.getMathScore()) +"</td><td>" +   Integer.toString(sDO.getSciScore()) + "</td></tr>";
	}
%>

<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>StudentScoreChange.jsp</title>
	<script>
		<%= request.getAttribute("script") %>
	</script>
	<style>
		table, td, th{
			border : 2px solid gray;
			border-collapse:collapse;
		}
		td, th{
			padding:5px;
			text-align:center;
		}
	</style>
</head>

<body>
	<h1>학생 성적 변경</h1>
	<form method = "POST">
	<fieldset>
		<legend>성적을 변경할 학생의 학번과 각 과목 성적을 입력하세요</legend>
		<label for = "num">학번</label>
		<input type = "text" name = "num" id = "num" size = "10"/>
		<br/>
		<label for = "korScore">국어 성적</label>
		<input type = "text" name = "korScore" id = "korScore" size = "5" /> /
		<label for = "engScore">영어 성적</label>
		<input type = "text" name = "engScore" id = "engScore" size = "5" />
		<br/>
		<label for = "mathScore">수학 성적</label>
		<input type = "text" name = "mathScore" id = "mathScore" size = "5" /> /
		<label for = "sciScore">과학 성적</label>
		<input type = "text" name = "sciScore" id = "sciScore" size = "5" />
		<input type="hidden" name="command" value="studentScoreChange" />
		<input type = "submit" value = "성적 변경"/>
	</fieldset>
	</form>
	
	
	<h2>전체 학생 정보</h2>
	<table>
		<th>학번</th>
		<th>이름</th>
		<th>성별</th>
		<th>국어성적</th>
		<th>영어성적</th>
		<th>수학성적</th>
		<th>과학성적</th>
		<%= result %>
	</table>
	<br/>
	
	<form method = "POST">
		<input type="hidden" name="command" value="back" />
		<input type="submit" value="메인으로" />
	</form>
</body>
</html>