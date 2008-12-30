package suite {

  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  import org.coderepos.xml.atom.*;
  import com.adobe.net.URI;

  public class AtomContentTest extends TestCase {

    public function AtomContentTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new AtomContentTest("testBuildText") );
      ts.addTest( new AtomContentTest("testBuildMultibyteText") );
      ts.addTest( new AtomContentTest("testBuildXML") );
      ts.addTest( new AtomContentTest("testBuildXMLAsText") );
      ts.addTest( new AtomContentTest("testBuildImage") );
      ts.addTest( new AtomContentTest("testParseText") );
      ts.addTest( new AtomContentTest("testParseMultibyteText") );
      ts.addTest( new AtomContentTest("testParseXML") );
      return ts;
    }

    public function testBuildText():void {
      var content:AtomContent = new AtomContent();
      content.body = "hoge";
      var result:String = content.toXMLString();
      assertEquals('<content type="text" xmlns="http://www.w3.org/2005/Atom">hoge</content>', result);
    }

    public function testBuildMultibyteText():void {
      var content:AtomContent = new AtomContent();
      content.body = "foo";
      var result:String = content.toXMLString();
      assertEquals('<content type="text" xmlns="http://www.w3.org/2005/Atom">foo</content>', result);
    }

    public function testBuildXML():void {
      var content:AtomContent = new AtomContent();
      var source:XML = <p xmlns="http://www.w3.org/1999/xhtml">hoge</p>;
      content.body = source;
      var result:String = content.toXMLString();
      assertEquals('<content type="xhtml" xmlns="http://www.w3.org/2005/Atom"><p xmlns="http://www.w3.org/1999/xhtml">hoge</p></content>', result);
    }

    public function testBuildXMLAsText():void {
      var content:AtomContent = new AtomContent();
      var source:String = '<p xmlns="http://www.w3.org/1999/xhtml">hoge</p>';
      content.body = source;
      var result:String = content.toXMLString();
      assertEquals('<content type="xhtml" xmlns="http://www.w3.org/2005/Atom"><p xmlns="http://www.w3.org/1999/xhtml">hoge</p></content>', result);
    }

    public function testBuildImage():void {
      var content:AtomContent = new AtomContent();
      content.type = "image/jpeg";
      content.src = new URI("http://example.org/example.jpg")
      var result:String = content.toXMLString();
      assertEquals('<content type="image/jpeg" src="http://example.org/example.jpg" xmlns="http://www.w3.org/2005/Atom"/>', result);
    }

    public function testParseImage():void {
      var source:XML = <content type="image/jpeg" src="http://example.org/example.jpg" xmlns="http://www.w3.org/2005/Atom"/>;
      var content:AtomContent = new AtomContent(source);
      assertEquals("image/jpeg", content.type);
      assertEquals("http://example.org/example.jpg", content.src.toString());
    }

    public function testParseText():void {
      var source:XML = <content type="text" xmlns="http://www.w3.org/2005/Atom">hoge</content>;
      var content:AtomContent = new AtomContent(source);
      assertEquals("text", content.type);
      assertEquals("hoge", content.body);
    }

    public function testParseMultibyteText():void {
      var source:XML = <content type="text" xmlns="http://www.w3.org/2005/Atom">hoge</content>;
      var content:AtomContent = new AtomContent(source);
      assertEquals("text", content.type);
      assertEquals("hoge", content.body);
    }

    public function testParseXML():void {
      var source:XML = <content type="xhtml" xmlns="http://www.w3.org/2005/Atom"><p xmlns="http://www.w3.org/1999/xhtml">hoge</p></content>;
      var content:AtomContent = new AtomContent(source);
      assertEquals("xhtml", content.type);
      assertEquals('<p xmlns="http://www.w3.org/1999/xhtml">hoge</p>', content.body);
    }

  }

}
