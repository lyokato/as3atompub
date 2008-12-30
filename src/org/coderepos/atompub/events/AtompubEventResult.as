/*
Copyright (c) Lyo Kato, <lyo.kato _at_ gmail.com>

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION 
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION 
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
*/

package org.coderepos.atompub.events {

  import flash.utils.ByteArray;
  import org.coderepos.xml.atom.*;
  import com.adobe.net.URI;

  /**
   * Class represents object that includes various data passed from dispatcher
   */
  public class AtompubEventResult {

    /**
     * HTTP status code
     */
    public var code:uint;
    /**
     * HTTP status message
     */
    public var message:String;
    /**
     * service document
     */
    public var service:AtomService;
    /**
     * categories
     */
    public var categories:AtomCategories;
    /**
     * feed
     */
    public var feed:AtomFeed;
    /**
     * entry
     */
    public var entry:AtomEntry;
    /**
     * media resource
     */
    public var resource:ByteArray;
    /**
     * location uri
     */
    public var location:URI;

    /**
     * Constructor
     *
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function AtompubEventResult() { }

  }

}

