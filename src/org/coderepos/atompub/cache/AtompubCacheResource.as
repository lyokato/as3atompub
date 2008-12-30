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

  import flash.utils.ByteArray;

  /**
   * Class represents cache resource
   */
  public class AtompubCacheResource {

    /**
     * etag string
     */
    public var etag:String;
    /**
     * lastModified string
     */
    public var lastModified:String;
    /**
     * resource bytearray
     */
    public var resource:ByteArray;

    /**
     * Constructor
     *
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function AtompubCacheResource() { }

  }

}
