package system;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

//sets url
@WebServlet(urlPatterns = {""})
public class reqController extends HttpServlet {

  //create an instance of a ServiceIT class to run on the server
  ServiceIT newServer = new ServiceIT();


//handles get requests
  public void doGet(HttpServletRequest req, HttpServletResponse res) 
    throws IOException, ServletException
  {
    doUserCheck(req);

      if (req.isUserInRole("user")) {
        if(req.getParameter("myRep") != null){
          doUserReqView(req,res);
        }else if(req.getParameter("knowledge") != null){
            doUserKnowledgeView(req, res);
          }else{
          doUserView(req, res);
        }
      }
      else if (req.isUserInRole("admin")) {
        if(req.getParameter("adminreq") != null){
          doReqView(req, res);
        }
        else if(req.getParameter("knowledge") != null){
          doAdminKnowledgeView(req, res);
        }else{
          doAdminView(req, res);
        }
      }
      else {
          RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/loginError.jsp");
          dispatcher.forward(req, res);
          return;
      }
    
    
  }
  public void doUserCheck(HttpServletRequest req){
    String username = req.getUserPrincipal().getName();
    boolean test = newServer.userCheck(username);
    if(!test){
      newServer.newUser(username);
    }
  }
  

  //handles post requests
  public void doPost(HttpServletRequest req, HttpServletResponse res) 
    throws IOException, ServletException
  {
    //gets the category parameter
    String inputCat = req.getParameter("category");

    // tests to see if a category is present
    if(inputCat != null){
      
      ServiceRequest newReq = new ServiceRequest(inputCat, req.getParameter("IssueDesc"), req.getParameter("IssueName"), req.getUserPrincipal().getName(),req.getParameter("Restart"),req.getParameter("Location"));
      newServer.addRequest(newReq);
      
    }
    // Sets the new status of the selected IT request
    if(req.getParameter("statusUpdate") != null)
    {
      if(req.getParameter("statusUpdate").equals("Reporter")){
        newServer.updateWait(Integer.parseInt(req.getParameter("reqnum")), req.getParameter("statusUpdate"));

      }else{
        newServer.updateStatus(Integer.parseInt(req.getParameter("reqnum")), req.getParameter("statusUpdate"));
      }
      
    }

    if(req.getParameter("knowBaseUpdate") != null)
    {
        newServer.addKBReq(newServer.getReqIn(Integer.parseInt(req.getParameter("reqKB"))));
        newServer.removeReq(Integer.parseInt(req.getParameter("reqKB")));
    }

    if (req.getParameter("maintenanceInfo") != null){
    	newServer.setWebStatus(req.getParameter("maintenanceStatus"));
    	newServer.setMaintenance(req.getParameter("maintenanceInfo"));
    	req.setAttribute("systemStatus", newServer.getWebStatus());
    	req.setAttribute("systemMaintenance", newServer.getMaintenance());
    }

      doGet(req, res);
    
  }

 
  //displays the game jsp
  private void doAdminView(HttpServletRequest req, HttpServletResponse res) 
    throws IOException, ServletException
  {
      
      
      //Sets counter on admin dashboard
      req.setAttribute("new", newServer.getNew());
      req.setAttribute("prog", newServer.getProg());
      req.setAttribute("comp", newServer.getComp());
      req.setAttribute("res", newServer.getRes());
      

    //get the game jsp
    RequestDispatcher view = req.getRequestDispatcher("WEB-INF/admin/admin.jsp");

    //forward the request
    view.forward(req, res);
  }

  private void doReqView(HttpServletRequest req, HttpServletResponse res) 
    throws IOException, ServletException
  {
    
      req.setAttribute("requests", newServer.getNewReq());
    
    
    //get the game jsp
    RequestDispatcher view = req.getRequestDispatcher("WEB-INF/admin/adminReports.jsp");

    //forward the request
    view.forward(req, res);
  }

  private void doUserReqView(HttpServletRequest req, HttpServletResponse res) 
    throws IOException, ServletException
  {
    
      req.setAttribute("requests", newServer.getNewReq());
    
    
    //get the game jsp
    RequestDispatcher view = req.getRequestDispatcher("WEB-INF/user/userReports.jsp");

    //forward the request
    view.forward(req, res);
  }


   //displays the game jsp
   private void doLoginView(HttpServletRequest req, HttpServletResponse res) 
   throws IOException, ServletException
 {
   //get the game jsp
   RequestDispatcher view = req.getRequestDispatcher("login.jsp");

   //forward the request
   view.forward(req, res);
 }

  //displays the game jsp
  private void doUserView(HttpServletRequest req, HttpServletResponse res) 
    throws IOException, ServletException
  {
    req.setAttribute("requests", newServer.getNewReq());
    //get the game jsp
    RequestDispatcher view = req.getRequestDispatcher("WEB-INF/user/user.jsp");

    //forward the request
    view.forward(req, res);
  }

  //displays the game jsp
  private void doAdminKnowledgeView(HttpServletRequest req, HttpServletResponse res) 
    throws IOException, ServletException
  {
    req.setAttribute("requests", newServer.getKBReq());
    //get the game jsp
    RequestDispatcher view = req.getRequestDispatcher("WEB-INF/admin/admin-knowledge.jsp");

    //forward the request
    view.forward(req, res);
  }
  //displays the game jsp
  private void doUserKnowledgeView(HttpServletRequest req, HttpServletResponse res) 
    throws IOException, ServletException
  {
    req.setAttribute("requests", newServer.getKBReq());
    //get the game jsp
    RequestDispatcher view = req.getRequestDispatcher("WEB-INF/user/user-knowledge.jsp");

    //forward the request
    view.forward(req, res);
  }
}

  