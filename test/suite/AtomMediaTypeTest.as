package suite {

  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  import org.coderepos.atompub.AtomMediaType;

  public class AtomMediaTypeTest extends TestCase {

    public function AtomMediaTypeTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new AtomMediaTypeTest("testBasic") );
      return ts;
    }

    public function testBasic():void {
      assertEquals("application/atomsvc+xml", AtomMediaType.SERVICE.toString());
      assertEquals("application/atomcat+xml", AtomMediaType.CATEGORIES.toString());
      assertEquals("application/atom+xml;type=entry", AtomMediaType.ENTRY.toString());
      assertEquals("application/atom+xml;type=feed", AtomMediaType.FEED.toString());
    }

  }

}
