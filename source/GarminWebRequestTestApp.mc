/*
 * Simple test app to demonstrate makeWebRequest() regression in 2.3.X SDK *nix simulator
 *
 * Based on the sample code provided by Garmin at
 * https://developer.garmin.com/downloads/connect-iq/monkey-c/doc/Toybox/Communications.html#makeWebRequest-instance_method
 * with the typo fixed (method named onReceieve but called as onReceive), and the stray ; which broke compilation removed
 *
 * If run under Windows or on a watch this returns a 302 from the request
 * If run under Mac/Linux on SDK 2.2.{1,2,3,4,5,6} it also returns 302
 * If run under Mac/Linux on SDL 2.3.{1,2,3,4} it, or in fact any makeWebRequest() returns 404
 *
 * No (c) or anything else asserted, other than a slightly bewildered wondering if anyone actually develops for Garmin on
 * non Windows platforms
 *
 * David Brownlee abs@absd.org
 */
using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System;
using Toybox.Communications;

const URL = "https://www.garmin.com";

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

       var params = {                                              // set the parameters
              "definedParams" => "123456789abcdefg"
       };

       var options = {                                             // set the options
           :method => Communications.HTTP_REQUEST_METHOD_GET,      // set HTTP method
           :headers => {                                           // set headers
                   "Content-Type" => Communications.REQUEST_CONTENT_TYPE_URL_ENCODED},
                                                                   // set response type
           :responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_URL_ENCODED
       };

       var responseCallback = method(:onReceive);                  // set responseCallback to
                                                                   // onReceive() method
       // Make the Communications.makeWebRequest() call
       Communications.makeWebRequest(URL, params, options, method(:onReceive));
  }

}
