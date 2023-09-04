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
<h2>회원정보조회</h2>
<table border="1">
<tr>
<th>수강월</th>
<th>회원번호</th>
<th>회원명</th>
<th>강의명</th>
<th>강의장소</th>
<th>수강료</th>
<th>등급</th>
</tr>
<%if( rs.next() ){ 
do{
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
</tr>
<% }while(rs.next());
} else { %>
<tr><td colspan="5"> 데이터가 없습니다 </td> </tr>
<%}%>
</table>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>
<%
if(conn!=null){conn.close();}
if(pstmt!=null){pstmt.close();}
if(rs!=null){rs.close();}
%>