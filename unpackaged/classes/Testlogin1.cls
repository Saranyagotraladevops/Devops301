public class Testlogin1 {

    public String getUsername() {
        return null;
    }

 public Employee__c lg=new Employee__c();
       public Id id1;
        PageReference pg;
        Employee__c c;
        public Employee__c getvalues()
        {
                return lg;
        }
        public PageReference submit()
        {
                list<Employee__c> lglist=[select Employee_ID__c,Password__c from Employee__c where  Employee__c.Employee_ID__c=:lg.Employee_ID__c AND Employee__c.Password__c=:lg.Password__c];
                if(lg.Employee_ID__c != null && lg.Password__c != null)
                {
                       for(Employee__c f: lglist)
                       {
                             id1= f.id;
                       }   
                       if(lglist.size()>0)
                       {
                           pg= new pagereference('https://c.ap1.visual.force.com/apex/loginsuccess?id='+id1);
                          /*    String query=[Select name from employee__c where employee__c.employeeid__c =: lg.employeeid__c];
                           list<Tracker__c> track = [select MarksObtained__c from Tracker__c order by Employee__c];
                           for(integer i=0;i<track.size();i++)
                           {
                          // String test=track.get(i);
                           System.debug(track.get(i));
                          
                            }*/
                            // 
                       }
                       else
                             pg= new pagereference('https://c.ap1.visual.force.com/apex/loginfailure');
                       return pg;
               }
               else
               {
                       ApexPages.addMessage(new ApexPages.message(ApexPages.severity.Error,'Field Missing'));
                       return null;
               }
        }
        public pagereference reset()
        {
                pagereference pg = new pagereference('https://c.ap1.visual.force.com/apex/index');
                return pg;
        }
}