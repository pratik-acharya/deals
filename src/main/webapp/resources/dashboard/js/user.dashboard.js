$(document).ready(function(){
	var contentElement = $("#user_dashboard_content");
	var page = 1;
	
	
	$(".link_user_dashboard").click(function(){
		page=1;
		$(".link_user_dashboard").removeClass('active');
		$(this).addClass('active');
		loadContent(contentElement,$(this).data('link'));
	});
	

	
	function loadContent(element,url){
		element.load(url, function( response, status, xhr ) {
			  if ( status == "error" ) {
			    var msg = "Sorry but there was an error: ";
			    $( "#error" ).html( msg + xhr.status + " " + xhr.statusText );
			  }
		});
	}
	
	loadContent(contentElement,$("#default_user_dashboard_link").data('link'));
	
	
	$(document).on('click', '#more_offer_list_button', function(){
		var contextPath = $("#contextPath").val();

		page++;
		 $.ajax({
			type:"GET",
			 url: $(this).data('link')+"?page.page="+page+"&page.size=1", 
			 dataType:"json",
			 contentType:"application/json",
			 success: function(result){
				 	if(result.lastPage){
				 		$("#more_offer_list_button").hide();
				 	}
				 	$.each(result.content,function(i,deal){
				 	$("#offers_table_body_content").append('<tr id="user_dashboard_offer_'+deal.id+'">'+
					'<td class="col-md-2 col-sm-3">'+
						'<span class="cartImage"><img height=100 width=100 '+
							'src="'+contextPath+'resources/images/deals/'+deal.id+'.jpg" alt="image"></span>'+
					'</td>'+
					'<td>'+deal.title+'</td>'+
					'<td>$ '+deal.price+'</td>'+
					'<td>'+deal.category.name+'</td>'+
					'<td>'+deal.description+'</td>'+
					' <td>'+
		              '<div class="btn-group" role="group">'+
		                    '<button type="button" class="btn btn-default" id="user_dashboard_edit_offer_button" data-offer="'+deal.id+'"><i class="fa fa-pencil" aria-hidden="true"></i></button>'+
		                    '<button type="button" class="btn btn-default" data-toggle="modal" data-target="#user_dashboard_delete_offer_modal" data-offer="'+deal.id+'"><i class="fa fa-times" aria-hidden="true"></i></button>'+
		               '</div>'+
                     '</td>'+
					'</tr>'
				 	);
				 	});
		 
	 }});
	});

});

$(document).on("click","#user_dashboard_edit_offer_button",function(){
	var offer = $(this).data("offer");
	var contextPath = $("#contextPath").val();
	window.location.href = contextPath+"/add/offer?id="+offer;
});


$(document).on("click","#modal_delete_offer_button",function(){
	$("#user_dashboard_delete_offer_modal").modal("hide");
	var offer = $(this).data("offer");
	var contextPath = $("#contextPath").val();
	var csrf = $("#csrfToken").val();
	 $.ajax({
			type:"DELETE",
			 url: contextPath+"user/offer/"+offer+"?"+csrf, 
			 success: function(result){
				 $("#user_dashboard_offer_"+offer).fadeOut("slow");
	

			 },error: function(jqXHR,  textStatus,  exception ){	
				 
			 },complete:function(data){
	 
			 }});
});

$(document).on('show.bs.modal',"#user_dashboard_delete_offer_modal", function (event) {
	console.log("called");
	  var button = $(event.relatedTarget);
	  var modal = $(this)
	 modal.find('#modal_delete_offer_button').data("offer",button.data('offer'));
	});

$(document).on("click","#user_dashboard_profile_form_submit_button",function(e){
	e.preventDefault();
	$(this).html("Updating")
	var formData = JSON.stringify(serializeObject($("#user_dashboard_profile_form")));
	 $.ajax({
			type:"POST",
			 url: $(this).data('link'), 
			 data:formData,
			 dataType:"json",
			 contentType:"application/json",
			 success: function(result){
					$("#user_dashboard_profile_form_submit_button").html("Update");
					$("#update_user_dashboard_profile_success").fadeIn("slow");

	 },error: function(jqXHR,  textStatus,  exception ){	
			
			if (jqXHR.responseJSON.errorType == "validationError") {
	 			$('#update_user_dashboard_profile_error').html("");
	 			$("#update_user_dashboard_profile_error").append( '<H3 align="center"> Error(s)!! <H3>');                
	  			    $("#errors").append( '<p>');
	  	
	  			    var errorList = jqXHR.responseJSON.errors;
	 	 	        $.each(errorList,  function(i,error) {			   
	 		    		$("#update_user_dashboard_profile_error").append( error.message + '<br>');
			    	});
	 	 	        $("#update_user_dashboard_profile_error").append( '</p>');
	 				$('#update_user_dashboard_profile_error').fadeIn("slow");
			} 
	 },complete:function(data){
	 
			$("#user_dashboard_profile_form_submit_button").html("Update");
			$("#update_user_dashboard_profile_success").fadeOut("slow");
	 


	 }});
	
});


 function serializeObject (form)
	 {
		 var jsonObject = {};
	     var array = form.serializeArray();
	     $.each(array, function() {
	    	 if (this.name.indexOf('.') > -1)
	    	 {
	    		 var partsOfStr = this.name.split('.');
	    		 if(!(partsOfStr[0] in jsonObject) ){
	    		 jsonObject[partsOfStr[0]] = {};
	    		 }
	    		 jsonObject[partsOfStr[0]] [partsOfStr[1]] = this.value;
	    		
	    		 
	    	 }else jsonObject[this.name] = this.value;
	     });
	     return jsonObject;

	 };



