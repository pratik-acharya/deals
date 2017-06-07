<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<input id="csrfToken" type="hidden" value='${_csrf.parameterName}=${_csrf.token}'>

 <!-- Modal -->
 <div id="editUserModal" class="modal fade" role="dialog">
   <div class="modal-dialog modal-lg">

     <!-- Modal content-->
     <div class="modal-content">
       <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
     
      <form id="userUpdateForm" class="form-horizontal">
       <div class="modal-body">        
		     <div class="col-md-2" id="resultuserUpdate" style="display:none"  >
      		</div>
      		<div class="col-md-6">
				<fieldset>
					
					<!-- Text input-->
					<div class="form-group" style="display:none">
					  <label class="col-md-4 control-label" for="textinput">id :</label>  
					  <div class="col-md-4">
					  <input id="idUpdate" name="id" placeholder="placeholder" class="form-control input-md" type="text">
					  </div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="textinput">Name :</label>  
					  <div class="col-md-4">
					  <input id="nameUpdate" name="name" placeholder="placeholder" class="form-control input-md" type="text" readonly>
					  </div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="textinput">Email :</label>  
					  <div class="col-md-4">
					  <input id="emailUpdate" name="email" placeholder="placeholder" class="form-control input-md" type="text" readonly>
					  </div>
					</div>
					
					<!-- Password input-->
					<div class="form-group" style="display:none">
					  <label class="col-md-4 control-label" for="password">Password :</label>
					  <div class="col-md-4">
					    <input id="passwordUpdate" name="password" placeholder="placeholder" class="form-control input-md" type="password" >
					  </div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="textinput">Street</label>  
					  <div class="col-md-4">
					  <input id="addressUpdate" name="location.address" placeholder="placeholder" class="form-control input-md" type="text" readonly> 
					  </div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="textinput">City</label>  
					  <div class="col-md-4">
					  <input id="cityUpdate" name="location.city" placeholder="placeholder" class="form-control input-md" type="text" readonly>
					 
					  </div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="textinput">State</label>  
					  <div class="col-md-4">
					  <input id="stateUpdate" name="location.state" placeholder="placeholder" class="form-control input-md" type="text" readonly>
					  
					  </div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="textinput">country</label>  
					  <div class="col-md-4">
					  <input id="countryUpdate" name="location.country" placeholder="placeholder" class="form-control input-md" type="text" readonly>
					  
					  </div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="textinput">Postal Code</label>  
					  <div class="col-md-4">
					  <input id="postalCodeUpdate" name="location.postalCode" placeholder="placeholder" class="form-control input-md" type="text" readonly>
					 
					  </div>
					</div>
					
					<!-- Multiple Radios -->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="radios">Status</label>
					  <div class="col-md-4">
					  <div class="radio">
					    <label for="radios-0">
					      <input name="status" id="status.ACTIVE.Update" value="0" checked="checked" type="radio">
					      Active
					    </label>
						</div>
					  <div class="radio">
					    <label for="radios-1">
					      <input name="status" id="status.INACTIVE.Update" value="1" type="radio">
					      In Active
					    </label>
						</div>
						<div class="radio">
					    <label for="radios-1">
					      <input name="status" id="status.BANNED.Update" value="2" type="radio">
					      Banned
					    </label>
						</div>
						<div class="radio">
					    <label for="radios-1">
					      <input name="status" id="status.LOCKED.Update" value="3" type="radio">
					      Locked
					    </label>
						</div>
					  </div>
					</div>
					
					<!-- Multiple Checkboxes -->
					
						<div class="form-group">
						  <label class="col-md-4 control-label" for="checkboxes">Role</label>
						  <div class="col-md-4">
						  <div class="checkbox">
						    <label for="checkboxes-0">
						      <input name="roles." id="userAdminUpdate" value="1" type="checkbox">
						       Admin
						    </label>
							</div>
						  </div>
						  <div class="col-md-4">
						  <div class="checkbox">
						    <label for="checkboxes-0">
						      <input name="roles" id="userMemberUpdate" value="2" type="checkbox">
						       Member
						    </label>
							</div>
						  </div>
						</div>
					
				
				</fieldset>
			</div>
       </div>
       	<div class="modal-footer">
       		<div class="col-md-4">
       			 <button type="submit" class="btn btn-danger pull-left"  onClick="userUpdate();return false;">Add</button>
	         
	         	<button type="submit" class="btn btn-info pull-left" data-dismiss="modal">Cancel</button>
       		</div>
	        
	       </div>
       </form>
     </div>
     
   </div>
 </div>
 
 <!-- modals end -->


<div class="row">
     <div class="col-xs-12">
         <div class="box">
             <div class="box-header">
             <div class="product-title">
                 <h2 >Member</h2> 
             
             </div>                                  
             </div>
 
             <div class="box-body table-responsive">
                 <table id="example1" class="table table-bordered table-striped">
                     <thead>
                         <tr>
                             <th>ID</th>
                             <th>Name</th>
                             <th>Phone no.</th>
                             <th>Email</th>
                             <th>Address</th>
                             <th>Role</th>
                             <th>status</th>
                             <th>Action</th>
                         </tr>
                     </thead>
                     <tbody id="userTable">
                       <c:forEach items="${users}" var="user">
                       	<tr>
                       		<td >${user.id}</td>
                       		<td>${user.name}</td>
                       		<td >${user.phone.landline}</td>
                       		<td>${user.email}</td>
                       		<td >${user.location.state}</td>
                       		<td>
	                       		<c:forEach items="${user.roles}" var="role">
	                       			<ul>
	                       				<li>${role.type}</li>
	                       			</ul>
	                       		</c:forEach>
                       		</td>
                       		<td>${user.status}</td>
                       		<td>
                            	<table style="width:100%">
	                                 <tr>
	                                     <td>
	                                         <div class="foot-prop">
	                                             <button class="btn btn-default" data-toggle="modal" data-placement="top" title="Edit" onClick="userEdit(${user.id});"  data-target="#editUserModal"><span class="glyphicon glyphicon-pencil button-icon-size"></span></button>
	                                         </div>
	                                     </td>
	                                     <td>
	                                         <div class="foot-prop">
	                                             <button id="btn-edit-delete" class="btn btn-danger" data-toggle="modal" title="Delete" data-target="#-deleteCategoryModal" value="${user.id}" onClick="userRemove(${user.id});return false;"><span class="glyphicon glyphicon-remove button-icon-size"></span></button>
	                                         </div>
	                                     </td>
	                                 </tr>
                             	</table>
                            </td>
                       	</tr>
                       </c:forEach>
                     </tbody> 
                 </table>
             </div><!-- /.box-body -->
         </div><!-- /.box -->
     </div>
 </div>