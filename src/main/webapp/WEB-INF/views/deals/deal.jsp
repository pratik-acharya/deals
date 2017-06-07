<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<input id="csrfToken" type="hidden"
	value='${_csrf.parameterName}=${_csrf.token}'>
<input id="contextPath" type="hidden"
	value='<spring:url value="/"></spring:url>'>


<section class="mainContent clearfix">
	<div class="container">
		<div class="row singleProduct">
			<div class="col-lg-6">
				<div class="media">
					<div class="media-left productSlider">
						<div id="carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active" data-thumb="0">
									<img
										src="<spring:url value='/resources/images/deals/${deal.id}.jpg'></spring:url>"
										alt="products-img">
								</div>
								<div class="item" data-thumb="1">
									<img
										src="<spring:url value='/resources/images/deals/${deal.id}.jpg'></spring:url>"
										alt="products-img">
								</div>
								<div class="item" data-thumb="2">
									<img
										src="<spring:url value='/resources/images/deals/${deal.id}.jpg'></spring:url>"
										alt="products-img">
								</div>
								<div class="item" data-thumb="3">
									<img
										src="<spring:url value='/resources/images/deals/${deal.id}.jpg'></spring:url>"
										alt="products-img">
								</div>
							</div>
						</div>
						<div class="clearfix">
							<div id="thumbcarousel" class="carousel slide" id="carousel-ex">


								<div class="carousel-inner">
									<div data-target="#carousel" data-slide-to="0" class="thumb">
										<img
											src="<spring:url value='/resources/images/deals/${deal.id}.jpg'></spring:url>"
											alt="products-img">
									</div>
									<div data-target="#carousel" data-slide-to="1" class="thumb">
										<img
											src="<spring:url value='/resources/images/deals/${deal.id}.jpg'></spring:url>"
											alt="products-img">
									</div>
									<div data-target="#carousel" data-slide-to="2" class="thumb">
										<img
											src="<spring:url value='/resources/images/deals/${deal.id}.jpg'></spring:url>"
											alt="products-img">
									</div>
									<div data-target="#carousel" data-slide-to="3" class="thumb">
										<img
											src="<spring:url value='/resources/images/deals/${deal.id}.jpg'></spring:url>"
											alt="products-img">
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6">

				<div class="well">
					<h4>Product Details:</h4>

					<h4>
						<label class="label label-info">${deal.title} </label> <label
							class="label label-info">$${deal.price}</label>
					</h4>
					<h4>
						<label class="label label-info">${deal.category.name} </label>
					</h4>





					<label><spring:message code="deal.type"></spring:message>:</label>
					<p>${deal.type}</p>
					<label><spring:message code="deal.offeredBy"></spring:message>:</label>
					<p>${deal.user.name}</p>
					<label><spring:message code="deal.email"></spring:message>:</label>
					<p>${deal.user.email}</p>


					<p>
				</div>




			</div>
		</div>

		<div class="row">

			<div class="col-lg-12">
				<div class="well">

					<label><spring:message code="deal.description"></spring:message>:</label>
					<p>${deal.description}</p>
					<label><spring:message code="deal.used"></spring:message>:</label>
					<p>
					
					<c:choose>
						<c:when test="${deal.used=='true'}">
						        Yes 
						     </c:when>
						<c:otherwise>
						        No
						    </c:otherwise>
					</c:choose>
					</p>

					<label><spring:message code="deal.negotiable"></spring:message>:</label>
					<p>
						<c:choose>
							<c:when test="${deal.negotiable=='true'}">
						        Yes 
						     </c:when>
							<c:otherwise>
						        No
						    </c:otherwise>
						</c:choose>
					</p>

					<label><spring:message code="deal.condition"></spring:message>:</label>
					<p>${deal.condition}</p>

				</div>
			</div>
		</div>
	</div>
	<!-- comment area start -->

	<security:authorize access="isAuthenticated()">


		<div class="commentsArea">
			<h3>
				<spring:message code="deal.comments"></spring:message>
				:
			</h3>


			<c:forEach items="${deal.enquiries}" var="enquiry">

				<div class="media">
					<a class="media-left" href="blog-single-fullwidth.html#"> <img
						class="media-object"
						src='<c:url value="/resources/images/users/user_icon.png" ></c:url>'
						width="80" height="80" alt="Image">
					</a>
					<div class="media-body">
						<h4 class="media-heading">${enquiry.user.name}</h4>
						<h4>
							<span><i class="fa fa-calendar" aria-hidden="true"></i>${enquiry.date}</span>
						</h4>
						<%--  <p>${enquiry.content}</p>  --%>
						<textarea class='form-control' name='content' rows='3' cols='50'
							readonly='true'>${enquiry.content}</textarea>

					</div>
				</div>
			</c:forEach>

		</div>



		<!-- Success - or Validation errors -->

		<div id="formInput" style="display: none"></div>
		<div id="errors" style="display: none"></div>

		<!-- comment area end -->
		<!-- comment box start -->

		<div class="col-xs-12">
			<div class="form-group">

				<input type="hidden" id="deal_id" value="${deal.id}" />
				<textarea id="Comment" class="form-control" rows="3"
					placeholder="Add a comment"></textarea>
				<br>
				<div class="col-md-offset-10 col-md-2">
					<button type="submit" id="Post_Comment"
						class="btn btn-primary btn-xs pull-right">Post</button>
				</div>
			</div>

		</div>

	</security:authorize>
	</div>
	<!-- comment box end -->



	<security:authorize access="isAnonymous()">
		<div class="well">

			<h3 align="center">
				Please Login to Enquire <a href='<c:url value="/login"/>'
					class="btn btn-primary btn-lg" role="button">Login</a>
			</h3>

			<div>
	</security:authorize>


	</div>
</section>