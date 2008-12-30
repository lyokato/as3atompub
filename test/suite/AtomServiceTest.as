package suite {

  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  import org.coderepos.xml.atom.*;
  import com.adobe.net.URI;

  public class AtomServiceTest extends TestCase {
    public function AtomServiceTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new AtomServiceTest("testBuild") );
      ts.addTest( new AtomServiceTest("testParse") );
      return ts;
    }

    public function testBuild():void {
      var service:AtomService = new AtomService();
      var ws:AtomWorkspace = new AtomWorkspace();
      ws.title = "MyWorkspace";
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
      ws.addCollection( coll );
      service.addWorkspace( ws );
      var result:String = service.toXMLString();
      assertEquals('<service xmlns="http://www.w3.org/2007/app"><workspace><atom:title xmlns:atom="http://www.w3.org/2005/Atom">MyWorkspace</atom:title><collection href="http://example.org/"><atom:title xmlns:atom="http://www.w3.org/2005/Atom">MyCollection</atom:title><accept>image/jpeg</accept><accept>image/gif</accept><categories href="http://example.org/" scheme="foo" fixed="yes"><atom:category term="foo" label="bar" scheme="buz" xmlns:atom="http://www.w3.org/2005/Atom"/><atom:category term="foo2" label="bar2" scheme="buz2" xmlns:atom="http://www.w3.org/2005/Atom"/></categories></collection></workspace></service>', result);
    }

    public function testParse():void {
      var source:XML = <service xmlns="http://www.w3.org/2007/app" xmlns:atom="http://www.w3.org/2005/Atom">
        <workspace>
          <atom:title>MyWorkspace</atom:title>
          <collection href="http://example.org/">
            <atom:title>MyCollection</atom:title>
            <accept>image/jpeg</accept>
            <accept>image/gif</accept>
            <categories href="http://example.org/" scheme="foo" fixed="yes">
              <atom:category term="foo" label="bar" scheme="buz"/>
              <atom:category term="foo2" label="bar2" scheme="buz2"/>
            </categories>
          </collection>
        </workspace>
      </service>;

      var service:AtomService = new AtomService(source);
      var workspaces:Array = service.workspaces;
      assertEquals(1, workspaces.length);
      var ws:AtomWorkspace = workspaces[0];
      assertEquals("MyWorkspace", ws.title);

      var colls:Array = ws.collections;
      assertEquals(1, colls.length);

      var coll:AtomCollection = colls[0];
      assertEquals("MyCollection", coll.title);

      var accepts:Array = coll.accepts;
      assertEquals(2, accepts.length);
      assertEquals("image/jpeg", accepts[0]);
      assertEquals("image/gif", accepts[1]);

      var cats:AtomCategories = coll.categories;
      assertEquals("http://example.org/", cats.href.toString());
      assertEquals("foo", cats.scheme);
      assertTrue(cats.fixed);

      var categories:Array = cats.categories;
      assertEquals(2, categories.length);
    }
  }

}
