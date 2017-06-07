<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<input id="csrfToken" type="hidden" value='${_csrf.parameterName}=${_csrf.token}'>
<!-- Modal -->
 <div id="addCategoryModal" class="modal fade" role="dialog">
   <div class="modal-dialog modal-sm">

     <!-- Modal content-->
     <div class="modal-content">
       <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal">&times;</button>        
       </div>
       <form id="categoryForm">
	       <div class="modal-body">        
			    <fieldset>
			        <legend><spring:message code="label.add"/><spring:message code="label.category"/></legend>
			  		<p id="result">		  		    
			        </p>
			        <p>
			            <label for="category"><spring:message code="label.admin.category.name" />: </label>
			             <input type="text" id="name" name="name"/>
			        </p>
			       </fieldset>
			   	<p id="result" style="display:none"></p>
	       </div>
	       <div class="modal-footer">
	         <button type="submit" class="btn btn-danger pull-left"  onClick="categorySubmit();return false;"><spring:message code="label.add"/></button>
	         
	         <button type="submit" class="btn btn-info pull-left" data-dismiss="modal">Cancel</button>
	       </div>
       </form>
     </div>
     
   </div>
 </div>
 
 <!-- Modal -->
 <div id="editCategoryModal" class="modal fade" role="dialog">
   <div class="modal-dialog modal-sm">

     <!-- Modal content-->
     <div class="modal-content">
       <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal">&times;</button>        
       </div>
       <form id="categoryUpdateForm">
	       <div class="modal-body">        
			    <fieldset>
			        <legend><spring:message code="label.update"/> <spring:message code="label.category"/></legend>
			  		<p id="result">		  		    
			        </p>
			        <p>
			        	<label for="category" style="display: none">id: </label>
			             <input type="text" id="category-edit-id" name="id" value="" style="display:none"/>
			            <label for="category"><spring:message code="label.admin.category.name" />: </label>
			             <input type="text" id="category-edit-name" name="name" value=""/>
			        </p>
			        <p id="resultEdit" style="display: none"></p>
			       </fieldset>
			   	<p id="result" style="display:none"></p>
	       </div>
	       <div class="modal-footer">
	         <button type="submit" class="btn btn-danger pull-left"  onClick="categoryUpdate();return false;"><spring:message code="label.update"/></button>
	         
	         <button type="submit" class="btn btn-info pull-left" data-dismiss="modal"><spring:message code="label.update"/></button>
	       </div>
       </form>
     </div>
     
   </div>
 </div>
 
 <div id="deleteCategoryModal" class="modal fade" role="dialog">
   <div class="modal-dialog modal-sm">

     <!-- Modal content-->
     <div class="modal-content">
       <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal">&times;</button>         
       </div>
       
       <div class="modal-body">
         Are you sure you want to delete?
       </div>
       <div class="modal-footer">
         <button type="submit" class="btn btn-danger pull-left" data-dismiss="modal">Yes</button>
         
         <button type="submit" class="btn btn-info pull-left" data-dismiss="modal">No</button>
       </div>
     </div>
     
   </div>
 </div>
 
<div class="row">
     <div class="col-xs-12">
         <div class="box">
             <div class="box-header">
             <div class="product-title">
                 <h2 >Category</h2> 
                 <button class="btn btn-add-sucess btn-add-member pull-right" data-toggle="modal" data-placement="top" title="Edit" data-target="#addCategoryModal">+ Add Category</button> 
             </div>                                  
             </div>
 
             <div class="box-body table-responsive">
                 <table id="example1" class="table table-bordered table-striped">
                     <thead>
                         <tr>
                             <th>ID</th>
                             <th>Category Name</th>
                             <th>Action</th>
                         </tr>
                     </thead>
                     <tbody id="categoryTable">
                       <c:forEach items="${categories}" var="category">
                       	<tr>
                       		<td >${category.id}</td>
                       		<td>${category.name}</td>
                       		<td>
                            	<table style="width:100%">
	                                 <tr>
	                                     <td>
	                                         <div class="foot-prop">
	                                             <button class="btn btn-default" data-toggle="modal" data-placement="top" title="Edit" onClick="categoryEdit(${category.id});"  data-target="#editCategoryModal"><span class="glyphicon glyphicon-pencil button-icon-size"></span></button>
	                                         </div>
	                                     </td>
	                                     <td>
	                                         <div class="foot-prop">
	                                             <button id="btn-edit-delete" class="btn btn-danger" data-toggle="modal" title="Delete" data-target="#-deleteCategoryModal" value="${category.id}" onClick="categoryRemove(${category.id});return false;"><span class="glyphicon glyphicon-remove button-icon-size"></span></button>
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