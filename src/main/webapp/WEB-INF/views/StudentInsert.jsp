<%@ page  contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>StudentInsert.jsp</title>
	<script>
		<%= request.getAttribute("script") %>
	</script>
</head>

<body>
	<form method = "POST">
	<fieldset>
		<legend>추가할 학생 정보를 입력하세요</legend>
		<label for = "num">학번</label>
		<input type = "text" name = "num" id = "num" size = "10"/> /
		<label for = "name">이름</label>
		<input type = "text" name = "name" id = "name" size = "10"/>
		<br/>
		<label for = "gender">성별</label>
		<input type = "radio" name = "gender" id = "gender" value = "여자"/>여자
		<input type = "radio" name = "gender" id = "gender" value = "남자"/>남자
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
		<br/>
		<input type="hidden" name="command" value="studentInsert" />
		<input type = "submit" value = "추가"/>
	</fieldset>
	</form>

	<br/>
	<form method = "POST">
		<input type="hidden" name="command" value="back" />
		<input type="submit" value="메인으로" />
	</form>
</body>
</html>