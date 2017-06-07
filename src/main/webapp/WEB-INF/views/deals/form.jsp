<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- MAIN CONTENT SECTION -->
<section class="mainContent clearfix stepsWrapper">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="innerWrapper clearfix stepsPage">

					<form:form   modelAttribute="deal" class="row" method="POST" role="form" id="add_deal_form" enctype="multipart/form-data">
						<div class="col-xs-12">
							<div class="page-header">
							<c:choose>
							    <c:when test="${not edit}">
									<h4>Add ${dealType}</h4>							  
							  </c:when>
							    
							    <c:otherwise>
									<h4>Update ${dealType}</h4>							    
								</c:otherwise>
							</c:choose>
							</div>
						</div>
						<form:hidden path="type" value="${dealType }" />

						<div class="form-group col-sm-6 col-xs-12">
							<label><spring:message code="label.title"/></label>
							<form:input path="title" class="form-control" />
							<form:errors path="title" cssClass="alert-danger" />
						</div>
						<div class="form-group col-sm-6 col-xs-12">
							<label><spring:message code="label.price"/></label>
							<form:input path="price" class="form-control" />
							<form:errors path="price" cssClass="alert-danger" />
						</div>


						<div class="form-group col-sm-6 col-xs-12">
							<label for=""><spring:message code="label.category"/></label> <span class="step-drop"> <form:select
									path="category.id" cssClass="select-drop">
									<form:options items="${categories}" itemLabel="name" itemValue="id"/>
								</form:select> <form:errors path="category" cssClass="alert-danger" />
							</span>
						</div>
						<div class="form-group col-sm-6 col-xs-12">
							<label for=""><spring:message code="label.condition"/></label> <span class="step-drop"> <form:select
									path="condition" items="${conditionMap}" cssClass="select-drop">
								</form:select> <form:errors path="condition" cssClass="alert-danger" />
							</span>
						</div>

						<div class="form-group col-sm-12 col-xs-12">
							<label><spring:message code="label.description"/></label>
							<form:textarea path="description" class="form-control" />
							<form:errors path="description" cssClass="alert-danger" />
						</div>
						<div class="col-xs-6 ">
							<form:checkbox id="deal_used_checkbox" path="used"/>
							<label for="deal_used_checkbox"><span></span>Used ${used }</label>
							<form:errors path="used" cssClass="alert-danger"/>
							
						</div>
						<div class="col-xs-6 ">
							<form:checkbox id="deal_negotiable_checkbox" path="negotiable"/>
							<label for="deal_negotiable_checkbox"><span></span>Negotiable ${negotiable }
							</label>
							 <form:errors path="negotiable" cssClass="alert-danger"/>
						</div>
						<div class="form-group col-sm-6 col-xs-12">
							<label><spring:message code="label.image"/></label> <input name="image" type="file">
							<form:errors path="image" cssClass="alert-danger" />
 						</div>
						<div class="col-xs-12">
							<div class="well well-lg clearfix">
								<ul class="pager">
									<li class="next" id="add_deal_form_submit_button"><a
										href="javascript:void(0)">	
										<c:choose>
										    <c:when test="${not edit}">
												<spring:message code="label.save"/>						  
										  </c:when>
										    
										    <c:otherwise>
												<spring:message code="label.update"/>							    
											</c:otherwise>
										</c:choose>
									</a></li>
								</ul>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</section>