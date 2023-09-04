<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
Connection conn;
PreparedStatement pstmt = null;
ResultSet rs = null;

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
rs = conn.prepareStatement("select substr(c.resist_month,1,4)||'년'||substr(c.resist_month,5,2)||'월', c.c_no,m.c_name,t.class_name,c.class_area,'￦'||to_char(c.tuiton,'FM999,999,999,999'),m.grade from TBL_TEACHER_202201 t join TBL_class_202201 c on t.teacher_code=c.teacher_code join TBL_member_202201 m on m.c_no = c.c_no").executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section>
<h2>수강 신청</h2>
<form action="action.jsp" name="z">
<table border="1">
<tr>
<th>수강월</th>
<td class="left"> <input type="text" name="a"> 2022년03월 예)202203</td>
</tr>
<tr>
<th>회원명</th>
<td class="left"> <select name="b" onchange="bfun()">
	<option value="">회원명</option>
	<option value="10001">홍길동</option>
	<option value="10002">장발장</option>
	<option value="10003">임꺽정</option>
	<option value="20001">성춘향</option>
	<option value="20002">이몽룡</option>
</select> </td>
</tr>
<tr>
<th>회원번호</th>
<td class="left"> <input type="text" name="c"> 예)10001</td>
</tr>
<tr>
<th>강의장소</th>
<td class="left"> <input type="text" name="d"> </td>
</tr>
<tr>
<th>강의명</th>
<td class="left"> <select name="e" onchange="efun()">
	<option value="">강의신청</option>
	<option value="100">초급반</option>
	<option value="200">중급반</option>
	<option value="300">고급반</option>
	<option value="400">심화반</option>
</select> </td>
</tr>
<tr>
<th>수강료</th>
<td class="left"> <input type="text" name="f">원 </td>
</tr>
<tr>
<td colspan="2">
<input type="button" value="수강신청" onclick="subm()"/>
<input type="reset" value="다시쓰기" onclick="alert('정보를 지우고 처음부터 다시 시작합니다!') document.z.a.focus();"/>
</td>
</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"/>
<script>
	var z = document.z;
function bfun(){
	if(z.b.value!=""){
		z.c.value = z.b.value;
	}
	c();
}
function efun(){
	var f;
	if(z.b.value==""){
		z.f.value=='';
		return;
	}else{
		switch(z.e.value){
		case '' : f=''; break;
		case '100' : f=100000; break;
		case '200' : f=200000; break;
		case '300' : f=300000; break;
		case '400' : f=400000; break;
		}
		if( parseInt(z.b.value)>19999 ){
			alert('VIP 할인 : '+f+'원 -> '+f/2+'원');
			f/=2;
		}
		z.f.value=f;
	}
}
function subm(){
	if(z.a.value==""){
		alert('수강월이 입력되지 않았습니다!');
		z.a.focus();
	}else if(z.b.value==""){
		alert('회원명이 선택되지 않았습니다!');
		z.b.focus();
	}else if(z.c.value==""){
		alert('회원번호가 입력되지 않았습니다!');
		z.c.focus();
	}else if(z.d.value==""){
		alert('강의장소가 입력되지 않았습니다!');
		z.d.focus();
	}else if(z.e.value==""){
		alert('강의명이 선택되지 않았습니다!');
		z.e.focus();
	}else if(z.f.value==""){
		alert('수강료가 입력되지 않았습니다!');
		z.f.focus();
	}else{
		z.submit();
	} 
}
</script>
</body>
<style>
</style>
</html>
<%
if(conn!=null){conn.close();}
if(rs!=null){rs.close();}
%>