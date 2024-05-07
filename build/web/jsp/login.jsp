<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
        try {
            String adminLogin;
            String adminSenha;
            adminLogin = request.getParameter("LoginAdmin");
            adminSenha = request.getParameter("SenhaAdmin");
           
            Connection conecta;
            PreparedStatement pst;
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url= "jdbc:mysql://localhost:3307/bancoadmin";
            String user= "root";
            String password= "";
            conecta = DriverManager.getConnection(url,user,password);
            
            String sql = "SELECT * FROM tbl_admin WHERE admin_login=? AND admin_senha=?";
            
            pst = conecta.prepareStatement(sql);
            pst.setString(1, adminLogin);
            pst.setString(2, adminSenha);
            
            ResultSet rs = pst.executeQuery();
            
            if(rs.next()){
                response.sendRedirect("../pages/principal.html");
            }
            else {
                out.print("Usuario e Senha incorretos ou não existem.");
            }
            
            rs.close();
            pst.close();
            conecta.close();
        }
        catch (Exception e){    
            out.print("Mensagem de erro: " + e);
        }    
        %>
    </body>
</html>
