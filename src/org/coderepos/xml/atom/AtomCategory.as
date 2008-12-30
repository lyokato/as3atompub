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

  /**
   * Class represents atom category
   */
  public class AtomCategory extends AtomElement {

    /**
     * Constructor
     *
     * @param source XML object
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function AtomCategory(source:XML=null) {
      super(source);
    }

    /**
     * get element name
     *
     * @returns elementName
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    override public function get elementName():String {
      return "category";
    }

    /**
     * get term, synonym of getTerm method
     *
     * @returns term
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get term():String {
      return getTerm();
    }

    /**
     * get term
     *
     * @returns term
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getTerm():String {
      if (_src.hasOwnProperty("@term")) {
        return String(_src.@term[0]);
      } else {
        return null;
      }
    }

    /**
     * set term, synonym of setTerm method
     *
     * @param term
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set term(_term:String):void {
      setTerm(_term);
    }

    /**
     * set term
     *
     * @param term
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setTerm(_term:String):void {
      _src.@term = _term;
    }

    /**
     * get label, synonym of getLabel method
     *
     * @returns label
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get label():String {
      return getLabel();
    }

    /**
     * get label
     *
     * @returns label
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getLabel():String {
      if (_src.hasOwnProperty("@label")) {
        return String(_src.@label[0]);
      } else {
        return null;
      }
    }

    /**
     * set label, synonym of setLabel method
     *
     * @param label
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set label(_label:String):void {
      return setLabel(_label);
    }

    /**
     * set label
     *
     * @param label
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setLabel(_label:String):void {
      _src.@label = _label;
    }

    /**
     * get scheme, synonym of getScheme method
     *
     * @returns scheme
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get scheme():String {
      return getScheme();
    }

    /**
     * get scheme
     *
     * @returns scheme
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function getScheme():String {
      if (_src.hasOwnProperty("@scheme")) {
        return String(_src.@scheme[0]);
      } else {
        return null;
      }
    }

    /**
     * set scheme, synonym of setScehem method
     *
     * @param scheme
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function set scheme(_scheme:String):void {
      setScheme(_scheme);
    }

    /**
     * set scheme
     *
     * @param scheme
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function setScheme(_scheme:String):void {
      _src.@scheme = _scheme;
    }

  }

}

