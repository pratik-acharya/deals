<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<input id="csrfToken" type="hidden" value='${_csrf.parameterName}=${_csrf.token}'>
<section class="home-content-top">
  <div class="container">
    
    <!--our-quality-shadow-->
    <div class="clearfix"></div>
    <div class="tabbable-panel margin-tops4 ">
      <div class="tabbable-line">
        <ul class="nav nav-tabs tabtop  tabsetting">
          <li class="active"> <a href="#tab_default_1" data-toggle="tab">Member</a> </li>
          <li> <a href="#tab_default_2" data-toggle="tab">Category </a> </li>

        </ul>
        <div class="tab-content margin-tops">
          <div class="tab-pane active fade in" id="tab_default_1">
            
            <%@ include file="memberList.jsp" %>
            
          </div>
          <div class="tab-pane fade" id="tab_default_2">
          
            <%@ include file="categoryList.jsp" %>
            
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
