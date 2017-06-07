$(document).ready(function(){
	var filter = null;
	var value = null;
	var sort = "timestamp";
	var direction = "desc";
	var page =1;
	var contextPath = $("#contextPath").val();
	var url = null;


	
	getDeals(filter,value,sort,direction);
	
	function getDeals(filter,value,sort,direction){
		$("#dealsArea").html("");
		console.log(filter);
		console.log(sort);
		console.log(direction);
		if(filter==null){
			 url =contextPath+"dashboard/deals?sort="+sort+"&direction="+direction+"&page.page="+page+"&page.size=50";
		}else{
			 url = contextPath+"dashboard/deals?filter="+filter+"&value="+value+"&sort="+sort+"&direction="+direction+"&page.page="+page+"&page.size=20";

		}
		$.ajax({
				type:"GET",
				 url: url, 
				 dataType:"json",
				 contentType:"application/json",
				 success: function(result){
					 page++;
					 $.each(result.content,function(i,deal){
					
					 $("#dealsArea").append(
			              '<div class="col-sm-4 col-xs-12">'+
			                '<div class="productBox">'+
		                    '<div class="productImage clearfix">'+
		                      '<img src="'+contextPath+'/resources/images/deals/'+deal.id+'.jpg" alt="products-img">'+
		                     ' <div class="productMasking">'+
		                        '<ul class="list-inline btn-group" role="group">'+
		                          '<li><a class="btn btn-default" data-toggle="modal" href="'+contextPath+'deal/'+deal.id+'" ><i class="fa fa-eye"></i></a></li>'+
		                        '</ul>'+
		                     '</div>'+
		                    '</div>'+
		                    '<div class="productCaption clearfix">'+
		                      '<a href="javascript:void(0)">'+
		                        '<h5>'+deal.title+'</h5>'+
		                     '</a>'+
		                      '<h3>$'+deal.price+'</h3>'+
		                    '</div>'+
		                  '</div>'+
		                '</div>'
			              );
					 
					 });
	 
			 
		 }});	
	}
	
	 $(document).on('click',".categoryList",function(){
		 	page =1;
		 	$(".categoryList").removeClass("list-active");
			$(this).addClass("list-active");
			value = $(this).data('id');
			filter = "category";
			getDeals(filter,value,sort,direction);

			 
	 });
	 
	 $("#sortList").change(function(){
		page =1;
		var selectedValue = $(this).val();
		var parts = selectedValue.split("_");
		sort = parts[0];
		direction = parts[1];
		getDeals(filter,value,sort,direction);

		
		 
	 });
	
});