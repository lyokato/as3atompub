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

  public class AtomWorkspace extends AtomElement {

    public function AtomWorkspace(source:XML=null) {
      super(source);
    }

    override public function get elementName():String {
      return "workspace";      
    }

    override public function get defaultNamespace():Namespace {
      return AtomNamespace.APP_WITHOUT_PREFIX;
    }

    public function get collection():AtomCollection {
      return getCollection();
    }

    public function getCollection():AtomCollection {
      var element:XML = getElement(defaultNamespace, 'collection');
      if (element == null) {
        return null;
      }
      return new AtomCollection(element);
    }

    public function get collections():Array {
      return getCollections();
    }

    public function getCollections():Array {
      var elementList:XMLList = getElementList(defaultNamespace, 'collection');
      var collections:Array = new Array();
      for each(var element:XML in elementList) {
        var collection:AtomCollection = new AtomCollection(element);
        collections.push(collection);
      }
      return collections;
    }

    public function set collection(_collection:AtomCollection):void {
      setCollection(_collection);
    }

    public function setCollection(_collection:AtomCollection):void {
      setAtomElement(defaultNamespace, 'collection', _collection);
    }

    public function addCollection(_collection:AtomCollection):void {
      addAtomElement(defaultNamespace, 'collection', _collection);
    }

    public function get title():String {
      return getTitle();
    }

    public function getTitle():String {
      return getElementText(AtomNamespace.ATOM_WITHOUT_PREFIX, 'title');
    }

    public function set title(_title:String):void {
      setTitle(_title);
    }

    public function setTitle(_title:String):void {
      setElement(AtomNamespace.ATOM, 'title', _title);
    }

  }

}

