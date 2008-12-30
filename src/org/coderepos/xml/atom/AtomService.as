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

  public class AtomService extends AtomElement {

    public function AtomService(source:XML=null) {
      super(source);
    }

    override public function get elementName():String {
      return "service";
    }

    override public function get defaultNamespace():Namespace {
      return AtomNamespace.APP_WITHOUT_PREFIX;
    }

    public function get workspace():AtomWorkspace {
      return getWorkspace();
    }

    public function getWorkspace():AtomWorkspace {
      var element:XML = getElement(defaultNamespace, 'workspace');
      if (element == null) {
        return null;
      }
      return new AtomWorkspace(element);
    }

    public function get workspaces():Array {
      return getWorkspaces();
    }

    public function getWorkspaces():Array {
      var elementList:XMLList = getElementList(defaultNamespace, 'workspace');
      var workspaces:Array = new Array();
      for each(var element:XML in elementList) {
        var workspace:AtomWorkspace = new AtomWorkspace(element);
        workspaces.push(workspace);
      }
      return workspaces;
    }

    public function set workspace(_workspace:AtomWorkspace):void {
      setWorkspace(_workspace);
    }

    public function setWorkspace(_workspace:AtomWorkspace):void {
      setAtomElement(defaultNamespace, 'workspace', _workspace);
    }

    public function addWorkspace(_workspace:AtomWorkspace):void {
      addAtomElement(AtomNamespace.APP_WITHOUT_PREFIX, 'workspace', _workspace);
    }

  }

}

