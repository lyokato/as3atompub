package suite {

  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  import org.coderepos.xml.atom.*;
  import com.adobe.net.URI;

  public class AtomFeedTest extends TestCase {

    public function AtomFeedTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new AtomFeedTest("testBuild") );
      ts.addTest( new AtomFeedTest("testParse") );
      return ts;
    }

    public function testBuild():void {

    }

    public function testParse():void {

    }

  }

}
