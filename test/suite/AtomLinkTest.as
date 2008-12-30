package suite {

  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  import org.coderepos.xml.atom.AtomLink;
  import com.adobe.net.URI;

  public class AtomLinkTest extends TestCase {

    public function AtomLinkTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new AtomLinkTest("testBuild") );
      ts.addTest( new AtomLinkTest("testParse") );
      return ts;
    }

    public function testBuild():void {
      var link:AtomLink = new AtomLink();
      assertEquals('<link xmlns="http://www.w3.org/2005/Atom"/>', link.toXMLString());
      assertEquals('link', link.elementName);
      assertEquals('http://www.w3.org/2005/Atom', link.defaultNamespace.uri);
      assertNull(link.defaultNamespace.prefix);
      assertNull(link.href);
      link.href = new URI("http://example.org");
      assertEquals('http://example.org', link.href);
      assertEquals('<link href="http://example.org" xmlns="http://www.w3.org/2005/Atom"/>', link.toXMLString());
      assertNull(link.type);
      link.type = "text/html";
      assertEquals('text/html', link.type);
      assertNull(link.rel);
      link.rel = "alternate";
      assertEquals('alternate', link.rel);
      assertNull(link.hreflang);
      link.hreflang = 'en-us';
      assertEquals('en-us', link.hreflang);
      assertNull(link.title);
      link.title = "example";
      assertEquals('example', link.title);
      assertEquals(0, link.length);
      link.length = 10;
      assertEquals(10, link.length);
      var str:String = "" + link;
      assertEquals('http://example.org', str);
    }

    public function testParse():void {
      var src:XML = <link rel="alternate" href="http://example.org"/>;
      var link:AtomLink = new AtomLink(src);
      assertEquals('alternate', link.rel);
      assertEquals('http://example.org', link.href.toString());
      link.rel = "related";
      assertEquals('related', link.rel);
      assertNull(link.title);
      assertNull(link.hreflang);
      assertNull(link.type);
      assertEquals(0, link.length);
    }

  }

}

