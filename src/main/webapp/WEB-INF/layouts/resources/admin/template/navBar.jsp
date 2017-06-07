<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="header clearfix">
	<!-- NAVBAR -->
	<nav class="navbar navbar-main navbar-default" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="javascript:void(0)"><img src='<spring:url value="/resources/common/images/logo.png"></spring:url>'/></a>

			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="javascript:void(0)"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">Change language</a>
						<ul class="dropdown-menu dropdown-menu-right">
							<li><a href="?lang=en_US">English</a></li>
							<li><a href="?lang=ne_NP">Nepali</a></li>
						</ul></li>
					<security:authorize access="isAuthenticated()">
						<li><a onclick="document.forms['logoutForm'].submit()" class="dropdown-toggle">Logout</a></li>
							 <form id="logoutForm" method="POST" action='<c:url value="/j_spring_security_logout"></c:url>'>
            				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        				</form>
					</security:authorize>
					<security:authorize access="isAnonymous()">
						<li><a href='<c:url value="/login"/>' class="dropdown-toggle">Login</a></li>
					</security:authorize>

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
	</nav>

</div>