<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String bloodgroup = request.getParameter("bloodgroup");
String incdec = request.getParameter("incdec");
String units = request.getParameter("units");
int units1 = Integer.parseInt(units);
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	if(incdec.equals("inc")){
		st.executeUpdate("UPDATE stock SET units = units+'"+units1+"' WHERE bloodgroup ='"+bloodgroup+"'");
	}
	else{
		st.executeUpdate("UPDATE stock SET units = units-'"+units1+"' WHERE bloodgroup ='"+bloodgroup+"'");
	}
	response.sendRedirect("manageStock.jsp?msg.valid");
}
catch(Exception e){
	response.sendRedirect("manageStock.jsp?msg.invalid");
}
%>