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
  import org.coderepos.crypto.WSSEUsernameToken;
  import com.adobe.net.URI;

  /**
   * Credential for WSSE Auth
   *
   * @example
   * <listing version="3.0">
   * var client:AtompubClient = new AtompubClient();
   * client.credential = new WsseCredential("username", "password");
   * ...
   * </listing>
   */
  public class WsseCredential extends AtompubCredential {

    private var _name:String;
    private var _password:String;

    /**
     * Constructor
     *
     * @param name
     * @param password
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function WsseCredential(name:String="", password:String="") {
      _name = name;
      _password = password;
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
      req.addHeader("Authorization", 'WSSE profile="UsernameToken"');
      req.addHeader("X-Wsse", getToken());
    }

    private function getToken():String {
      return WSSEUsernameToken.getUsernameToken(_name, _password);
    }

  }

}

