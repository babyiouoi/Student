<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 导入jQuery库 -->
<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
<!-- 编写jQuery代码 -->
   <script type="text/javascript">
	//1.当整个页面都加载完毕之后，再执行head标签内的js代码
	$(function() {
		//2.通过使用选择器，选中--根据id查询功能--的提交按钮，添加click事件
		//3.当点击该按钮时，执行对输入内容检查的函数
		$("#delButton").click(function() {
			//4.选中被检查的入力框，创建一个变量(jquery中只有一个格式，var),来接收该入力框的输入内容(即元素的value属性)
			var id = $("#stuId").val();
			//4.1对输入的内容进行去除前后空格操作
			id = $.trim(id);
			/*5.获取到输入的内容后，执行检查
			  5.1 首先检查入力内容是否是空值
			  5.2 再次检查输入的内容是否符合我们所需的格式，即正则表达式所规定的格式
			  5.2.1 正则表达式，是使用字符，数字，符号所编写的特殊代码，能够达到待定内容的格式限定，如，生日，邮编，数字，字母等
			 */
			if (id == null || id == "") {
				// 如果我们输入的内容为空值，给用户一个弹框提示
				alert("IDを入力してください");
				//并且，返回值设定为false，取消本次请求的提交
				return false;
			} else {
				//设置第二个变量来导入正则表达式，限定输入内容
				var stuId = /^[0-9]+$/;
				if (!stuId.test(id)) {
					//如果我们输入的内容不符合正则表达式，给用户一个弹框提示
					alert("IDをチェックしてください");
					//并且，返回值设定为false.取消本次请求的提交
					return false;

				} else {
					alert("入力完了")
					$("#delById").submit();
				}
			}	});

		});</script>
<title>Insert title here</title>
</head>
<body>
	<h3 align="center">学生情報新規</h3>
	<br>
	<br>
	<hr>
	<br>
	<br>
    <!-- 1.创建表格，用于接收数据
		1.1 在最上方添加taglib信息，从而可以使用for each循环，和EL表达式
		1,2创建表格标签，编写具体要用的信息列
-->

	<table border="1">
		<tr>
			<td>順番</td>
			<td>名前</td>
			<td>生年月日</td>
			<td>年齢</td>
			<td>成績</td>
			<td>クラス</td>
			<td>住所</td>
			<td>英語</td>
			<td>音楽</td>
			<td>中国語</td>
		</tr>

		<c:forEach items="${stuList}" var="student">
			<tr>
				<td>${student.id}</td>
				<td>${student.name}</td>
				<td>${student.birthday}</td>
				<td>${student.age}</td>
				<td>${student.score}</td>
				<td>${student.classId}</td>
				<td>${student.address}</td>
				<td>${student.english}</td>
				<td>${student.music}</td>
				<td>${student.chinese}</td>

			</tr>
		</c:forEach>
	</table>
	<!-- 2. 创建根据id增加学生信息功能
			2.1 编写發送請求form標籤，id，action，method屬性。
			2.2編寫一個五個入力框，輸入要增加學生信息的name，birthday，age，score，classId
			2.3編寫一個提交按鈕，發送本次請求
			-->
			<h3></h3>
		<form id="add" action="goToAddStudent" method="post">
			<input id="stuName" name="name" placeholder="名前を入力してください" type="text"/>
			<div id="checkname"></div>
			<br>
			<input id="stuBir" name="birthday" placeholder="生年月日を入力してください" type="text"/>
			<br>
			<input id="stuAge" name="age" placeholder="年齢を入力してください" type="text"/>
			<br>
			<input id="stuScore" name="score" placeholder="成績を入力してください" type="text"/>
			<br>
			<input id="stuClassId" name="classId" placeholder="クラスを入力してください" type="text"/>
			<br>
			<input id="stuAddress" name="address" placeholder="住所を入力してください" type="text"/>
			<br>
			<input id="stuEnglish" name="english" placeholder="英語の点数を入力してください" type="text"/>
			<br>
			<input id="stuMusic" name="music" placeholder="音楽の点数を入力してください" type="text"/>
			<br>
			<input id="stuChinese" name="chinese" placeholder="中国語の点数を入力してください" type="text"/>
			<br>
			<input id="addButton" type="submit" value="新規"/>
		</form>
	<br>
	<br>
	<hr>
	<br>
	<a href="goToDownLoadFile">＜ダウンロード</a>
	<br>
	<a href="welcome.jsp"><button type="button">ホームページへ戻す</button></a>

</body>
</html>