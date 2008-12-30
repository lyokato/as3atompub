package suite {

  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  import org.coderepos.mime.MediaType;

  public class MediaTypeTest extends TestCase {

    private var atom:MediaType;
    private var entry:MediaType;
    private var anyApp:MediaType;
    private var any:MediaType;
    private var plain:MediaType;
    private var html:MediaType;

    public function MediaTypeTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new MediaTypeTest("testAtom") );
      ts.addTest( new MediaTypeTest("testEntry") );
      ts.addTest( new MediaTypeTest("testAnyApp") );
      ts.addTest( new MediaTypeTest("testAny") );
      ts.addTest( new MediaTypeTest("testPlain") );
      ts.addTest( new MediaTypeTest("testHtml") );
      return ts;
    }

    override public function setUp():void {
      atom = new MediaType("application/atom+xml");
      entry = new MediaType("application/atom+xml;type=entry");
      anyApp = new MediaType("application/*");
      any = new MediaType("*/*");
      plain = new MediaType("text/plain");
      html = new MediaType("text/html;charset=utf-8");
    }

    public function testAtom():void {
      assertEquals("application", atom.type);
      assertEquals("atom+xml", atom.subtype);
      assertEquals("xml", atom.subtypeMajor);
      assertNull(atom.parameters);
      assertEquals("application/atom+xml", atom.toString());
    }

    public function testEntry():void {
      assertEquals("application", entry.type);
      assertEquals("atom+xml", entry.subtype);
      assertEquals("xml", entry.subtypeMajor);
      assertEquals("type=entry", entry.parameters);
      assertEquals("application/atom+xml;type=entry", entry.toString());
    }

    public function testAnyApp():void {
      assertEquals("application", anyApp.type);
      assertEquals("*", anyApp.subtype);
      assertEquals("*", anyApp.subtypeMajor);
      assertNull(anyApp.parameters);
      assertEquals("application/*", anyApp.toString());
    }

    public function testAny():void {
      assertEquals("*", any.type);
      assertEquals("*", any.subtype);
      assertEquals("*", any.subtypeMajor);
      assertNull(any.parameters);
      assertEquals("*/*", any.toString());
    }

    public function testPlain():void {
      assertEquals("text", plain.type);
      assertEquals("plain", plain.subtype);
      assertEquals("plain", plain.subtypeMajor);
      assertNull(plain.parameters);
      assertEquals("text/plain", plain.toString());
    }

    public function testHtml():void {
      assertEquals("text", html.type);
      assertEquals("html", html.subtype);
      assertEquals("html", html.subtypeMajor);
      assertEquals("charset=utf-8", html.parameters);
      assertEquals("text/html;charset=utf-8", html.toString());
    }

  }

}
