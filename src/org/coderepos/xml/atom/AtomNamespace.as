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
   * Class stores namespaces that used in atompub protocols often.
   */
  public class AtomNamespace {

    /**
     * atom namespace with prefix
     */
    public static const ATOM:Namespace = new Namespace('atom', 'http://www.w3.org/2005/Atom');
    /**
     * atom namespace without prefix
     */
    public static const ATOM_WITHOUT_PREFIX:Namespace = new Namespace('http://www.w3.org/2005/Atom');
    /**
     * app namespace with prefix
     */
    public static const APP:Namespace = new Namespace('app', 'http://www.w3.org/2007/app');
    /**
     * app namespace without prefix
     */
    public static const APP_WITHOUT_PREFIX:Namespace = new Namespace('http://www.w3.org/2007/app');
    /**
     * open search namespace
     */
    public static const OPEN_SEARCH:Namespace = new Namespace('openSearch', 'http://a9.com/-/spec/opensearchrss/1.1/');
    /**
     * dubline core namespace
     */
    public static const DC:Namespace = new Namespace('dc', 'http://purl.org/dc/elements/1.1/');
    /**
     * friend of a friend namespace
     */
    public static const FOAF:Namespace = new Namespace('foaf', 'http://xmlns.com/foaf/0.1');
    /**
     * atom threading namespace
     */
    public static const THR:Namespace = new Namespace('thr', 'http://purl.org/syndication/thread/1.0');

  }

}

