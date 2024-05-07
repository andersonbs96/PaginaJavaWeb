<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produtos salvos</title>
    </head>
    <body>
        <%
            try{
            // declaração de variaveis a serem ligadas ao banco de dados
            int codigo;
            String nome;
            String marca;
            double preco;
            codigo = Integer.parseInt(request.getParameter("codigoProduto"));
            nome = request.getParameter("nomeProduto");
            marca = request.getParameter("marcaProduto");
            preco = Double.parseDouble(request.getParameter("precoProduto"));
            
            // declaração de variaveis para preparar a conexão com banco de dados
                Connection conecta;
                PreparedStatement pst;
                Class.forName("com.mysql.cj.jdbc.Driver");

                String url= "jdbc:mysql://localhost:3307/bancojsp";
                String user= "root";
                String password= "";
                conecta = DriverManager.getConnection(url,user,password);
            
                String sql= ("INSERT INTO produto VALUES(?,?,?,?)");
                pst = conecta.prepareStatement(sql);
                pst.setInt(1, codigo);
                pst.setString(2, nome);
                pst.setString(3, marca);
                pst.setDouble(4, preco);
                pst.executeUpdate();
                out.print("<p><strong>Produto Cadastrado</strong></p>");
            }
            catch(Exception x){
                String erro = x.getMessage();
                if (erro.contains("Duplicate entry")) {
                    out.print("<p style='color: blue;font-size:25px'> Este produto já está cadastrado!</p>");
                } 
                else {
                    out.print("<p style='color: red; font-size:25px'> Mensagem de erro: " + erro + "</p>");
                }
            }
        %>
    </body>
</html>
