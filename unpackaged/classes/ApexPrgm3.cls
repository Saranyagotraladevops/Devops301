public class ApexPrgm3
{
    private string ModelNumber;
    private Integer Stock;
    public ApexPrgm3(String themodelnumber,integer thestock)
    {
     modelnumber=themodelnumber;
        stock=thestock;
    }
    public  void todebug(ApexPrgm3 b)
    {
        system.debug(b.modelnumber);
        system.debug(b.stock);
    }
 
}