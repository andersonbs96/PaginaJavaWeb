<!--Fazendo a importação das bibliotecas para fazer a conexão com o banco de dados-->
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <<link rel="stylesheet" href="../css/deletar.css"/>
        <title>Alteração de Produto</title>
    </head>
    <body>
        <%
            int c;
            c = Integer.parseInt(request.getParameter("codigoProduto"));
            
     
            Connection conecta;
            PreparedStatement pst;
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url= "jdbc:mysql://localhost:3307/bancojsp";
            String user= "root";
            String password= "";
            conecta = DriverManager.getConnection(url,user,password);
                
            //Buscar o produto pelo código digitado pelo formulário
            String sql = ("SELECT * FROM produto WHERE codigoProduto=?");
            pst = conecta.prepareStatement(sql);
                
            pst.setInt(1, c);
             
            ResultSet resultado = pst.executeQuery();
            /*
                verifica se o produto de codigo informado foi encontrado
                na tabelaproduto
            */
            if (!resultado.next()){
                //o produto na tabela, será impresso o texto abaixo 
                out.print("<p>Este produto não foi localizado.</p>");
            }
            else {
                /*
                    se encontrou o produto na tabela, vamos carregar estes dados
                    Produto tal não foi localizado
                */
                
            %>
                <form method="post" action="alterarProduto.jsp">
                    <p>
                        <label class="label" for="codigoProduto">Código: </label>
                        <input type="number" name="codigoProduto" id="codigoProduto" value="<%=resultado.getString("codigoProduto")%>">
                    </p>
                    <p> 
                        <label class="label" for="nomeProduto">Nome do Produto: </label>
                        <input type="text" name="nomeProduto" id="nomeProduto" value="<%=resultado.getString("nomeProduto")%>">
                    </p>
                    <p>
                        <label  class="label" for="marcaProduto">Marca: </label>
                        <input type="text" name="marcaProduto" id="marcaProduto" value="<%=resultado.getString("marcaProduto")%>">
                    </p>
                    <p>
                        <label for="precoProduto">Preço: </label>
                        <input type="number" name="precoProduto" id="precoProduto" value="<%=resultado.getString("precoProduto")%>">
                    </p>
                    <p>
                        <input type="submit" value="Salvar Alterações">
                    </p>
                </form>
            <% 
                }
            %>
    </body>
</html>
