<!--Fazendo a importação das bibliotecas para fazer a conexão com o banco de dados-->
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="../css/deletar.css">
            <title>JSP Page</title>
        </head>
        <body>
            <%
            //recebe o código digitado no formulario
            int cod;
            cod = Integer.parseInt(request.getParameter("codigoProduto"));
            //Conecta ao Banco de dados bancojsp
 
            try {
                //Fazendo a conexão com o banco de dados
                Connection conecta;
                PreparedStatement pst;
                Class.forName("com.mysql.cj.jdbc.Driver");
 
                String url = "jdbc:mysql://localhost:3307/bancojsp";
                String user = "root";
                String password = "";
 
                conecta = DriverManager.getConnection(url, user, password);
 
                //exclui o produto do codigo informado no form.
                String sql = ("DELETE FROM produto WHERE codigoProduto=?");
                pst = conecta.prepareStatement(sql);
                pst.setInt(1, cod);
                int resultado = pst.executeUpdate(); //executa o DELETE
 
                //Verificar se o produto foi ou não excluido
                if (resultado == 0) {
                    out.print("<p>Este produto não esta cadastrado</p>");
                } 
                else{
                    out.print("<p>O produto de código " + cod + " foi excluido com sucesso<p>");
                }
            }
            catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                out.print("<p>Entre em contato com o suporte e informe o erro: " + mensagemErro + ";</p>");
            }
 
        %>
    </body>
</html>