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
<title>Exception</title>

<c:forEach var="css" items="${stylesheets}">
	<link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
</c:forEach>
</head>
<body>
<body class="body-wrapper">
	<div class="main-wrapper">
			<section class="mainContent clearfix notFound">
		<div class="container">
			<div class="row">
				<div
					class="col-md-6 col-md-offset-3 col-sm-10 col-sm-offset-1 col-xs-12">
					<a class="navbar-brand pageLogo" href="javascript:void(0)"><img
						src='<spring:url value="/resources/common/images/logo.png"></spring:url>' /></a>
					<h2>${reason}</h2>

					<a class="btn btn-default"
						href='<spring:url value="/dashboard"></spring:url>' role="button">Go Back</a>
				</div>
			</div>
		</div>
		</section>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<c:forEach var="script" items="${javascripts}">
		<script src="<c:url value="${script}"/>"></script>
	</c:forEach>

</body>
</html>