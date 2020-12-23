package system;

import java.util.*; 


public class ServiceRequest{

    LinkedList<String> comments;
    String category, status, issue, title, restart, location;
    boolean resolved;
    String wait = "Admin";
    String userSub = "";

    public ServiceRequest(String cat, String issue, String title,String userSub, String res, String loc){
        comments = new LinkedList<String>();
        category = cat;
        this.issue = issue;  
        this.title = title;
        this.userSub = userSub;
        status = "New";
        resolved = false; 
        restart = res;
        location = loc;
    }

    public String getUser(){ return userSub; }
    public String getRestart(){ return restart; }
    public String getLocation(){ return location; }
    public void setStatus(String stat){ status = stat; }
    public void setWait(String nWait){ wait = nWait; }
    public String getTitle(){ return title; }
    public String getCat(){ return category; }
    public int getCommentNum(){ return comments.size(); }
    public String getComment(int num){ return comments.get(num); }
    public String getStatus(){ return status; }
    public String getWait(){ return wait; }
    public String getIssue(){ return issue; }


}