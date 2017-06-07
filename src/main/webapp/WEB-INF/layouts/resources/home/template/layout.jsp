<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:importAttribute name="javascripts"/>
<tiles:importAttribute name="stylesheets"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title> <tiles:insertAttribute name="title"/></title>
  <!-- stylesheets -->
   <c:forEach var="css" items="${stylesheets}">
        <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
    </c:forEach>
    <!-- end stylesheets -->
</head>
<body class="body-wrapper">
     <div class="main-wrapper">
     		<tiles:insertAttribute name="navBar"/>
     		<tiles:insertAttribute name="content"/>
			<tiles:insertAttribute name="footer"/>
	</div>
 <!-- scripts -->
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <c:forEach var="script" items="${javascripts}">
        <script src="<c:url value="${script}"/>"></script>
    </c:forEach>
    <!-- end scripts -->

</body>
</html>