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

  internal class AtomCoreElement extends AtomElement {

    public function AtomCoreElement(source:XML=null) {
      super(source);
    }

    public function get id():String {
      return getId();
    }

    public function getId():String {
      return getElementText(defaultNamespace, "id");
    }

    public function set id(_id:String):void {
      setId(_id);
    }

    public function setId(_id:String):void {
      setElement(defaultNamespace, "id", _id);
    }

    public function get title():String {
      return getTitle();
    }

    public function getTitle():String {
      return getElementText(defaultNamespace, "title");
    }

    public function set title(_title:String):void {
      setTitle(_title);
    }

    public function setTitle(_title:String):void {
      setElement(defaultNamespace, 'title', _title);
    }

    public function get rights():String {
      return getRights();
    }

    public function getRights():String {
      return getElementText(defaultNamespace, "rights");
    }

    public function set rights(_rights:String):void {
      setRights(_rights);
    }

    public function setRights(_rights:String):void {
      setElement(defaultNamespace, "rights", _rights);
    }

    public function get updated():Date {
      return getUpdated();
    }

    public function getUpdated():Date {
      return getElementDateText(defaultNamespace, "updated");
    }

    public function set updated(_updated:Date):void {
      setUpdated(_updated);
    }

    public function setUpdated(_updated:Date):void {
      setDateElement(defaultNamespace, "updated", _updated);
    }

    public function get links():Array {
      return getLinks();
    }

    public function getLinks():Array {
      var elements:XMLList = getElementList(AtomNamespace.ATOM_WITHOUT_PREFIX, 'link');
      var links:Array = new Array();
      for each(var element:XML in elements) {
        var link:AtomLink = new AtomLink(element);
        links.push(link);
      }
      return links;
    }

    public function set link(_link:AtomLink):void {
      setLink(_link);
    }

    public function setLink(_link:AtomLink):void {
      setAtomElement(defaultNamespace, 'link', _link);
    }

    public function addLink(_link:AtomLink):void {
      addAtomElement(defaultNamespace, 'link', _link);
    }

    public function get categories():Array {
      return getCategories();
    }

    public function getCategories():Array {
      var elementList:XMLList = getElementList(defaultNamespace, "category");
      var cats:Array = new Array();
      for each(var element:XML in elementList) {
        var cat:AtomCategory = new AtomCategory(element);
        cats.push(cat);
      }
      return cats;
    }

    public function setCategory(_category:AtomCategory):void {
      setAtomElement(defaultNamespace, "category", _category);
    }

    public function addCategory(_category:AtomCategory):void {
      addAtomElement(defaultNamespace, "category", _category);
    }

    public function get author():AtomPerson {
      return getAuthor();
    }

    public function getAuthor():AtomPerson {
      var element:XML = getElement(defaultNamespace, "author");      
      if (element == null) {
        return null;
      }
      return new AtomPerson(element);
    }

    public function get authors():Array {
      return getAuthors();
    }

    public function getAuthors():Array {
      var elementList:XMLList = getElementList(defaultNamespace, "authors");
      var authorList:Array = new Array();
      for each(var element:XML in elementList) {
        authorList.push(new AtomPerson(element));
      }
      return authorList;
    }

    public function set author(_author:AtomPerson):void {
      setAuthor(_author);
    }

    public function setAuthor(_author:AtomPerson):void {
      setAtomElement(defaultNamespace, "author", _author);
    }

    public function addAuthor(_author:AtomPerson):void {
      addAtomElement(defaultNamespace, "author", _author);
    }

    public function get contributor():AtomPerson {
      return getContributor();
    }

    public function getContributor():AtomPerson {
      var element:XML = getElement(defaultNamespace, "contributor");
      if (element == null) {
        return null;
      }
      return new AtomPerson(element);
    }

    public function get contributors():Array {
      return getContributors();
    }

    public function getContributors():Array {
      var elementList:XMLList = getElementList(defaultNamespace, "contributors");
      var conts:Array = new Array();
      for each(var element:XML in elementList) {
        conts.push(new AtomPerson(element));
      }
      return conts;
    }

    public function set contributor(_contributor:AtomPerson):void {
      setContributor(_contributor);
    }

    public function setContributor(_contributor:AtomPerson):void {
      setAtomElement(defaultNamespace, "contributor", _contributor);
    }

    public function addContributor(_contributor:AtomPerson):void {
      addAtomElement(defaultNamespace, "contributor", _contributor);
    }

    protected function getLinkByRelType(_type:String):URI {
      var element:XML = _src.defaultNamespace::link.(hasOwnProperty("@rel") && @rel==_type).@href[0];
      if (element == null) {
        return null;
      }
      return new URI(String(element));
    }

    protected function getLinksByRelType(_type:String):Array {
      var elementList:XMLList = _src.defaultNamespace::link.(hasOwnProperty("@rel") && @rel==_type).@href;
      var links:Array = new Array();
      for each(var element:XML in elementList) {
        links.push(new URI(String(element)));
      }
      return links;
    }

    protected function setLinkByRelType(_type:String, _href:URI):void {
      var elements:XMLList = _src.defaultNamespace::link.(hasOwnProperty("@rel") && @rel!=_type);
      delete _src.defaultNamespace::link;
      for each(var element:XML in elements) {
        addAtomElement(defaultNamespace, 'link', new AtomLink(element));   
      }
      var _link:AtomLink = new AtomLink();
      _link.href = _href;
      _link.rel = _type;
      addAtomElement(defaultNamespace, 'link', _link);
      //setLink(_link);
    }

    protected function addLinkByRelType(_type:String, _href:URI):void {
      var _link:AtomLink = new AtomLink();
      _link.href = _href;
      _link.rel = _type;
      addLink(_link);
    }


    public function get alternateLink():URI {
      return getAlternateLink();
    }

    public function getAlternateLink():URI {
      var element:XML = _src.defaultNamespace::link.(hasOwnProperty("@rel")==false || @rel=="alternate").@href[0];
      if (element == null) {
        return null;
      }
      return new URI(String(element));
    }

    public function get alternateLinks():Array {
      return getAlternateLinks();
    }

    public function getAlternateLinks():Array {
      var elementList:XMLList = _src.defaultNamespace::link.(hasOwnProperty("@rel")==false || @rel=="alternate").@href;
      var links:Array = new Array();
      for each(var element:XML in elementList) {
        links.push(new URI(String(element)));
      }
      return links;
    }

    public function set alternateLink(_href:URI):void {
      setAlternateLink(_href);
    }

    public function setAlternateLink(_href:URI):void {
      setLinkByRelType("alternate", _href);
    }

    public function addAlternateLink(_href:URI):void {
      addLinkByRelType("alternate", _href);
    }

    public function get selfLink():URI {
      return getSelfLink();
    }

    public function getSelfLink():URI {
      return getLinkByRelType("self");
    }

    public function get selfLinks():Array {
      return getSelfLinks();
    }

    public function getSelfLinks():Array {
      return getLinksByRelType("self");
    }

    public function set selfLink(_href:URI):void {
      setSelfLink(_href);
    }

    public function setSelfLink(_href:URI):void {
      setLinkByRelType("self", _href);
    }

    public function addSelfLink(_href:URI):void {
      addLinkByRelType("self", _href);
    }

    public function get editLink():URI {
      return getEditLink();
    }

    public function getEditLink():URI {
      return getLinkByRelType("edit");
    }

    public function get editLinks():Array {
      return getEditLinks();
    }

    public function getEditLinks():Array {
      return getLinksByRelType("edit");
    }

    public function set editLink(_href:URI):void {
      setEditLink(_href);
    }

    public function setEditLink(_href:URI):void {
      setLinkByRelType("edit", _href);
    }

    public function addEditLink(_href:URI):void {
      addLinkByRelType("edit", _href);
    }

    public function get mediaLink():URI {
      return getMediaLink();
    }

    public function getMediaLink():URI {
      return getLinkByRelType("media");
    }

    public function get mediaLinks():Array {
      return getMediaLinks();
    }

    public function getMediaLinks():Array {
      return getLinksByRelType("media");
    }

    public function set mediaLink(_href:URI):void {
      setMediaLink(_href);
    }

    public function setMediaLink(_href:URI):void {
      setLinkByRelType("media", _href);
    }

    public function addMediaLink(_href:URI):void {
      addLinkByRelType("media", _href);
    }

    public function get editMediaLink():URI {
      return getEditMediaLink();
    }

    public function getEditMediaLink():URI {
      return getLinkByRelType("edit-media");
    }

    public function get editMediaLinks():Array {
      return getEditMediaLinks();
    }

    public function getEditMediaLinks():Array {
      return getLinksByRelType("edit-media");
    }

    public function set editMediaLink(_href:URI):void {
      setEditMediaLink(_href);
    }

    public function setEditMediaLink(_href:URI):void {
      setLinkByRelType("edit-media", _href);
    }

    public function addEditMediaLink(_href:URI):void {
      addLinkByRelType("edit-media", _href);
    }

    public function get relatedLink():URI {
      return getRelatedLink();
    }

    public function getRelatedLink():URI {
      return getLinkByRelType("related");
    }

    public function get relatedLinks():Array {
      return getRelatedLinks();
    }

    public function getRelatedLinks():Array {
      return getLinksByRelType("related");
    }

    public function set relatedLink(_href:URI):void {
      setRelatedLink(_href);
    }

    public function setRelatedLink(_href:URI):void {
      setLinkByRelType("related", _href);
    }

    public function addRelatedLink(_href:URI):void {
      addLinkByRelType("related", _href);
    }

    public function get enclosureLink():URI {
      return getEnclosureLink();
    }

    public function getEnclosureLink():URI {
      return getLinkByRelType("enclosure");
    }

    public function get enclosureLinks():Array {
      return getEnclosureLinks();
    }

    public function getEnclosureLinks():Array {
      return getLinksByRelType("enclosure");
    }

    public function set enclosureLink(_href:URI):void {
      setEnclosureLink(_href);
    }

    public function setEnclosureLink(_href:URI):void {
      setLinkByRelType("enclosure", _href);
    }

    public function addEnclosureLink(_href:URI):void {
      addLinkByRelType("enclosure", _href);
    }

    public function get viaLink():URI {
      return getViaLink();
    }

    public function getViaLink():URI {
      return getLinkByRelType("via");
    }

    public function get viaLinks():Array {
      return getViaLinks();
    }

    public function getViaLinks():Array {
      return getLinksByRelType("via");
    }

    public function set viaLink(_href:URI):void {
      setViaLink(_href);
    }

    public function setViaLink(_href:URI):void {
      setLinkByRelType("via", _href);
    }

    public function addViaLink(_href:URI):void {
      addLinkByRelType("via", _href);
    }

    public function get firstLink():URI {
      return getFirstLink();
    }

    public function getFirstLink():URI {
      return getLinkByRelType("first");
    }

    public function set firstLink(_href:URI):void {
      setFirstLink(_href);
    }

    public function setFirstLink(_href:URI):void {
      setLinkByRelType("first", _href);
    }

    public function get previousLink():URI {
      return getPreviousLink();
    }

    public function getPreviousLink():URI {
      return getLinkByRelType("previous");
    }

    public function set previousLink(_href:URI):void {
      setPreviousLink(_href);
    }

    public function setPreviousLink(_href:URI):void {
      setLinkByRelType("previous", _href);
    }

    public function get nextLink():URI {
      return getNextLink();
    }

    public function getNextLink():URI {
      return getLinkByRelType("next");
    }

    public function set nextLink(_href:URI):void {
      setNextLink(_href);
    }

    public function setNextLink(_href:URI):void {
      setLinkByRelType("next", _href);
    }

    public function get lastLink():URI {
      return getLastLink();
    }

    public function getLastLink():URI {
      return getLinkByRelType("last");
    }

    public function set lastLink(_href:URI):void {
      setLastLink(_href);
    }

    public function setLastLink(_href:URI):void {
      setLinkByRelType("last", _href);
    }

  }

}
