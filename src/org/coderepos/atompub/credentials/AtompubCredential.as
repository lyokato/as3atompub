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
  import com.adobe.net.URI;

  /**
   * Credential base abstract class
   */
  public class AtompubCredential {

    /**
     * Constructor
     *
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function AtompubCredential() { }

    /**
     * set credential information onto request
     *
     * @param uri
     * @param req HttpRequest subclass
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set(uri:URI, req:HttpRequest):void { /* abstract */ }

  }

}

