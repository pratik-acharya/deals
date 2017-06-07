<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="col-xs-12">
	<div class="innerWrapper profile">
		<div class="orderBox">
			<h4><spring:message code="header.profile"></spring:message></h4>
		</div>
		<div class="row">
			<div class="col-md-2 col-sm-3 col-xs-12">
				<div class="thumbnail">
					<img
						src='<spring:url value="/resources/images/users/user_icon.png"></spring:url>'
						alt="profile-image">

				</div>
			</div>
			<div class="col-md-10 col-sm-9 col-xs-12">
				<form:form modelAttribute="user" class="form-horizontal"
					method="POST" id="user_dashboard_profile_form">
					<form:hidden path="id" />
					<div class="form-group">
						<label class="col-md-2 col-sm-3 control-label"><spring:message code="label.name"></spring:message></label>
						<div class="col-md-10 col-sm-9">
							<form:input path="name" class="form-control" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-2 col-sm-3 control-label"><spring:message code="label.email"></spring:message></label>
						<div class="col-md-10 col-sm-9">
							<form:input type="email" path="email" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 col-sm-3 control-label"><spring:message code="label.location"></spring:message></label>
						<div class="col-md-10 col-sm-9">
							<form:input path="location.address" class="form-control"
								placeholder="Enter address" />
						</div>
						<label class="col-md-2 col-sm-3 control-label"></label>
						<div class="col-md-10 col-sm-9">
							<form:input path="location.city" class="form-control"
								placeholder="Enter city" />
						</div>
						<label class="col-md-2 col-sm-3 control-label"></label>
						<div class="col-md-10 col-sm-9">
							<form:input path="location.state" class="form-control"
								placeholder="Enter state" />
						</div>
						<label class="col-md-2 col-sm-3 control-label"></label>
						<div class="col-md-10 col-sm-9">
							<form:input path="location.postalCode" class="form-control"
								placeholder="Enter postal code" />
						</div>
						<label class="col-md-2 col-sm-3 control-label"></label>

						<div class="col-md-10 col-sm-9">
							<form:input path="location.country" class="form-control"
								placeholder="Enter country" />
						</div>



					</div>
					<div class="form-group">
						<label class="col-md-2 col-sm-3 control-label"><spring:message code="label.phone"></spring:message></label>
						<div class="col-md-10 col-sm-9">
							<form:input path="phone.cellular" class="form-control"
								placeholder="Enter cell number" />
						</div>
						<label class="col-md-2 col-sm-3 control-label"></label>

						<div class="col-md-10 col-sm-9">
							<form:input path="phone.landline" class="form-control"
								placeholder="Enter landline number" />
						</div>
					</div>
					<div class="form-group">

						<div class="col-md-10 col-sm-9">

							<div class="alert alert-success" style="display: none"
								id="update_user_dashboard_profile_success" role="alert"><spring:message code="label.updateSuccessful"></spring:message></div>
							<div class="alert alert-danger" style="display: none"
								id="update_user_dashboard_profile_error" role="alert"></div>
						</div>
						<div class="col-md-2 col-sm-3">
							<button id="user_dashboard_profile_form_submit_button"
								data-link='<spring:url value="/user/profile/update?${_csrf.parameterName}=${_csrf.token}"></spring:url>'
								class="btn btn-primary btn-block"><spring:message code="label.update"></spring:message></button>

						</div>



					</div>

				</form:form>
			</div>
		</div>
	</div>
</div>