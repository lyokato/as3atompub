package suite {

  import flexunit.framework.TestSuite;
  import flexunit.framework.TestCase;
  import org.coderepos.xml.atom.AtomCategories;
  import org.coderepos.xml.atom.AtomCategory;
  import com.adobe.net.URI;

  public class AtomCategoriesTest extends TestCase {

    public function AtomCategoriesTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new AtomCategoriesTest("testParse") );
      ts.addTest( new AtomCategoriesTest("testBuild") );
      return ts;
    }

    public function testParse():void {
      var source:XML = <categories xmlns="http://www.w3.org/2007/app" xmlns:atom="http://www.w3.org/2005/Atom" fixed="yes" scheme="myscheme" href="http://example.org/">
          <atom:category term="foo" scheme="bar" label="buz" />
          <atom:category term="foo2" scheme="bar2" label="buz2" />
        </categories>;
      var cats:AtomCategories = new AtomCategories(source);
      assertTrue(cats.fixed);
      assertEquals("myscheme", cats.scheme);
      assertEquals("http://example.org/", cats.href.toString());

      var categories:Array = cats.categories;
      assertEquals(2, categories.length);
      var cat1:AtomCategory = categories[0];
      assertEquals("foo", cat1.term);
      assertEquals("bar", cat1.scheme);
      assertEquals("buz", cat1.label);
      var cat2:AtomCategory = categories[1];
      assertEquals("foo2", cat2.term);
      assertEquals("bar2", cat2.scheme);
      assertEquals("buz2", cat2.label);
    }

    public function testBuild():void {
      var cats:AtomCategories = new AtomCategories();
      cats.href = new URI("http://example.org/");
      cats.scheme = "foo";
      cats.fixed = true;
      var result:String = cats.toXMLString();
      assertEquals('<categories href="http://example.org/" scheme="foo" fixed="yes" xmlns="http://www.w3.org/2007/app"/>', result);
      var cat1:AtomCategory = new AtomCategory();
      cat1.term = "foo";
      cat1.label = "bar";
      cat1.scheme = "buz";
      var cat2:AtomCategory = new AtomCategory();
      cat2.term = "foo2";
      cat2.label = "bar2";
      cat2.scheme = "buz2";
      cats.addCategory(cat1);
      cats.addCategory(cat2);
      var result2:String = cats.toXMLString();
      assertEquals('<categories href="http://example.org/" scheme="foo" fixed="yes" xmlns="http://www.w3.org/2007/app"><atom:category term="foo" label="bar" scheme="buz" xmlns:atom="http://www.w3.org/2005/Atom"/><atom:category term="foo2" label="bar2" scheme="buz2" xmlns:atom="http://www.w3.org/2005/Atom"/></categories>', result2);
    }

  }

}
