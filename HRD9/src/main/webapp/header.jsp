<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
*{padding:0;margin:0}
h1,h2,h3{text-align: center; padding:30px 40px}
body{ background-color: lightgray;}
header{ background-color: gray }
footer{ 
	background-color: gray; 
	position: absolute;
	bottom: 0;
	width: 100vw;
}
nav{ background-color: darkgray }
ul{
	display: flex;
}
li {
	list-style: none;
	padding : 10px 15px
}
a {
	text-decoration: none;
}
table {
	margin: 30px auto;
}
th,td {
	text-align: center;
	padding:15px 25px;
}
td.right{
	text-align: right;
	padding:15px 5px 15px 25px;
}
td.left{
	text-align: left;
	padding:15px 25px 15px 5px;
}

</style>
<body>
<header><h1>골프연습장 회원관리 프로그램 ver1.0</h1> </header>
<nav><ul>
<li><a href="tList.jsp">강사조회</a></li>
<li><a href="insert.jsp">수강신청</a></li>
<li><a href="mList.jsp">회원정보조회</a></li>
<li><a href="rList.jsp">강사매출현황</a></li>
<li><a href="index.jsp">홈으로</a></li>
</ul> </nav>
</body>
</html>