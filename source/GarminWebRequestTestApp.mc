/*
 * Simple test app to demonstrate makeWebRequest() issue with https in SDK 2.3.{1,2,3,4} Mac simulator
 * See README.md
 */
using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System;
using Toybox.Communications;

const URL = "https://jsonplaceholder.typicode.com/posts/1";

class GarminWebRequestTestApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
        makeRequest();
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new GarminWebRequestTestView("Starting " + URL) ];
    }


   // set up the response callback function
   function onReceive(responseCode, data) {
       Ui.switchToView(new GarminWebRequestTestView("onReceive: " + URL + "\n" + responseCode + " " + data), null, Ui.SLIDE_IMMEDIATE);
   }

   function makeRequest() {
       var url = URL;
       var params = null;
       var options = {
         :method => Communications.HTTP_REQUEST_METHOD_GET,
         :responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
       };
       var responseCallback = method(:onReceive);

       Communications.makeWebRequest(url, params, options, method(:onReceive));
  }

}
