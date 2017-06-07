 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 <section class="mainContent clearfix userProfile">
        <div class="container">
          <div class="row">
            <div class="col-xs-12">
              <div class="btn-group" role="group" aria-label="...">
              
                <a href="javascript:void(0)" id="default_user_dashboard_link" data-link='<spring:url value="/user/dashboard/profile"></spring:url>' class="btn btn-default link_user_dashboard active"><i class="fa fa-user" aria-hidden="true"></i>Profile</a>
                <a href="javascript:void(0)" data-link="<spring:url value="/user/dashboard/offers"></spring:url>" class="btn btn-default link_user_dashboard"><i class="fa fa-gift" aria-hidden="true"></i>Offers</a>
              </div>
            </div>
          </div>
          <div class="row" id="user_dashboard_content">
          
          </div>
        </div>
      </section>