Simple test app to demonstrate makeWebRequest() regression in 2.3.X SDK *nix simulator

Based on the sample code provided by Garmin at
https://developer.garmin.com/downloads/connect-iq/monkey-c/doc/Toybox/Communications.html#makeWebRequest-instance_method
with the typo fixed (method named onReceieve but called as onReceive), and the stray ; which broke compilation removed

If run under Windows or on a watch this returns a 302 from the request
If run under Mac/Linux on SDK 2.2.{1,2,3,4,5,6} it also returns 302
If run under Mac/Linux on SDL 2.3.{1,2,3,4} it, or in fact any makeWebRequest() returns 404

No (c) or anything else asserted, other than a slightly bewildered wondering if anyone actually develops for Garmin on
non Windows platforms

David Brownlee abs@absd.org