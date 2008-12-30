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

  public class AtomLink extends AtomElement {

    public function AtomLink(source:XML=null) {
      super(source);
    }

    override public function get elementName():String {
      return "link";
    }

    public function get href():URI {
      return getHref();
    }

    public function getHref():URI {
      if (_src.hasOwnProperty("@href")) {
        return new URI(String(_src.@href[0]));
      } else {
        return null;
      }
    }

    public function set href(_href:URI):void {
      setHref(_href);
    }

    public function setHref(_href:URI):void {
      _src.@href = _href.toString();
    }

    public function get rel():String {
      return getRel();
    }

    public function getRel():String {
      if (_src.hasOwnProperty("@rel")) {
        return String(_src.@rel[0]);
      } else {
        return null;
      }
    }

    public function set rel(_rel:String):void {
      setRel(_rel);
    }

    public function setRel(_rel:String):void {
      _src.@rel = _rel;
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

    public function get hreflang():String {
      return getHreflang();
    }

    public function getHreflang():String {
      if (_src.hasOwnProperty("@hreflang")) {
        return String(_src.@hreflang[0]);
      } else {
        return null;
      }
    }

    public function set hreflang(_hreflang:String):void {
      setHreflang(_hreflang);
    }

    public function setHreflang(_hreflang:String):void {
      _src.@hreflang = _hreflang;
    }

    public function get title():String {
      return getTitle();
    }

    public function getTitle():String {
      if (_src.hasOwnProperty("@title")) {
        return String(_src.@title[0]);
      } else {
        return null;
      }
    }

    public function set title(_title:String):void {
      setTitle(_title);
    }

    public function setTitle(_title:String):void {
      _src.@title = _title;
    }

    public function get length():uint {
      return getLength();
    }

    public function getLength():uint {
      if (_src.hasOwnProperty("@length")) {
        return uint(String(_src.@length[0]));
      } else {
        return 0;
      }
    }

    public function set length(_length:uint):void {
      setLength(_length);
    }

    public function setLength(_length:uint):void {
      _src.@length = String(_length);
    }

    override public function toString():String {
      return getHref().toString();
    }

  }
}

