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

  import flash.utils.ByteArray;
  import com.hurlant.util.Base64;
  import com.adobe.net.URI;

  public class AtomContent extends AtomElement {

    public function AtomContent(source:XML=null) {
      super(source);
    }

    override public function get elementName():String {
      return "content";
    }

    public function get type():String {
      return getType();
    }

    public function getType():String {
      if (_src.hasOwnProperty("@type")) {
        return String(_src.@type[0]);
      } else {
        return null;
      }
    }

    public function set type(_type:String):void {
      setType(_type);
    }

    public function setType(_type:String):void {
      _src.@type = _type;
    }

    public function get src():URI {
      return getSrc();
    }

    public function getSrc():URI {
      if (_src.hasOwnProperty("@src")) {
        return new URI(String(_src.@src[0]));
      } else {
        return null;
      }
    }

    public function set src(__src:URI):void {
      setSrc(__src);
    }

    public function setSrc(__src:URI):void {
      _src.@src = __src;
    }

    public function get body():String {
      return getBody();
    }

    public function getBody():String {
      // TODO: return propertype content
      var t:String = getType();
      if (t == "text" || t == "html") {
        return _src.text();
      } else if (t == "xhtml") {
        var list:XMLList = _src.elements("*"); 
        var result:Array = new Array();
        for each(var elem:XML in list) {
          result.push(elem.toXMLString());
        }
        return result.join('');
      } else {
        return null;
      }
    }

    public function set body(_body:*):void {
      setBody(_body);
    }

    public function setBody(_body:*):void {
      if (_body is String) {
        setBodyWithString(_body);
      } else if (_body is XML) {
        setBodyWithXML(_body);
      } else {
        throw new ArgumentError("body-type should be String, XML or ByteArray.");
      }
    }

    public function setBodyWithXML(_body:XML):void {
      _src.appendChild(_body);
      setType('xhtml');
    }

    public function setBodyWithString(_body:String):void {
      var copy:String = '<div xmlns="http://www.w3.org/1999/xhtml">' + _body + '</div>';
      var isValid:Boolean = true;
      var node:XML = null;
      try {
        var copyXML:XML = new XML(copy);
        node = copyXML.elements('*')[0];
      } catch (e:Error) {
        isValid = false;
      }
      if (isValid && node != null) {
        _src.appendChild(node);
        setType('xhtml');
      } else {
        _src.appendChild(_body);
        var type:String = (_body.match(/^\s*</)) ? 'html' : 'text';
        setType(type);
      }
    }

  }
}

