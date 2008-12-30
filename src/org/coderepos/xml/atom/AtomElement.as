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

  import org.coderepos.date.W3CDTF;

  /**
   * Base class of each atom element
   */
  public class AtomElement {

    protected var _src:XML;

    /**
     * Constructor
     *
     * @param source XML object
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function AtomElement(source:XML=null) {
      if (source == null) {
        resetElement();
      } else {
        _src = source;
      }
    }

    /**
     * Reset source element
     *
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function resetElement():void {
      _src = <{elementName}/>;
      _src.setNamespace(defaultNamespace);
    }

    /**
     * get element name. this method is abstract. override in each subclass.
     *
     * @returns elementName
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get elementName():String {
      return "";
    }

    /**
     * get element name. this method is abstract. override in each subclass.
     *
     * @returns elementName
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get defaultNamespace():Namespace {
      return AtomNamespace.ATOM_WITHOUT_PREFIX;
    }

    /**
     * set new element for indicated namespace and elementName
     *
     * @param namespace
     * @param elementName
     * @param value
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setElement(ns:Namespace, elementName:String, value:String=""):void {
      delete _src.ns::[elementName];
      addElement(ns, elementName, value);
    }

    /**
     * append another element for indicated namespace and elementName
     *
     * @param namespace
     * @param elementName
     * @param value
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function addElement(ns:Namespace, elementName:String, value:String=""):void {
      var newElem:XML = <{elementName}>{value}</{elementName}>;
      // newElem.addNamespace(ns);
      newElem.setNamespace(ns);
      _src.appendChild(newElem);
    }

    /**
     * set new element with Date object for indicated namespace and elementName
     *
     * @param namespace
     * @param elementName
     * @param date
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setDateElement(ns:Namespace, elementName:String, date:Date=null):void {
      var value:String = (date == null) ? "" : W3CDTF.format(date);
      setElement(ns, elementName, value);
    }

    /**
     * set new element with AtomElement subclass for indicated namespace and elementName
     *
     * @param namespace
     * @param elementName
     * @param element
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setAtomElement(ns:Namespace, elementName:String, value:AtomElement):void {
      delete _src.ns::[elementName];
      addAtomElement(ns, elementName, value);
    }

    /**
     * append another element with AtomElement subclass for indicated namespace and elementName
     *
     * @param namespace
     * @param elementName
     * @param element
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function addAtomElement(ns:Namespace, elementName:String, value:AtomElement):void {
      var newElem:XML = <{elementName}/>;
      newElem.setNamespace(ns);
      var elements:XMLList = value.elementSrc.elements("*");
      for each(var element:XML in elements) {
        newElem.appendChild(element);
      }
      var attributes:XMLList = value.elementSrc.attributes();
      for each(var attribute:XML in attributes) {
        newElem.@[attribute.name()] = attribute.toString();
        //newElem.appendChild(attribute);
      }
      _src.appendChild(newElem);
    }

    /**
     * get XML element for indicated both namespace and element name
     *
     * @param namespace
     * @param elementName
     * @returns xml element
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getElement(ns:Namespace, elementName:String):XML {
      var list:XMLList = getElementList(ns, elementName);
      return (list.length() > 0) ? list[0] : null;
    }

    /**
     * get text node for indicated both namespace and element name
     *
     * @param namespace
     * @param elementName
     * @returns text text node string
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getElementText(ns:Namespace, elementName:String):String {
      var element:XML = getElement(ns, elementName);
      if (element == null) {
        return null;
      }
      return element.toString();
    }

    /**
     * get text node as boolean for indicated both namespace and element name
     *
     * @param namespace
     * @param elementName
     * @returns bool
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getElementBooleanText(ns:Namespace, elementName:String):Boolean {
      var element:XML = getElement(ns, elementName);
      if (element == null) {
        return false;
      }
      return (element.toString() == "yes") ? true : false;
    }

    /**
     * get text node as uint for indicated both namespace and element name
     *
     * @param namespace
     * @param elementName
     * @returns uint
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getElementUintText(ns:Namespace, elementName:String):uint {
      var element:XML = getElement(ns, elementName);
      if (element == null) {
        return null;
      }
      var num:String = element.toString();
      return num.match(/^\d+$/) ? uint(num) : null;
    }

    /**
     * get text node as date for indicated both namespace and element name
     *
     * @param namespace
     * @param elementName
     * @returns date
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getElementDateText(ns:Namespace, elementName:String):Date {
      var element:XML = getElement(ns, elementName);
      if (element == null) {
        return null;
      }
      try {
        var date:Date = W3CDTF.parse(element.toString());
        return date;
      } catch (e:Error) { }
      return null;
    }

    /**
     * get multiple element list for indicated both namespace and element name
     *
     * @param namespace
     * @param elementName
     * @returns list XMLList object
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getElementList(ns:Namespace, elementName:String):XMLList {
      var q:QName = new QName(ns, elementName);
      return _src.elements(q);
    }

    /**
     * Proxy to source xml element's toString method
     *
     * @returns string
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function toString():String {
      return _src.toString();
    }

    /**
     * Proxy to source xml element's toXMLString method
     *
     * @param indent
     * @param prettyPrinting use prettyPrinting or not
     * @returns string
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function toXMLString(indent:int=0, prettyPrinting:Boolean=false):String {
      XML.prettyIndent = indent;
      XML.prettyPrinting = prettyPrinting;
      return _src.toXMLString();
    }

    /**
     * get source element
     *
     * @returns source XML object
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get elementSrc():XML {
      return _src;
    }

    /**
     * returns attribute value string for indicated attribute name
     *
     * @param attributeName
     * @returns attr
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getAttr(attr:String):String {
      if (_src.hasOwnProperty("@" + attr)) {
        return String(_src.@[attr]); 
      } else {
        return null;
      }
    }

    /**
     * set attribute
     *
     * @param attributeName
     * @param attributeValue
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setAttr(attr:String, value:String):void {
      _src.@[attr] = value;
    }

  }

}

