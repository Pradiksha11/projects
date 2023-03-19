<%-- 
    Document   : validate
    Created on : Jul 25, 2022, 11:16:21 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}
input[type="number"]{
	font-family: Georgia, "Times New Roman", Times, serif;
	background: rgba(255,255,255,.1);
	border: none;
	border-radius: 4px;
	font-size: 15px;
	margin: 0;
	outline: 0;
	padding: 10px;
	width: 50%;
	box-sizing: border-box; 
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box; 
	background-color: #e8eeef;
	color:#8a97a0;
	-webkit-box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
	box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
	margin-bottom: 10px;
}
input[type="number"]:focus{
	background: #d2d9dd;
}
.number {
	background: #1abc9c;
	color: #fff;
	height: 30px;
	width: 30px;
	display: inline-block;
	font-size: 0.8em;
	margin-right: 4px;
	line-height: 30px;
	text-align: center;
	text-shadow: 0 1px 0 rgba(255,255,255,0.2);
	border-radius: 15px 15px 15px 0px;
}
input[type="submit"],
input[type="button"]
{
	position: relative;
	display: block;
	padding: 19px 39px 18px 39px;
	color: #FFF;
	margin: 0 auto;
	background: #1abc9c;
	font-size: 18px;
	text-align: center;
	font-style: normal;
	width: 50%;
	border: 1px solid #16a085;
	border-width: 1px 1px 3px;
	margin-bottom: 10px;
}

tr:nth-child(even) {background-color: #f2f2f2;}
input[type="submit"]:hover,
input[type="button"]:hover
</style>
    </head>
    <body style="background-color:powderblue;">
        <%@ page import="java.sql.*" %>        
        <%@ page import="panda.Prdy" %>
        <h1 style='text-align: center'>Billing System</h1>
        <%
            String uname,pswd;
            uname = request.getParameter("uname");
            pswd = request.getParameter("pswd");
            Prdy obj =new Prdy();
            int flag =0;
             Connection conn = null;  
        try {  
            
            String url = "jdbc:sqlite:C:/Users/ashok/Desktop/Billing/sqlite.db";  
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection(url);  
            Statement stmt  = conn.createStatement();  
            ResultSet rs    = stmt.executeQuery("select * from customer");  
        
            while (rs.next()) {  
                String unameDB = rs.getString("name");
                String pswdDB = rs.getString("password");
                
               if(unameDB.equals(uname) && pswdDB.equals(pswd))
               {
                   String mobile=rs.getString("mobile");
                   String email=rs.getString("email");
                   
                   obj.setName(uname);
                   obj.setMobile(mobile);
                   obj.setEmail(email);
                   obj.setPassword(pswd);
                   flag=1;
                   break;
               }
                   
               }
                   
            }
              
        catch (SQLException e) {  
            out.println(e.getMessage());  
        } finally {  
            try {  
                if (conn != null) {  
                    conn.close();  
                }  
            } catch (SQLException ex) {  
                out.println(ex.getMessage());  
            }  
        }              
            if(flag==1){
                out.println("Logged in success fully");
                out.println("<h1 style='text-align: center'>Welcome  "+obj.getName()+"</h1>");
            %>
                <form action="bill.jsp" method="post">
                <table style="margin-left: auto;margin-right: auto; border: 1px solid black;">
                    <tr>
                        <th>S.no</th><th>Products</th><th>Cost</th><th>Quantity</th></tr>
                        <%
                           try {  
            
            String url = "jdbc:sqlite:C:/Users/ashok/Desktop/Billing/sqlite.db";  
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection(url);  
            Statement stmt  = conn.createStatement();  
            ResultSet rs    = stmt.executeQuery("select * from product");  
        
            while (rs.next()) {  
                String sno = rs.getString("sno");
                String product = rs.getString("product");         
                String cost=rs.getString("cost");
                out.println("<tr><td>"+sno+"</td><td>"+product+"</td><td>"+cost+"</td><td><input type='number' name='"+sno+"' value=0></td></tr>");
                
            }
              
        } catch (SQLException e) {  
            out.println(e.getMessage());  
        } finally {  
            try {  
                if (conn != null) {  
                    conn.close();  
                }  
            } catch (SQLException ex) {  
                out.println(ex.getMessage());  
            }  
        }  
                            %>
                    <tr><td></td>
                        <td></td>
                        <td></td>
                        <td><input type='submit' value='Buy now'></td></tr>
                </table>
                </form>
                
            <%}

            else
            {%>
                Invalid Username or Password
                <a href="javascript:window.history.back()">Try again</a>
                
            <%}
                
        %>
    </body>
</html>
