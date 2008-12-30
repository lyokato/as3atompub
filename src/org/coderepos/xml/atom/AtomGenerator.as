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

  public class AtomGenerator extends AtomElement {

    public function AtomGenerator(source:XML=null) {
      super(source);
    }

    override public function get elementName():String {
      return "generator";
    }

    public function get name():String {
      return getName();
    }

    public function getName():String {
      return getElementText(defaultNamespace, "name");
    }

    public function set name(_name:String):void {
      setName(_name);
    }

    public function setName(_name:String):void {
      setElement(defaultNamespace, "name", _name);
    }

    public function get uri():URI {
      return getUri();
    }

    public function getUri():URI {
      if (_src.hasOwnProperty("@uri")) {
        return new URI(String(_src.@uri[0]));
      } else {
        return null;
      }
    }

    public function set uri(_uri:URI):void {
      return setUri(_uri);
    }

    public function setUri(_uri:URI):void {
      _src.@uri = _uri.toString();
    }

    public function get version():String {
      return getVersion();
    }

    public function getVersion():String {
      if (_src.hasOwnProperty("@version")) {
        return String(_src.@version[0]);
      } else {
        return null;
      }
    }

    public function set version(_ver:String):void {
      setVersion(_ver);
    }

    public function setVersion(_ver:String):void {
      _src.@version = _ver;
    }

  }

}
