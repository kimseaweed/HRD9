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
rs = conn.prepareStatement("select t.teacher_code,t.class_name,t.teacher_name, '￦'||to_char(sum(c.tuiton),'FM999,999,999,999') from TBL_TEACHER_202201 t join TBL_class_202201 c on t.teacher_code=c.teacher_code group by t.teacher_code,t.class_name,t.teacher_name order by t.teacher_code").executeQuery();
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
<h2>강사매출현황</h2>
<table border="1">
<tr>
<th>강사코드</th>
<th>강의명</th>
<th>강사명</th>
<th>총매출</th>
</tr>
<%if( rs.next() ){ 
do{
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td class="right"><%=rs.getString(3) %></td>
<td class="right"><%=rs.getString(4) %></td>
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