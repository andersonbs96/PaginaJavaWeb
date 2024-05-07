<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/listar.css">
        <title>Listagem de produto</title>
    </head>
    <body>
        <%
            Connection conecta;
            PreparedStatement pst;
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url= "jdbc:mysql://localhost:3307/bancojsp";
            String user= "root";
            String password= "";
            conecta = DriverManager.getConnection(url,user,password);
            
            String sql =("SELECT * FROM produto");
            pst = conecta.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            
        %>
        <div class="tabela">
            <table>
                <tr class="tabelaCabecalho">
                    <th>Código</th>
                    <th>Nome</th>
                    <th>Marca</th>
                    <th>Preço (R$)</th>
                    <th>Excluir</th>
                </tr>
                <br>
                <%
                while(rs.next()){
                %>
                    <tr class="tabelaCorpo">
                        <td>
                            <%=rs.getString("codigoProduto")%>
                        </td>
                        <td>
                            <%=rs.getString("nomeProduto")%>
                        </td>
                        <td>
                            <%=rs.getString("marcaProduto")%>
                        </td>
                        <td>
                            <%=rs.getString("precoProduto")%>
                        </td>
                        <td>
                            <a href="deletarProduto.jsp?codigoProduto=<%=rs.getString("codigoProduto")%>">Excluir</a>
                        </td>
                    </tr>
                    <br>
                <%
                    }
                %>
            </table>
        </div>
    </body>
</html>
