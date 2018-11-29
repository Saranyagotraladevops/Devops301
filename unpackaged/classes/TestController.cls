public class TestController
  {
    public TestController() {}
    // This will simple create a log that the action was invoked
    public void process()
    {
      System.debug( 'Came to TestController, process() method' );
    }
  }