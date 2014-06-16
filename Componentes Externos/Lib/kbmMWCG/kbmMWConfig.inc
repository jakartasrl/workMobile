// This is the standard kbmMW CodeGear Edition configuration file.
// ***************************************************************

{$DEFINE KBMMW_CODEGEAR_EDITION}

// ===========================================================================
// Transport support.
// ===========================================================================
{$DEFINE KBMMW_LOCALTRANSPORT_SUPPORT}             // Client/Server in one app.
{$DEFINE KBMMW_INDYTCPIPTRANSPORT_SUPPORT}         // Indy TCPIP support.
{$DEFINE KBMMW_ISAPITRANSPORT_SUPPORT}             // ISAPI support.

// -------------------------------------------------------------------
// Specific settings for Indy TCPIP transport stream.
// -------------------------------------------------------------------
{$DEFINE KBMMW_USING_INDY_10}

// ===========================================================================
// Transport stream support.
// ===========================================================================
{$DEFINE KBMMW_HTTP_TRANSPORTSTREAM_SUPPORT}           // HTTP Tunneling transport stream format.
{$DEFINE KBMMW_XML_TRANSPORTSTREAM_SUPPORT}            // XML transport stream format.
{$DEFINE KBMMW_SOAP_TRANSPORTSTREAM_SUPPORT}           // SOAP transport stream format.

// ===========================================================================
// Database adapters.
// ===========================================================================
{$DEFINE KBMMW_BDE_SUPPORT}               // BDE Support.
{$DEFINE KBMMW_IBX5_SUPPORT}              // Interbase Express 5 support.
{$DEFINE KBMMW_MT_SUPPORT}                // kbmMemTable backend support.
{$DEFINE KBMMW_SQLITE_SUPPORT}            // SQLite support.
{$DEFINE KBMMW_MD_SUPPORT}                // kbmMW Memory Dataset support.
