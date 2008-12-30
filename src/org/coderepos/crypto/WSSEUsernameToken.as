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

/* XXX:
 *   as3corelib includes WSSEUsernameToken.as,
 *   but it doesn't work as expected and is inconvinient on Flash environment
 *   because of dependencies on some mx-libraries.
 *   So, I did remake the same functionality but without mx-dependencies.
 */

package org.coderepos.crypto {

  import flash.utils.ByteArray;
  import com.hurlant.util.Base64;
  import com.hurlant.crypto.Crypto;
  import com.hurlant.crypto.hash.SHA1;
  import org.coderepos.date.W3CDTF;

  /**
   * Class generate username token for WSSE authentication
   */
  public class WSSEUsernameToken {

    /**
     * generate usernametoken
     *
     * @param username
     * @param password
     * @param nonce
     * @param timestamp
     * @return token
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public static function getUsernameToken(username:String, password:String,
      nonce:String=null, timestamp:Date=null):String {
      if (nonce == null) {
        nonce = generateNonce();
      }
      var nonce64:String = Base64.encode(nonce);
      var created:String = generateTimestamp(timestamp);
      var password64:String = getBase64Digest(nonce, created, password);
      var token:String = 'UsernameToken Username="';
      token += username + '", PasswordDigest="' + password64 + '", Nonce="' + nonce64 + '", Created="' + created + '"';
      return token;
    }

    private static function generateNonce():String {
      var s:String = Math.random().toString();
      return s.replace(".", "");
    }

    private static function generateTimestamp(timestamp:Date):String {
      return (timestamp == null) ? W3CDTF.now() : W3CDTF.format(timestamp);
    }

    private static function getBase64Digest(nonce:String, created:String, password:String):String {
      var hash:SHA1 = Crypto.getHash("sha1") as SHA1;
      var bytes:ByteArray = new ByteArray();
      bytes.writeUTFBytes(nonce + created + password);
      bytes.position = 0;
      var result:ByteArray = hash.hash(bytes);
      return Base64.encodeByteArray(result);
    }

  }

}

