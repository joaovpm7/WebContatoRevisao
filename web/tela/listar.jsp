<%-- 
    Document   : listar
    Created on : 26/04/2022, 08:34:09
    Author     : joao victor
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Contato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idcont = String.valueOf(
            request.getAttribute("idcont"));
    List<Contato> cont = new Contato().ListarContato();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="../css/bootstrap.css" >
        <link rel="stylesheet" href="../css/estilo.css" >
    </head>
    <body>
        <h1>Listagem</h1>
        <div class="container px-lg-5">
            <div class="row mx-lg-n5 row-cols-9 row align-items-start">
                <div class="col py-3 px-lg-5 border bg-light">nome</div>
                <div class="col py-3 px-lg-5 border bg-light">Sobre Nome</div>
                <div class="col py-3 px-lg-5 border bg-light">Sexo</div>
                <div class="col py-3 px-lg-5 border bg-light">Data Nascimento</div>
                <div class="col py-3 px-lg-5 border bg-light">Email</div>
                <div class="col py-3 px-lg-5 border bg-light">Telefone</div>
                <div class="col py-3 px-lg-5 border bg-light">Escolaridade</div>
                <div class="col py-3 px-lg-5 border bg-light">Data Cadastro</div>
                <div class="col py-3 px-lg-5 border bg-light">Ações</div>
            </div>
        </div>
        <%
            for (Contato c : cont) {%>
        <div class="container px-lg-5">
            <div class="row mx-lg-n5 row-cols-9 row align-items-start">
                <div class="col py-3 px-lg-5 border bg-light"><%= c.getNome()%></div>
                <div class="col py-3 px-lg-5 border bg-light"><%= c.getSobrenome()%></div>
                <div class="col py-3 px-lg-5 border bg-light"><%= c.getSexo()%></div>
                <div class="col py-3 px-lg-5 border bg-light"><%= c.getDataNascimento()%></div>
                <div class="col py-3 px-lg-5 border bg-light"><%= c.getEmail()%></div>
                <div class="col py-3 px-lg-5 border bg-light"><%= c.getTelefone()%></div>
                <div class="col py-3 px-lg-5 border bg-light"><%= c.getEscolaridade()%></div>
                <div class="col py-3 px-lg-5 border bg-light"><%= c.getDtCadastro()%></div>
                <div class="col py-3 px-lg-5 border bg-light">
                    <form action="cadastrar.jsp" method="POST">
                        <input type="hidden" name="acao" value="editar">
                        <input type="hidden" name="idcont" value="<%= c.getId()%>">
                        <button class="btn btn-primary" type="submit">Editar</button>
                    </form> 
                </div>
                <div class="col py-3 px-lg-5 border bg-light">
                    <form action="ClienteServlet" method="POST">
                        <input type="hidden" name="acao" value="deletar">
                        <input type="hidden" name="icont" value="<%= c.getId()%>">
                        <button class="btn btn-danger" type="submit">Deletar</button>
                    </form> 
                </div>
            </div>
        </div>
        <% }
        %>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.mask.js"></script>
    </body>
</html>
