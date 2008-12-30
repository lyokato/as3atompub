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
   * Class represents Atom feed
   */
  public class AtomFeed extends AtomCoreElement {

    /**
     * Constructor
     *
     * @param source
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function AtomFeed(source:XML=null) {
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
      return "feed";
    }

    /**
     * get entries list, synonym of getEntries method
     *
     * @returns entries array
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get entries():Array {
      return getEntries();
    }

    /**
     * get entries list
     *
     * @returns entries array
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getEntries():Array {
      var elementList:XMLList = getElementList(defaultNamespace, "entry");
      var _entries:Array = new Array();
      for each(var element:XML in elementList) {
        _entries.push(new AtomEntry(element));
      }
      return _entries;
    }

    /**
     * set entry, synonym of setEntry method
     *
     * @param entry
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set entry(_entry:AtomEntry):void {
      setEntry(_entry);
    }

    /**
     * set entry
     *
     * @param entry
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setEntry(_entry:AtomEntry):void {
      setAtomElement(defaultNamespace, "entry", _entry);
    }

    /**
     * add entry
     *
     * @param entry
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function addEntry(_entry:AtomEntry):void {
      addAtomElement(defaultNamespace, "entry", _entry);
    }

    /**
     * get icon uri, synonym of getIcon method.
     *
     * @returns icon uri
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get icon():URI {
      return getIcon();
    }

    /**
     * get icon uri
     *
     * @returns icon uri
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getIcon():URI {
      var i:String = getElementText(defaultNamespace, "icon");
      if (i == null) return null;
      return new URI(i);
    }

    /**
     * set icon, synonym of setIcon method
     *
     * @param icon
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set icon(_icon:URI):void {
      setIcon(_icon);
    }

    /**
     * set icon
     *
     * @param icon
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setIcon(_icon:URI):void {
      setElement(defaultNamespace, "icon", _icon.toString());
    }

    /**
     * get logo, synonym of getLogo method
     *
     * @returns logo
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get logo():URI {
      return getLogo();
    }

    /**
     * get logo
     *
     * @returns logo
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getLogo():URI {
      var l:String = getElementText(defaultNamespace, "logo");
      if (l == null) return null;
      return new URI(l);
    }

    /**
     * set logo, synonym of setLogo method
     *
     * @param logo
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set logo(_logo:URI):void {
      setLogo(_logo);
    }

    /**
     * set logo
     *
     * @param logo
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setLogo(_logo:URI):void {
      setElement(defaultNamespace, "logo", _logo.toString());
    }

    /**
     * get subtitle, synonym of getSubtitle method
     *
     * @returns subtitle
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get subtitle():String {
      return getSubtitle();
    }

    /**
     * get subtitle
     *
     * @returns subtitle
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getSubtitle():String {
      return getElementText(defaultNamespace, "subtitle");
    }

    /**
     * set subtitle, synonym of setSubtitle method
     *
     * @param subtitle
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set subtitle(_subtitle:String):void {
      setSubtitle(_subtitle);
    }

    /**
     * set subtitle
     *
     * @param subtitle
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setSubtitle(_subtitle:String):void {
      setElement(defaultNamespace, "subtitle", _subtitle);
    }

    /**
     * get generator, synonym of getGenerator method
     *
     * @returns generator AtomGenerator object
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get generator():AtomGenerator {
      return getGenerator();
    }

    /**
     * get generator
     *
     * @returns generator AtomGenerator object
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getGenerator():AtomGenerator {
      var element:XML = getElement(defaultNamespace, "generator");
      if (element == null) {
        return null;
      }
      return new AtomGenerator(element);
    }

    /**
     * set generator, synonym of setGenerator method
     *
     * @param generator AtomGenerator object
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set generator(_gen:AtomGenerator):void {
      setGenerator(_gen);
    }

    /**
     * set generator
     *
     * @param generator AtomGenerator object
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setGenerator(_gen:AtomGenerator):void {
      setAtomElement(defaultNamespace, "generator", _gen);
    }

    /**
     * get language, synonym of getLanguage method
     *
     * @returns language
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get language():String {
      return getLanguage();
    }

    /**
     * get language
     *
     * @returns language
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getLanguage():String {
      /** namespce and attribute
      if (_src.hasOwnProperty("@xml:lang")) {
        return String(_src.@xml:lang[0]);
      } else {
        return null;
      }
      */
      return null;
    }

    /**
     * set generator, synonym of setLanguage method
     *
     * @param language
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set language(_lang:String):void {
      setLanguage(_lang);
    }

    /**
     * set generator
     *
     * @param language
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setLanguage(_lang:String):void {

    }

    /**
     * get version, synonym of getVersion method
     *
     * @returns version
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get version():String {
      return getVersion();
    }

    /**
     * get version
     *
     * @returns version
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getVersion():String {
      if (_src.hasOwnProperty("@version")) {
        return String(_src.@version[0]);
      } else {
        return null;
      }
    }

    /**
     * set version, synonym of setVersion method
     *
     * @param version
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set version(_version:String):void {
      setVersion(_version);
    }

    /**
     * set version
     *
     * @param version
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setVersion(_version:String):void {
      _src.@version = _version;
    }

    /**
     * get total result that is used with OpenSearch namespace.
     * synonym of getTotalResults method
     *
     * @returns count total results amount
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get totalResults():uint {
      return getTotalResults();
    }

    /**
     * get total result that is used with OpenSearch namespace.
     *
     * @returns count total results amount
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getTotalResults():uint {
      return getElementUintText(AtomNamespace.OPEN_SEARCH, "totalResults");
    }

    /**
     * set total result that is used with OpenSearch namespace.
     * synonym of setTotalResults method
     *
     * @param count total results amount
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set totalResults(_total:uint):void {
      setTotalResults(_total);
    }

    /**
     * set total result that is used with OpenSearch namespace.
     *
     * @param count total results amount
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setTotalResults(_total:uint):void {
      setElement(AtomNamespace.OPEN_SEARCH, "totalResults", String(_total));
    }

    /**
     * get start-index that is used with OpenSearch namespace.
     * synonym of getStartIndex method
     *
     * @returns number it represents the first index of the feed
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get startIndex():uint {
      return getStartIndex();
    }

    /**
     * get start-index that is used with OpenSearch namespace.
     *
     * @returns number it represents the first index of the feed
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getStartIndex():uint {
      return getElementUintText(AtomNamespace.OPEN_SEARCH, "startIndex");
    }

    /**
     * set start-index that is used with OpenSearch namespace.
     * synonym of setStartIndex method
     *
     * @param number it represents the first index of the feed
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set startIndex(_index:uint):void {
      setStartIndex(_index);
    }

    /**
     * set start-index that is used with OpenSearch namespace.
     *
     * @param number it represents the first index of the feed
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setStartIndex(_index:uint):void {
      setElement(AtomNamespace.OPEN_SEARCH, "startIndex", String(_index));
    }

    /**
     * get items-per-page that is used with OpenSearch namespace.
     * synonym of getItemsPerPage method
     *
     * @returns number it represents the amount of entry in the feed
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get itemsPerPage():uint {
      return getItemsPerPage();
    }

    /**
     * get items-per-page that is used with OpenSearch namespace.
     *
     * @returns number it represents the amount of entry in the feed
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getItemsPerPage():uint {
      return getElementUintText(AtomNamespace.OPEN_SEARCH, "itemsPerPage");
    }

    /**
     * set items-per-page that is used with OpenSearch namespace.
     * synonym of setItemsPerPage method.
     *
     * @param number it represents the amount of entry in the feed
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set itemsPerPage(_items:uint):void {
      setItemsPerPage(_items);
    }

    /**
     * set items-per-page that is used with OpenSearch namespace.
     *
     * @param number it represents the amount of entry in the feed
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setItemsPerPage(_items:uint):void {
      setElement(AtomNamespace.OPEN_SEARCH, "itemsPerPage", String(_items));
    }

  }

}

