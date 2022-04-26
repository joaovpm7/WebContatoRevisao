<%-- 
    Document   : cadastro
    Created on : 26/04/2022, 08:11:23
    Author     : joao victor
--%>

<%@page import="modelo.Contato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String acao = "cadastrar", idcont = "",nome = "", sobrenome = "", sexo = "",
            dtnascimento = "", email = "", telefone = "";

    Contato con = new Contato();
    if (request.getParameter("acao") != null) {
        if (request.getParameter("acao").equals("editar")) {

            idcont = request.getParameter("idcontato");
            boolean achou = con.BuscarPorId(idcont);
            if (!achou) {
                out.print("<script>"
                        + "window.alert('Cliente não Encontrado');"
                        + "</script>");
            } else {
                //id, nome, categoria, descricao, quantidade, preco, datacadastro
                acao = "editar";
                idcont = String.valueOf(con.getId());
                nome = con.getNome();
                sobrenome = con.getSobrenome();
                sexo = con.getSexo();
                dtnascimento = String.valueOf(con.getDataNascimento());
                email = con.getEmail();
                telefone = con.getTelefone();
            }
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../css/bootstrap.css" />
        <link rel="stylesheet" href="../css/estilo.css" />

    </head>
    <body>
        <div class="row">
            <div class="col-4"></div>
            <div class="col-4">
                <div class="row">
                    <div class="col-6"> 
                        <label>Nome</label>
                        <input type="text"  name="nome"  class="form-control" id="inputNome">
                    </div>
                    <div class="col-6"> 
                        <label for="inputSobrenome">Sobrenome</label>

                        <input type="text"  name="sobrenome" class="form-control" id="inputSobrenome">
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <label >Sexo</label>
                        <br/>
                        <input id="rdbM"
                               required
                               type="radio" 
                               name="sexo"
                               value="M"/>
                        <label for="rdbM">Masculino</label>

                        <input id="rdbF"
                               required
                               type="radio" 
                               name="sexo"
                               value="F"/>
                        <label for="rdbF">Feminino</label>

                        <input id="rdbO"
                               required
                               type="radio" 
                               name="sexo"
                               value="O"/>
                        <label for="rdbO">Outro</label>
                    </div> 
                    <div class="col-6">
                        <label for="inputDataNacimento" >Data Nascimento</label>
                        <input type="date"  name="datanascimento" class="form-control" id="inputDataNacimento">
                    </div>
                </div>
                <div class="row">
                    <div class="col-6"> 
                        <label>Email</label>
                        <input type="text"  name="email"  class="form-control" id="inputEmail">
                    </div>
                    <div class="col-6"> 
                        <label for="inputTelefone">Telefone</label>

                        <input type="text"  name="telefone" class="form-control" id="inputTelefone">
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <label for="sltEscolaridade">Escolaridade:</label>
                        <select id="sltEscolaridade" name="escolaridade" class="form-control">
                            <option
                                value="EM">Ensino Médio</option>
                            <option
                                value="ET">Ensino Técnico</option>
                            <option
                                value="ES">Ensino Superior</option>
                            <option 
                                value="PG">Pós Graduação</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <input class="btn btn-primary" type="submit" value="Cadastrar" />
                    </div>
                </div>
            </div>
            <div class="col-4"></div>
        </div>
        <script type="text/javascript" src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery.mask.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $("#inputTelefone").on("click", function (e) {
                    $("#inputTelefone").mask("(00) 00000-0000");
                });
            });
        </script>
    </body>
</html>
