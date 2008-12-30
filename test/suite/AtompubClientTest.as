package suite {

  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  import org.coderepos.xml.atom.*;
  import org.coderepos.atompub.*;
  import org.coderepos.atompub.events.*;
  import org.coderepos.atompub.credentials.*;
  import com.adobe.net.URI;

  public class AtompubClientTest extends TestCase {

    private var _client:AtompubClient;

    public function AtompubClientTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new AtompubClientTest("testTeahutService") );
      ts.addTest( new AtompubClientTest("testTeahutDiary") );
      ts.addTest( new AtompubClientTest("testTeahutPhoto") );
      return ts;
    }

    public function testTeahutService():void {
      _client = new AtompubClient();
      _client.credential = new BasicCredential('foo', 'foo');
      _client.addEventListener(AtompubEvent.GET_SERVICE_COMPLETED, addAsync(onCompletedToGetService, 1000));
      _client.getService(new URI("http://teahut.sakura.ne.jp:3000/service/"));
    }

    public function testTeahutDiary():void {
      _client = new AtompubClient();
      _client.credential = new BasicCredential('foo', 'foo');
      _client.addEventListener(AtompubEvent.GET_FEED_COMPLETED, addAsync(onCompletedToGetDiary, 2000));
      _client.getFeed(new URI("http://teahut.sakura.ne.jp:3000/entrycollection"));
    }

    public function testTeahutPhoto():void {
      _client = new AtompubClient();
      _client.credential = new BasicCredential('foo', 'foo');
      _client.addEventListener(AtompubEvent.GET_FEED_COMPLETED, addAsync(onCompletedToGetPhoto, 2000));
      _client.getFeed(new URI("http://teahut.sakura.ne.jp:3000/mediacollection"));
    }

    private function onCompletedToGetDiary(e:AtompubEvent):void {
      var feed:AtomFeed = e.result.feed;
      //assertEquals('<feed xmlns="http://www.w3.org/2005/Atom"><title>Diary</title><updated>2008-05-09T14:51:16+09:00</updated><id>http://teahut.sakura.ne.jp:3000/entrycollection</id><entry><title/><author><name>foo</name></author><content type="xhtml"><div xmlns="http://www.w3.org/1999/xhtml"/></content><app:edited xmlns:app="http://www.w3.org/2007/app">2008-05-08T04:12:50+09:00</app:edited><updated>2008-05-08T04:12:50+09:00</updated><id>http://teahut.sakura.ne.jp:3000/entrycollection/20080508-041250-187167.atom</id><link rel="edit" href="http://teahut.sakura.ne.jp:3000/entrycollection/20080508-041250-187167.atom"/></entry><entry><title type="text">Entry 3</title><updated>2008-03-28T12:17:13.000+02:00</updated><summary type="text"/><app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>no</app:draft></app:control><app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>no</app:draft></app:control><content type="text">Testing</content><app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>no</app:draft></app:control><app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>no</app:draft></app:control><category term="mineral" label="mineral" scheme="http://example.com/dogs/big3"/><app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>no</app:draft></app:control><app:edited xmlns:app="http://www.w3.org/2007/app">2008-03-28T19:17:40+09:00</app:edited><id>http://teahut.sakura.ne.jp:3000/entrycollection/20080328-191707-497679.atom</id><link rel="edit" href="http://teahut.sakura.ne.jp:3000/entrycollection/20080328-191707-497679.atom"/></entry><entry><title type="text">Entry 1</title><updated>2008-03-28T11:14:09.000+02:00</updated><summary type="text"/><content type="text">This is second entry</content><app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>no</app:draft></app:control><app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>no</app:draft></app:control><app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>no</app:draft></app:control><category term="mineral" label="mineral" scheme="http://example.com/dogs/big3"/><app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>no</app:draft></app:control><app:edited xmlns:app="http://www.w3.org/2007/app">2008-03-28T18:16:04+09:00</app:edited><id>http://teahut.sakura.ne.jp:3000/entrycollection/20080328-181403-974674.atom</id><link rel="edit" href="http://teahut.sakura.ne.jp:3000/entrycollection/20080328-181403-974674.atom"/></entry><entry><title type="text">Entry 2</title><updated>2008-03-13T11:59:40.000+02:00</updated><content type="text">This is the 1st entry</content><summary type="text"/><app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>no</app:draft></app:control><app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>no</app:draft></app:control><app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>no</app:draft></app:control><app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>no</app:draft></app:control><app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>no</app:draft></app:control><app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>no</app:draft></app:control><category term="mineral" label="mineral" scheme="http://example.com/dogs/big3"/><app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>no</app:draft></app:control><app:edited xmlns:app="http://www.w3.org/2007/app">2008-03-28T18:15:26+09:00</app:edited><id>http://teahut.sakura.ne.jp:3000/entrycollection/entry_1.atom</id><link rel="edit" href="http://teahut.sakura.ne.jp:3000/entrycollection/entry_1.atom"/></entry><link rel="self" href="http://teahut.sakura.ne.jp:3000/entrycollection"/><link rel="alternate" href="http://teahut.sakura.ne.jp:3000/html"/><link rel="first" href="http://teahut.sakura.ne.jp:3000/entrycollection"/></feed>', feed.toXMLString());
      assertEquals("Diary", feed.title);
      assertEquals("http://teahut.sakura.ne.jp:3000/entrycollection", feed.id);
      assertEquals("http://teahut.sakura.ne.jp:3000/entrycollection", feed.firstLink.toString());
      assertEquals("http://teahut.sakura.ne.jp:3000/html", feed.alternateLink.toString());
      assertEquals("http://teahut.sakura.ne.jp:3000/entrycollection", feed.selfLink.toString());
      assertEquals("2008", feed.updated.getFullYear());
    }

    private function onCompletedToGetPhoto(e:AtompubEvent):void {
      var feed:AtomFeed = e.result.feed;
      //assertEquals('<feed xmlns="http://www.w3.org/2005/Atom"><title>Photo</title><updated>*</updated><id>http://teahut.sakura.ne.jp:3000/mediacollection</id><link rel="self" href="http://teahut.sakura.ne.jp:3000/mediacollection"/><link rel="alternate" href="http://teahut.sakura.ne.jp:3000/html"/><link rel="first" href="http://teahut.sakura.ne.jp:3000/mediacollection"/></feed>', feed.toXMLString());
      assertEquals("Photo", feed.title);
      assertEquals('2008', feed.updated.getFullYear());
      assertEquals("http://teahut.sakura.ne.jp:3000/mediacollection", feed.id);
      assertEquals("http://teahut.sakura.ne.jp:3000/mediacollection", feed.selfLink.toString());
      assertEquals("http://teahut.sakura.ne.jp:3000/html", feed.alternateLink.toString());
      assertEquals("http://teahut.sakura.ne.jp:3000/mediacollection", feed.firstLink.toString());
    }

    private function onCompletedToGetService(e:AtompubEvent):void {
      var service:AtomService = e.result.service;
      assertEquals('<service xmlns="http://www.w3.org/2007/app"><workspace><atom:title xmlns:atom="http://www.w3.org/2005/Atom">My Blog</atom:title><collection href="http://teahut.sakura.ne.jp:3000/entrycollection"><atom:title xmlns:atom="http://www.w3.org/2005/Atom">Diary</atom:title><categories fixed="yes" scheme="http://example.com/cats/big3"><category term="animal" label="animal" xmlns="http://www.w3.org/2005/Atom"/><category term="vegetable" label="vegetable" xmlns="http://www.w3.org/2005/Atom"/><category term="mineral" scheme="http://example.com/dogs/big3" label="mineral" xmlns="http://www.w3.org/2005/Atom"/></categories></collection><collection href="http://teahut.sakura.ne.jp:3000/mediacollection"><atom:title xmlns:atom="http://www.w3.org/2005/Atom">Photo</atom:title><accept>image/png</accept><accept>image/jpeg</accept><accept>image/gif</accept></collection></workspace></service>', service.toXMLString());
      var workspace:AtomWorkspace = service.workspace;
      assertEquals("My Blog", workspace.title);
      var collections:Array = workspace.collections;
      var collection1:AtomCollection = collections[0];
      assertEquals("http://teahut.sakura.ne.jp:3000/entrycollection", collection1.href.toString());
      assertEquals("Diary", collection1.title);
      var collection2:AtomCollection = collections[1];
      var categories:AtomCategories = collection1.categories;
      assertTrue(categories.fixed);
      assertEquals("http://example.com/cats/big3", categories.scheme.toString());
      var cats:Array = categories.categories;
      var category1:AtomCategory = cats.shift();
      assertEquals("animal", category1.term);
      assertEquals("animal", category1.label);
      var category2:AtomCategory = cats.shift();
      assertEquals("vegetable", category2.term);
      assertEquals("vegetable", category2.label);
      var category3:AtomCategory = cats.shift();
      assertEquals("mineral", category3.term);
      assertEquals("mineral", category3.label);
      assertEquals("http://example.com/dogs/big3", category3.scheme);

      assertEquals("http://teahut.sakura.ne.jp:3000/mediacollection", collection2.href.toString());
      assertEquals("Photo", collection2.title);
      var accepts:Array = collection2.accepts;
      assertEquals("image/png", accepts[0]);
      assertEquals("image/jpeg", accepts[1]);
      assertEquals("image/gif", accepts[2]);
    }

  }

}

