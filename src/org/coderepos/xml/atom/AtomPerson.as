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

  public class AtomPerson extends AtomElement {

    public function AtomPerson(source:XML=null) {
      super(source);
    }

    override public function get elementName():String {
      return "author";
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

    public function get email():String {
      return getEmail();
    }

    public function getEmail():String {
      return getElementText(defaultNamespace, "email");
    }

    public function set email(_email:String):void {
      setEmail(_email);
    }

    public function setEmail(_email:String):void {
      setElement(defaultNamespace, "email", _email);
    }

    public function get uri():URI {
      return getUri();
    }

    public function getUri():URI {
      var u:String = getElementText(defaultNamespace, "uri");
      return (u == null) ? null : new URI(u);
    }

    public function set uri(_uri:URI):void {
      setUri(_uri);
    }

    public function setUri(_uri:URI):void {
      setElement(defaultNamespace, "uri", _uri.toString());
    }

  }

}
