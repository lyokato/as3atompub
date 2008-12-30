/*
Copyright (c) Lyo Kato (lyo.kato _at_ gmail.com)

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION 
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION 
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
*/

package org.coderepos.atompub.credentials {

  import org.httpclient.HttpRequest;
  import org.coderepos.oauth.OAuthConsumer;
  import org.coderepos.oauth.OAuthToken;
  import org.coderepos.atompub.AtompubCredential;
  import com.adobe.net.URI;

  /**
   * Credential for OAuth
   *
   * @example
   * <listing version="3.0">
   *
   * var consumer:OAuthConsumer = new OAuthConsumer(consumerKey, consumerSecret);
   * ...
   * consumer.addEventListener(OAuthEvent.GET_ACCESS_TOKEN_COMPLETED, onCompletedToGetAccessToken);
   *
   * private function onCompletedToGetAccessToken(e:OAuthEvent):void {
   *   var accessToken:OAuthToken = e.result.token;
   *   var client:AtompubClient = new AtompubClient();
   *   client.credential = new OAuthCredential(consumer, accessToken);
   *   client.addEventListener(AtompubEvent.GET_SERVICE_COMPLETED, onCompletedToGetService);
   *   client.getService(new URI("http://example.org/protected_resource"));
   * }
   *
   * </listing>
   */
  public class OAuthCredential extends AtompubCredential {
    
    private var _consumer:OAuthConsumer;
    private var _token:OAuthToken;

    /**
     * Constructor
     *
     * @param consumer
     * @param accessToken
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function OAuthCredential(consumer:OAuthConsumer, token:OAuthToken=null) {
      super();
      _consumer = consumer;
      _token = token;
    }

    /**
     * set credential information onto request
     *
     * @param uri
     * @param req HttpRequest subclass
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    override public function set(uri:URI, req:HttpRequest):void {
      var method:String = req.method;
      var header:String = _consumer.genOAuthHeader(method, uri, null, _token);
      req.addHeader("Authorization", header);
    }

  }

}

