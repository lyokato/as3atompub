package {

  import org.coderepos.xml.atom.*;
  import org.coderepos.atompub.*;
  import org.coderepos.atompub.events.*;
  import org.coderepos.atompub.credentials.*;
  import com.adobe.net.URI;

  public class As3atompub {

    private var _client:AtompubClient;
    private var _locked:Boolean;

    public function As3atompub() {
    }

    public function init():void {
      _locked = false;
    }

    public function updateFeed():void {
      if (_client.isFetching) {
        return;
      }
      lockComponents();
      _client = new AtompubClient(); 
      _client.addEventListener(Atompub.GET_FEED_COMPLETED, onCompletedToGetFeed);
      _client.addEventListener(Atompub.GET_FEED_FAILED, onFailedToGetFeed);
      _client.getFeed(new URI("http://teahut.sakura.ne.jp:3000/entrycollection"));
    }

    private function get isLocked():void {
      return _locked;
    }

    private function lockComponents():void {
      _locked = true;
    }

    private function unlockComponents():void {
      _locked = false;
    }

    private function showError(e:AtompubEvent):void {
      var message:String = buildErrorMessage(e);
    }

    private function buildErrorMessage(code:uint, message:String):String {
      return "[" + String(code) + "] " + message;
    }

    private function onCompletedToGetFeed(e:AtompubEvent):void {
      unlockComponents();
      var feed:AtomFeed = e.result.feed;
    }

    private function onFailedToGetFeed(e:AtompubEvent):void {
      unlockComponents();
      showError(e);
    }

  }

}

