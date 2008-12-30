package suite {

  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  import org.coderepos.xml.atom.AtomControl;

  public class AtomControlTest extends TestCase {

    public function AtomControlTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new AtomControlTest("testBuild") );
      return ts;
    }

    public function testBuild():void {
      var c:AtomControl = new AtomControl();
      assertEquals('<app:control xmlns:app="http://www.w3.org/2007/app"/>', c.toXMLString());
      assertFalse(c.draft);
      c.draft = true;
      assertTrue(c.draft);
      var result:String = c.toXMLString();
      assertEquals('<app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>yes</app:draft></app:control>', result);
    }

  }

}

