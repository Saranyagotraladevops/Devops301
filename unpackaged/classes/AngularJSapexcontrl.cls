public with sharing class AngularJSapexcontrl {

    public AngularJSapexcontrl() {
      
    }
    Public class accountwrapper
    {
      Public Integer RowId {get;set;}
       public Id accid{get;set;}
       public string accname{get;set;}
       public string Industry{get;set;}
       public string description{get;set;}
       
       public string Type{get;set;}
       public accountwrapper(Integer rid,Id acid,string acname,string ind,string descrptn,string type)
       {
          this.RowId = rid;
          this.accid = acid;
          this.accname = acname;
          this.Industry=ind;
          this.description=descrptn;
          
          this.Type=type;
       }
    }
@RemoteAction
     public static List<accountwrapper> getAccounts ()
     {
      Integer i = 0;
      List<accountwrapper> acclist = new List<accountwrapper> ();
      string querystring = 'select id,name,Industry,Description,Type from Account';
      List<Account> accrecords = Database.Query(queryString);
      if(accrecords.size() > 0)
      {
        for(Account record : accrecords)
        {
           acclist.add(new accountwrapper(i,record.id,record.name,record.Industry,record.Description,record.Type)); 
           i++;
        }    
      }
      system.debug('$$$$$$$$'+acclist);
  return acclist;
     
     }
@RemoteAction
     public static List<String> Types()
     {
       List<String> options = new List<String>();
       Schema.DescribeFieldResult type1 = Account.Type.getDescribe();
       for (Schema.Picklistentry picklistEntry: type1.getPicklistValues())
       {
         Options.add(pickListEntry.getValue());
       }
       return options;
     }
     
  @RemoteAction
     public static string saverecord(String recordtosave)
     {
         string message;
         system.debug('@@@@@@@@@@@@'+recordtosave);
         accountwrapper obj =(accountwrapper)JSON.deserialize(recordtosave, accountwrapper.class);
         system.debug('&&&&&&&&&&&&&&&&'+obj);
         Account mappingobj = new Account(Id = obj.accid);
         mappingobj.Name = obj.accname;
         mappingobj.Industry = obj.Industry;
         mappingobj.Description = obj.description;

         if(obj.Type != Null)
         { 
          mappingobj.Type = obj.Type;
         }
         
         
         try
         {
           upsert mappingobj;
           message = 'sucess';
         }
         catch(DmlException e)
         {
                             String error = e.getMessage();
         system.debug('DEBUG: ErrorMsg:'+error);
            
         }
         return message;
     }

@RemoteAction
     public static void deleterecord(String recordId)
     {
        Account delmapping = [select id from Account where id =:recordId];
        delete delmapping;
     }

}