public class Fridge
{
	private String modelNumber;
	private Integer numberInStock;
	public  Fridge()
    {
    	modelNumber = 'XX-XX';
		numberInStock = 0;
	}
	public Fridge(String theModelNumber,Integer theNumberInStock)
	{
		modelNumber = theModelNumber; 
		numberInStock = theNumberInStock;
	}
    public void todebug(Fridge f)
    {
        	system.debug(f.modelnumber);
            system.debug(f.numberInstock);
    }
     
}