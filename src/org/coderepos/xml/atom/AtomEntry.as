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

  /**
   * Class represents entry element for Atom Syndication Format
   *
   * @example
   * <listing version="3.0">
   *
   * var entry:AtomEntry = new AtomEntry();
   * entry.title = "My Entry Title";
   * entry.summary = "entry summary";
   * entry.updated = new Date();
   * var author:AtomPerson = new AtomPerson();
   * author.name = "Lyo Kato";
   * author.email = "lyo.kato _at_ gmail.com";
   * author.uri = new URI("http://d.hatena.ne.jp/lyokato");
   * entry.author = author;
   * var content:AtomContent = new AtomContent();
   * content.body = "content body";
   * entry.content = content;
   * var str:String = entry.toXMLString();
   *
   * </listing>
   */
  public class AtomEntry extends AtomCoreElement {

    /**
     * Constructor
     *
     * @param source source XML element
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function AtomEntry(_source:XML=null) {
      super(_source);
    }

    /**
     * getter for element name
     *
     * @returns elementName
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    override public function get elementName():String {
      return "entry";
    }

    /**
     * getter for summary
     *
     * @returns elementName
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get summary():String {
      return getSummary();
    }

    /**
     * getter for summary
     *
     * @returns elementName
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getSummary():String {
      return getElementText(defaultNamespace, "summary");
    }

    /**
     * setter for summary
     *
     * @param elementName
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set summary(_summary:String):void {
      setSummary(_summary);
    }

    /**
     * setter for summary
     *
     * @param elementName
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setSummary(_summary:String):void {
      setElement(defaultNamespace, "summary", _summary);
    }

    /**
     * getter for source
     *
     * @returns source
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get source():String {
      return getSource();
    }

    /**
     * getter for source
     *
     * @returns source
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getSource():String {
      return getElementText(defaultNamespace, "source");
    }

    /**
     * setter for source
     *
     * @param source
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set source(_source:String):void {
      setSource(_source);
    }

    /**
     * setter for source
     *
     * @param source
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setSource(_source:String):void {
      setElement(defaultNamespace, "source", _source);
    }

    /**
     * getter for published
     *
     * @returns published date
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get published():Date {
      return getPublished();
    }

    /**
     * getter for published
     *
     * @returns published date
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getPublished():Date {
      return getElementDateText(defaultNamespace, "published");
    }

    /**
     * setter for published
     *
     * @param published
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set published(_published:Date):void {
      setPublished(_published);
    }

    /**
     * setter for published
     *
     * @param published date
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setPublished(_published:Date):void {
      setDateElement(defaultNamespace, "published", _published);
    }

    public function get control():AtomControl {
      return getControl();
    }

    public function getControl():AtomControl {
      var element:XML = getElement(AtomNamespace.APP_WITHOUT_PREFIX, 'control');
      if (element == null) {
        return null;
      }
      return new AtomControl(element);
    }

    public function get controls():Array {
      return getControls();
    }

    public function getControls():Array {
      var elements:XMLList = getElementList(AtomNamespace.APP_WITHOUT_PREFIX, 'control');
      var controls:Array = new Array();
      for each(var element:XML in elements) {
        var control:AtomControl = new AtomControl(element);
        controls.push(control);
      }
      return controls;
    }

    public function set control(_control:AtomControl):void {
      setControl(_control);
    }

    public function setControl(_control:AtomControl):void {
      setAtomElement(AtomNamespace.APP, 'control', _control);
    }

    public function addControl(_control:AtomControl):void {
      addAtomElement(AtomNamespace.APP, 'control', _control);
    }

    public function get edited():Date {
      return getEdited();
    }

    public function getEdited():Date {
      return getElementDateText(AtomNamespace.APP_WITHOUT_PREFIX, "edited");
    }

    public function set edited(_date:Date):void {
      setEdited(_date);
    }

    public function setEdited(_date:Date):void {
      setDateElement(AtomNamespace.APP, "edited", _date);
    }

    public function get total():uint {
      return getTotal();
    }

    public function getTotal():uint {
      return getElementUintText(AtomNamespace.THR, "total");
    }

    public function set total(_total:uint):void {
      setTotal(_total);
    }

    public function setTotal(_total:uint):void {
      setElement(AtomNamespace.THR, "total", String(_total));
    }

    public function get replyTarget():AtomReplyTarget {
      return getReplyTarget();
    }

    public function getReplyTarget():AtomReplyTarget {
      var element:XML = getElement(AtomNamespace.THR, "in-reply-to");
      if (element == null) {
        return null;
      }
      return new AtomReplyTarget(element);
    }

    public function set replyTarget(_target:AtomReplyTarget):void {
      setReplyTarget(_target);
    }

    public function setReplyTarget(_target:AtomReplyTarget):void {
      setAtomElement(AtomNamespace.THR, "in-reply-to", _target);
    }

    public function get repliesLink():URI {
      return getRepliesLink();
    }

    public function getRepliesLink():URI {
      return getLinkByRelType("replies");
    }

    public function get repliesLinks():Array {
      return getRepliesLinks();
    }

    public function getRepliesLinks():Array {
      return getLinksByRelType("replies");
    }

    public function set repliesLink(_href:URI):void {
      setRepliesLink(_href);
    }

    public function setRepliesLink(_href:URI):void {
      setLinkByRelType("replies", _href);
    }

    public function addRepliesLink(_href:URI):void {
      addLinkByRelType("replies", _href);
    }

  }

}

