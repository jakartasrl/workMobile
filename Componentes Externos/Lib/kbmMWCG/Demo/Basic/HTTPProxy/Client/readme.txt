kbmMW HTTP Proxy client demo
-----------------------------

This project contains a demo client which is using a traditional
request/response transport to access an application server.

The transport is configured to use and understand HTTP v1.1 streams in 
the communication with the application server. 
Thus the client can be setup to use a HTTP proxy server (web proxy)
as an intermediate in reaching the application server.
This allows for having application servers running which do not
require special ports opened in a corporate firewall, aslong
the company have an internal web proxy server running.

kbmMW's HTTP streamformat support basic authentication if the 
HTTP proxy server should required that.




