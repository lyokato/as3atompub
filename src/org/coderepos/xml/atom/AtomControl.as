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

  public class AtomControl extends AtomElement {

    public function AtomControl(source:XML=null) {
      super(source);
    }

    override public function get elementName():String {
      return "control";
    }

    override public function get defaultNamespace():Namespace {
      return AtomNamespace.APP;
    }

    public function get draft():Boolean {
      return getDraft();
    }

    public function getDraft():Boolean {
      return getElementBooleanText(AtomNamespace.APP_WITHOUT_PREFIX, "draft");
    }

    public function set draft(_draft:Boolean):void {
      setDraft(_draft);
    }

    public function setDraft(_draft:Boolean):void {
      var str:String = (_draft) ? "yes" : "no";
      setElement(AtomNamespace.APP_WITHOUT_PREFIX, "draft", str);
    }

  }

}

