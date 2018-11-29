public class LoginPage1 
{

    public PageReference signin() {
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
                if(lg.Employee_ID__c != null || lg.Password__c != null)
                {
                       for(Employee__c f: lglist)
                       {
                             id1= f.id;
                       }
                       if(lglist.size()>0)
                       {                            
                                                                      pg= new pagereference('https://c.na15.visual.force.com/apex/Employeedetails?id='+id1);
                            
                               
                                       
                      }
                      else
                             pg= new pagereference('https://c.ap1.visual.force.com/apex/LoginFail');
                       return pg;
               }
               else
               {
                       ApexPages.addMessage(new ApexPages.message(ApexPages.severity.Error,'Field Missing'));
                       return null;
               }
        }
        public PageReference reset()
        {
                pagereference pg = new pagereference('https://c.ap1.visual.force.com/apex/LoginAdmin');
                return pg;
        }
}