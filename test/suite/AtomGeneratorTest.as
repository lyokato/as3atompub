package suite {

  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  import org.coderepos.xml.atom.AtomGenerator;
  import com.adobe.net.URI;

  public class AtomGeneratorTest extends TestCase {

    public function AtomGeneratorTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new AtomGeneratorTest("testParse") );
      ts.addTest( new AtomGeneratorTest("testBuild") );
      return ts;
    }

    public function testParse():void {
      var generator:AtomGenerator = new AtomGenerator();
      generator.name = "MyGenerator";
      generator.uri = new URI("http://example.org/");
      generator.version = "1.0";
      var result:String = generator.toXMLString();
      assertEquals('<generator uri="http://example.org/" version="1.0" xmlns="http://www.w3.org/2005/Atom"><name>MyGenerator</name></generator>', result);
    }

    public function testBuild():void {
      var source:XML = <generator uri="http://example.org/" version="1.0" xmlns="http://www.w3.org/2005/Atom">
        <name>MyGenerator</name>
        </generator>;
      var generator:AtomGenerator = new AtomGenerator(source);
      assertEquals('MyGenerator', generator.name);
      assertEquals('1.0', generator.version);
      assertEquals('http://example.org/', generator.uri.toString());
    }

  }

}
