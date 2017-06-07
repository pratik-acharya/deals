 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
      
      <section class="mainContent clearfix signUp">
        <div class="container">
          <div class="row">
            <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-12">
              <div class="panel panel-default">
                <div class="panel-heading"><h3><spring:message code="label.registrationForm.title"></spring:message></h3></div>
                <div class="panel-body">
                  <form:form action = "" modelAttribute="user" method="POST" role="form" enctype="utf8">
                    <div class="form-group">
                    	<spring:message code="placeholder.registrationForm.name" var="name"></spring:message>
                      	<form:input type="text"  path="name" class="form-control"  placeholder='${name}'/>
						<form:errors path="name" cssClass="text-danger"></form:errors>                   		
                    </div>
                    <div class="form-group">
                    	<spring:message code="placeholder.registrationForm.email" var ="email"></spring:message>
                      	<form:input type="email" path="email" class="form-control"  placeholder='${email }'/>
                    	<form:errors path="email" cssClass="text-danger"></form:errors>
                    </div>
                    <div class="form-group">
                    	<spring:message code="placeholder.registrationForm.password" var= "password"></spring:message>
                      	<form:input type="password" path="password" class="form-control"  placeholder='${password }'/>
                    	<form:errors path="password" cssClass="text-danger"></form:errors>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block"><spring:message code="label.registrationForm.submit"></spring:message></button>
                    <button type="button" id="login_link" data-link ="<c:url value="/login"/>" class="btn btn-link btn-block"><span><spring:message code="text.alreadyHaveAccount"></spring:message></span><spring:message code="link.login"></spring:message></button>
                  </form:form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>