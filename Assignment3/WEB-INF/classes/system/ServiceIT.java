package system;

import java.util.*;

import system.ServiceRequest; 

public class ServiceIT{
    LinkedList<ServiceRequest> newRequests;
    LinkedList<ServiceRequest> knowledgeBase;
    LinkedList<User> usernames;
    String maintenance;
    String status;

    public ServiceIT(){
        newRequests = new LinkedList<ServiceRequest>();
        knowledgeBase = new LinkedList<ServiceRequest>();
        usernames = new LinkedList<User>();
        String maintenance = "No Planned Maintenance";
        String status = "Online";

        
    }

    public void newUser(String user){
        User newUser = new User(user);
        usernames.add(newUser);
    }


    public boolean userCheck(String in){
        if(usernames.size() != 0){
        for(User req : usernames)
           {
               if( req.getUsername().equals(in)){
                   return true;
               }
           }
        }
           return false;

    }

    public void addKBReq(ServiceRequest newReq){ knowledgeBase.add(newReq);}

    public LinkedList<ServiceRequest> getKBReq(){ return knowledgeBase; }

    public void setWebStatus(String webStatus){ this.status = status;}

    public String getWebStatus(){ return status;}

    public void setMaintenance(String nextMaintenance){ this.maintenance = maintenance; }

    public String getMaintenance(){ return maintenance; }

    public ServiceRequest getReqIn(int i){ return newRequests.get(i); }

    public void removeReq(int i){ newRequests.remove(i); }

    public void addRequest(ServiceRequest newReq){ newRequests.add(newReq); }

    public LinkedList<ServiceRequest> getNewReq(){ return newRequests; }

    public void updateStatus(int i, String newStatus){ newRequests.get(i).setStatus(newStatus); }

    public void updateWait(int i, String newStatus){ newRequests.get(i).setWait(newStatus); }

    public void setReq(LinkedList<ServiceRequest> reqs){ this.newRequests = reqs; }

    public int getNew(){
        int test = 0;
        for(ServiceRequest req : newRequests)
           {
               if( req.getStatus().equals("New")){
                   test++;
               }
           }
        return test;
    }

    public int getProg(){
        int test = 0;
        for(ServiceRequest req : newRequests)
           {
               if( req.getStatus().equals("Progress")){
                   test++;
               }
           }
        return test;
    }

    public int getComp(){
        int test = 0;
        for(ServiceRequest req : newRequests)
           {
               if( req.getStatus().equals("Completed")){
                   test++;
               }
           }
        return test;
    }

    public int getRes(){
        int test = 0;
        for(ServiceRequest req : newRequests)
           {
               if( req.getStatus().equals("Resolved")){
                   test++;
               }
           }
        return test;
    }


}