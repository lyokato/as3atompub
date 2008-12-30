package suite {

  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  import org.coderepos.crypto.WSSEUsernameToken;

  public class WSSEUsernameTokenTest extends TestCase {

    public function WSSEUsernameTokenTest(method:String) {
      super(method);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      ts.addTest( new WSSEUsernameTokenTest("build") );
      return ts;
    }

    public function build():void {
      var timestamp:Date = new Date(2008, 1, 31, 10, 4, 56, 33);
      var token:String = WSSEUsernameToken.getUsernameToken("foobar", "pass", "nonce", timestamp);
      assertEquals('UsernameToken Username="foobar", PasswordDigest="dlZ70d+vYDl2ITucKAHoizra5GQ=", Nonce="bm9uY2U=", Created="2008-03-02T01:04:56.033Z"', token);
    }

  }

}
