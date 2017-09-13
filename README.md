Simple test app to demonstrate makeWebRequest() issue with https in SDK 2.3.{1,2,3,4} Mac simulator

Based on the sample code provided by Garmin at
https://developer.garmin.com/downloads/connect-iq/monkey-c/doc/Toybox/Communications.html#makeWebRequest-instance_method

If run under Windows or on a watch this returns a 200 and shows data

If run under Mac it return a 404
It will work on a Mac via http:
- Change the URL in GarminWebRequestTestApp.mc from https to http
- Run in simulator, it will fail with -1001 (SECURE_CONNECTION_REQUIRED)
- In simulator toggle Settings > Use Device HTTPS Requirements
- In simulator select File > Reset App Settings
The app will request again via http and report a 200 success

No (c) or anything else asserted, other than a slightly bewildered wondering if anyone actually develops for Garmin on
non Windows platforms

David Brownlee abs@absd.org