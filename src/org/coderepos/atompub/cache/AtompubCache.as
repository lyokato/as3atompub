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

package org.coderepos.atompub.cache {

  import com.adobe.net.URI;

  /**
   * Class represents cache storage for atompub client
   */
  public class AtompubCache {

    private var _resources:Object;

    /**
     * Constructor
     *
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function AtompubCache() {
      _resources = new Object();
    }

    /**
     * set cache resource
     *
     * @param uri
     * @param resource
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set(uri:URI, rc:AtompubCacheResource):void {
      var uriString:String = uri.toString();
      _resources[uriString] = rc;
    }

    /**
     * return cache resource
     *
     * @param uri
     * @returns resource
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get(uri:URI):AtompubCacheResource {
      var uriString:String = uri.toString();
      if (_resources[uriString])
        return _resources[uriString];
      else
        return null;
    }

    /**
     * remove cache resource
     *
     * @param uri
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function remove(uri:URI):void {
      var uriString:String = uri.toString();
      if (_resources[uriString])
        delete _resources[uriString];
    }

    /**
     * clear all resources
     *
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function clear():void {
      _resources = new Object();
    }

  }

}

