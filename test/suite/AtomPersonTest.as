package suite {

  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  import com.adobe.net.URI;
  import org.coderepos.xml.atom.AtomPerson;

  public class AtomPersonTest extends TestCase {

    public function AtomPersonTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new AtomPersonTest("testParse") );
      ts.addTest( new AtomPersonTest("testBuild") );
      return ts;
    }

    public function testParse():void {
      var source:XML = <author xmlns="http://www.w3.org/2005/Atom">
        <name>FooBar</name>
        <email>foobar@example.org</email>
        <uri>http://example.org/</uri>
        </author>;
      var person:AtomPerson = new AtomPerson(source);
      assertEquals("FooBar", person.name);
      assertEquals("foobar@example.org", person.email);
      assertEquals("http://example.org/", person.uri.toString());
    }

    public function testBuild():void {
      var person:AtomPerson = new AtomPerson();
      person.name = "Lyo Kato";
      person.email = "lyo.kato@gmail.com";
      person.uri = new URI("http://d.hatena.ne.jp/lyokato/");
      var result:String = person.toXMLString();
      assertEquals('<author xmlns="http://www.w3.org/2005/Atom"><name>Lyo Kato</name><email>lyo.kato@gmail.com</email><uri>http://d.hatena.ne.jp/lyokato/</uri></author>', result);
    }

  }

}
