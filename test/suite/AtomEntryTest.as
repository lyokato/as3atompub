package suite {
  
  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  import org.coderepos.xml.atom.*;
  import com.adobe.net.URI;

  public class AtomEntryTest extends TestCase {

    public function AtomEntryTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new AtomEntryTest("testBuild") );
      ts.addTest( new AtomEntryTest("testTitle") );
      ts.addTest( new AtomEntryTest("testSummary") );
      ts.addTest( new AtomEntryTest("testUpdated") );
      ts.addTest( new AtomEntryTest("testPublished") );
      ts.addTest( new AtomEntryTest("testId") );
      ts.addTest( new AtomEntryTest("testSource") );
      ts.addTest( new AtomEntryTest("testRights") );
      ts.addTest( new AtomEntryTest("testLinks") );
      ts.addTest( new AtomEntryTest("testCategories") );
      ts.addTest( new AtomEntryTest("testAuthor") );
      ts.addTest( new AtomEntryTest("testContributor") );
      ts.addTest( new AtomEntryTest("testEdited") );
      ts.addTest( new AtomEntryTest("testControl") );
      return ts;
    }

    public function testBuild():void {
      var entry:AtomEntry = new AtomEntry();
      assertEquals('<entry xmlns="http://www.w3.org/2005/Atom"/>', entry.toXMLString());
    }

    public function testTitle():void {
      var entry:AtomEntry = new AtomEntry();
      assertNull(entry.title);
      entry.title = 'example title';
      assertEquals('example title', entry.title);
      
      var src:XML = <entry xmlns="http://www.w3.org/2005/Atom">
      <title>foobar</title> 
      </entry>;
      var entry2:AtomEntry = new AtomEntry(src);
      assertEquals('foobar', entry2.title);
    }

    public function testSummary():void {
      var entry:AtomEntry = new AtomEntry();
      assertNull(entry.summary);
      entry.summary = 'example summary';
      assertEquals('example summary', entry.summary);

      var src:XML = <entry xmlns="http://www.w3.org/2005/Atom">
      <summary>foobar</summary>
      </entry>;
      var entry2:AtomEntry = new AtomEntry(src);
      assertEquals('foobar', entry2.summary);
    }

    public function testUpdated():void {
      var entry:AtomEntry = new AtomEntry();
      assertNull(entry.updated);
      var date:Date = new Date();
      entry.updated = date;
      assertEquals(date.toString(), entry.updated.toString());

      var src:XML = <entry xmlns="http://www.w3.org/2005/Atom">
      <updated>2008-04-21T07:12:47Z</updated>
      </entry>;
      var entry2:AtomEntry = new AtomEntry(src);
      var updated:Date = entry2.updated;
      assertEquals(2008, updated.getFullYear());
      assertEquals(3, updated.getMonth());
    }

    public function testPublished():void {
      var entry:AtomEntry = new AtomEntry();
      assertNull(entry.published);
      var date:Date = new Date();
      entry.published = date;
      assertEquals(date.toString(), entry.published.toString());

      var src:XML = <entry xmlns="http://www.w3.org/2005/Atom">
      <published>2008-04-21T07:12:47Z</published>
      </entry>;
      var entry2:AtomEntry = new AtomEntry(src);
      var published:Date = entry2.published;
      assertEquals(2008, published.getFullYear());
      assertEquals(3, published.getMonth());
    }

    public function testId():void {
      var entry:AtomEntry = new AtomEntry();
      assertNull(entry.id);
      entry.id = "tag:example.org,2008:test";
      assertEquals("tag:example.org,2008:test", entry.id);

      var src:XML = <entry xmlns="http://www.w3.org/2005/Atom">
      <id>tag:example.org,2008:test</id>
      </entry>;
      var entry2:AtomEntry = new AtomEntry(src);
      assertEquals("tag:example.org,2008:test", entry2.id);
    }

    public function testSource():void {
      var entry:AtomEntry = new AtomEntry();
      assertNull(entry.source);
      entry.source = "hoge";
      assertEquals("hoge", entry.source);

      var src:XML = <entry xmlns="http://www.w3.org/2005/Atom">
        <source>foobar</source>
      </entry>;
      var entry2:AtomEntry = new AtomEntry(src);
      assertEquals("foobar", entry2.source);
    }

    public function testRights():void {
      var entry:AtomEntry = new AtomEntry();
      assertNull(entry.rights);
      entry.rights = "copyrights(c) 2007 foobar, inc.";
      var src:XML = <entry xmlns="http://www.w3.org/2005/Atom">
      <rights>2007 foobar inc</rights>
      </entry>;
      var entry2:AtomEntry = new AtomEntry(src);
      assertEquals("2007 foobar inc", entry2.rights);
    }

    public function testLinks():void {
      var entry:AtomEntry = new AtomEntry();
      var link:AtomLink = new AtomLink();
      link.href = new URI("http://example.org/related");
      link.rel = "related";
      entry.addLink(link);
      var link2:AtomLink = new AtomLink();
      link2.href = new URI("http://example.org/alternate");
      link2.rel = "alternate";
      entry.addLink(link2);
      entry.enclosureLink = new URI("http://example.org/enclusure.jpg");
      assertEquals('<entry xmlns="http://www.w3.org/2005/Atom"><link href="http://example.org/related" rel="related"/><link href="http://example.org/alternate" rel="alternate"/><link href="http://example.org/enclusure.jpg" rel="enclosure"/></entry>', entry.toXMLString());

      var src:XML = <entry xmlns="http://www.w3.org/2005/Atom">
        <link rel="related" href="http://example.org/related" />
        <link rel="alternate" href="http://example.org/alternate" />
        <link rel="self" href="http://example.org/self" />
        </entry>;
      //var hoge:XMLList = src.link.(hasOwnProperty("@rel") && @rel=="self").@href;
      var entry2:AtomEntry = new AtomEntry(src);
      assertEquals('http://example.org/related', entry2.relatedLink.toString());
      assertEquals('http://example.org/alternate', entry2.alternateLink.toString());
      assertEquals('http://example.org/self', entry2.selfLink.toString());
    }


    public function testCategories():void {

    }
    
    public function testAuthor():void {
      var entry:AtomEntry = new AtomEntry();
      assertNull(entry.author);
      var author:AtomPerson = new AtomPerson();
      author.name = "Lyo Kato";
      author.email = "lyo.kato@gmail.com";
      author.uri = new URI("http://example.org/");
      entry.author = author;
      var result:String = entry.toXMLString();
      assertEquals('<entry xmlns="http://www.w3.org/2005/Atom"><author><name>Lyo Kato</name><email>lyo.kato@gmail.com</email><uri>http://example.org/</uri></author></entry>', result);

      var src:XML = <entry xmlns="http://www.w3.org/2005/Atom">
        <author>
          <name>foo</name>
          <email>bar@example.org</email>
          <uri>http://example.org/</uri>
        </author>
      </entry>;

      var entry2:AtomEntry = new AtomEntry(src);
      var author2:AtomPerson = entry2.author;
      assertEquals("foo", author2.name);
      assertEquals("bar@example.org", author2.email);
      assertEquals("http://example.org/", author2.uri.toString());
    }

    public function testContributor():void {
      var entry:AtomEntry = new AtomEntry();
      assertNull(entry.contributor);
      var contributor:AtomPerson = new AtomPerson();
      contributor.name = "Lyo Kato";
      contributor.email = "lyo.kato@gmail.com";
      contributor.uri = new URI("http://example.org/");
      entry.contributor = contributor;
      var result:String = entry.toXMLString();
      assertEquals('<entry xmlns="http://www.w3.org/2005/Atom"><contributor><name>Lyo Kato</name><email>lyo.kato@gmail.com</email><uri>http://example.org/</uri></contributor></entry>', result);

      var src:XML = <entry xmlns="http://www.w3.org/2005/Atom">
        <contributor>
          <name>foo</name>
          <email>bar@example.org</email>
          <uri>http://example.org/</uri>
        </contributor>
      </entry>;

      var entry2:AtomEntry = new AtomEntry(src);
      var contributor2:AtomPerson = entry2.contributor;
      assertEquals("foo", contributor2.name);
      assertEquals("bar@example.org", contributor2.email);
      assertEquals("http://example.org/", contributor2.uri.toString());

    }

    public function testEdited():void {
      var entry:AtomEntry = new AtomEntry();
      assertNull(entry.updated);
      var date:Date = new Date();
      entry.edited = date;
      assertEquals(date.toString(), entry.edited.toString());

      var src:XML = <entry xmlns="http://www.w3.org/2005/Atom" xmlns:app="http://www.w3.org/2007/app">
      <app:edited>2008-04-21T07:12:47Z</app:edited>
      </entry>;
      var entry2:AtomEntry = new AtomEntry(src);
      var edited:Date = entry2.edited;
      assertEquals(2008, edited.getFullYear());
      assertEquals(3, edited.getMonth());
    }

    public function testControl():void {
      var control:AtomControl = new AtomControl();
      control.draft = true;
      var entry:AtomEntry = new AtomEntry();
      entry.addControl(control);
      assertEquals('<entry xmlns="http://www.w3.org/2005/Atom"><app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>yes</app:draft></app:control></entry>', entry.toXMLString());
      var returnedControl:AtomControl = entry.getControl();
      assertEquals('<app:control xmlns:app="http://www.w3.org/2007/app"><app:draft>yes</app:draft></app:control>', returnedControl.toXMLString());
    }

  }
}
