<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<%-- 
    Document   : index
    Created on : 09-ene-2017, 8:08:19
    Author     : inesm
--%>
<sql:query var="tipoA" dataSource="jdbc/RESERVABLES">
    SELECT  DISTINCT tipo_Apartamento FROM apartamento
</sql:query>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html
    <html>
<head>
        <meta name="viewport" content="width=device-width,user-scalable=si,initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css"  media ="all" href="style.css">
        <link rel="shortcut icon"  href="Brasiliaico.ico"/>
        <title>SISTEMA DE RESERVAS BRASILIA</title>
</head>
<body>
        <div id="container">
                <div id="header">
                        <div id="logo"></div>
                        <div id= "tit"><h1> APARTHOTEL  BRASILIA,</h1></div>
                        <div id="ciu"><h2>ALMERÍA, ESPAÑA.</h2></div>
                </div>

                <div id="fisrt">

                        <div class="slider"> 
                                <h3> Asi nos vemos por Fuera...</h3> 
                                <ul>

                                        <li><img src="img/extbrasilia02.PNG"></li> 
                                        <li><img src="img/extbrasilia04.PNG"></li> 
                                        <li><img src="img/extbrasilia05.PNG"></li> 
                                        <li><img src="img/extbrasilia07.PNG"></li> 
                                        <li><img src="img/extbrasilia08.PNG"></li> 

                                </ul>
                        </div>
                        <div class="history">
                                <h3>  Nuestra Historia...</h3>
                                <p>Fundado en  1958, nuestro Aparthotel se convirtió en novedad para turistas y artistas.</p>

                                <p> Contando con el honor de  recibir la visita de  entre otros Lola Flores y demás artistas y equipos de filmación de varios filmes.</p>

                                <p>  A tan solo dos calles de la playa, con vistas increibles.Y acceso tanto al Paseo
                                        Marítimo, como a una Avenida principal donde  tomar medios de transporte.</p>

                                <p>Cerca del Centro de la Ciudad, tiene una ubicación  genial.</p>

                                <p> Consta de Recepción.Con un trato grato y personalizado.</p>       
                        </div>


                </div>

                <div id= "second">

                        <div class="dispo">
                                <table id="Tipo" border="0">
                                        <thead>
                                                <tr>
                                                        <th id="vd">VERIFICAMOS DISPONIBILIDAD?</th>
                                                </tr>
                                        </thead>
                                        <tbody>
                                                <tr>
                                                        <td>
                                                                <form name="tipo" action="response.jsp" method="GET">
                                                                        <Strong id=tst> Seleccione un Tipo de Apartamento:
                                                                                
                                                                                                  <Select name="tipo_Apartamento">
                                                                                <c:forEach var="row" items="${tipoA.rows}">
                                                                                    <option value="${row.tipo_Apartamento}">${row.tipo_Apartamento}</option>
                                                                                </c:forEach> 
                                                                        </Select><br />
                                                                        <br /><strong><label> Fecha de Ingreso Deseada: </label></strong><input type="text" max-lenght="10"  placeholder="aaaa/mm/dd" name="FechaIngDes" value="" />
                                                                        <br /> <strong><label> Fecha de Salida Deseada: </label></strong> <input type="text" max-lenght="10"  placeholder="aaaa/mm/dd"name="FechaSaliDes" value="" />
                                                                        <br /><input class="button"type="submit"  value="Disponibles ?" name="btndisponibles" />
                                                                </form>                 
                                                        </td>
                                                </tr>
                                        </tbody>
                                </table>
                        </div>
                        <div class="Dentro">
                                <h3> Y asi nos vemos por Dentro...</h3> 
                                <ul>

                                        <li><img src="img/intbrasilia01.png"></li> 
                                        <li><img src="img/intbrasilia02.png"></li> 
                                        <li><img src="img/intbrasilia03.png"></li> 
                                        <li><img src="img/intbrasilia04.png"></li> 
                                        <li><img src="img/intbrasilia05.png"></li> 

                                </ul>

                        </div>                                       
                </div>      
                <div id=footer>                                    
                        <h3>Estamos en Calle  Cartagena, 23. Almería. CP:04007. TeleF: 950240011  email:aptosbrasilia@gmail.com</h3> 
                </div>                                      
        </div>              
</body>
</html>

