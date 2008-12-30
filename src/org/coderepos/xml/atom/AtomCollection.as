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
   * Class represents Atom Collection
   */
  public class AtomCollection extends AtomElement {

    /**
     * Constructor
     *
     * @param source source XML element
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function AtomCollection(source:XML=null) {
      super(source);
    }

    /**
     * getter for element name
     *
     * @returns elementName
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    override public function get elementName():String {
      return "collection";
    }

    /**
     * getter for default namespace
     *
     * @returns namespace
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    override public function get defaultNamespace():Namespace {
      return AtomNamespace.APP_WITHOUT_PREFIX;
    }

    /**
     * returns the mediatypes the server accepts, synonym of getAccepts method
     *
     * @returns mediatypes Array
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get accepts():Array {
      return getAccepts();
    }

    /**
     * returns the mediatypes the server accepts
     *
     * @returns mediatypes Array
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getAccepts():Array {
      var elementList:XMLList = getElementList(defaultNamespace, "accept");
      var accepts:Array = new Array();
      for each(var element:XML in elementList) {
        var accept:String = element.toString();
        accepts.push(accept);
      }
      return accepts;
    }

    /**
     * set an mediatype, synonym of setAccept method
     *
     * @param mediatype
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set accept(_accept:String):void {
      setAccept(_accept);
    }

    /**
     * set an mediatype
     *
     * @param mediatype
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setAccept(_accept:String):void {
      setElement(defaultNamespace, "accept", _accept);
    }

    /**
     * add an mediatype
     *
     * @param mediatype
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function addAccept(_accept:String):void {
      addElement(defaultNamespace, "accept", _accept);
    } 

    /**
     * get categories, synonym of getCategories method
     *
     * @returns categories
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get categories():AtomCategories {
      return getCategories();
    }

    /**
     * get categories
     *
     * @returns categories
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getCategories():AtomCategories {
      var element:XML = getElement(defaultNamespace, "categories");
      if (element == null) {
        return null;
      }
      return new AtomCategories(element);
    }

    /**
     * set categories, synonym of setCategories method
     *
     * @param categories
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set categories(_categories:AtomCategories):void {
      setCategories(_categories);
    }

    /**
     * set categories
     *
     * @param categories
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setCategories(_categories:AtomCategories):void {
      setAtomElement(defaultNamespace, "categories", _categories);
    }

    /**
     * get href uri, synonym of getHref method
     *
     * @returns uri
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get href():URI {
      return getHref();
    }

    /**
     * get href uri
     *
     * @returns uri
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getHref():URI {
      if(_src.hasOwnProperty("@href")) {
        return new URI(String(_src.@href[0]));
      } else {
        return null;
      }
    }

    /**
     * set href uri, synonym of setHref method
     *
     * @param uri
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set href(_href:URI):void {
      setHref(_href);
    }

    /**
     * set href uri
     *
     * @param uri
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setHref(_href:URI):void {
      _src.@href = _href.toString();
    }

    /**
     * get title, synonym of getTitle method
     *
     * @returns title
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get title():String {
      return getTitle();
    }

    /**
     * get title
     *
     * @returns title
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getTitle():String {
      return getElementText(AtomNamespace.ATOM, "title");
    }

    /**
     * set title, synonym of setTitle method
     *
     * @param title
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set title(_title:String):void {
      setTitle(_title);
    }
    
    /**
     * set title
     *
     * @param title
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setTitle(_title:String):void {
      setElement(AtomNamespace.ATOM, "title", _title);
    }

  }

}

