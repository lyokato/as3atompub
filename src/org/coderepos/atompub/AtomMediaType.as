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

package org.coderepos.atompub {

  import org.coderepos.mime.MediaType;

  /**
   * Class stores constants represents each Atom media types.
   */
  public class AtomMediaType {

    /**
     * Media type for Atom service document
     */
    public static const SERVICE:MediaType = new MediaType("application/atomsvc+xml");
    /**
     * Media type for Atom categories
     */
    public static const CATEGORIES:MediaType = new MediaType("application/atomcat+xml");
    /**
     * Media type for Atom entry
     */
    public static const ENTRY:MediaType = new MediaType("application/atom+xml;type=entry");
    /**
     * Media type for Atom feed
     */
    public static const FEED:MediaType = new MediaType("application/atom+xml;type=feed");

  }

}

