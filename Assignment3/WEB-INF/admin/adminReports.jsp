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
          
                 int i = 0;
                 int test = 0;
           for(ServiceRequest req : requests)
           {
            
             if(req.getStatus().equalsIgnoreCase(request.getParameter("adminreq"))){ test++;
             %>
            <h4>
              <%=  req.getTitle() %>
            </h4>
            <b>
                <% out.print("Category: " +req.getCat()); %>
            </b>
           <p>
              <% out.print("<b>Waiting on: </b>" +req.getWait()); %><br>
              <% out.print("<b>Was a restart tried: </b>" +req.getRestart()); %><br>
              <% out.print("<b>Issue Location: </b>" +req.getLocation()); %><br>
              <% out.print("<b>Issue: </b>" +req.getIssue()); %>
          </p> 
          <% out.print("Status: <b>" +req.getStatus() + "</b><form method='post'> <em>Set Status</em><br><select name='statusUpdate'><option value='New'>New</option><option value='Progress'>Progress</option><option value='Completed'>Completed</option><option value='Reporter'>Waiting on reporter</option></select>&nbsp;&nbsp;<input type='text' name='reqnum' style='display: none;' value='" + i + "'></input> <input type='submit' value='Update'></form>");
         
          if(req.getStatus().equalsIgnoreCase("Resolved")){
          
            out.print("</br><form method='post'><button type='submit' name=knowBaseUpdate>Add to Knowledge Base</button><input type='text' name='reqKB' style='display: none;' value='" + i + "'></input></form><hr>");} } %>
          <% i++;} %>
          <% if(test == 0){
             out.print("<h4>There are no requests in this category</h4>");
          }
          %>
          

          
      </div>
      <!-- End of Main Content -->


      <jsp:include page="/templates/admin-bottom.html" />

</html>
