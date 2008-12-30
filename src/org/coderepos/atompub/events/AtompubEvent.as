/*
Copyright (c) Lyo Kato, <lyo.kato _at_ gmail.com>

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION 
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION 
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
*/

package org.coderepos.atompub.events {
  
  import flash.events.Event;

  /**
   * Class represents event that is dispatched around process on Atompub.
   */
  public class AtompubEvent extends Event {

    /**
     * Event type that is for an event dispatched when client gets service document
     */
    public static const GET_SERVICE_COMPLETED :String = "getServiceCompleted";
    /**
     * Event type that is for an event dispatched when client fails to get service document
     */
    public static const GET_SERVICE_FAILED :String = "getServiceFailed";
    /**
     * Event type that is for an event dispatched when client gets categories document
     */
    public static const GET_CATEGORIES_COMPLETED :String = "getCategoriesCompleted";
    /**
     * Event type that is for an event dispatched when client fails to categories document
     */
    public static const GET_CATEGORIES_FAILED :String = "getCategoriesFailed";
    /**
     * Event type that is for an event dispatched when client gets feed
     */
    public static const GET_FEED_COMPLETED :String = "getFeedCompleted";
    /**
     * Event type that is for an event dispatched when client fails to get feed
     */
    public static const GET_FEED_FAILED :String = "getFeedFailed";
    /**
     * Event type that is for an event dispatched when client gets entry
     */
    public static const GET_ENTRY_COMPLETED :String = "getEntryCompleted";
    /**
     * Event type that is for an event dispatched when client fails to get entry
     */
    public static const GET_ENTRY_FAILED :String = "getEntryFailed";
    /**
     * Event type that is for an event dispatched when client creates entry
     */
    public static const CREATE_ENTRY_COMPLETED :String = "createEntryCompleted";
    /**
     * Event type that is for an event dispatched when client fails to create entry
     */
    public static const CREATE_ENTRY_FAILED :String = "createEntryFailed";
    /**
     * Event type that is for an event dispatched when client updates entry
     */
    public static const UPDATE_ENTRY_COMPLETED :String = "updateEntryCompleted";
    /**
     * Event type that is for an event dispatched when client fails to update entry
     */
    public static const UPDATE_ENTRY_FAILED :String = "updateEntryFailed";
    /**
     * Event type that is for an event dispatched when client deletes entry
     */
    public static const DELETE_ENTRY_COMPLETED :String = "deleteEntryCompleted";
    /**
     * Event type that is for an event dispatched when client fails to delete entry
     */
    public static const DELETE_ENTRY_FAILED :String = "deleteEntryFailed";
    /**
     * Event type that is for an event dispatched when client gets media
     */
    public static const GET_MEDIA_COMPLETED :String = "getMediaCompleted";
    /**
     * Event type that is for an event dispatched when client fails to get media
     */
    public static const GET_MEDIA_FAILED :String = "getMediaFailed";
    /**
     * Event type that is for an event dispatched when client creates media
     */
    public static const CREATE_MEDIA_COMPLETED :String = "createMediaCompleted";
    /**
     * Event type that is for an event dispatched when client fails to create media
     */
    public static const CREATE_MEDIA_FAILED :String = "createMediaFailed";
    /**
     * Event type that is for an event dispatched when client updates media
     */
    public static const UPDATE_MEDIA_COMPLETED :String = "updateMediaCompleted";
    /**
     * Event type that is for an event dispatched when client fails to update media
     */
    public static const UPDATE_MEDIA_FAILED :String = "updateMediaFailed";
    /**
     * Event type that is for an event dispatched when client deletes media
     */
    public static const DELETE_MEDIA_COMPLETED :String = "deleteMediaCompleted";
    /**
     * Event type that is for an event dispatched when client fails to delete media
     */
    public static const DELETE_MEDIA_FAILED :String = "deleteMediaFailed";
    /**
     * timeout
     */
    public static const TIMEOUT :String = "timeout";

    private var _result:AtompubEventResult;

    /**
     * Constructor
     *
     * @param type event-type
     * @param result AtompubEventResult object
     * @param bubbles use bubbling
     * @param cancelable use cancel
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function AtompubEvent(type:String, result:AtompubEventResult=null, bubbles:Boolean=false, cancelable:Boolean=false) {
      super(type, bubbles, cancelable);
      _result = result;
    }

    /**
     * Returns the result object that is made by dispatcher
     *
     * @return result object
     * @langversion ActionScript 3.0
     * @playerversion 9.0
     */
    public function get result():AtompubEventResult {
      return _result;
    }

  }

}
