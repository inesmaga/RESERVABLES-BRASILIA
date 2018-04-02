
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<% String tip = request.getParameter("tipo_Apartamento");%>
<% String FeIn = request.getParameter("FechaIngDes");%>
<% String FeSa = request.getParameter("FechaSaliDes");%>

<%-- 
       Document   : response
       Created on : 14-ene-2017, 6:05:27
       Author     : inesm
--%>


<sql:query var="reservables" dataSource="jdbc/RESERVABLES">
    SELECT DISTINCT apartamento.numero,
    apartamento.idapartamento,
    apartamento.piso,
    apartamento.Descripcion,
    apartamento.Caracteristicas,
    apartamento.preciodbaja,
    apartamento.preciodalta,
    apartamento.tipo_Apartamento,
    reserva.fecha_salida
    FROM apartamento, reserva
    WHERE ((apartamento.tipo_Apartamento=?) AND ( !(apartamento.Estado='Mantenimiento')) AND (reserva.fecha_salida < ?)) GROUP BY apartamento.numero  
    <sql:param value="${param.tipo_Apartamento}"/>
    <sql:param value="${param.FechaIngDes}"/>

</sql:query>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
        <head>
         <meta name="viewport" content="width=device-width,user-scalable=si,initial-scale=1.0">
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                 <link rel="stylesheet" type="text/css"  media ="all" href="style2.css">
                <title>Reservables-SISTEMA DE RESERVAS BRASILIA</title>

        </head>
<body>
<div id="container">
     <div id="header">
                    <div id="logo"></div>
                    <div id= "tit"><h1> APARTHOTEL  BRASILIA,</h1></div>
                    <div id="ciu"><h2>ALMERÍA, ESPAÑA.</h2></div>
     </div>
     <div id="first">
       <div id="table-container">
        <table  border="2" cellspacing="1">
           <thead>
               <tr>
                <th colspan="6">Apartamentos Reservables:<strong id="indclic"> Seleccione un  Apartamento:<strong></th>
               </tr>
               <tr>
                 <th colspan="6">Tipo_Apartamento:<strong> ${param.tipo_Apartamento}<strong></th>  
               </tr>
               <tr>
                 <th>Número:</th>
                 <th>Piso:</th>
                 <th>Descripción</th>
                 <th>Características</th>
                 <th>Precio.T.Baja:</th>
                 <th>Precio.T.Alta:</th>
                </tr>
            </thead>
            <tbody>
              <form name="solweb" action="index.jsp" method="POST"  >

                 <c:forEach var="row" items="${reservables.rows}">
                   <tr>   
                     <td><a href="mailto:aptosbrasilia@gmail.com?subject=Reservar Apto,${row.numero}&body=Desearia reservar Apto del Tipo ${param.tipo_Apartamento}, ${row.numero} con ID ${row.idapartamento} entre ${param.FechaIngDes} y  ${param.FechaSaliDes}"><c:out value="${row.numero}"/></a>
                     </td>
                     <td><c:out value="${row.piso}"/></td>
                     <td><c:out value="${row.descripcion}"/></td>
                     <td><c:out value="${row.caracteristicas}"/></td>
                     <td><c:out value="${row.preciodbaja}"/></td>
                     <td><c:out value="${row.preciodalta}"/></td>
                   </tr>
                 </c:forEach>
            </tbody>
        </table>
        </div>
        <input class ="button" type="submit" value="<-- Seleccionar Otro Tipo-Apartamento" />
         </form>                        
       
    </div> 
    <div id="des"><h1>¡Gracias por Elegirnos! En breve le contactaremos.</h1></div> 
    <div id="second">
          <div class="recuer"> 
             <ul>
               <li><img src="img/extbrasilia02.PNG"></li> 
               <li><img src="img/extbrasilia04.PNG"></li> 
               <li><img src="img/extbrasilia05.PNG"></li> 
               <li><img src="img/extbrasilia07.PNG"></li> 
               <li><img src="img/extbrasilia08.PNG"></li> 
               <li><img src="img/intbrasilia01.png"></li> 
               <li><img src="img/intbrasilia02.png"></li> 
               <li><img src="img/intbrasilia03.png"></li> 
               <li><img src="img/intbrasilia04.png"></li>
               <li><img src="img/intbrasilia05.png"></li>
              </ul> 
         </div>
    </div>  
    <div id=footer>                                    
                    <h3>Estamos en Calle  Cartagena, 23. Almería. CP:04007. Telef: 950240011  email:aptosbrasilia@gmail.com</h3> 
    </div>                                   
</div>
</body>
</html>

