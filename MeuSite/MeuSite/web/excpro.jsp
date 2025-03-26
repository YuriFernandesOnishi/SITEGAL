<%-- 
    Document   : excpro
    Created on : 5 de mar. de 2025, 14:36:14
    Author     : 2DT
--%>
<%@page import = "java.sql.Connection"%>
<%@page import = "java.sql.DriverManager"%>
<%@page import = "java.sql.*"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            //recebe o codigo digitado no formulario
            int cod;
            cod=Integer.parseInt(request.getParameter("codigo"));
            try{
                // conectar ao banco de dado bancojsp
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url="jdbc:mysql://localhost:3306/bancojsp";
                String user = "root";
                String password = "root";
                conecta=DriverManager.getConnection(url,user,password);
                
                String sql = "DELETE FROM produto WHERE codigo=?";
                st=conecta.prepareStatement(sql);
                st.setInt(1,cod);
                int resultado=st.executeUpdate(); // Executou a função delete acima
                if (resultado==0){
                    out.print("Este produto não está cadastrado no Banco");
            }else{
                    out.print(" O produto de código =" + cod+ " , foi exluido com sucesso");
            }
            }catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                out.print("Entre em contato com o administrador e informe o erro");
            }
            %>
                
            
                
            
        <h1>Obrigado pela consulta</h1>
    </body>
</html>
