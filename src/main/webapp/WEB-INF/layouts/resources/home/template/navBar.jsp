<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            	<li>
                  <a href="<c:url value='/dashboard'/>"><spring:message code="navbar.offer"/></a>
                </li>
                 <li class="dropdown">
                  <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><spring:message code="navbar.language"/></a>
                  <ul class="dropdown-menu dropdown-menu-right">
                    <li><a href="?lang=en_US"><spring:message code="navbar.language.english"/></a></li>
                    <li><a href="?lang=ne_NP"><spring:message code="navbar.language.nepali"/></a></li>
                  </ul>
                </li>
               
              </ul>
            </div><!-- /.navbar-collapse -->
          </div>
        </nav>

      </div>