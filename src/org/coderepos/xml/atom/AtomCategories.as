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

package org.coderepos.xml.atom {

  import com.adobe.net.URI;

  /**
   * Class represents atom categories
   */
  public class AtomCategories extends AtomElement {

    /**
     * Constructor
     *
     * @param source
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function AtomCategories(source:XML=null) {
      super(source);
    }

    /**
     * get element name
     *
     * @returns elementName
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    override public function get elementName():String {
      return "categories";
    }

    /**
     * get default namespace
     *
     * @returns namespace
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    override public function get defaultNamespace():Namespace {
      return AtomNamespace.APP_WITHOUT_PREFIX;
    }

    /**
     * get categories, synonym of getCategories method
     *
     * @returns categories array
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get categories():Array {
      return getCategories();
    }

    /**
     * get categories
     *
     * @returns categories array
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getCategories():Array {
      var elementList:XMLList = getElementList(AtomNamespace.ATOM, "category");
      var categoriesList:Array = new Array();
      for each(var element:XML in elementList) {
        var cat:AtomCategory = new AtomCategory(element);
        categoriesList.push(cat);
      }
      return categoriesList;
    }

    /**
     * set category, synonym of the setCategory
     *
     * @param category
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set category(_category:AtomCategory):void {
      setCategory(_category);
    }

    /**
     * set category
     *
     * @param categorie
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setCategory(_category:AtomCategory):void {
      setAtomElement(AtomNamespace.ATOM, "category", _category);
    }

    /**
     * add category
     *
     * @param categorie
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function addCategory(_category:AtomCategory):void {
      addAtomElement(AtomNamespace.ATOM, "category", _category);
    }

    /**
     * get href uri, synonym of getHref method
     *
     * @returns href uri
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get href():URI {
      return getHref();
    }

    /**
     * get href uri
     *
     * @returns href uri
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getHref():URI {
      if (_src.hasOwnProperty("@href")) {
        return new URI(String(_src.@href[0]));
      } else {
        return null;
      }
    }

    /**
     * set href uri, setHref
     *
     * @param href uri
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set href(_href:URI):void {
      setHref(_href);
    }

    /**
     * set href uri
     *
     * @param href uri
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setHref(_href:URI):void {
      _src.@href = _href.toString();
    }

    /**
     * get scheme, synonym of getScheme method
     *
     * @returns scheme
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get scheme():String {
      return getScheme();
    }

    /**
     * get scheme
     *
     * @returns scheme
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getScheme():String {
      if (_src.hasOwnProperty("@scheme")) {
        return String(_src.@scheme);
      } else {
        return null;
      }
    }

    /**
     * set scheme, synonym of setScheme method
     *
     * @param scheme
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set scheme(_scheme:String):void {
      setScheme(_scheme);
    }

    /**
     * set scheme
     *
     * @param scheme
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setScheme(_scheme:String):void {
      _src.@scheme = _scheme;
    }

    /**
     * get boolean that shows if it fixed or not
     * synonym of getFixed method
     *
     * @returns boolean that shows fixed or not
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get fixed():Boolean {
      return getFixed();
    }

    /**
     * get boolean that shows if it fixed or not
     *
     * @returns boolean that shows fixed or not
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getFixed():Boolean {
      if (_src.hasOwnProperty("@fixed")) {
        return (String(_src.@fixed) == "yes") ? true : false;
      } else {
        return false;
      }
    }

    /**
     * set boolean that shows if it fixed or not
     * synonym of setFixed method
     *
     * @param boolean that shows fixed or not
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set fixed(_fixed:Boolean):void {
      setFixed(_fixed);
    }

    /**
     * set boolean that shows if it fixed or not
     *
     * @param boolean that shows fixed or not
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setFixed(_fixed:Boolean):void {
      if (_fixed) {
        _src.@fixed = "yes";
      } else {
        _src.@fixed = "no";
      }
    }

  }

}
