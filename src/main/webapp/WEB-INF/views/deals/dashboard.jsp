<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<input id="contextPath"type="hidden" value='<spring:url value="/"></spring:url>'>

      
<section class="mainContent clearfix productsContent">
        <div class="container">
          <div class="row">
            <div class="col-md-3 col-sm-4 col-xs-12 sideBar">
              <div class="panel panel-default">
                <div class="panel-heading">Product categories</div>
                <div class="panel-body">
                  <div class="collapse navbar-collapse navbar-ex1-collapse navbar-side-collapse">
                    <ul class="nav navbar-nav side-nav" id="selectCategory">
                      <c:forEach var="category" items="${categories }">
                      	<li data-id="${category.id }" class="categoryList"><a href="javascript:void(0)">${category.name }</a></li>                      
                      </c:forEach>
                      
                    </ul>
                  </div>
                </div>
              </div>
          
            </div>
            <div class="col-md-9 col-sm-8 col-xs-12">
              <div class="row filterArea">
                <div class="col-xs-6">
                  <select name="sortList"  id="sortList" class="select-drop">
                    <option value="timestamp_desc">Sort by newness (desc)</option>
                    <option value="timestamp_asc">Sort by newness (asc)</option>
                    <option value="price_desc">Sort by price(desc)</option>            
                    <option value="price_asc">Sort by price(asc)</option>            
                  </select>
                </div>
                  <div class="col-xs-6">
                  <div class="btn-group pull-right" role="group">
                    <button type="button" class="btn btn-default active" id="post_link" data-link='<spring:url value="/add/${dealType}"></spring:url>'><i class="fa fa-th" aria-hidden="true"></i><span>Post</span></button>
                  </div>
                </div>
			</div>
              <div class="row" id="showDeals" >
              <div class="row" id="dealsArea" >
              <%-- <c:forEach var="deal" items="${dealList }">
                <div class="col-sm-4 col-xs-12">
                  <div class="productBox">
                    <div class="productImage clearfix">
                    	
                      <img src="<spring:url value='/resources/images/deals/products-0${deal.id}.jpg'></spring:url>" alt="products-img">
                    
                      <div class="productMasking">
                        <ul class="list-inline btn-group" role="group">
                          <li><a data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.login-modal" class="btn btn-default"><i class="fa fa-heart"></i></a></li>
                          <li><a href="cart-page.html" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a></li>
                          <li><a class="btn btn-default" data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.quick-view" ><i class="fa fa-eye"></i></a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="productCaption clearfix">
                      <a href="single-product.html">
                        <h5>${deal.title}</h5>
                      </a>
                      <h3>$<span>${deal.price}</span></h3>
                    </div>
                  </div>
                </div>
                </c:forEach> --%>
                <%-- <div class="col-sm-4 col-xs-12">
                  <div class="productBox">
                    <div class="productImage clearfix">
                      <img src="<spring:url value='/resources/images/deals/products-02.jpg'></spring:url>" alt="products-img">
                      <div class="productMasking">
                        <ul class="list-inline btn-group" role="group">
                          <li><a data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.login-modal" class="btn btn-default"><i class="fa fa-heart"></i></a></li>
                          <li><a href="cart-page.html" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a></li>
                          <li><a class="btn btn-default" data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.quick-view" ><i class="fa fa-eye"></i></a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="productCaption clearfix">
                      <a href="single-product.html">
                        <h5>Dip Dyed Sweater</h5>
                      </a>
                      <h3>$249</h3>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4 col-xs-12">
                  <div class="productBox">
                    <div class="productImage clearfix">
                      <img src="<spring:url value='/resources/images/deals/products-03.jpg'></spring:url>" alt="products-img">
                      <div class="productMasking">
                        <ul class="list-inline btn-group" role="group">
                          <li><a data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.login-modal" class="btn btn-default"><i class="fa fa-heart"></i></a></li>
                          <li><a href="cart-page.html" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a></li>
                          <li><a class="btn btn-default" data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.quick-view" ><i class="fa fa-eye"></i></a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="productCaption clearfix">
                      <a href="single-product.html">
                        <h5>Scarf Ring Corner</h5>
                      </a>
                      <h3>$179</h3>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4 col-xs-12">
                  <div class="productBox">
                    <div class="productImage clearfix">
                      <img src="<spring:url value='/resources/images/deals/products-04.jpg'></spring:url>" alt="products-img">
                      <div class="productMasking">
                        <ul class="list-inline btn-group" role="group">
                          <li><a data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.login-modal" class="btn btn-default"><i class="fa fa-heart"></i></a></li>
                          <li><a href="cart-page.html" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a></li>
                          <li><a class="btn btn-default" data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.quick-view" ><i class="fa fa-eye"></i></a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="productCaption clearfix">
                      <a href="single-product.html">
                        <h5>Sun Buddies</h5>
                      </a>
                      <h3>$149</h3>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4 col-xs-12">
                  <div class="productBox">
                    <div class="productImage clearfix">
                      <img src="<spring:url value='/resources/images/deals/products-05.jpg'></spring:url>" alt="products-img">
                      <div class="productMasking">
                        <ul class="list-inline btn-group" role="group">
                          <li><a data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.login-modal" class="btn btn-default"><i class="fa fa-heart"></i></a></li>
                          <li><a href="cart-page.html" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a></li>
                          <li><a class="btn btn-default" data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.quick-view" ><i class="fa fa-eye"></i></a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="productCaption clearfix">
                      <a href="single-product.html">
                        <h5>Nike Sportswear</h5>
                      </a>
                      <h3>$199</h3>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4 col-xs-12">
                  <div class="productBox">
                    <div class="productImage clearfix">
                      <img src="<spring:url value='/resources/images/deals/products-06.jpg'></spring:url>" alt="products-img">
                      <div class="productMasking">
                        <ul class="list-inline btn-group" role="group">
                          <li><a data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.login-modal" class="btn btn-default"><i class="fa fa-heart"></i></a></li>
                          <li><a href="cart-page.html" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a></li>
                          <li><a class="btn btn-default" data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.quick-view" ><i class="fa fa-eye"></i></a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="productCaption clearfix">
                      <a href="single-product.html">
                        <h5>Dip Dyed Sweater</h5>
                      </a>
                      <h3>$249</h3>
                    </div>
                  </div>
                </div> --%>
                <%-- <div class="col-sm-4 col-xs-12">
                  <div class="productBox">
                    <div class="productImage clearfix">
                      <img src="<spring:url value='/resources/images/deals/products-07.jpg'></spring:url>" alt="products-img">
                      <div class="productMasking">
                        <ul class="list-inline btn-group" role="group">
                          <li><a data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.login-modal" class="btn btn-default"><i class="fa fa-heart"></i></a></li>
                          <li><a href="cart-page.html" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a></li>
                          <li><a class="btn btn-default" data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.quick-view" ><i class="fa fa-eye"></i></a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="productCaption clearfix">
                      <a href="single-product.html">
                        <h5>Scarf Ring Corner</h5>
                      </a>
                      <h3>$179</h3>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4 col-xs-12">
                  <div class="productBox">
                    <div class="productImage clearfix">
                      <img src="<spring:url value='/resources/images/deals/products-08.jpg'></spring:url>" alt="products-img">
                      <div class="productMasking">
                        <ul class="list-inline btn-group" role="group">
                          <li><a data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.login-modal" class="btn btn-default"><i class="fa fa-heart"></i></a></li>
                          <li><a href="cart-page.html" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a></li>
                          <li><a class="btn btn-default" data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.quick-view" ><i class="fa fa-eye"></i></a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="productCaption clearfix">
                      <a href="single-product.html">
                        <h5>Sun Buddies</h5>
                      </a>
                      <h3>$149</h3>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4 col-xs-12">
                  <div class="productBox">
                    <div class="productImage clearfix">
                      <img src="<spring:url value='/resources/images/deals/products-09.jpg'></spring:url>" alt="products-img">
                      <div class="productMasking">
                        <ul class="list-inline btn-group" role="group">
                          <li><a data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.login-modal" class="btn btn-default"><i class="fa fa-heart"></i></a></li>
                          <li><a href="cart-page.html" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a></li>
                          <li><a class="btn btn-default" data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.quick-view" ><i class="fa fa-eye"></i></a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="productCaption clearfix">
                      <a href="single-product.html">
                        <h5>Nike Sportswear</h5>
                      </a>
                      <h3>$199</h3>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4 col-xs-12">
                  <div class="productBox">
                    <div class="productImage clearfix">
                      <img src="<spring:url value='/resources/images/deals/products-10.jpg'></spring:url>" alt="products-img">
                      <div class="productMasking">
                        <ul class="list-inline btn-group" role="group">
                          <li><a data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.login-modal" class="btn btn-default"><i class="fa fa-heart"></i></a></li>
                          <li><a href="cart-page.html" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a></li>
                          <li><a class="btn btn-default" data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.quick-view" ><i class="fa fa-eye"></i></a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="productCaption clearfix">
                      <a href="single-product.html">
                        <h5>Dip Dyed Sweater</h5>
                      </a>
                      <h3>$249</h3>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4 col-xs-12">
                  <div class="productBox">
                    <div class="productImage clearfix">
                      <img src="<spring:url value='/resources/images/deals/products-11.jpg'></spring:url>" alt="products-img">
                      <div class="productMasking">
                        <ul class="list-inline btn-group" role="group">
                          <li><a data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.login-modal" class="btn btn-default"><i class="fa fa-heart"></i></a></li>
                          <li><a href="cart-page.html" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a></li>
                          <li><a class="btn btn-default" data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.quick-view" ><i class="fa fa-eye"></i></a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="productCaption clearfix">
                      <a href="single-product.html">
                        <h5>Scarf Ring Corner</h5>
                      </a>
                      <h3>$179</h3>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4 col-xs-12">
                  <div class="productBox">
                    <div class="productImage clearfix">
                      <img src="<spring:url value='/resources/images/deals/products-12.jpg'></spring:url>" alt="products-img">
                      <div class="productMasking">
                        <ul class="list-inline btn-group" role="group">
                          <li><a data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.login-modal" class="btn btn-default"><i class="fa fa-heart"></i></a></li>
                          <li><a href="cart-page.html" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a></li>
                          <li><a class="btn btn-default" data-toggle="modal" href="http://themes.iamabdus.com/bigbag/1.1/.quick-view" ><i class="fa fa-eye"></i></a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="productCaption clearfix">
                      <a href="single-product.html">
                        <h5>Sun Buddies</h5>
                      </a>
                      <h3>$149</h3>
                    </div>
                  </div>
                </div>
              </div>  
            </div>
          </div> --%>
        </div>
      </section>