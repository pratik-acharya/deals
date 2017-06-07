$(function() {
	$("#example1").dataTable();
	$('#example2').dataTable({
	    "bPaginate": true,
	    "bLengthChange": false,
	    "bFilter": false,
	    "bSort": true,
	    "bInfo": true,
	    "bAutoWidth": false
	    });
});
var contextRoot = "/" + window.location.pathname.split( '/' )[1];

var csrf = $("#csrfToken").val();

function categorySubmit(){
   	var dataToSend = JSON.stringify(serializeObject($('#categoryForm')));
   	 $.ajax({
		type: 'POST',
		url:'/deals/admin/addCategory?'+csrf,
		dataType: "json",           // Accept header
 		data:dataToSend,
 		contentType: 'application/json',   // Sends - Content-type
		success: function(){
			location.reload(true); 
		},
 
		error: function(errorObject ){	
			if (errorObject.responseJSON.errorType == "validationError") {
	 			$('#result').html("");
	 			$('#result').html("");
	  			    var errorList = errorObject.responseJSON.errors;
	 	 	        $.each(errorList,  function(i,error) {			   
	 		    		$("#result").append( error.message + '<br>');
			    	});
	 	 	        $("#result").append( '</p>');
	 	 	        $('#result').show();
			}
			else {
				alert(errorObject.responseJSON.errors(0));   // "non" Validation Error
			}
 		}
	});
}  	 
function categoryRemove(id){
	
	var dataToSend = JSON.stringify(id);
   	 $.ajax({
		type:'DELETE',
		url:'/deals/admin/deleteCategory?'+csrf,
		dataType: "json",           // Accept header
 		data:dataToSend,
 		contentType: 'application/json',   // Sends - Content-type
		success: function(){
			location.reload(true);
		},
 
		error: function(errorObject ){
 		}
	});
}
function categoryEdit(id) {
	$.ajax({
		url: '/deals/admin/editCategory?'+csrf,
 		type: 'GET',
 		async:false,
		dataType: "json",
		data:'id=' + id,
	 	 success: function (response) {
	 		document.getElementById('category-edit-name').value = response.name;
	 		document.getElementById('category-edit-id').value = id;
	 		
			},
			error: function(data){
		 	 } 
   });
}
function categoryUpdate(){
   	var dataToSend = JSON.stringify(serializeObject($('#categoryUpdateForm')));
   	
   	 $.ajax({
		type: 'PUT',
		url:'/deals/admin/editCategory?'+csrf,
		dataType: "json",           // Accept header
 		data:dataToSend,
 		contentType: 'application/json',   // Sends - Content-type
		success: function(){
			location.reload(true);
			//location.reload(true); 
		},
 
		error: function(errorObject ){
			if (errorObject.responseJSON.errorType == "validationError") {
				
	 			$('#resultEdit').html("");
	  			    var errorList = errorObject.responseJSON.errors;
	 	 	        $.each(errorList,  function(i,error) {			   
	 		    		$("#resultEdit").append( error.message + '<br>');
			    	});
	 	 	        $("#resultEdit").append( '</p>');
	 	 	        $('#resultEdit').show();
			}
			else {
				alert(errorObject.responseJSON.errors(0));   // "non" Validation Error
			}
 		}
	});
}  	
function userSubmit(){
   	var dataToSend = JSON.stringify(serializeObject($('#userForm')));
   	 $.ajax({
		type: 'POST',
		url:'/deals/admin/addUser?'+csrf,
		dataType: "json",           // Accept header
 		data:dataToSend,
 		contentType: 'application/json',   // Sends - Content-type
		success: function(){
			location.reload(true); 
		},
 
		error: function(errorObject ){	
			if (errorObject.responseJSON.errorType == "validationError") {
	 			
	 			$('#resultuserSubmit').html("");
	  			    var errorList = errorObject.responseJSON.errors;
	 	 	        $.each(errorList,  function(i,error) {			   
	 		    		$("#resultuserSubmit").append( error.message + '<br>');
			    	});
	 	 	        $("#resultuserSubmit").append( '</p>');
	 	 	        $('#resultuserSubmit').show();
			}
			else {
				  // "non" Validation Error
			}
 		}
	});
}  	 
function userRemove(id){
	
	var dataToSend = JSON.stringify(id);
   	 $.ajax({
		type:'DELETE',
		url:'/deals/admin/deleteUser?'+csrf,
		dataType: "json",           // Accept header
 		data:dataToSend,
 		contentType: 'application/json',   // Sends - Content-type
		success: function(){
			location.reload(true);
		},
		
		error: function(errorObject ){
 		}
	});
}
function userEdit(id) {
	
	$.ajax({
		url: '/deals/admin/editUser?'+csrf,
 		type: 'GET',
 		async:false,
		dataType: "json",
		data:'id=' + id,
	 	 success: function (user) {
	 		 console.log(user);
	 		document.getElementById('idUpdate').value = id;
	 		document.getElementById('nameUpdate').value = user.name;
	 		document.getElementById('emailUpdate').value = user.email;
	 		document.getElementById('passwordUpdate').value = user.password;
	 		document.getElementById('addressUpdate').value = user.location.address;
	 		document.getElementById('cityUpdate').value = user.location.city;
	 		document.getElementById('stateUpdate').value = user.location.state;
	 		document.getElementById('countryUpdate').value = user.location.country;
	 		document.getElementById('postalCodeUpdate').value = user.location.postalCode;
	 		if (user.state==1) {
	 			$("#status.ACTIVE.Update").attr('checked', 'checked');
	 		} else if (user.state==2) {
	 			$("#status.INACTIVE.Update").attr('checked', 'checked');
	 		} else if (user.state==3) {
	 			$("#status.BANNED.Update").attr('checked', 'checked');
	 		} else {
	 			$("#status.LOCKED.Update").attr('checked', 'checked');
	 		} 
	 		for (role in user.roles) {
	 		    if(user.role.id==1){
	 		    	$("#userAdminUpdate").attr('checked', 'checked');
	 		    }
	 		   if(user.role.id==2){
	 		    	$("#userMemberUpdate").attr('checked', 'checked');
	 		    }
	 		}
	 	 },
			error: function(data){
		 	 } 
   });
}
function userUpdate(){
   	var dataToSend = JSON.stringify(serializeObject($('#userUpdateForm')));
   	
   	 $.ajax({
		type: 'PUT',
		url:'/deals/admin/editUser?'+csrf,
		dataType: "json",           // Accept header
 		data:dataToSend,
 		contentType: 'application/json',   // Sends - Content-type
		success: function(){
			location.reload(true);
			//location.reload(true); 
		},
 
		error: function(errorObject ){
			if (errorObject.responseJSON.errorType == "validationError") {
				
				var errors
	 			$('#resultEdit').html("");
	  			    var errorList = errorObject.responseJSON.errors;
	 	 	        $.each(errorList,  function(i,error) {			   
	 		    		$("#resultEdit").append( error.message + '<br>');
	 		    		errors+=error.message;
			    	});
	 	 	        $("#resultEdit").append( '</p>');
	 	 	        $('#resultEdit').show();
			}
			else {
				   // "non" Validation Error
			}
 		}
	});
}  	
resetForm = function(id) {
    var element = document.getElementById(id);
    $(element)[0].reset();

    }	  
	


make_hidden = function(id) {
    var e = document.getElementById(id);
        e.style.display = 'none';
        }	   

make_visible = function(id) {
    var e = document.getElementById(id);
    e.style.display = 'block';
 }	   

// Translate form to array
// Then put in JSON format
 function serializeObject (form)
{
	 
    var jsonObject = {};
    var array = form.serializeArray();
    $.each(array, function() {
         	jsonObject[this.name] = this.value;
    });
    return jsonObject;
    
}
