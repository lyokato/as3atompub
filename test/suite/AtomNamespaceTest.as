package suite {

  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  import org.coderepos.xml.atom.AtomNamespace;

  public class AtomNamespaceTest extends TestCase {

    public function AtomNamespaceTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new AtomNamespaceTest("testAtom") );
      ts.addTest( new AtomNamespaceTest("testApp") );
      ts.addTest( new AtomNamespaceTest("testDublineCore") );
      ts.addTest( new AtomNamespaceTest("testOpenSearch") );
      ts.addTest( new AtomNamespaceTest("testThreading") );
      return ts;
    }

    public function testAtom():void {
      assertEquals('atom', AtomNamespace.ATOM.prefix);
      assertEquals('http://www.w3.org/2005/Atom', AtomNamespace.ATOM.uri);
      assertNull(AtomNamespace.ATOM_WITHOUT_PREFIX.prefix);
      assertEquals('http://www.w3.org/2005/Atom', AtomNamespace.ATOM_WITHOUT_PREFIX.uri);
    }

    public function testApp():void {
      assertEquals('app', AtomNamespace.APP.prefix);
      assertEquals('http://www.w3.org/2007/app', AtomNamespace.APP.uri);
      assertNull(AtomNamespace.APP_WITHOUT_PREFIX.prefix);
      assertEquals('http://www.w3.org/2007/app', AtomNamespace.APP_WITHOUT_PREFIX.uri);
    }

    public function testDublineCore():void {
      assertEquals('dc', AtomNamespace.DC.prefix);
      assertEquals('http://purl.org/dc/elements/1.1/', AtomNamespace.DC.uri);
    }

    public function testOpenSearch():void {
      assertEquals('openSearch', AtomNamespace.OPEN_SEARCH.prefix);
      assertEquals('http://a9.com/-/spec/opensearchrss/1.1/', AtomNamespace.OPEN_SEARCH.uri);
    }

    public function testThreading():void {
      assertEquals('thr', AtomNamespace.THR.prefix);
      assertEquals('http://purl.org/syndication/thread/1.0', AtomNamespace.THR.uri);
    }

  }

}

