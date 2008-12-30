package suite {

  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  import org.coderepos.xml.atom.AtomCollection;
  import org.coderepos.xml.atom.AtomCategories;
  import org.coderepos.xml.atom.AtomCategory;
  import com.adobe.net.URI;

  public class AtomCollectionTest extends TestCase {

    public function AtomCollectionTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new AtomCollectionTest("testBuild") );
      ts.addTest( new AtomCollectionTest("testParse") );
      return ts;
    }

    public function testBuild():void {
      var coll:AtomCollection = new AtomCollection();
      coll.title = "MyCollection";
      coll.href = new URI("http://example.org/");
      coll.addAccept("image/jpeg");
      coll.addAccept("image/gif");
      var cats:AtomCategories = new AtomCategories();
      cats.href = new URI("http://example.org/");
      cats.scheme = "foo";
      cats.fixed = true;
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
      coll.categories = cats;
      var result:String = coll.toXMLString();
      assertEquals('<collection href="http://example.org/" xmlns="http://www.w3.org/2007/app"><atom:title xmlns:atom="http://www.w3.org/2005/Atom">MyCollection</atom:title><accept>image/jpeg</accept><accept>image/gif</accept><categories href="http://example.org/" scheme="foo" fixed="yes"><atom:category term="foo" label="bar" scheme="buz" xmlns:atom="http://www.w3.org/2005/Atom"/><atom:category term="foo2" label="bar2" scheme="buz2" xmlns:atom="http://www.w3.org/2005/Atom"/></categories></collection>', result);
    }

    public function testParse():void {
      var source:XML = <collection href="http://example.org/" xmlns="http://www.w3.org/2007/app" xmlns:atom="http://www.w3.org/2005/Atom">
        <atom:title>MyCollection</atom:title>
        <accept>image/jpeg</accept>
        <accept>image/gif</accept>
        <categories href="http://example.org/" scheme="foo" fixed="yes">
          <atom:category term="foo" label="bar" scheme="buz"/>
          <atom:category term="foo2" label="bar2" scheme="buz2"/>
        </categories>
        </collection>;
      var coll:AtomCollection = new AtomCollection(source);
      assertEquals('MyCollection', coll.title);
      assertEquals("http://example.org/", coll.href.toString());
      var accepts:Array = coll.accepts;
      assertEquals(2, accepts.length);
      assertEquals("image/jpeg", accepts[0]);
      assertEquals("image/gif", accepts[1]);
      var categories:AtomCategories = coll.categories;
      assertEquals("foo", categories.scheme);
      assertTrue(categories.fixed);
      assertEquals("http://example.org/", categories.href.toString());
      var cats:Array = categories.categories;
      assertEquals(2, cats.length);
      var cat1:AtomCategory = cats[0];
      assertEquals("foo", cat1.term);
      assertEquals("bar", cat1.label);
      assertEquals("buz", cat1.scheme);
      var cat2:AtomCategory = cats[1];
      assertEquals("foo2", cat2.term);
      assertEquals("bar2", cat2.label);
      assertEquals("buz2", cat2.scheme);
    }

  }

}
