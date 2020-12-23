<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" import="java.util.*" %>
<%@ page import="system.ServiceRequest" %>

<!DOCTYPE html>
<html lang="en">

    <jsp:include page="/templates/user-top.html" />
     <!-- Content Wrapper -->
     <div id="content-wrapper" class="d-flex flex-column">

      
            <!-- Main Content -->
            <div id="content">
      
              <!-- Topbar -->
              <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
      
                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                  <i class="fa fa-bars"></i>
                </button>
      
                <!-- Topbar Search -->
                <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                  </div>
                </form>
      
                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">
      
                  <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                  <li class="nav-item dropdown no-arrow d-sm-none">
                    <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-search fa-fw"></i>
                    </a>
                    <!-- Dropdown - Messages -->
                    <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                      <form class="form-inline mr-auto w-100 navbar-search">
                        <div class="input-group">
                          <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                          <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                              <i class="fas fa-search fa-sm"></i>
                            </button>
                          </div>
                        </div>
                      </form>
                    </div>
                  </li>
      
                  <% LinkedList<ServiceRequest> tests = (LinkedList<ServiceRequest>)request.getAttribute("requests"); 
                
                    int updated = 0;
                    
              for(ServiceRequest req : tests)
              {
               
                if(request.getUserPrincipal().getName().equals(req.getUser())){
                    if(req.getStatus().equals("Completed")){
                      updated++;
                    }
                }
      
              } %>
      
                  <!-- Nav Item - Alerts -->
                  <li class="nav-item dropdown no-arrow mx-1">
                    <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-bell fa-fw"></i>
                      <!-- Counter - Alerts -->
                      <span class="badge badge-danger badge-counter"><%= updated %></span>  <!-- this is the counter -->
                    </a>
      
                    <!-- Dropdown - Alerts -->
                    <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                      <h6 class="dropdown-header">
                        Alerts Center
                      </h6>
                      
                  <% if(updated != 0){ %>
                     <!-- Alert -->
                      <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="mr-3">
                          <div class="icon-circle bg-primary">
                            <i class="fas fa-file-alt text-white"></i>
                          </div>
                        </div>
                        <div>
                          <div class="small text-gray-500">Update to your reports</div>
                          <span class="font-weight-bold">One or more of your reports have progressed and are waiting for your confirmation</span>
                        </div>
          <% } else{ %>
                        <!-- default -->
                      <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="mr-3">
                          <div class="icon-circle bg-primary">
                            <i class="fas fa-file-alt text-white"></i>
                          </div>
                        </div>
                        <div>
                          <div class="small text-gray-500">No updates</div>
                          <span class="font-weight-bold">You have no current updates requiring attention</span>
                        </div>
                        
                        <% } %>
                      </a>
                      <!-- end of alert -->
      
                    </div>
                  </li>            
                </ul>
      
              </nav>
              <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Reports</h1>
          </div>
        <hr>
             
            
              <% LinkedList<ServiceRequest> requests = (LinkedList<ServiceRequest>)request.getAttribute("requests"); 
                     out.print("<h1> Knowledge Base</h1><br><p>Selected knowledge base: "+request.getParameter("knowledge")+"</p><hr>");
                 int i = 0;
                 int test = 0;
           for(ServiceRequest req : requests){
            
             if(req.getCat().equalsIgnoreCase(request.getParameter("knowledge")))
             { 
                 test++;
             %>
            <h4>
              <%=  req.getTitle() %>
            </h4>
            <% out.print("Issue: " +req.getIssue() +"<hr>");} %>
          <% i++;} %>
          <% if(test == 0){
             out.print("<h4>There are no articles in this category</h4>");
          }
          %>
          
      </div>
      <!-- End of Main Content -->


      <jsp:include page="/templates/user-bottom.html" />

</html>
