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

  public class AtomReplyTarget extends AtomElement {

    public function AtomReplyTarget(source:XML=null) {
      super(source);
    }

    override public function get elementName():String {
      return "in-reply-to";
    }

    override public function get defaultNamespace():Namespace {
      return AtomNamespace.THR;
    }

    public function get id():String {
      return getId();
    }

    public function getId():String {
      return getRef();
    }

    public function set id(_ref:String):void {
      setId(_ref);
    }

    public function setId(_ref:String):void {
      setRef(_ref);
    }

    public function get href():String {
      return getHref();
    }

    public function getHref():String {
      if (_src.hasOwnProperty("@href")) {
        return String(_src.@href[0]);
      } else {
        return null;
      }
    }

    public function set href(_href:String):void {
      setHref(_href);
    }

    public function setHref(_href:String):void {
      _src.@href = _href;
    }

    public function get ref():String {
      return getRef();
    }

    public function getRef():String {
      if (_src.hasOwnProperty("@ref")) {
        return String(_src.@ref[0]);
      } else {
        return null;
      }
    }

    public function set ref(_ref:String):void {
      setRef(_ref);
    }

    public function setRef(_ref:String):void {
      _src.@ref = _ref;
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

    public function get source():String {
      return getSource();
    }

    public function getSource():String {
      if (_src.hasOwnProperty("@source")) {
        return String(_src.@source[0]);
      } else {
        return null;
      }
    }

    public function set source(_source:String):void {
      setSource(_source);
    }

    public function setSource(_source:String):void {
      _src.@source = _source;
    }

  }

}

