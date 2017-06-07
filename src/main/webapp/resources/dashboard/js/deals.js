

$(document).ready(function(){
	
	$("#post_link").click(function(){
		window.location.href = $(this).data('link');
	});
	
	$("#add_deal_form_submit_button").click(function(){
		$('#add_deal_form').submit();	   
	});
	
	
 $("#Post_Comment").click(function(){
		var csrf = $("#csrfToken").val();

		 
		 var Deal_id = $('#deal_id').val();
		 
		 var Content  = $('#Comment').val();
		 
	
		 var jsonObject = {"deal":{id: Deal_id}, "content": Content}
		
		
		 var dataToSend= JSON.stringify( jsonObject);
		 
		 var contextPath = $("#contextPath").val();
		
		
		 $.ajax({

					contentType: "application/json",
					
					type : "POST",
					
					dataType : "json",
					
					url : "/deals/saveComment?"+csrf,
					
					data : dataToSend,
					
				success : function(data) {
					
					var curdate = new Date(0);
					
					curdate.setTime(data.date);
				
				
					
					
					$('#formInput').append('<div class="commentsArea">' +
					'<div class="media">' +
					'<a class="media-left"href="blog-single-fullwidth.html#">'   +
					'<img class="media-object" src='+contextPath+'resources/images/users/user_icon.png width="80" height="80" alt="Image">' +
					'</a>' +
					'<div class="media-body">' +
							'<h4 class="media-heading">' + data.user.name + '</h4>' +  
						'<h4>' +
							'<span><i class="fa fa-calendar" aria-hidden="true"></i>' + curdate.toLocaleString().substring(0,8) + '</span>' +
						'</h4>' +
						 
						 '<textarea  class="form-control"  rows="3" cols="50" readonly="true" >' + data.content + '</textarea>' +
					'</div></div></div>');
					
					
					
				
					$('#formInput').show();
					$("#Comment").val('');
					$('#errors').html("");
			
					
					},

			  error : function(errorObject) {
				
				
			
		
				
				if (errorObject.responseJSON.errorType == "validationError") {
		 			
		 			$('#errors').html("");
		 			$("#errors").append( '<h3 align="center"> <label class="label label-danger">Error(s)!! </label></h3>');                
		  			   
		 			$("#errors").append( '<ul class="list-group">');
		  	
		  			    var errorList = errorObject.responseJSON.errors;
		 	 	        $.each(errorList,  function(i,error) {	
		 	 	        	
		 		    		$("#errors").append('<li class="list-group-item-warning">' + error.message + '</li>');
	
				    	});
		 	 	      $("#errors").append( '</ul>');
		 	 	        $('#errors').show();
				}
				else {
					alert(errorObject.responseJSON.errors(0));   // "non" Validation Error
				}
				
				

			}

		});
		
		
		
		});
	
		

					});
