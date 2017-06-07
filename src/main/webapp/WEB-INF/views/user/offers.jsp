<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<input id="contextPath"type="hidden" value='<spring:url value="/"></spring:url>'>
<input id="csrfToken" type="hidden" value='${_csrf.parameterName}=${_csrf.token}'>
<div class="col-xs-12">
	<div class="innerWrapper">
		<div class="orderBox myAddress wishList">
			<h4>Offers</h4>

			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th></th>
							<th>Title</th>
							<th>Price</th>
							<th>Category</th>
							<th>Description</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="offers_table_body_content">
						<c:forEach items="${page.content}" var="deal">

							<tr id="user_dashboard_offer_${deal.id}">
								<td class="col-md-2 col-sm-3">
									 <span class="cartImage"><img height=100 width=100
										src="<spring:url value='/resources/images/deals/${deal.id}.jpg'></spring:url>" alt="image"></span>
								</td>
								<td>${deal.title}</td>
								<td>$ ${deal.price}</td>
								<td>${deal.category.name }</td>
								<td>${deal.description}</td>
								 <td>
		                            <div class="btn-group" role="group">
		                              <button type="button" class="btn btn-default" id="user_dashboard_edit_offer_button" data-offer="${deal.id }"><i class="fa fa-pencil" aria-hidden="true"></i></button>
		                              <button type="button" class="btn btn-default" data-toggle="modal" data-target="#user_dashboard_delete_offer_modal" data-offer="${deal.id}"><i class="fa fa-times" aria-hidden="true"></i></button>
		                            </div>
                            		</td>
								
							</tr>
						</c:forEach>
					</tbody>

				</table>
				<c:if test="${not page.lastPage}">
					<div class="pull-right" >
						<button id="more_offer_list_button" data-link='<spring:url value="/user/dashboard/offers/next"></spring:url>' class="btn btn-default">More</button>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" tabindex="-1" role="dialog" id="user_dashboard_delete_offer_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Delete this offer</h4>
      </div>
      <div class="modal-body">
        <p>Are you sure you want to delete? This action is not reversible.</p>
        <input type="hidden" id="modal_delete_offer_input">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="modal_delete_offer_button">Delete</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
