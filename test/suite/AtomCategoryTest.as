package suite {

  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  import org.coderepos.xml.atom.AtomCategory;

  public class AtomCategoryTest extends TestCase {
      
    public function AtomCategoryTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new AtomCategoryTest("testParse") );
      ts.addTest( new AtomCategoryTest("testBuild") );
      return ts;
    }

    public function testParse():void {
      var source:XML = <category label="foo" scheme="bar" term="buz" xmlns="http://www.w3.org/2005/Atom" />;
      var cat:AtomCategory = new AtomCategory(source);
      assertEquals('foo', cat.label);
      assertEquals('bar', cat.scheme);
      assertEquals('buz', cat.term);
    }

    public function testBuild():void {
      var cat:AtomCategory = new AtomCategory();
      cat.label = "mylabel";
      cat.scheme = "myscheme";
      cat.term = "myterm";
      var result:String = cat.toXMLString();
      assertEquals('<category label="mylabel" scheme="myscheme" term="myterm" xmlns="http://www.w3.org/2005/Atom"/>', result);
    }

  }

}
