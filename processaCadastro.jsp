<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>

<%
    String nomeEmpresa = request.getParameter("nome");
    String porteEmpresa = request.getParameter("porte");
    String email = request.getParameter("email");
    String telefone = request.getParameter("telefone");

    String url = "jdbc:mysql://localhost:3306/exodo_db";
    String usuarioDB = "root"; // Usuário root
    String senhaDB = ""; // Senha vazia para o usuário root (ou insira a senha correta, se definida)

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexao = DriverManager.getConnection(url, usuarioDB, senhaDB);

        String sql = "INSERT INTO tabela_contatos (nome_empresa, porte_empresa, email, telefone) VALUES (?, ?, ?, ?)";
        PreparedStatement declaracao = conexao.prepareStatement(sql);

        declaracao.setString(1, nomeEmpresa);
        declaracao.setString(2, porteEmpresa);
        declaracao.setString(3, email);
        declaracao.setString(4, telefone);

        declaracao.executeUpdate();

        conexao.close();

        response.sendRedirect("sucesso.html");
    } catch (Exception e) {
        out.println("Erro: " + e.getMessage());
    }
%>
