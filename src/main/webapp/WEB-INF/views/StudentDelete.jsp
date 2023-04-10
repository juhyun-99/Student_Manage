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
	<title>StudentDelete.jsp</title>
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
	<h1>학생 정보 삭제</h1>
	<form method = "POST">
	<fieldset>
		<legend>정보를 삭제할 학생의 학번을 입력하세요</legend>
		<label for = "num">학번</label>
		<input type = "text" name = "num" id = "num" size = "10"/>
		<input type="hidden" name="command" value="studentDelete" />
		<input type = "submit" value = "삭제"/>
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