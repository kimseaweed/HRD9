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
rs = conn.prepareStatement("select teacher_code,teacher_name,class_name,'￦'||TO_char(class_price,'FM999,999,999,999,999'),substr(teache_resist_date,1,4)||'년'||substr(teache_resist_date,5,2)||'월'||substr(teache_resist_date,7,2)||'일' from TBL_TEACHER_202201").executeQuery();
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
<h2>강사조회</h2>
<table border="1">
<tr>
<th>강사코드</th>
<th>강사명</th>
<th>강의명</th>
<th>수강료</th>
<th>강사자격취득일</th>
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