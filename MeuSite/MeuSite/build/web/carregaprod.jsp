<%@page import = "java.sql.Connection"%>
<%@page import = "java.sql.DriverManager"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.sql.ResultSet"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Produto</title>
    </head>
    <body>
       <%
       // Recebe o código do produto a ser alterado
       // na variável.
       int c;
       c=Integer.parseInt(request.getParameter("codigo"));
       Connection conecta;
       PreparedStatement st;
       Class.forName("com.mysql.cj.jdbc.Driver");
       String url="jdbc:mysql://localhost:3306/bancojsp";
       String user="root";
       String password="root";
       
       conecta=DriverManager.getConnection(url,user,password);
       // Buscar o produto pelo código recebido
       String sql = ("SELECT * FROM produto WHERE codigo = ? ");
       st = conecta.prepareStatement(sql);
       // ResultSet sderve para huardar aquilo que é trago do BD
       st.setInt(1,c);
       ResultSet resultado = st.executeQuery();
       // Verifica se o produto de código informado foi encontrado
       if (!resultado.next()){
       out.print("Este produto não foi localizado");
           }else{ // se encontrou o produto na tabela, vamos
                  // carregar estes dados dentro de um formulário
        %>
        <form method="post" action="alterar_produtos.jsp">
            <p>
                <label for ="codigo">Código</label>
                <input type="number" name="codigo" id="codigo" value="<%=resultado.getString("codigo")%>"readonly>
                                      
            </p>  
          
            <p>
                <label for ="codigo">Nome do Produto</label>
                <input type="text" name="nome" id="nome" value="<%=resultado.getString("nome")%>">
                                      
            </p>      
            <p>
                <label for ="codigo">Marca</label>
                <input type="text" name="marca" id="marca" value="<%=resultado.getString("marca")%>">
                                      
            </p>  
            <p>
                <label for ="codigo">Preço</label>
                <input type="text" name="preco" id="preco" value="<%=resultado.getString("preco")%>">
                                      
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
