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

  import com.hurlant.util.Base64;
  import org.httpclient.HttpRequest;
  import com.adobe.net.URI;

  /**
   * Credential for HTTP Basic Auth
   *
   * @example
   * <listing version="3.0">
   * var client:AtompubClient = new AtompubClient();
   * client.credential = new BasicCredential("username", "password");
   * ...
   * </listing>
   */
  public class BasicCredential extends AtompubCredential {

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
    public function BasicCredential(name:String="", password:String="") {
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
      req.addHeader("Authorization", "Basic " + encodeToken());
    }

    private function encodeToken():String {
      var token:String = _name + ":" + _password;
      return Base64.encode(token);
    }

  }

}
