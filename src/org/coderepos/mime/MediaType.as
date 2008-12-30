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

package org.coderepos.mime {

  public class MediaType {

    private var _type:String;
    private var _subtype:String;
    private var _parameters:String;

    public function MediaType(type:String) {
      var result:Array = type.split(/[\/;]/);
      if (result[0] == null || result[1] == null) {
        throw new ArgumentError("Invalid media type: " + type);
      }
      _type = result[0];
      _subtype = result[1];
      _parameters = result[2];
    }

    public function get type():String {
      return _type;
    }

    public function get subtype():String {
      return _subtype;
    }

    public function get parameters():String {
      return _parameters;
    }

    public function get subtypeMajor():String {
      var result:Array = _subtype.match(/\+(.+)/);
      return (result == null) ? _subtype : result[1];

    }

    public function getWithoutParameters():String {
      return _type + "/" + _subtype;
    }

    public function toString():String {
      var withoutParam:String = getWithoutParameters();
      if (_parameters != null) {
        withoutParam = withoutParam + ";" + _parameters;
      }
      return withoutParam;
    }

    public function isA(value:MediaType):Boolean {
      if (value.type == "*") return true;
      if (value.type != _type) return false;
      if (value.subtype == "*") return true;
      if (value.subtype != _subtype) return false;
      if (value.parameters == null || _parameters == null) return true;
      if (value.parameters == _parameters)
        return true;
      else
        return false;
    }

  }

}
