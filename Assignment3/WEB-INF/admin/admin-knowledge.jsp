<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" import="java.util.*" %>
<%@ page import="system.ServiceRequest" %>

<!DOCTYPE html>
<html lang="en">

    <jsp:include page="/templates/admin-top.html" />

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


      <jsp:include page="/templates/admin-bottom.html" />

</html>
