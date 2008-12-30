package suite {

  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  import org.coderepos.date.W3CDTF;

  public class W3CDTFTest extends TestCase {

    public function W3CDTFTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new W3CDTFTest("testParse") );
      ts.addTest( new W3CDTFTest("testFormat") );
      ts.addTest( new W3CDTFTest("testFormatWithoutMilliseconds") );
      return ts;
    }

    public function testParse():void {
      var date:Date = W3CDTF.parse("2008-01-31T19:36:22.055Z");
      assertEquals(2008, date.getUTCFullYear());
      assertEquals(0, date.getUTCMonth());
      assertEquals(31, date.getUTCDate());
      assertEquals(19, date.getUTCHours());
      assertEquals(36, date.getUTCMinutes());
      assertEquals(22, date.getUTCSeconds());
      assertEquals(55, date.getUTCMilliseconds());
    }

    public function testFormat():void {
      var date1:Date = new Date(2008, 1, 1, 4, 36, 22, 500);
      var str1:String = W3CDTF.format(date1);
      assertEquals("2008-01-31T19:36:22.5Z", str1);
      var date2:Date = new Date(2008, 1, 1, 4, 36, 22, 5);
      var str2:String = W3CDTF.format(date2);
      assertEquals("2008-01-31T19:36:22.005Z", str2);
      var date3:Date = new Date(2008, 1, 1, 4, 36, 22, 55);
      var str3:String = W3CDTF.format(date3);
      assertEquals("2008-01-31T19:36:22.055Z", str3);
    }

    public function testFormatWithoutMilliseconds():void {
      var date1:Date = new Date(2008, 1, 1, 4, 36, 22, 500);
      var str1:String = W3CDTF.format(date1, false);
      assertEquals("2008-01-31T19:36:22Z", str1);
    }

  }

}

