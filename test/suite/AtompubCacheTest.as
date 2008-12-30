package suite {

  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  import flash.utils.ByteArray;
  import org.coderepos.atompub.cache.*;
  import com.adobe.net.URI;

  public class AtompubCacheTest extends TestCase {

    public function AtompubCacheTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new AtompubCacheTest("testStorage") );
      return ts;
    }

    public function testStorage():void {
      var storage:AtompubCache = new AtompubCache(); 
      var url1:URI = new URI("http://example1.org/");
      var nullCache:AtompubCacheResource = storage.get(url1);
      assertNull(nullCache);
      var cache1:AtompubCacheResource = new AtompubCacheResource();
      cache1.etag = "foo";
      cache1.lastModified = "2008-01-01 00:00:00";
      var bytes:ByteArray = new ByteArray();
      bytes.writeUTFBytes("FOOBARBUZ");
      cache1.resource = bytes;
      storage.set(url1, cache1);

      var ret1:AtompubCacheResource = storage.get(url1);
      assertEquals('foo', ret1.etag);
      assertEquals('2008-01-01 00:00:00', ret1.lastModified);
      var ret1Bytes:ByteArray = ret1.resource;
      ret1Bytes.position = 0;
      assertEquals("FOOBARBUZ", ret1Bytes.readUTFBytes(ret1Bytes.bytesAvailable));

      storage.remove(url1);

      var ret2:AtompubCacheResource = storage.get(url1);
      assertNull(ret2);

    }

  }

}
