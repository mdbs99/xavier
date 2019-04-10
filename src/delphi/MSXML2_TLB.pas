unit MSXML2_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 10/04/2019 17:46:26 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Windows\SysWOW64\msxml6.dll (1)
// LIBID: {F5078F18-C551-11D3-89B9-0000F81FE221}
// LCID: 0
// Helpfile: 
// HelpString: Microsoft XML, v6.0
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// Errors:
//   Hint: Parameter 'type' of IXMLDOMNode.nodeType changed to 'type_'
//   Hint: Member 'implementation' of 'IXMLDOMDocument' changed to 'implementation_'
//   Hint: Parameter 'type' of IXMLDOMDocument.createNode changed to 'type_'
//   Hint: Symbol 'type' renamed to 'type_'
//   Hint: Parameter 'type' of ISchemaElement.type changed to 'type_'
//   Hint: Symbol 'type' renamed to 'type_'
//   Hint: Parameter 'type' of ISchemaAttribute.type changed to 'type_'
//   Hint: Parameter 'var' of IXMLDOMSchemaCollection.add changed to 'var_'
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  MSXML2MajorVersion = 6;
  MSXML2MinorVersion = 0;

  LIBID_MSXML2: TGUID = '{F5078F18-C551-11D3-89B9-0000F81FE221}';

  IID_IXMLDOMNode: TGUID = '{2933BF80-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMNodeList: TGUID = '{2933BF82-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMNamedNodeMap: TGUID = '{2933BF83-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMDocument: TGUID = '{2933BF81-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMDocumentType: TGUID = '{2933BF8B-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMImplementation: TGUID = '{2933BF8F-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMElement: TGUID = '{2933BF86-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMAttribute: TGUID = '{2933BF85-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMDocumentFragment: TGUID = '{3EFAA413-272F-11D2-836F-0000F87A7782}';
  IID_IXMLDOMCharacterData: TGUID = '{2933BF84-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMText: TGUID = '{2933BF87-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMComment: TGUID = '{2933BF88-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMCDATASection: TGUID = '{2933BF8A-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMProcessingInstruction: TGUID = '{2933BF89-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMEntityReference: TGUID = '{2933BF8E-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMParseError: TGUID = '{3EFAA426-272F-11D2-836F-0000F87A7782}';
  IID_IXMLDOMNotation: TGUID = '{2933BF8C-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMEntity: TGUID = '{2933BF8D-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMParseError2: TGUID = '{3EFAA428-272F-11D2-836F-0000F87A7782}';
  IID_IXMLDOMParseErrorCollection: TGUID = '{3EFAA429-272F-11D2-836F-0000F87A7782}';
  IID_IXTLRuntime: TGUID = '{3EFAA425-272F-11D2-836F-0000F87A7782}';
  IID_ISAXXMLReader: TGUID = '{A4F96ED0-F829-476E-81C0-CDC7BD2A0802}';
  IID_ISAXEntityResolver: TGUID = '{99BCA7BD-E8C4-4D5F-A0CF-6D907901FF07}';
  IID_ISAXContentHandler: TGUID = '{1545CDFA-9E4E-4497-A8A4-2BF7D0112C44}';
  IID_ISAXLocator: TGUID = '{9B7E472A-0DE4-4640-BFF3-84D38A051C31}';
  IID_ISAXAttributes: TGUID = '{F078ABE1-45D2-4832-91EA-4466CE2F25C9}';
  IID_ISAXDTDHandler: TGUID = '{E15C1BAF-AFB3-4D60-8C36-19A8C45DEFED}';
  IID_ISAXErrorHandler: TGUID = '{A60511C4-CCF5-479E-98A3-DC8DC545B7D0}';
  IID_ISAXXMLFilter: TGUID = '{70409222-CA09-4475-ACB8-40312FE8D145}';
  IID_IVBSAXXMLFilter: TGUID = '{1299EB1B-5B88-433E-82DE-82CA75AD4E04}';
  IID_IVBSAXXMLReader: TGUID = '{8C033CAA-6CD6-4F73-B728-4531AF74945F}';
  IID_IVBSAXEntityResolver: TGUID = '{0C05D096-F45B-4ACA-AD1A-AA0BC25518DC}';
  IID_IVBSAXContentHandler: TGUID = '{2ED7290A-4DD5-4B46-BB26-4E4155E77FAA}';
  IID_IVBSAXLocator: TGUID = '{796E7AC5-5AA2-4EFF-ACAD-3FAAF01A3288}';
  IID_IVBSAXAttributes: TGUID = '{10DC0586-132B-4CAC-8BB3-DB00AC8B7EE0}';
  IID_IVBSAXDTDHandler: TGUID = '{24FB3297-302D-4620-BA39-3A732D850558}';
  IID_IVBSAXErrorHandler: TGUID = '{D963D3FE-173C-4862-9095-B92F66995F52}';
  IID_IMXReaderControl: TGUID = '{808F4E35-8D5A-4FBE-8466-33A41279ED30}';
  IID_IMXSchemaDeclHandler: TGUID = '{FA4BB38C-FAF9-4CCA-9302-D1DD0FE520DB}';
  IID_ISchemaItem: TGUID = '{50EA08B3-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaParticle: TGUID = '{50EA08B5-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaElement: TGUID = '{50EA08B7-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchema: TGUID = '{50EA08B4-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaItemCollection: TGUID = '{50EA08B2-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaStringCollection: TGUID = '{50EA08B1-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaType: TGUID = '{50EA08B8-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaComplexType: TGUID = '{50EA08B9-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaAny: TGUID = '{50EA08BC-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaModelGroup: TGUID = '{50EA08BB-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_IMXXMLFilter: TGUID = '{C90352F7-643C-4FBC-BB23-E996EB2D51FD}';
  IID_ISchemaAttribute: TGUID = '{50EA08B6-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaAttributeGroup: TGUID = '{50EA08BA-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaIdentityConstraint: TGUID = '{50EA08BD-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaNotation: TGUID = '{50EA08BE-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_IXMLDOMSelection: TGUID = '{AA634FC7-5888-44A7-A257-3A47150D3A0E}';
  DIID_XMLDOMDocumentEvents: TGUID = '{3EFAA427-272F-11D2-836F-0000F87A7782}';
  IID_IXMLDOMDocument2: TGUID = '{2933BF95-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMDocument3: TGUID = '{2933BF96-7B36-11D2-B20E-00C04F983E60}';
  CLASS_DOMDocument60: TGUID = '{88D96A05-F192-11D4-A65F-0040963251E5}';
  IID_IXMLDOMSchemaCollection: TGUID = '{373984C8-B845-449B-91E7-45AC83036ADE}';
  CLASS_FreeThreadedDOMDocument60: TGUID = '{88D96A06-F192-11D4-A65F-0040963251E5}';
  IID_IXMLDOMSchemaCollection2: TGUID = '{50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}';
  CLASS_XMLSchemaCache60: TGUID = '{88D96A07-F192-11D4-A65F-0040963251E5}';
  IID_IXSLTemplate: TGUID = '{2933BF93-7B36-11D2-B20E-00C04F983E60}';
  CLASS_XSLTemplate60: TGUID = '{88D96A08-F192-11D4-A65F-0040963251E5}';
  IID_IXSLProcessor: TGUID = '{2933BF92-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLHTTPRequest: TGUID = '{ED8C108D-4349-11D2-91A4-00C04F7969E8}';
  CLASS_XMLHTTP60: TGUID = '{88D96A0A-F192-11D4-A65F-0040963251E5}';
  IID_IXMLHTTPRequest2: TGUID = '{E5D37DC0-552A-4D52-9CC0-A14D546FBD04}';
  CLASS_FreeThreadedXMLHTTP60: TGUID = '{88D96A09-F192-11D4-A65F-0040963251E5}';
  IID_IXMLHTTPRequest2Callback: TGUID = '{A44A9299-E321-40DE-8866-341B41669162}';
  IID_ISequentialStream: TGUID = '{0C733A30-2A1C-11CE-ADE5-00AA0044773D}';
  IID_IServerXMLHTTPRequest: TGUID = '{2E9196BF-13BA-4DD4-91CA-6C571F281495}';
  IID_IServerXMLHTTPRequest2: TGUID = '{2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}';
  CLASS_ServerXMLHTTP60: TGUID = '{88D96A0B-F192-11D4-A65F-0040963251E5}';
  CLASS_SAXXMLReader60: TGUID = '{88D96A0C-F192-11D4-A65F-0040963251E5}';
  IID_IMXWriter: TGUID = '{4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}';
  IID_ISAXDeclHandler: TGUID = '{862629AC-771A-47B2-8337-4E6843C1BE90}';
  IID_ISAXLexicalHandler: TGUID = '{7F85D5F5-47A8-4497-BDA5-84BA04819EA6}';
  IID_IVBSAXDeclHandler: TGUID = '{E8917260-7579-4BE1-B5DD-7AFBFA6F077B}';
  IID_IVBSAXLexicalHandler: TGUID = '{032AAC35-8C0E-4D9D-979F-E3B702935576}';
  CLASS_MXXMLWriter60: TGUID = '{88D96A0F-F192-11D4-A65F-0040963251E5}';
  CLASS_MXHTMLWriter60: TGUID = '{88D96A10-F192-11D4-A65F-0040963251E5}';
  IID_IMXAttributes: TGUID = '{F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}';
  CLASS_SAXAttributes60: TGUID = '{88D96A0E-F192-11D4-A65F-0040963251E5}';
  IID_IVBMXNamespaceManager: TGUID = '{C90352F5-643C-4FBC-BB23-E996EB2D51FD}';
  IID_IMXNamespaceManager: TGUID = '{C90352F6-643C-4FBC-BB23-E996EB2D51FD}';
  IID_IMXNamespacePrefixes: TGUID = '{C90352F4-643C-4FBC-BB23-E996EB2D51FD}';
  CLASS_MXNamespaceManager60: TGUID = '{88D96A11-F192-11D4-A65F-0040963251E5}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum tagDOMNodeType
type
  tagDOMNodeType = TOleEnum;
const
  NODE_INVALID = $00000000;
  NODE_ELEMENT = $00000001;
  NODE_ATTRIBUTE = $00000002;
  NODE_TEXT = $00000003;
  NODE_CDATA_SECTION = $00000004;
  NODE_ENTITY_REFERENCE = $00000005;
  NODE_ENTITY = $00000006;
  NODE_PROCESSING_INSTRUCTION = $00000007;
  NODE_COMMENT = $00000008;
  NODE_DOCUMENT = $00000009;
  NODE_DOCUMENT_TYPE = $0000000A;
  NODE_DOCUMENT_FRAGMENT = $0000000B;
  NODE_NOTATION = $0000000C;

// Constants for enum _SOMITEMTYPE
type
  _SOMITEMTYPE = TOleEnum;
const
  SOMITEM_SCHEMA = $00001000;
  SOMITEM_ATTRIBUTE = $00001001;
  SOMITEM_ATTRIBUTEGROUP = $00001002;
  SOMITEM_NOTATION = $00001003;
  SOMITEM_ANNOTATION = $00001004;
  SOMITEM_IDENTITYCONSTRAINT = $00001100;
  SOMITEM_KEY = $00001101;
  SOMITEM_KEYREF = $00001102;
  SOMITEM_UNIQUE = $00001103;
  SOMITEM_ANYTYPE = $00002000;
  SOMITEM_DATATYPE = $00002100;
  SOMITEM_DATATYPE_ANYTYPE = $00002101;
  SOMITEM_DATATYPE_ANYURI = $00002102;
  SOMITEM_DATATYPE_BASE64BINARY = $00002103;
  SOMITEM_DATATYPE_BOOLEAN = $00002104;
  SOMITEM_DATATYPE_BYTE = $00002105;
  SOMITEM_DATATYPE_DATE = $00002106;
  SOMITEM_DATATYPE_DATETIME = $00002107;
  SOMITEM_DATATYPE_DAY = $00002108;
  SOMITEM_DATATYPE_DECIMAL = $00002109;
  SOMITEM_DATATYPE_DOUBLE = $0000210A;
  SOMITEM_DATATYPE_DURATION = $0000210B;
  SOMITEM_DATATYPE_ENTITIES = $0000210C;
  SOMITEM_DATATYPE_ENTITY = $0000210D;
  SOMITEM_DATATYPE_FLOAT = $0000210E;
  SOMITEM_DATATYPE_HEXBINARY = $0000210F;
  SOMITEM_DATATYPE_ID = $00002110;
  SOMITEM_DATATYPE_IDREF = $00002111;
  SOMITEM_DATATYPE_IDREFS = $00002112;
  SOMITEM_DATATYPE_INT = $00002113;
  SOMITEM_DATATYPE_INTEGER = $00002114;
  SOMITEM_DATATYPE_LANGUAGE = $00002115;
  SOMITEM_DATATYPE_LONG = $00002116;
  SOMITEM_DATATYPE_MONTH = $00002117;
  SOMITEM_DATATYPE_MONTHDAY = $00002118;
  SOMITEM_DATATYPE_NAME = $00002119;
  SOMITEM_DATATYPE_NCNAME = $0000211A;
  SOMITEM_DATATYPE_NEGATIVEINTEGER = $0000211B;
  SOMITEM_DATATYPE_NMTOKEN = $0000211C;
  SOMITEM_DATATYPE_NMTOKENS = $0000211D;
  SOMITEM_DATATYPE_NONNEGATIVEINTEGER = $0000211E;
  SOMITEM_DATATYPE_NONPOSITIVEINTEGER = $0000211F;
  SOMITEM_DATATYPE_NORMALIZEDSTRING = $00002120;
  SOMITEM_DATATYPE_NOTATION = $00002121;
  SOMITEM_DATATYPE_POSITIVEINTEGER = $00002122;
  SOMITEM_DATATYPE_QNAME = $00002123;
  SOMITEM_DATATYPE_SHORT = $00002124;
  SOMITEM_DATATYPE_STRING = $00002125;
  SOMITEM_DATATYPE_TIME = $00002126;
  SOMITEM_DATATYPE_TOKEN = $00002127;
  SOMITEM_DATATYPE_UNSIGNEDBYTE = $00002128;
  SOMITEM_DATATYPE_UNSIGNEDINT = $00002129;
  SOMITEM_DATATYPE_UNSIGNEDLONG = $0000212A;
  SOMITEM_DATATYPE_UNSIGNEDSHORT = $0000212B;
  SOMITEM_DATATYPE_YEAR = $0000212C;
  SOMITEM_DATATYPE_YEARMONTH = $0000212D;
  SOMITEM_DATATYPE_ANYSIMPLETYPE = $000021FF;
  SOMITEM_SIMPLETYPE = $00002200;
  SOMITEM_COMPLEXTYPE = $00002400;
  SOMITEM_PARTICLE = $00004000;
  SOMITEM_ANY = $00004001;
  SOMITEM_ANYATTRIBUTE = $00004002;
  SOMITEM_ELEMENT = $00004003;
  SOMITEM_GROUP = $00004100;
  SOMITEM_ALL = $00004101;
  SOMITEM_CHOICE = $00004102;
  SOMITEM_SEQUENCE = $00004103;
  SOMITEM_EMPTYPARTICLE = $00004104;
  SOMITEM_NULL = $00000800;
  SOMITEM_NULL_TYPE = $00002800;
  SOMITEM_NULL_ANY = $00004801;
  SOMITEM_NULL_ANYATTRIBUTE = $00004802;
  SOMITEM_NULL_ELEMENT = $00004803;

// Constants for enum _SCHEMADERIVATIONMETHOD
type
  _SCHEMADERIVATIONMETHOD = TOleEnum;
const
  SCHEMADERIVATIONMETHOD_EMPTY = $00000000;
  SCHEMADERIVATIONMETHOD_SUBSTITUTION = $00000001;
  SCHEMADERIVATIONMETHOD_EXTENSION = $00000002;
  SCHEMADERIVATIONMETHOD_RESTRICTION = $00000004;
  SCHEMADERIVATIONMETHOD_LIST = $00000008;
  SCHEMADERIVATIONMETHOD_UNION = $00000010;
  SCHEMADERIVATIONMETHOD_ALL = $000000FF;
  SCHEMADERIVATIONMETHOD_NONE = $00000100;

// Constants for enum _SCHEMATYPEVARIETY
type
  _SCHEMATYPEVARIETY = TOleEnum;
const
  SCHEMATYPEVARIETY_NONE = $FFFFFFFF;
  SCHEMATYPEVARIETY_ATOMIC = $00000000;
  SCHEMATYPEVARIETY_LIST = $00000001;
  SCHEMATYPEVARIETY_UNION = $00000002;

// Constants for enum _SCHEMAWHITESPACE
type
  _SCHEMAWHITESPACE = TOleEnum;
const
  SCHEMAWHITESPACE_NONE = $FFFFFFFF;
  SCHEMAWHITESPACE_PRESERVE = $00000000;
  SCHEMAWHITESPACE_REPLACE = $00000001;
  SCHEMAWHITESPACE_COLLAPSE = $00000002;

// Constants for enum _SCHEMAPROCESSCONTENTS
type
  _SCHEMAPROCESSCONTENTS = TOleEnum;
const
  SCHEMAPROCESSCONTENTS_NONE = $00000000;
  SCHEMAPROCESSCONTENTS_SKIP = $00000001;
  SCHEMAPROCESSCONTENTS_LAX = $00000002;
  SCHEMAPROCESSCONTENTS_STRICT = $00000003;

// Constants for enum _SCHEMACONTENTTYPE
type
  _SCHEMACONTENTTYPE = TOleEnum;
const
  SCHEMACONTENTTYPE_EMPTY = $00000000;
  SCHEMACONTENTTYPE_TEXTONLY = $00000001;
  SCHEMACONTENTTYPE_ELEMENTONLY = $00000002;
  SCHEMACONTENTTYPE_MIXED = $00000003;

// Constants for enum _SCHEMAUSE
type
  _SCHEMAUSE = TOleEnum;
const
  SCHEMAUSE_OPTIONAL = $00000000;
  SCHEMAUSE_PROHIBITED = $00000001;
  SCHEMAUSE_REQUIRED = $00000002;

// Constants for enum _SERVERXMLHTTP_OPTION
type
  _SERVERXMLHTTP_OPTION = TOleEnum;
const
  SXH_OPTION_URL = $FFFFFFFF;
  SXH_OPTION_URL_CODEPAGE = $00000000;
  SXH_OPTION_ESCAPE_PERCENT_IN_URL = $00000001;
  SXH_OPTION_IGNORE_SERVER_SSL_CERT_ERROR_FLAGS = $00000002;
  SXH_OPTION_SELECT_CLIENT_SSL_CERT = $00000003;

// Constants for enum _SXH_SERVER_CERT_OPTION
type
  _SXH_SERVER_CERT_OPTION = TOleEnum;
const
  SXH_SERVER_CERT_IGNORE_UNKNOWN_CA = $00000100;
  SXH_SERVER_CERT_IGNORE_WRONG_USAGE = $00000200;
  SXH_SERVER_CERT_IGNORE_CERT_CN_INVALID = $00001000;
  SXH_SERVER_CERT_IGNORE_CERT_DATE_INVALID = $00002000;
  SXH_SERVER_CERT_IGNORE_ALL_SERVER_ERRORS = $00003300;

// Constants for enum _SXH_PROXY_SETTING
type
  _SXH_PROXY_SETTING = TOleEnum;
const
  SXH_PROXY_SET_DEFAULT = $00000000;
  SXH_PROXY_SET_PRECONFIG = $00000000;
  SXH_PROXY_SET_DIRECT = $00000001;
  SXH_PROXY_SET_PROXY = $00000002;

// Constants for enum _XHR_PROPERTY
type
  _XHR_PROPERTY = TOleEnum;
const
  XHR_PROP_NO_CRED_PROMPT = $00000000;
  XHR_PROP_NO_AUTH = $00000001;
  XHR_PROP_TIMEOUT = $00000002;
  XHR_PROP_NO_DEFAULT_HEADERS = $00000003;
  XHR_PROP_REPORT_REDIRECT_STATUS = $00000004;
  XHR_PROP_NO_CACHE = $00000005;
  XHR_PROP_EXTENDED_ERROR = $00000006;
  XHR_PROP_QUERY_STRING_UTF8 = $00000007;
  XHR_PROP_IGNORE_CERT_ERRORS = $00000008;
  XHR_PROP_ONDATA_THRESHOLD = $00000009;
  XHR_PROP_SET_ENTERPRISEID = $0000000A;
  XHR_PROP_MAX_CONNECTIONS = $0000000B;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IXMLDOMNode = interface;
  IXMLDOMNodeDisp = dispinterface;
  IXMLDOMNodeList = interface;
  IXMLDOMNodeListDisp = dispinterface;
  IXMLDOMNamedNodeMap = interface;
  IXMLDOMNamedNodeMapDisp = dispinterface;
  IXMLDOMDocument = interface;
  IXMLDOMDocumentDisp = dispinterface;
  IXMLDOMDocumentType = interface;
  IXMLDOMDocumentTypeDisp = dispinterface;
  IXMLDOMImplementation = interface;
  IXMLDOMImplementationDisp = dispinterface;
  IXMLDOMElement = interface;
  IXMLDOMElementDisp = dispinterface;
  IXMLDOMAttribute = interface;
  IXMLDOMAttributeDisp = dispinterface;
  IXMLDOMDocumentFragment = interface;
  IXMLDOMDocumentFragmentDisp = dispinterface;
  IXMLDOMCharacterData = interface;
  IXMLDOMCharacterDataDisp = dispinterface;
  IXMLDOMText = interface;
  IXMLDOMTextDisp = dispinterface;
  IXMLDOMComment = interface;
  IXMLDOMCommentDisp = dispinterface;
  IXMLDOMCDATASection = interface;
  IXMLDOMCDATASectionDisp = dispinterface;
  IXMLDOMProcessingInstruction = interface;
  IXMLDOMProcessingInstructionDisp = dispinterface;
  IXMLDOMEntityReference = interface;
  IXMLDOMEntityReferenceDisp = dispinterface;
  IXMLDOMParseError = interface;
  IXMLDOMParseErrorDisp = dispinterface;
  IXMLDOMNotation = interface;
  IXMLDOMNotationDisp = dispinterface;
  IXMLDOMEntity = interface;
  IXMLDOMEntityDisp = dispinterface;
  IXMLDOMParseError2 = interface;
  IXMLDOMParseError2Disp = dispinterface;
  IXMLDOMParseErrorCollection = interface;
  IXMLDOMParseErrorCollectionDisp = dispinterface;
  IXTLRuntime = interface;
  IXTLRuntimeDisp = dispinterface;
  ISAXXMLReader = interface;
  ISAXEntityResolver = interface;
  ISAXContentHandler = interface;
  ISAXLocator = interface;
  ISAXAttributes = interface;
  ISAXDTDHandler = interface;
  ISAXErrorHandler = interface;
  ISAXXMLFilter = interface;
  IVBSAXXMLFilter = interface;
  IVBSAXXMLFilterDisp = dispinterface;
  IVBSAXXMLReader = interface;
  IVBSAXXMLReaderDisp = dispinterface;
  IVBSAXEntityResolver = interface;
  IVBSAXEntityResolverDisp = dispinterface;
  IVBSAXContentHandler = interface;
  IVBSAXContentHandlerDisp = dispinterface;
  IVBSAXLocator = interface;
  IVBSAXLocatorDisp = dispinterface;
  IVBSAXAttributes = interface;
  IVBSAXAttributesDisp = dispinterface;
  IVBSAXDTDHandler = interface;
  IVBSAXDTDHandlerDisp = dispinterface;
  IVBSAXErrorHandler = interface;
  IVBSAXErrorHandlerDisp = dispinterface;
  IMXReaderControl = interface;
  IMXReaderControlDisp = dispinterface;
  IMXSchemaDeclHandler = interface;
  IMXSchemaDeclHandlerDisp = dispinterface;
  ISchemaItem = interface;
  ISchemaItemDisp = dispinterface;
  ISchemaParticle = interface;
  ISchemaParticleDisp = dispinterface;
  ISchemaElement = interface;
  ISchemaElementDisp = dispinterface;
  ISchema = interface;
  ISchemaDisp = dispinterface;
  ISchemaItemCollection = interface;
  ISchemaItemCollectionDisp = dispinterface;
  ISchemaStringCollection = interface;
  ISchemaStringCollectionDisp = dispinterface;
  ISchemaType = interface;
  ISchemaTypeDisp = dispinterface;
  ISchemaComplexType = interface;
  ISchemaComplexTypeDisp = dispinterface;
  ISchemaAny = interface;
  ISchemaAnyDisp = dispinterface;
  ISchemaModelGroup = interface;
  ISchemaModelGroupDisp = dispinterface;
  IMXXMLFilter = interface;
  IMXXMLFilterDisp = dispinterface;
  ISchemaAttribute = interface;
  ISchemaAttributeDisp = dispinterface;
  ISchemaAttributeGroup = interface;
  ISchemaAttributeGroupDisp = dispinterface;
  ISchemaIdentityConstraint = interface;
  ISchemaIdentityConstraintDisp = dispinterface;
  ISchemaNotation = interface;
  ISchemaNotationDisp = dispinterface;
  IXMLDOMSelection = interface;
  IXMLDOMSelectionDisp = dispinterface;
  XMLDOMDocumentEvents = dispinterface;
  IXMLDOMDocument2 = interface;
  IXMLDOMDocument2Disp = dispinterface;
  IXMLDOMDocument3 = interface;
  IXMLDOMDocument3Disp = dispinterface;
  IXMLDOMSchemaCollection = interface;
  IXMLDOMSchemaCollectionDisp = dispinterface;
  IXMLDOMSchemaCollection2 = interface;
  IXMLDOMSchemaCollection2Disp = dispinterface;
  IXSLTemplate = interface;
  IXSLTemplateDisp = dispinterface;
  IXSLProcessor = interface;
  IXSLProcessorDisp = dispinterface;
  IXMLHTTPRequest = interface;
  IXMLHTTPRequestDisp = dispinterface;
  IXMLHTTPRequest2 = interface;
  IXMLHTTPRequest2Callback = interface;
  ISequentialStream = interface;
  IServerXMLHTTPRequest = interface;
  IServerXMLHTTPRequestDisp = dispinterface;
  IServerXMLHTTPRequest2 = interface;
  IServerXMLHTTPRequest2Disp = dispinterface;
  IMXWriter = interface;
  IMXWriterDisp = dispinterface;
  ISAXDeclHandler = interface;
  ISAXLexicalHandler = interface;
  IVBSAXDeclHandler = interface;
  IVBSAXDeclHandlerDisp = dispinterface;
  IVBSAXLexicalHandler = interface;
  IVBSAXLexicalHandlerDisp = dispinterface;
  IMXAttributes = interface;
  IMXAttributesDisp = dispinterface;
  IVBMXNamespaceManager = interface;
  IVBMXNamespaceManagerDisp = dispinterface;
  IMXNamespaceManager = interface;
  IMXNamespacePrefixes = interface;
  IMXNamespacePrefixesDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DOMDocument60 = IXMLDOMDocument3;
  FreeThreadedDOMDocument60 = IXMLDOMDocument3;
  XMLSchemaCache60 = IXMLDOMSchemaCollection2;
  XSLTemplate60 = IXSLTemplate;
  XMLHTTP60 = IXMLHTTPRequest;
  FreeThreadedXMLHTTP60 = IXMLHTTPRequest2;
  ServerXMLHTTP60 = IServerXMLHTTPRequest2;
  SAXXMLReader60 = IVBSAXXMLReader;
  MXXMLWriter60 = IMXWriter;
  MXHTMLWriter60 = IMXWriter;
  SAXAttributes60 = IMXAttributes;
  MXNamespaceManager60 = IVBMXNamespaceManager;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PWord1 = ^Word; {*}
  PUserType1 = ^tagXHR_COOKIE; {*}
  PByte1 = ^Byte; {*}

  DOMNodeType = tagDOMNodeType; 
  SOMITEMTYPE = _SOMITEMTYPE; 
  SCHEMADERIVATIONMETHOD = _SCHEMADERIVATIONMETHOD; 
  SCHEMATYPEVARIETY = _SCHEMATYPEVARIETY; 
  SCHEMAWHITESPACE = _SCHEMAWHITESPACE; 
  SCHEMAPROCESSCONTENTS = _SCHEMAPROCESSCONTENTS; 
  SCHEMACONTENTTYPE = _SCHEMACONTENTTYPE; 
  SCHEMAUSE = _SCHEMAUSE; 
  SERVERXMLHTTP_OPTION = _SERVERXMLHTTP_OPTION; 
  SXH_SERVER_CERT_OPTION = _SXH_SERVER_CERT_OPTION; 
  SXH_PROXY_SETTING = _SXH_PROXY_SETTING; 

  __msxml6_ReferenceRemainingTypes__ = packed record
    __tagDomNodeType__: tagDOMNodeType;
    __domNodeType__: DOMNodeType;
    __serverXmlHttpOptionEnum__: _SERVERXMLHTTP_OPTION;
    __serverXmlHttpOption__: SERVERXMLHTTP_OPTION;
    __serverCertOptionEnum__: _SXH_SERVER_CERT_OPTION;
    __serverCertOption__: SXH_SERVER_CERT_OPTION;
    __proxySettingEnum__: _SXH_PROXY_SETTING;
    __proxySetting__: SXH_PROXY_SETTING;
    __somItemTypeEnum__: _SOMITEMTYPE;
    __somItemType__: SOMITEMTYPE;
    __schemaUseEnum__: _SCHEMAUSE;
    __schemaUse__: SCHEMAUSE;
    __schemaDerivationMethodEnum__: _SCHEMADERIVATIONMETHOD;
    __schemaDerivationMethod__: SCHEMADERIVATIONMETHOD;
    __schemaContentTypeEnum__: _SCHEMACONTENTTYPE;
    __schemaContentType__: SCHEMACONTENTTYPE;
    __schemaProcessContentsEnum__: _SCHEMAPROCESSCONTENTS;
    __schemaProcessContents__: SCHEMAPROCESSCONTENTS;
    __schemaWhitespaceEnum__: _SCHEMAWHITESPACE;
    __schemaWhitespace__: SCHEMAWHITESPACE;
    __schemaTypeVarietyEnum__: _SCHEMATYPEVARIETY;
    __schemaTypeVariety__: SCHEMATYPEVARIETY;
  end;

  _FILETIME = packed record
    dwLowDateTime: LongWord;
    dwHighDateTime: LongWord;
  end;

  tagXHR_COOKIE = packed record
    pwszUrl: PWideChar;
    pwszName: PWideChar;
    pwszValue: PWideChar;
    pwszP3PPolicy: PWideChar;
    ftExpires: _FILETIME;
    dwFlags: LongWord;
  end;

  XHR_PROPERTY = _XHR_PROPERTY; 

// *********************************************************************//
// Interface: IXMLDOMNode
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF80-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMNode = interface(IDispatch)
    ['{2933BF80-7B36-11D2-B20E-00C04F983E60}']
    function Get_nodeName: WideString; safecall;
    function Get_nodeValue: OleVariant; safecall;
    procedure Set_nodeValue(value: OleVariant); safecall;
    function Get_nodeType: DOMNodeType; safecall;
    function Get_parentNode: IXMLDOMNode; safecall;
    function Get_childNodes: IXMLDOMNodeList; safecall;
    function Get_firstChild: IXMLDOMNode; safecall;
    function Get_lastChild: IXMLDOMNode; safecall;
    function Get_previousSibling: IXMLDOMNode; safecall;
    function Get_nextSibling: IXMLDOMNode; safecall;
    function Get_attributes: IXMLDOMNamedNodeMap; safecall;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; safecall;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; safecall;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; safecall;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; safecall;
    function hasChildNodes: WordBool; safecall;
    function Get_ownerDocument: IXMLDOMDocument; safecall;
    function cloneNode(deep: WordBool): IXMLDOMNode; safecall;
    function Get_nodeTypeString: WideString; safecall;
    function Get_text: WideString; safecall;
    procedure Set_text(const text: WideString); safecall;
    function Get_specified: WordBool; safecall;
    function Get_definition: IXMLDOMNode; safecall;
    function Get_nodeTypedValue: OleVariant; safecall;
    procedure Set_nodeTypedValue(typedValue: OleVariant); safecall;
    function Get_dataType: OleVariant; safecall;
    procedure Set_dataType(const dataTypeName: WideString); safecall;
    function Get_xml: WideString; safecall;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; safecall;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; safecall;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; safecall;
    function Get_parsed: WordBool; safecall;
    function Get_namespaceURI: WideString; safecall;
    function Get_prefix: WideString; safecall;
    function Get_baseName: WideString; safecall;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); safecall;
    property nodeName: WideString read Get_nodeName;
    property nodeValue: OleVariant read Get_nodeValue write Set_nodeValue;
    property nodeType: DOMNodeType read Get_nodeType;
    property parentNode: IXMLDOMNode read Get_parentNode;
    property childNodes: IXMLDOMNodeList read Get_childNodes;
    property firstChild: IXMLDOMNode read Get_firstChild;
    property lastChild: IXMLDOMNode read Get_lastChild;
    property previousSibling: IXMLDOMNode read Get_previousSibling;
    property nextSibling: IXMLDOMNode read Get_nextSibling;
    property attributes: IXMLDOMNamedNodeMap read Get_attributes;
    property ownerDocument: IXMLDOMDocument read Get_ownerDocument;
    property nodeTypeString: WideString read Get_nodeTypeString;
    property text: WideString read Get_text write Set_text;
    property specified: WordBool read Get_specified;
    property definition: IXMLDOMNode read Get_definition;
    property nodeTypedValue: OleVariant read Get_nodeTypedValue write Set_nodeTypedValue;
    property xml: WideString read Get_xml;
    property parsed: WordBool read Get_parsed;
    property namespaceURI: WideString read Get_namespaceURI;
    property prefix: WideString read Get_prefix;
    property baseName: WideString read Get_baseName;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMNodeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF80-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMNodeDisp = dispinterface
    ['{2933BF80-7B36-11D2-B20E-00C04F983E60}']
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    function dataType: OleVariant; dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMNodeList
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF82-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMNodeList = interface(IDispatch)
    ['{2933BF82-7B36-11D2-B20E-00C04F983E60}']
    function Get_item(index: Integer): IXMLDOMNode; safecall;
    function Get_length: Integer; safecall;
    function nextNode: IXMLDOMNode; safecall;
    procedure reset; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: IXMLDOMNode read Get_item; default;
    property length: Integer read Get_length;
    property _newEnum: IUnknown read Get__newEnum;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMNodeListDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF82-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMNodeListDisp = dispinterface
    ['{2933BF82-7B36-11D2-B20E-00C04F983E60}']
    property item[index: Integer]: IXMLDOMNode readonly dispid 0; default;
    property length: Integer readonly dispid 74;
    function nextNode: IXMLDOMNode; dispid 76;
    procedure reset; dispid 77;
    property _newEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IXMLDOMNamedNodeMap
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF83-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMNamedNodeMap = interface(IDispatch)
    ['{2933BF83-7B36-11D2-B20E-00C04F983E60}']
    function getNamedItem(const name: WideString): IXMLDOMNode; safecall;
    function setNamedItem(const newItem: IXMLDOMNode): IXMLDOMNode; safecall;
    function removeNamedItem(const name: WideString): IXMLDOMNode; safecall;
    function Get_item(index: Integer): IXMLDOMNode; safecall;
    function Get_length: Integer; safecall;
    function getQualifiedItem(const baseName: WideString; const namespaceURI: WideString): IXMLDOMNode; safecall;
    function removeQualifiedItem(const baseName: WideString; const namespaceURI: WideString): IXMLDOMNode; safecall;
    function nextNode: IXMLDOMNode; safecall;
    procedure reset; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: IXMLDOMNode read Get_item; default;
    property length: Integer read Get_length;
    property _newEnum: IUnknown read Get__newEnum;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMNamedNodeMapDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF83-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMNamedNodeMapDisp = dispinterface
    ['{2933BF83-7B36-11D2-B20E-00C04F983E60}']
    function getNamedItem(const name: WideString): IXMLDOMNode; dispid 83;
    function setNamedItem(const newItem: IXMLDOMNode): IXMLDOMNode; dispid 84;
    function removeNamedItem(const name: WideString): IXMLDOMNode; dispid 85;
    property item[index: Integer]: IXMLDOMNode readonly dispid 0; default;
    property length: Integer readonly dispid 74;
    function getQualifiedItem(const baseName: WideString; const namespaceURI: WideString): IXMLDOMNode; dispid 87;
    function removeQualifiedItem(const baseName: WideString; const namespaceURI: WideString): IXMLDOMNode; dispid 88;
    function nextNode: IXMLDOMNode; dispid 89;
    procedure reset; dispid 90;
    property _newEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IXMLDOMDocument
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF81-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMDocument = interface(IXMLDOMNode)
    ['{2933BF81-7B36-11D2-B20E-00C04F983E60}']
    function Get_doctype: IXMLDOMDocumentType; safecall;
    function Get_implementation_: IXMLDOMImplementation; safecall;
    function Get_documentElement: IXMLDOMElement; safecall;
    procedure _Set_documentElement(const DOMElement: IXMLDOMElement); safecall;
    function createElement(const tagName: WideString): IXMLDOMElement; safecall;
    function createDocumentFragment: IXMLDOMDocumentFragment; safecall;
    function createTextNode(const data: WideString): IXMLDOMText; safecall;
    function createComment(const data: WideString): IXMLDOMComment; safecall;
    function createCDATASection(const data: WideString): IXMLDOMCDATASection; safecall;
    function createProcessingInstruction(const target: WideString; const data: WideString): IXMLDOMProcessingInstruction; safecall;
    function createAttribute(const name: WideString): IXMLDOMAttribute; safecall;
    function createEntityReference(const name: WideString): IXMLDOMEntityReference; safecall;
    function getElementsByTagName(const tagName: WideString): IXMLDOMNodeList; safecall;
    function createNode(type_: OleVariant; const name: WideString; const namespaceURI: WideString): IXMLDOMNode; safecall;
    function nodeFromID(const idString: WideString): IXMLDOMNode; safecall;
    function load(xmlSource: OleVariant): WordBool; safecall;
    function Get_readyState: Integer; safecall;
    function Get_parseError: IXMLDOMParseError; safecall;
    function Get_url: WideString; safecall;
    function Get_async: WordBool; safecall;
    procedure Set_async(isAsync: WordBool); safecall;
    procedure abort; safecall;
    function loadXML(const bstrXML: WideString): WordBool; safecall;
    procedure save(destination: OleVariant); safecall;
    function Get_validateOnParse: WordBool; safecall;
    procedure Set_validateOnParse(isValidating: WordBool); safecall;
    function Get_resolveExternals: WordBool; safecall;
    procedure Set_resolveExternals(isResolving: WordBool); safecall;
    function Get_preserveWhiteSpace: WordBool; safecall;
    procedure Set_preserveWhiteSpace(isPreserving: WordBool); safecall;
    procedure Set_onreadystatechange(Param1: OleVariant); safecall;
    procedure Set_ondataavailable(Param1: OleVariant); safecall;
    procedure Set_ontransformnode(Param1: OleVariant); safecall;
    property doctype: IXMLDOMDocumentType read Get_doctype;
    property implementation_: IXMLDOMImplementation read Get_implementation_;
    property documentElement: IXMLDOMElement read Get_documentElement write _Set_documentElement;
    property readyState: Integer read Get_readyState;
    property parseError: IXMLDOMParseError read Get_parseError;
    property url: WideString read Get_url;
    property async: WordBool read Get_async write Set_async;
    property validateOnParse: WordBool read Get_validateOnParse write Set_validateOnParse;
    property resolveExternals: WordBool read Get_resolveExternals write Set_resolveExternals;
    property preserveWhiteSpace: WordBool read Get_preserveWhiteSpace write Set_preserveWhiteSpace;
    property onreadystatechange: OleVariant write Set_onreadystatechange;
    property ondataavailable: OleVariant write Set_ondataavailable;
    property ontransformnode: OleVariant write Set_ontransformnode;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMDocumentDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF81-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMDocumentDisp = dispinterface
    ['{2933BF81-7B36-11D2-B20E-00C04F983E60}']
    property doctype: IXMLDOMDocumentType readonly dispid 38;
    property implementation_: IXMLDOMImplementation readonly dispid 39;
    property documentElement: IXMLDOMElement dispid 40;
    function createElement(const tagName: WideString): IXMLDOMElement; dispid 41;
    function createDocumentFragment: IXMLDOMDocumentFragment; dispid 42;
    function createTextNode(const data: WideString): IXMLDOMText; dispid 43;
    function createComment(const data: WideString): IXMLDOMComment; dispid 44;
    function createCDATASection(const data: WideString): IXMLDOMCDATASection; dispid 45;
    function createProcessingInstruction(const target: WideString; const data: WideString): IXMLDOMProcessingInstruction; dispid 46;
    function createAttribute(const name: WideString): IXMLDOMAttribute; dispid 47;
    function createEntityReference(const name: WideString): IXMLDOMEntityReference; dispid 49;
    function getElementsByTagName(const tagName: WideString): IXMLDOMNodeList; dispid 50;
    function createNode(type_: OleVariant; const name: WideString; const namespaceURI: WideString): IXMLDOMNode; dispid 54;
    function nodeFromID(const idString: WideString): IXMLDOMNode; dispid 56;
    function load(xmlSource: OleVariant): WordBool; dispid 58;
    property readyState: Integer readonly dispid -525;
    property parseError: IXMLDOMParseError readonly dispid 59;
    property url: WideString readonly dispid 60;
    property async: WordBool dispid 61;
    procedure abort; dispid 62;
    function loadXML(const bstrXML: WideString): WordBool; dispid 63;
    procedure save(destination: OleVariant); dispid 64;
    property validateOnParse: WordBool dispid 65;
    property resolveExternals: WordBool dispid 66;
    property preserveWhiteSpace: WordBool dispid 67;
    property onreadystatechange: OleVariant writeonly dispid 68;
    property ondataavailable: OleVariant writeonly dispid 69;
    property ontransformnode: OleVariant writeonly dispid 70;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    function dataType: OleVariant; dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMDocumentType
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8B-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMDocumentType = interface(IXMLDOMNode)
    ['{2933BF8B-7B36-11D2-B20E-00C04F983E60}']
    function Get_name: WideString; safecall;
    function Get_entities: IXMLDOMNamedNodeMap; safecall;
    function Get_notations: IXMLDOMNamedNodeMap; safecall;
    property name: WideString read Get_name;
    property entities: IXMLDOMNamedNodeMap read Get_entities;
    property notations: IXMLDOMNamedNodeMap read Get_notations;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMDocumentTypeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8B-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMDocumentTypeDisp = dispinterface
    ['{2933BF8B-7B36-11D2-B20E-00C04F983E60}']
    property name: WideString readonly dispid 131;
    property entities: IXMLDOMNamedNodeMap readonly dispid 132;
    property notations: IXMLDOMNamedNodeMap readonly dispid 133;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    function dataType: OleVariant; dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMImplementation
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8F-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMImplementation = interface(IDispatch)
    ['{2933BF8F-7B36-11D2-B20E-00C04F983E60}']
    function hasFeature(const feature: WideString; const version: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMImplementationDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8F-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMImplementationDisp = dispinterface
    ['{2933BF8F-7B36-11D2-B20E-00C04F983E60}']
    function hasFeature(const feature: WideString; const version: WideString): WordBool; dispid 145;
  end;

// *********************************************************************//
// Interface: IXMLDOMElement
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF86-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMElement = interface(IXMLDOMNode)
    ['{2933BF86-7B36-11D2-B20E-00C04F983E60}']
    function Get_tagName: WideString; safecall;
    function getAttribute(const name: WideString): OleVariant; safecall;
    procedure setAttribute(const name: WideString; value: OleVariant); safecall;
    procedure removeAttribute(const name: WideString); safecall;
    function getAttributeNode(const name: WideString): IXMLDOMAttribute; safecall;
    function setAttributeNode(const DOMAttribute: IXMLDOMAttribute): IXMLDOMAttribute; safecall;
    function removeAttributeNode(const DOMAttribute: IXMLDOMAttribute): IXMLDOMAttribute; safecall;
    function getElementsByTagName(const tagName: WideString): IXMLDOMNodeList; safecall;
    procedure normalize; safecall;
    property tagName: WideString read Get_tagName;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMElementDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF86-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMElementDisp = dispinterface
    ['{2933BF86-7B36-11D2-B20E-00C04F983E60}']
    property tagName: WideString readonly dispid 97;
    function getAttribute(const name: WideString): OleVariant; dispid 99;
    procedure setAttribute(const name: WideString; value: OleVariant); dispid 100;
    procedure removeAttribute(const name: WideString); dispid 101;
    function getAttributeNode(const name: WideString): IXMLDOMAttribute; dispid 102;
    function setAttributeNode(const DOMAttribute: IXMLDOMAttribute): IXMLDOMAttribute; dispid 103;
    function removeAttributeNode(const DOMAttribute: IXMLDOMAttribute): IXMLDOMAttribute; dispid 104;
    function getElementsByTagName(const tagName: WideString): IXMLDOMNodeList; dispid 105;
    procedure normalize; dispid 106;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    function dataType: OleVariant; dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMAttribute
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF85-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMAttribute = interface(IXMLDOMNode)
    ['{2933BF85-7B36-11D2-B20E-00C04F983E60}']
    function Get_name: WideString; safecall;
    function Get_value: OleVariant; safecall;
    procedure Set_value(attributeValue: OleVariant); safecall;
    property name: WideString read Get_name;
    property value: OleVariant read Get_value write Set_value;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMAttributeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF85-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMAttributeDisp = dispinterface
    ['{2933BF85-7B36-11D2-B20E-00C04F983E60}']
    property name: WideString readonly dispid 118;
    property value: OleVariant dispid 120;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    function dataType: OleVariant; dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMDocumentFragment
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA413-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXMLDOMDocumentFragment = interface(IXMLDOMNode)
    ['{3EFAA413-272F-11D2-836F-0000F87A7782}']
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMDocumentFragmentDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA413-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXMLDOMDocumentFragmentDisp = dispinterface
    ['{3EFAA413-272F-11D2-836F-0000F87A7782}']
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    function dataType: OleVariant; dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMCharacterData
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF84-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMCharacterData = interface(IXMLDOMNode)
    ['{2933BF84-7B36-11D2-B20E-00C04F983E60}']
    function Get_data: WideString; safecall;
    procedure Set_data(const data: WideString); safecall;
    function Get_length: Integer; safecall;
    function substringData(offset: Integer; count: Integer): WideString; safecall;
    procedure appendData(const data: WideString); safecall;
    procedure insertData(offset: Integer; const data: WideString); safecall;
    procedure deleteData(offset: Integer; count: Integer); safecall;
    procedure replaceData(offset: Integer; count: Integer; const data: WideString); safecall;
    property data: WideString read Get_data write Set_data;
    property length: Integer read Get_length;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMCharacterDataDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF84-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMCharacterDataDisp = dispinterface
    ['{2933BF84-7B36-11D2-B20E-00C04F983E60}']
    property data: WideString dispid 109;
    property length: Integer readonly dispid 110;
    function substringData(offset: Integer; count: Integer): WideString; dispid 111;
    procedure appendData(const data: WideString); dispid 112;
    procedure insertData(offset: Integer; const data: WideString); dispid 113;
    procedure deleteData(offset: Integer; count: Integer); dispid 114;
    procedure replaceData(offset: Integer; count: Integer; const data: WideString); dispid 115;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    function dataType: OleVariant; dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMText
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF87-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMText = interface(IXMLDOMCharacterData)
    ['{2933BF87-7B36-11D2-B20E-00C04F983E60}']
    function splitText(offset: Integer): IXMLDOMText; safecall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMTextDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF87-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMTextDisp = dispinterface
    ['{2933BF87-7B36-11D2-B20E-00C04F983E60}']
    function splitText(offset: Integer): IXMLDOMText; dispid 123;
    property data: WideString dispid 109;
    property length: Integer readonly dispid 110;
    function substringData(offset: Integer; count: Integer): WideString; dispid 111;
    procedure appendData(const data: WideString); dispid 112;
    procedure insertData(offset: Integer; const data: WideString); dispid 113;
    procedure deleteData(offset: Integer; count: Integer); dispid 114;
    procedure replaceData(offset: Integer; count: Integer; const data: WideString); dispid 115;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    function dataType: OleVariant; dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMComment
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF88-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMComment = interface(IXMLDOMCharacterData)
    ['{2933BF88-7B36-11D2-B20E-00C04F983E60}']
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMCommentDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF88-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMCommentDisp = dispinterface
    ['{2933BF88-7B36-11D2-B20E-00C04F983E60}']
    property data: WideString dispid 109;
    property length: Integer readonly dispid 110;
    function substringData(offset: Integer; count: Integer): WideString; dispid 111;
    procedure appendData(const data: WideString); dispid 112;
    procedure insertData(offset: Integer; const data: WideString); dispid 113;
    procedure deleteData(offset: Integer; count: Integer); dispid 114;
    procedure replaceData(offset: Integer; count: Integer; const data: WideString); dispid 115;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    function dataType: OleVariant; dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMCDATASection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8A-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMCDATASection = interface(IXMLDOMText)
    ['{2933BF8A-7B36-11D2-B20E-00C04F983E60}']
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMCDATASectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8A-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMCDATASectionDisp = dispinterface
    ['{2933BF8A-7B36-11D2-B20E-00C04F983E60}']
    function splitText(offset: Integer): IXMLDOMText; dispid 123;
    property data: WideString dispid 109;
    property length: Integer readonly dispid 110;
    function substringData(offset: Integer; count: Integer): WideString; dispid 111;
    procedure appendData(const data: WideString); dispid 112;
    procedure insertData(offset: Integer; const data: WideString); dispid 113;
    procedure deleteData(offset: Integer; count: Integer); dispid 114;
    procedure replaceData(offset: Integer; count: Integer; const data: WideString); dispid 115;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    function dataType: OleVariant; dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMProcessingInstruction
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF89-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMProcessingInstruction = interface(IXMLDOMNode)
    ['{2933BF89-7B36-11D2-B20E-00C04F983E60}']
    function Get_target: WideString; safecall;
    function Get_data: WideString; safecall;
    procedure Set_data(const value: WideString); safecall;
    property target: WideString read Get_target;
    property data: WideString read Get_data write Set_data;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMProcessingInstructionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF89-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMProcessingInstructionDisp = dispinterface
    ['{2933BF89-7B36-11D2-B20E-00C04F983E60}']
    property target: WideString readonly dispid 127;
    property data: WideString dispid 128;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    function dataType: OleVariant; dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMEntityReference
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8E-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMEntityReference = interface(IXMLDOMNode)
    ['{2933BF8E-7B36-11D2-B20E-00C04F983E60}']
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMEntityReferenceDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8E-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMEntityReferenceDisp = dispinterface
    ['{2933BF8E-7B36-11D2-B20E-00C04F983E60}']
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    function dataType: OleVariant; dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMParseError
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA426-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXMLDOMParseError = interface(IDispatch)
    ['{3EFAA426-272F-11D2-836F-0000F87A7782}']
    function Get_errorCode: Integer; safecall;
    function Get_url: WideString; safecall;
    function Get_reason: WideString; safecall;
    function Get_srcText: WideString; safecall;
    function Get_line: Integer; safecall;
    function Get_linepos: Integer; safecall;
    function Get_filepos: Integer; safecall;
    property errorCode: Integer read Get_errorCode;
    property url: WideString read Get_url;
    property reason: WideString read Get_reason;
    property srcText: WideString read Get_srcText;
    property line: Integer read Get_line;
    property linepos: Integer read Get_linepos;
    property filepos: Integer read Get_filepos;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMParseErrorDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA426-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXMLDOMParseErrorDisp = dispinterface
    ['{3EFAA426-272F-11D2-836F-0000F87A7782}']
    property errorCode: Integer readonly dispid 0;
    property url: WideString readonly dispid 179;
    property reason: WideString readonly dispid 180;
    property srcText: WideString readonly dispid 181;
    property line: Integer readonly dispid 182;
    property linepos: Integer readonly dispid 183;
    property filepos: Integer readonly dispid 184;
  end;

// *********************************************************************//
// Interface: IXMLDOMNotation
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8C-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMNotation = interface(IXMLDOMNode)
    ['{2933BF8C-7B36-11D2-B20E-00C04F983E60}']
    function Get_publicId: OleVariant; safecall;
    function Get_systemId: OleVariant; safecall;
    property publicId: OleVariant read Get_publicId;
    property systemId: OleVariant read Get_systemId;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMNotationDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8C-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMNotationDisp = dispinterface
    ['{2933BF8C-7B36-11D2-B20E-00C04F983E60}']
    property publicId: OleVariant readonly dispid 136;
    property systemId: OleVariant readonly dispid 137;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    function dataType: OleVariant; dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMEntity
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8D-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMEntity = interface(IXMLDOMNode)
    ['{2933BF8D-7B36-11D2-B20E-00C04F983E60}']
    function Get_publicId: OleVariant; safecall;
    function Get_systemId: OleVariant; safecall;
    function Get_notationName: WideString; safecall;
    property publicId: OleVariant read Get_publicId;
    property systemId: OleVariant read Get_systemId;
    property notationName: WideString read Get_notationName;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMEntityDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8D-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMEntityDisp = dispinterface
    ['{2933BF8D-7B36-11D2-B20E-00C04F983E60}']
    property publicId: OleVariant readonly dispid 140;
    property systemId: OleVariant readonly dispid 141;
    property notationName: WideString readonly dispid 142;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    function dataType: OleVariant; dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMParseError2
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA428-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXMLDOMParseError2 = interface(IXMLDOMParseError)
    ['{3EFAA428-272F-11D2-836F-0000F87A7782}']
    function Get_errorXPath: WideString; safecall;
    function Get_allErrors: IXMLDOMParseErrorCollection; safecall;
    function errorParameters(index: Integer): WideString; safecall;
    function Get_errorParametersCount: Integer; safecall;
    property errorXPath: WideString read Get_errorXPath;
    property allErrors: IXMLDOMParseErrorCollection read Get_allErrors;
    property errorParametersCount: Integer read Get_errorParametersCount;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMParseError2Disp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA428-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXMLDOMParseError2Disp = dispinterface
    ['{3EFAA428-272F-11D2-836F-0000F87A7782}']
    property errorXPath: WideString readonly dispid 190;
    property allErrors: IXMLDOMParseErrorCollection readonly dispid 187;
    function errorParameters(index: Integer): WideString; dispid 188;
    property errorParametersCount: Integer readonly dispid 189;
    property errorCode: Integer readonly dispid 0;
    property url: WideString readonly dispid 179;
    property reason: WideString readonly dispid 180;
    property srcText: WideString readonly dispid 181;
    property line: Integer readonly dispid 182;
    property linepos: Integer readonly dispid 183;
    property filepos: Integer readonly dispid 184;
  end;

// *********************************************************************//
// Interface: IXMLDOMParseErrorCollection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA429-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXMLDOMParseErrorCollection = interface(IDispatch)
    ['{3EFAA429-272F-11D2-836F-0000F87A7782}']
    function Get_item(index: Integer): IXMLDOMParseError2; safecall;
    function Get_length: Integer; safecall;
    function Get_next: IXMLDOMParseError2; safecall;
    procedure reset; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: IXMLDOMParseError2 read Get_item; default;
    property length: Integer read Get_length;
    property next: IXMLDOMParseError2 read Get_next;
    property _newEnum: IUnknown read Get__newEnum;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMParseErrorCollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA429-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXMLDOMParseErrorCollectionDisp = dispinterface
    ['{3EFAA429-272F-11D2-836F-0000F87A7782}']
    property item[index: Integer]: IXMLDOMParseError2 readonly dispid 0; default;
    property length: Integer readonly dispid 193;
    property next: IXMLDOMParseError2 readonly dispid 194;
    procedure reset; dispid 195;
    property _newEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IXTLRuntime
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA425-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXTLRuntime = interface(IXMLDOMNode)
    ['{3EFAA425-272F-11D2-836F-0000F87A7782}']
    function uniqueID(const pNode: IXMLDOMNode): Integer; safecall;
    function depth(const pNode: IXMLDOMNode): Integer; safecall;
    function childNumber(const pNode: IXMLDOMNode): Integer; safecall;
    function ancestorChildNumber(const bstrNodeName: WideString; const pNode: IXMLDOMNode): Integer; safecall;
    function absoluteChildNumber(const pNode: IXMLDOMNode): Integer; safecall;
    function formatIndex(lIndex: Integer; const bstrFormat: WideString): WideString; safecall;
    function formatNumber(dblNumber: Double; const bstrFormat: WideString): WideString; safecall;
    function formatDate(varDate: OleVariant; const bstrFormat: WideString; varDestLocale: OleVariant): WideString; safecall;
    function formatTime(varTime: OleVariant; const bstrFormat: WideString; varDestLocale: OleVariant): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IXTLRuntimeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA425-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXTLRuntimeDisp = dispinterface
    ['{3EFAA425-272F-11D2-836F-0000F87A7782}']
    function uniqueID(const pNode: IXMLDOMNode): Integer; dispid 187;
    function depth(const pNode: IXMLDOMNode): Integer; dispid 188;
    function childNumber(const pNode: IXMLDOMNode): Integer; dispid 189;
    function ancestorChildNumber(const bstrNodeName: WideString; const pNode: IXMLDOMNode): Integer; dispid 190;
    function absoluteChildNumber(const pNode: IXMLDOMNode): Integer; dispid 191;
    function formatIndex(lIndex: Integer; const bstrFormat: WideString): WideString; dispid 192;
    function formatNumber(dblNumber: Double; const bstrFormat: WideString): WideString; dispid 193;
    function formatDate(varDate: OleVariant; const bstrFormat: WideString; varDestLocale: OleVariant): WideString; dispid 194;
    function formatTime(varTime: OleVariant; const bstrFormat: WideString; varDestLocale: OleVariant): WideString; dispid 195;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    function dataType: OleVariant; dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

// *********************************************************************//
// Interface: ISAXXMLReader
// Flags:     (16) Hidden
// GUID:      {A4F96ED0-F829-476E-81C0-CDC7BD2A0802}
// *********************************************************************//
  ISAXXMLReader = interface(IUnknown)
    ['{A4F96ED0-F829-476E-81C0-CDC7BD2A0802}']
    function getFeature(var pwchName: Word; out pvfValue: WordBool): HResult; stdcall;
    function putFeature(var pwchName: Word; vfValue: WordBool): HResult; stdcall;
    function getProperty(var pwchName: Word; out pvarValue: OleVariant): HResult; stdcall;
    function putProperty(var pwchName: Word; varValue: OleVariant): HResult; stdcall;
    function getEntityResolver(out ppResolver: ISAXEntityResolver): HResult; stdcall;
    function putEntityResolver(const pResolver: ISAXEntityResolver): HResult; stdcall;
    function getContentHandler(out ppHandler: ISAXContentHandler): HResult; stdcall;
    function putContentHandler(const pHandler: ISAXContentHandler): HResult; stdcall;
    function getDTDHandler(out ppHandler: ISAXDTDHandler): HResult; stdcall;
    function putDTDHandler(const pHandler: ISAXDTDHandler): HResult; stdcall;
    function getErrorHandler(out ppHandler: ISAXErrorHandler): HResult; stdcall;
    function putErrorHandler(const pHandler: ISAXErrorHandler): HResult; stdcall;
    function getBaseURL(out ppwchBaseUrl: PWord1): HResult; stdcall;
    function putBaseURL(var pwchBaseUrl: Word): HResult; stdcall;
    function getSecureBaseURL(out ppwchSecureBaseUrl: PWord1): HResult; stdcall;
    function putSecureBaseURL(var pwchSecureBaseUrl: Word): HResult; stdcall;
    function parse(varInput: OleVariant): HResult; stdcall;
    function parseURL(var pwchUrl: Word): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISAXEntityResolver
// Flags:     (16) Hidden
// GUID:      {99BCA7BD-E8C4-4D5F-A0CF-6D907901FF07}
// *********************************************************************//
  ISAXEntityResolver = interface(IUnknown)
    ['{99BCA7BD-E8C4-4D5F-A0CF-6D907901FF07}']
    function resolveEntity(var pwchPublicId: Word; var pwchSystemId: Word; out pvarInput: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISAXContentHandler
// Flags:     (16) Hidden
// GUID:      {1545CDFA-9E4E-4497-A8A4-2BF7D0112C44}
// *********************************************************************//
  ISAXContentHandler = interface(IUnknown)
    ['{1545CDFA-9E4E-4497-A8A4-2BF7D0112C44}']
    function putDocumentLocator(const pLocator: ISAXLocator): HResult; stdcall;
    function startDocument: HResult; stdcall;
    function endDocument: HResult; stdcall;
    function startPrefixMapping(var pwchPrefix: Word; cchPrefix: SYSINT; var pwchUri: Word; 
                                cchUri: SYSINT): HResult; stdcall;
    function endPrefixMapping(var pwchPrefix: Word; cchPrefix: SYSINT): HResult; stdcall;
    function startElement(var pwchNamespaceUri: Word; cchNamespaceUri: SYSINT; 
                          var pwchLocalName: Word; cchLocalName: SYSINT; var pwchQName: Word; 
                          cchQName: SYSINT; const pAttributes: ISAXAttributes): HResult; stdcall;
    function endElement(var pwchNamespaceUri: Word; cchNamespaceUri: SYSINT; 
                        var pwchLocalName: Word; cchLocalName: SYSINT; var pwchQName: Word; 
                        cchQName: SYSINT): HResult; stdcall;
    function characters(var pwchChars: Word; cchChars: SYSINT): HResult; stdcall;
    function ignorableWhitespace(var pwchChars: Word; cchChars: SYSINT): HResult; stdcall;
    function processingInstruction(var pwchTarget: Word; cchTarget: SYSINT; var pwchData: Word; 
                                   cchData: SYSINT): HResult; stdcall;
    function skippedEntity(var pwchName: Word; cchName: SYSINT): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISAXLocator
// Flags:     (16) Hidden
// GUID:      {9B7E472A-0DE4-4640-BFF3-84D38A051C31}
// *********************************************************************//
  ISAXLocator = interface(IUnknown)
    ['{9B7E472A-0DE4-4640-BFF3-84D38A051C31}']
    function getColumnNumber(out pnColumn: SYSINT): HResult; stdcall;
    function getLineNumber(out pnLine: SYSINT): HResult; stdcall;
    function getPublicId(out ppwchPublicId: PWord1): HResult; stdcall;
    function getSystemId(out ppwchSystemId: PWord1): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISAXAttributes
// Flags:     (16) Hidden
// GUID:      {F078ABE1-45D2-4832-91EA-4466CE2F25C9}
// *********************************************************************//
  ISAXAttributes = interface(IUnknown)
    ['{F078ABE1-45D2-4832-91EA-4466CE2F25C9}']
    function getLength(out pnLength: SYSINT): HResult; stdcall;
    function getURI(nIndex: SYSINT; out ppwchUri: PWord1; out pcchUri: SYSINT): HResult; stdcall;
    function getLocalName(nIndex: SYSINT; out ppwchLocalName: PWord1; out pcchLocalName: SYSINT): HResult; stdcall;
    function getQName(nIndex: SYSINT; out ppwchQName: PWord1; out pcchQName: SYSINT): HResult; stdcall;
    function getName(nIndex: SYSINT; out ppwchUri: PWord1; out pcchUri: SYSINT; 
                     out ppwchLocalName: PWord1; out pcchLocalName: SYSINT; out ppwchQName: PWord1; 
                     out pcchQName: SYSINT): HResult; stdcall;
    function getIndexFromName(var pwchUri: Word; cchUri: SYSINT; var pwchLocalName: Word; 
                              cchLocalName: SYSINT; out pnIndex: SYSINT): HResult; stdcall;
    function getIndexFromQName(var pwchQName: Word; cchQName: SYSINT; out pnIndex: SYSINT): HResult; stdcall;
    function getType(nIndex: SYSINT; out ppwchType: PWord1; out pcchType: SYSINT): HResult; stdcall;
    function getTypeFromName(var pwchUri: Word; cchUri: SYSINT; var pwchLocalName: Word; 
                             cchLocalName: SYSINT; out ppwchType: PWord1; out pcchType: SYSINT): HResult; stdcall;
    function getTypeFromQName(var pwchQName: Word; cchQName: SYSINT; out ppwchType: PWord1; 
                              out pcchType: SYSINT): HResult; stdcall;
    function getValue(nIndex: SYSINT; out ppwchValue: PWord1; out pcchValue: SYSINT): HResult; stdcall;
    function getValueFromName(var pwchUri: Word; cchUri: SYSINT; var pwchLocalName: Word; 
                              cchLocalName: SYSINT; out ppwchValue: PWord1; out pcchValue: SYSINT): HResult; stdcall;
    function getValueFromQName(var pwchQName: Word; cchQName: SYSINT; out ppwchValue: PWord1; 
                               out pcchValue: SYSINT): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISAXDTDHandler
// Flags:     (16) Hidden
// GUID:      {E15C1BAF-AFB3-4D60-8C36-19A8C45DEFED}
// *********************************************************************//
  ISAXDTDHandler = interface(IUnknown)
    ['{E15C1BAF-AFB3-4D60-8C36-19A8C45DEFED}']
    function notationDecl(var pwchName: Word; cchName: SYSINT; var pwchPublicId: Word; 
                          cchPublicId: SYSINT; var pwchSystemId: Word; cchSystemId: SYSINT): HResult; stdcall;
    function unparsedEntityDecl(var pwchName: Word; cchName: SYSINT; var pwchPublicId: Word; 
                                cchPublicId: SYSINT; var pwchSystemId: Word; cchSystemId: SYSINT; 
                                var pwchNotationName: Word; cchNotationName: SYSINT): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISAXErrorHandler
// Flags:     (16) Hidden
// GUID:      {A60511C4-CCF5-479E-98A3-DC8DC545B7D0}
// *********************************************************************//
  ISAXErrorHandler = interface(IUnknown)
    ['{A60511C4-CCF5-479E-98A3-DC8DC545B7D0}']
    function error(const pLocator: ISAXLocator; var pwchErrorMessage: Word; hrErrorCode: HResult): HResult; stdcall;
    function fatalError(const pLocator: ISAXLocator; var pwchErrorMessage: Word; 
                        hrErrorCode: HResult): HResult; stdcall;
    function ignorableWarning(const pLocator: ISAXLocator; var pwchErrorMessage: Word; 
                              hrErrorCode: HResult): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISAXXMLFilter
// Flags:     (16) Hidden
// GUID:      {70409222-CA09-4475-ACB8-40312FE8D145}
// *********************************************************************//
  ISAXXMLFilter = interface(ISAXXMLReader)
    ['{70409222-CA09-4475-ACB8-40312FE8D145}']
    function getParent(out ppReader: ISAXXMLReader): HResult; stdcall;
    function putParent(const pReader: ISAXXMLReader): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IVBSAXXMLFilter
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {1299EB1B-5B88-433E-82DE-82CA75AD4E04}
// *********************************************************************//
  IVBSAXXMLFilter = interface(IDispatch)
    ['{1299EB1B-5B88-433E-82DE-82CA75AD4E04}']
    function Get_parent: IVBSAXXMLReader; safecall;
    procedure _Set_parent(const oReader: IVBSAXXMLReader); safecall;
    property parent: IVBSAXXMLReader read Get_parent write _Set_parent;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXXMLFilterDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {1299EB1B-5B88-433E-82DE-82CA75AD4E04}
// *********************************************************************//
  IVBSAXXMLFilterDisp = dispinterface
    ['{1299EB1B-5B88-433E-82DE-82CA75AD4E04}']
    property parent: IVBSAXXMLReader dispid 1309;
  end;

// *********************************************************************//
// Interface: IVBSAXXMLReader
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {8C033CAA-6CD6-4F73-B728-4531AF74945F}
// *********************************************************************//
  IVBSAXXMLReader = interface(IDispatch)
    ['{8C033CAA-6CD6-4F73-B728-4531AF74945F}']
    function getFeature(const strName: WideString): WordBool; safecall;
    procedure putFeature(const strName: WideString; fValue: WordBool); safecall;
    function getProperty(const strName: WideString): OleVariant; safecall;
    procedure putProperty(const strName: WideString; varValue: OleVariant); safecall;
    function Get_entityResolver: IVBSAXEntityResolver; safecall;
    procedure _Set_entityResolver(const oResolver: IVBSAXEntityResolver); safecall;
    function Get_contentHandler: IVBSAXContentHandler; safecall;
    procedure _Set_contentHandler(const oHandler: IVBSAXContentHandler); safecall;
    function Get_dtdHandler: IVBSAXDTDHandler; safecall;
    procedure _Set_dtdHandler(const oHandler: IVBSAXDTDHandler); safecall;
    function Get_errorHandler: IVBSAXErrorHandler; safecall;
    procedure _Set_errorHandler(const oHandler: IVBSAXErrorHandler); safecall;
    function Get_baseURL: WideString; safecall;
    procedure Set_baseURL(const strBaseURL: WideString); safecall;
    function Get_secureBaseURL: WideString; safecall;
    procedure Set_secureBaseURL(const strSecureBaseURL: WideString); safecall;
    procedure parse(varInput: OleVariant); safecall;
    procedure parseURL(const strURL: WideString); safecall;
    property entityResolver: IVBSAXEntityResolver read Get_entityResolver write _Set_entityResolver;
    property contentHandler: IVBSAXContentHandler read Get_contentHandler write _Set_contentHandler;
    property dtdHandler: IVBSAXDTDHandler read Get_dtdHandler write _Set_dtdHandler;
    property errorHandler: IVBSAXErrorHandler read Get_errorHandler write _Set_errorHandler;
    property baseURL: WideString read Get_baseURL write Set_baseURL;
    property secureBaseURL: WideString read Get_secureBaseURL write Set_secureBaseURL;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXXMLReaderDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {8C033CAA-6CD6-4F73-B728-4531AF74945F}
// *********************************************************************//
  IVBSAXXMLReaderDisp = dispinterface
    ['{8C033CAA-6CD6-4F73-B728-4531AF74945F}']
    function getFeature(const strName: WideString): WordBool; dispid 1282;
    procedure putFeature(const strName: WideString; fValue: WordBool); dispid 1283;
    function getProperty(const strName: WideString): OleVariant; dispid 1284;
    procedure putProperty(const strName: WideString; varValue: OleVariant); dispid 1285;
    property entityResolver: IVBSAXEntityResolver dispid 1286;
    property contentHandler: IVBSAXContentHandler dispid 1287;
    property dtdHandler: IVBSAXDTDHandler dispid 1288;
    property errorHandler: IVBSAXErrorHandler dispid 1289;
    property baseURL: WideString dispid 1290;
    property secureBaseURL: WideString dispid 1291;
    procedure parse(varInput: OleVariant); dispid 1292;
    procedure parseURL(const strURL: WideString); dispid 1293;
  end;

// *********************************************************************//
// Interface: IVBSAXEntityResolver
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0C05D096-F45B-4ACA-AD1A-AA0BC25518DC}
// *********************************************************************//
  IVBSAXEntityResolver = interface(IDispatch)
    ['{0C05D096-F45B-4ACA-AD1A-AA0BC25518DC}']
    function resolveEntity(var strPublicId: WideString; var strSystemId: WideString): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXEntityResolverDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0C05D096-F45B-4ACA-AD1A-AA0BC25518DC}
// *********************************************************************//
  IVBSAXEntityResolverDisp = dispinterface
    ['{0C05D096-F45B-4ACA-AD1A-AA0BC25518DC}']
    function resolveEntity(var strPublicId: WideString; var strSystemId: WideString): OleVariant; dispid 1319;
  end;

// *********************************************************************//
// Interface: IVBSAXContentHandler
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2ED7290A-4DD5-4B46-BB26-4E4155E77FAA}
// *********************************************************************//
  IVBSAXContentHandler = interface(IDispatch)
    ['{2ED7290A-4DD5-4B46-BB26-4E4155E77FAA}']
    procedure _Set_documentLocator(const Param1: IVBSAXLocator); safecall;
    procedure startDocument; safecall;
    procedure endDocument; safecall;
    procedure startPrefixMapping(var strPrefix: WideString; var strURI: WideString); safecall;
    procedure endPrefixMapping(var strPrefix: WideString); safecall;
    procedure startElement(var strNamespaceURI: WideString; var strLocalName: WideString; 
                           var strQName: WideString; const oAttributes: IVBSAXAttributes); safecall;
    procedure endElement(var strNamespaceURI: WideString; var strLocalName: WideString; 
                         var strQName: WideString); safecall;
    procedure characters(var strChars: WideString); safecall;
    procedure ignorableWhitespace(var strChars: WideString); safecall;
    procedure processingInstruction(var strTarget: WideString; var strData: WideString); safecall;
    procedure skippedEntity(var strName: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXContentHandlerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2ED7290A-4DD5-4B46-BB26-4E4155E77FAA}
// *********************************************************************//
  IVBSAXContentHandlerDisp = dispinterface
    ['{2ED7290A-4DD5-4B46-BB26-4E4155E77FAA}']
    procedure startDocument; dispid 1323;
    procedure endDocument; dispid 1324;
    procedure startPrefixMapping(var strPrefix: WideString; var strURI: WideString); dispid 1325;
    procedure endPrefixMapping(var strPrefix: WideString); dispid 1326;
    procedure startElement(var strNamespaceURI: WideString; var strLocalName: WideString; 
                           var strQName: WideString; const oAttributes: IVBSAXAttributes); dispid 1327;
    procedure endElement(var strNamespaceURI: WideString; var strLocalName: WideString; 
                         var strQName: WideString); dispid 1328;
    procedure characters(var strChars: WideString); dispid 1329;
    procedure ignorableWhitespace(var strChars: WideString); dispid 1330;
    procedure processingInstruction(var strTarget: WideString; var strData: WideString); dispid 1331;
    procedure skippedEntity(var strName: WideString); dispid 1332;
  end;

// *********************************************************************//
// Interface: IVBSAXLocator
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {796E7AC5-5AA2-4EFF-ACAD-3FAAF01A3288}
// *********************************************************************//
  IVBSAXLocator = interface(IDispatch)
    ['{796E7AC5-5AA2-4EFF-ACAD-3FAAF01A3288}']
    function Get_columnNumber: SYSINT; safecall;
    function Get_lineNumber: SYSINT; safecall;
    function Get_publicId: WideString; safecall;
    function Get_systemId: WideString; safecall;
    property columnNumber: SYSINT read Get_columnNumber;
    property lineNumber: SYSINT read Get_lineNumber;
    property publicId: WideString read Get_publicId;
    property systemId: WideString read Get_systemId;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXLocatorDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {796E7AC5-5AA2-4EFF-ACAD-3FAAF01A3288}
// *********************************************************************//
  IVBSAXLocatorDisp = dispinterface
    ['{796E7AC5-5AA2-4EFF-ACAD-3FAAF01A3288}']
    property columnNumber: SYSINT readonly dispid 1313;
    property lineNumber: SYSINT readonly dispid 1314;
    property publicId: WideString readonly dispid 1315;
    property systemId: WideString readonly dispid 1316;
  end;

// *********************************************************************//
// Interface: IVBSAXAttributes
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {10DC0586-132B-4CAC-8BB3-DB00AC8B7EE0}
// *********************************************************************//
  IVBSAXAttributes = interface(IDispatch)
    ['{10DC0586-132B-4CAC-8BB3-DB00AC8B7EE0}']
    function Get_length: SYSINT; safecall;
    function getURI(nIndex: SYSINT): WideString; safecall;
    function getLocalName(nIndex: SYSINT): WideString; safecall;
    function getQName(nIndex: SYSINT): WideString; safecall;
    function getIndexFromName(const strURI: WideString; const strLocalName: WideString): SYSINT; safecall;
    function getIndexFromQName(const strQName: WideString): SYSINT; safecall;
    function getType(nIndex: SYSINT): WideString; safecall;
    function getTypeFromName(const strURI: WideString; const strLocalName: WideString): WideString; safecall;
    function getTypeFromQName(const strQName: WideString): WideString; safecall;
    function getValue(nIndex: SYSINT): WideString; safecall;
    function getValueFromName(const strURI: WideString; const strLocalName: WideString): WideString; safecall;
    function getValueFromQName(const strQName: WideString): WideString; safecall;
    property length: SYSINT read Get_length;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXAttributesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {10DC0586-132B-4CAC-8BB3-DB00AC8B7EE0}
// *********************************************************************//
  IVBSAXAttributesDisp = dispinterface
    ['{10DC0586-132B-4CAC-8BB3-DB00AC8B7EE0}']
    property length: SYSINT readonly dispid 1344;
    function getURI(nIndex: SYSINT): WideString; dispid 1345;
    function getLocalName(nIndex: SYSINT): WideString; dispid 1346;
    function getQName(nIndex: SYSINT): WideString; dispid 1347;
    function getIndexFromName(const strURI: WideString; const strLocalName: WideString): SYSINT; dispid 1348;
    function getIndexFromQName(const strQName: WideString): SYSINT; dispid 1349;
    function getType(nIndex: SYSINT): WideString; dispid 1350;
    function getTypeFromName(const strURI: WideString; const strLocalName: WideString): WideString; dispid 1351;
    function getTypeFromQName(const strQName: WideString): WideString; dispid 1352;
    function getValue(nIndex: SYSINT): WideString; dispid 1353;
    function getValueFromName(const strURI: WideString; const strLocalName: WideString): WideString; dispid 1354;
    function getValueFromQName(const strQName: WideString): WideString; dispid 1355;
  end;

// *********************************************************************//
// Interface: IVBSAXDTDHandler
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {24FB3297-302D-4620-BA39-3A732D850558}
// *********************************************************************//
  IVBSAXDTDHandler = interface(IDispatch)
    ['{24FB3297-302D-4620-BA39-3A732D850558}']
    procedure notationDecl(var strName: WideString; var strPublicId: WideString; 
                           var strSystemId: WideString); safecall;
    procedure unparsedEntityDecl(var strName: WideString; var strPublicId: WideString; 
                                 var strSystemId: WideString; var strNotationName: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXDTDHandlerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {24FB3297-302D-4620-BA39-3A732D850558}
// *********************************************************************//
  IVBSAXDTDHandlerDisp = dispinterface
    ['{24FB3297-302D-4620-BA39-3A732D850558}']
    procedure notationDecl(var strName: WideString; var strPublicId: WideString; 
                           var strSystemId: WideString); dispid 1335;
    procedure unparsedEntityDecl(var strName: WideString; var strPublicId: WideString; 
                                 var strSystemId: WideString; var strNotationName: WideString); dispid 1336;
  end;

// *********************************************************************//
// Interface: IVBSAXErrorHandler
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {D963D3FE-173C-4862-9095-B92F66995F52}
// *********************************************************************//
  IVBSAXErrorHandler = interface(IDispatch)
    ['{D963D3FE-173C-4862-9095-B92F66995F52}']
    procedure error(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; 
                    nErrorCode: Integer); safecall;
    procedure fatalError(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; 
                         nErrorCode: Integer); safecall;
    procedure ignorableWarning(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; 
                               nErrorCode: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXErrorHandlerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {D963D3FE-173C-4862-9095-B92F66995F52}
// *********************************************************************//
  IVBSAXErrorHandlerDisp = dispinterface
    ['{D963D3FE-173C-4862-9095-B92F66995F52}']
    procedure error(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; 
                    nErrorCode: Integer); dispid 1339;
    procedure fatalError(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; 
                         nErrorCode: Integer); dispid 1340;
    procedure ignorableWarning(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; 
                               nErrorCode: Integer); dispid 1341;
  end;

// *********************************************************************//
// Interface: IMXReaderControl
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {808F4E35-8D5A-4FBE-8466-33A41279ED30}
// *********************************************************************//
  IMXReaderControl = interface(IDispatch)
    ['{808F4E35-8D5A-4FBE-8466-33A41279ED30}']
    procedure abort; safecall;
    procedure resume; safecall;
    procedure suspend; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMXReaderControlDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {808F4E35-8D5A-4FBE-8466-33A41279ED30}
// *********************************************************************//
  IMXReaderControlDisp = dispinterface
    ['{808F4E35-8D5A-4FBE-8466-33A41279ED30}']
    procedure abort; dispid 1398;
    procedure resume; dispid 1399;
    procedure suspend; dispid 1400;
  end;

// *********************************************************************//
// Interface: IMXSchemaDeclHandler
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {FA4BB38C-FAF9-4CCA-9302-D1DD0FE520DB}
// *********************************************************************//
  IMXSchemaDeclHandler = interface(IDispatch)
    ['{FA4BB38C-FAF9-4CCA-9302-D1DD0FE520DB}']
    procedure schemaElementDecl(const oSchemaElement: ISchemaElement); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMXSchemaDeclHandlerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {FA4BB38C-FAF9-4CCA-9302-D1DD0FE520DB}
// *********************************************************************//
  IMXSchemaDeclHandlerDisp = dispinterface
    ['{FA4BB38C-FAF9-4CCA-9302-D1DD0FE520DB}']
    procedure schemaElementDecl(const oSchemaElement: ISchemaElement); dispid 1403;
  end;

// *********************************************************************//
// Interface: ISchemaItem
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B3-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaItem = interface(IDispatch)
    ['{50EA08B3-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_name: WideString; safecall;
    function Get_namespaceURI: WideString; safecall;
    function Get_schema: ISchema; safecall;
    function Get_id: WideString; safecall;
    function Get_itemType: SOMITEMTYPE; safecall;
    function Get_unhandledAttributes: IVBSAXAttributes; safecall;
    function writeAnnotation(const annotationSink: IUnknown): WordBool; safecall;
    property name: WideString read Get_name;
    property namespaceURI: WideString read Get_namespaceURI;
    property schema: ISchema read Get_schema;
    property id: WideString read Get_id;
    property itemType: SOMITEMTYPE read Get_itemType;
    property unhandledAttributes: IVBSAXAttributes read Get_unhandledAttributes;
  end;

// *********************************************************************//
// DispIntf:  ISchemaItemDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B3-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaItemDisp = dispinterface
    ['{50EA08B3-DD1B-4664-9A50-C2F40F4BD79A}']
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaParticle
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B5-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaParticle = interface(ISchemaItem)
    ['{50EA08B5-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_minOccurs: OleVariant; safecall;
    function Get_maxOccurs: OleVariant; safecall;
    property minOccurs: OleVariant read Get_minOccurs;
    property maxOccurs: OleVariant read Get_maxOccurs;
  end;

// *********************************************************************//
// DispIntf:  ISchemaParticleDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B5-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaParticleDisp = dispinterface
    ['{50EA08B5-DD1B-4664-9A50-C2F40F4BD79A}']
    property minOccurs: OleVariant readonly dispid 1455;
    property maxOccurs: OleVariant readonly dispid 1451;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaElement
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B7-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaElement = interface(ISchemaParticle)
    ['{50EA08B7-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_type_: ISchemaType; safecall;
    function Get_scope: ISchemaComplexType; safecall;
    function Get_defaultValue: WideString; safecall;
    function Get_fixedValue: WideString; safecall;
    function Get_isNillable: WordBool; safecall;
    function Get_identityConstraints: ISchemaItemCollection; safecall;
    function Get_substitutionGroup: ISchemaElement; safecall;
    function Get_substitutionGroupExclusions: SCHEMADERIVATIONMETHOD; safecall;
    function Get_disallowedSubstitutions: SCHEMADERIVATIONMETHOD; safecall;
    function Get_isAbstract: WordBool; safecall;
    function Get_isReference: WordBool; safecall;
    property type_: ISchemaType read Get_type_;
    property scope: ISchemaComplexType read Get_scope;
    property defaultValue: WideString read Get_defaultValue;
    property fixedValue: WideString read Get_fixedValue;
    property isNillable: WordBool read Get_isNillable;
    property identityConstraints: ISchemaItemCollection read Get_identityConstraints;
    property substitutionGroup: ISchemaElement read Get_substitutionGroup;
    property substitutionGroupExclusions: SCHEMADERIVATIONMETHOD read Get_substitutionGroupExclusions;
    property disallowedSubstitutions: SCHEMADERIVATIONMETHOD read Get_disallowedSubstitutions;
    property isAbstract: WordBool read Get_isAbstract;
    property isReference: WordBool read Get_isReference;
  end;

// *********************************************************************//
// DispIntf:  ISchemaElementDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B7-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaElementDisp = dispinterface
    ['{50EA08B7-DD1B-4664-9A50-C2F40F4BD79A}']
    property type_: ISchemaType readonly dispid 1476;
    property scope: ISchemaComplexType readonly dispid 1469;
    property defaultValue: WideString readonly dispid 1431;
    property fixedValue: WideString readonly dispid 1438;
    property isNillable: WordBool readonly dispid 1443;
    property identityConstraints: ISchemaItemCollection readonly dispid 1441;
    property substitutionGroup: ISchemaElement readonly dispid 1471;
    property substitutionGroupExclusions: SCHEMADERIVATIONMETHOD readonly dispid 1472;
    property disallowedSubstitutions: SCHEMADERIVATIONMETHOD readonly dispid 1433;
    property isAbstract: WordBool readonly dispid 1442;
    property isReference: WordBool readonly dispid 1444;
    property minOccurs: OleVariant readonly dispid 1455;
    property maxOccurs: OleVariant readonly dispid 1451;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchema
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B4-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchema = interface(ISchemaItem)
    ['{50EA08B4-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_targetNamespace: WideString; safecall;
    function Get_version: WideString; safecall;
    function Get_types: ISchemaItemCollection; safecall;
    function Get_elements: ISchemaItemCollection; safecall;
    function Get_attributes: ISchemaItemCollection; safecall;
    function Get_attributeGroups: ISchemaItemCollection; safecall;
    function Get_modelGroups: ISchemaItemCollection; safecall;
    function Get_notations: ISchemaItemCollection; safecall;
    function Get_schemaLocations: ISchemaStringCollection; safecall;
    property targetNamespace: WideString read Get_targetNamespace;
    property version: WideString read Get_version;
    property types: ISchemaItemCollection read Get_types;
    property elements: ISchemaItemCollection read Get_elements;
    property attributes: ISchemaItemCollection read Get_attributes;
    property attributeGroups: ISchemaItemCollection read Get_attributeGroups;
    property modelGroups: ISchemaItemCollection read Get_modelGroups;
    property notations: ISchemaItemCollection read Get_notations;
    property schemaLocations: ISchemaStringCollection read Get_schemaLocations;
  end;

// *********************************************************************//
// DispIntf:  ISchemaDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B4-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaDisp = dispinterface
    ['{50EA08B4-DD1B-4664-9A50-C2F40F4BD79A}']
    property targetNamespace: WideString readonly dispid 1474;
    property version: WideString readonly dispid 1481;
    property types: ISchemaItemCollection readonly dispid 1477;
    property elements: ISchemaItemCollection readonly dispid 1434;
    property attributes: ISchemaItemCollection readonly dispid 1427;
    property attributeGroups: ISchemaItemCollection readonly dispid 1426;
    property modelGroups: ISchemaItemCollection readonly dispid 1456;
    property notations: ISchemaItemCollection readonly dispid 1460;
    property schemaLocations: ISchemaStringCollection readonly dispid 1468;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaItemCollection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B2-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaItemCollection = interface(IDispatch)
    ['{50EA08B2-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_item(index: Integer): ISchemaItem; safecall;
    function itemByName(const name: WideString): ISchemaItem; safecall;
    function itemByQName(const name: WideString; const namespaceURI: WideString): ISchemaItem; safecall;
    function Get_length: Integer; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: ISchemaItem read Get_item; default;
    property length: Integer read Get_length;
    property _newEnum: IUnknown read Get__newEnum;
  end;

// *********************************************************************//
// DispIntf:  ISchemaItemCollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B2-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaItemCollectionDisp = dispinterface
    ['{50EA08B2-DD1B-4664-9A50-C2F40F4BD79A}']
    property item[index: Integer]: ISchemaItem readonly dispid 0; default;
    function itemByName(const name: WideString): ISchemaItem; dispid 1423;
    function itemByQName(const name: WideString; const namespaceURI: WideString): ISchemaItem; dispid 1424;
    property length: Integer readonly dispid 1447;
    property _newEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: ISchemaStringCollection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B1-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaStringCollection = interface(IDispatch)
    ['{50EA08B1-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_item(index: Integer): WideString; safecall;
    function Get_length: Integer; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: WideString read Get_item; default;
    property length: Integer read Get_length;
    property _newEnum: IUnknown read Get__newEnum;
  end;

// *********************************************************************//
// DispIntf:  ISchemaStringCollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B1-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaStringCollectionDisp = dispinterface
    ['{50EA08B1-DD1B-4664-9A50-C2F40F4BD79A}']
    property item[index: Integer]: WideString readonly dispid 0; default;
    property length: Integer readonly dispid 1447;
    property _newEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: ISchemaType
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B8-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaType = interface(ISchemaItem)
    ['{50EA08B8-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_baseTypes: ISchemaItemCollection; safecall;
    function Get_final: SCHEMADERIVATIONMETHOD; safecall;
    function Get_variety: SCHEMATYPEVARIETY; safecall;
    function Get_derivedBy: SCHEMADERIVATIONMETHOD; safecall;
    function isValid(const data: WideString): WordBool; safecall;
    function Get_minExclusive: WideString; safecall;
    function Get_minInclusive: WideString; safecall;
    function Get_maxExclusive: WideString; safecall;
    function Get_maxInclusive: WideString; safecall;
    function Get_totalDigits: OleVariant; safecall;
    function Get_fractionDigits: OleVariant; safecall;
    function Get_length: OleVariant; safecall;
    function Get_minLength: OleVariant; safecall;
    function Get_maxLength: OleVariant; safecall;
    function Get_enumeration: ISchemaStringCollection; safecall;
    function Get_whitespace: SCHEMAWHITESPACE; safecall;
    function Get_patterns: ISchemaStringCollection; safecall;
    property baseTypes: ISchemaItemCollection read Get_baseTypes;
    property final: SCHEMADERIVATIONMETHOD read Get_final;
    property variety: SCHEMATYPEVARIETY read Get_variety;
    property derivedBy: SCHEMADERIVATIONMETHOD read Get_derivedBy;
    property minExclusive: WideString read Get_minExclusive;
    property minInclusive: WideString read Get_minInclusive;
    property maxExclusive: WideString read Get_maxExclusive;
    property maxInclusive: WideString read Get_maxInclusive;
    property totalDigits: OleVariant read Get_totalDigits;
    property fractionDigits: OleVariant read Get_fractionDigits;
    property length: OleVariant read Get_length;
    property minLength: OleVariant read Get_minLength;
    property maxLength: OleVariant read Get_maxLength;
    property enumeration: ISchemaStringCollection read Get_enumeration;
    property whitespace: SCHEMAWHITESPACE read Get_whitespace;
    property patterns: ISchemaStringCollection read Get_patterns;
  end;

// *********************************************************************//
// DispIntf:  ISchemaTypeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B8-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaTypeDisp = dispinterface
    ['{50EA08B8-DD1B-4664-9A50-C2F40F4BD79A}']
    property baseTypes: ISchemaItemCollection readonly dispid 1428;
    property final: SCHEMADERIVATIONMETHOD readonly dispid 1437;
    property variety: SCHEMATYPEVARIETY readonly dispid 1480;
    property derivedBy: SCHEMADERIVATIONMETHOD readonly dispid 1432;
    function isValid(const data: WideString): WordBool; dispid 1445;
    property minExclusive: WideString readonly dispid 1452;
    property minInclusive: WideString readonly dispid 1453;
    property maxExclusive: WideString readonly dispid 1448;
    property maxInclusive: WideString readonly dispid 1449;
    property totalDigits: OleVariant readonly dispid 1475;
    property fractionDigits: OleVariant readonly dispid 1439;
    property length: OleVariant readonly dispid 1447;
    property minLength: OleVariant readonly dispid 1454;
    property maxLength: OleVariant readonly dispid 1450;
    property enumeration: ISchemaStringCollection readonly dispid 1435;
    property whitespace: SCHEMAWHITESPACE readonly dispid 1482;
    property patterns: ISchemaStringCollection readonly dispid 1462;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaComplexType
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B9-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaComplexType = interface(ISchemaType)
    ['{50EA08B9-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_isAbstract: WordBool; safecall;
    function Get_anyAttribute: ISchemaAny; safecall;
    function Get_attributes: ISchemaItemCollection; safecall;
    function Get_contentType: SCHEMACONTENTTYPE; safecall;
    function Get_contentModel: ISchemaModelGroup; safecall;
    function Get_prohibitedSubstitutions: SCHEMADERIVATIONMETHOD; safecall;
    property isAbstract: WordBool read Get_isAbstract;
    property anyAttribute: ISchemaAny read Get_anyAttribute;
    property attributes: ISchemaItemCollection read Get_attributes;
    property contentType: SCHEMACONTENTTYPE read Get_contentType;
    property contentModel: ISchemaModelGroup read Get_contentModel;
    property prohibitedSubstitutions: SCHEMADERIVATIONMETHOD read Get_prohibitedSubstitutions;
  end;

// *********************************************************************//
// DispIntf:  ISchemaComplexTypeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B9-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaComplexTypeDisp = dispinterface
    ['{50EA08B9-DD1B-4664-9A50-C2F40F4BD79A}']
    property isAbstract: WordBool readonly dispid 1442;
    property anyAttribute: ISchemaAny readonly dispid 1425;
    property attributes: ISchemaItemCollection readonly dispid 1427;
    property contentType: SCHEMACONTENTTYPE readonly dispid 1430;
    property contentModel: ISchemaModelGroup readonly dispid 1429;
    property prohibitedSubstitutions: SCHEMADERIVATIONMETHOD readonly dispid 1464;
    property baseTypes: ISchemaItemCollection readonly dispid 1428;
    property final: SCHEMADERIVATIONMETHOD readonly dispid 1437;
    property variety: SCHEMATYPEVARIETY readonly dispid 1480;
    property derivedBy: SCHEMADERIVATIONMETHOD readonly dispid 1432;
    function isValid(const data: WideString): WordBool; dispid 1445;
    property minExclusive: WideString readonly dispid 1452;
    property minInclusive: WideString readonly dispid 1453;
    property maxExclusive: WideString readonly dispid 1448;
    property maxInclusive: WideString readonly dispid 1449;
    property totalDigits: OleVariant readonly dispid 1475;
    property fractionDigits: OleVariant readonly dispid 1439;
    property length: OleVariant readonly dispid 1447;
    property minLength: OleVariant readonly dispid 1454;
    property maxLength: OleVariant readonly dispid 1450;
    property enumeration: ISchemaStringCollection readonly dispid 1435;
    property whitespace: SCHEMAWHITESPACE readonly dispid 1482;
    property patterns: ISchemaStringCollection readonly dispid 1462;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaAny
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BC-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaAny = interface(ISchemaParticle)
    ['{50EA08BC-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_namespaces: ISchemaStringCollection; safecall;
    function Get_processContents: SCHEMAPROCESSCONTENTS; safecall;
    property namespaces: ISchemaStringCollection read Get_namespaces;
    property processContents: SCHEMAPROCESSCONTENTS read Get_processContents;
  end;

// *********************************************************************//
// DispIntf:  ISchemaAnyDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BC-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaAnyDisp = dispinterface
    ['{50EA08BC-DD1B-4664-9A50-C2F40F4BD79A}']
    property namespaces: ISchemaStringCollection readonly dispid 1458;
    property processContents: SCHEMAPROCESSCONTENTS readonly dispid 1463;
    property minOccurs: OleVariant readonly dispid 1455;
    property maxOccurs: OleVariant readonly dispid 1451;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaModelGroup
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BB-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaModelGroup = interface(ISchemaParticle)
    ['{50EA08BB-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_particles: ISchemaItemCollection; safecall;
    property particles: ISchemaItemCollection read Get_particles;
  end;

// *********************************************************************//
// DispIntf:  ISchemaModelGroupDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BB-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaModelGroupDisp = dispinterface
    ['{50EA08BB-DD1B-4664-9A50-C2F40F4BD79A}']
    property particles: ISchemaItemCollection readonly dispid 1461;
    property minOccurs: OleVariant readonly dispid 1455;
    property maxOccurs: OleVariant readonly dispid 1451;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: IMXXMLFilter
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C90352F7-643C-4FBC-BB23-E996EB2D51FD}
// *********************************************************************//
  IMXXMLFilter = interface(IDispatch)
    ['{C90352F7-643C-4FBC-BB23-E996EB2D51FD}']
    function getFeature(const strName: WideString): WordBool; safecall;
    procedure putFeature(const strName: WideString; fValue: WordBool); safecall;
    function getProperty(const strName: WideString): OleVariant; safecall;
    procedure putProperty(const strName: WideString; varValue: OleVariant); safecall;
    function Get_entityResolver: IUnknown; safecall;
    procedure _Set_entityResolver(const oResolver: IUnknown); safecall;
    function Get_contentHandler: IUnknown; safecall;
    procedure _Set_contentHandler(const oHandler: IUnknown); safecall;
    function Get_dtdHandler: IUnknown; safecall;
    procedure _Set_dtdHandler(const oHandler: IUnknown); safecall;
    function Get_errorHandler: IUnknown; safecall;
    procedure _Set_errorHandler(const oHandler: IUnknown); safecall;
    property entityResolver: IUnknown read Get_entityResolver write _Set_entityResolver;
    property contentHandler: IUnknown read Get_contentHandler write _Set_contentHandler;
    property dtdHandler: IUnknown read Get_dtdHandler write _Set_dtdHandler;
    property errorHandler: IUnknown read Get_errorHandler write _Set_errorHandler;
  end;

// *********************************************************************//
// DispIntf:  IMXXMLFilterDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C90352F7-643C-4FBC-BB23-E996EB2D51FD}
// *********************************************************************//
  IMXXMLFilterDisp = dispinterface
    ['{C90352F7-643C-4FBC-BB23-E996EB2D51FD}']
    function getFeature(const strName: WideString): WordBool; dispid 1423;
    procedure putFeature(const strName: WideString; fValue: WordBool); dispid 1425;
    function getProperty(const strName: WideString): OleVariant; dispid 1424;
    procedure putProperty(const strName: WideString; varValue: OleVariant); dispid 1426;
    property entityResolver: IUnknown dispid 1421;
    property contentHandler: IUnknown dispid 1419;
    property dtdHandler: IUnknown dispid 1420;
    property errorHandler: IUnknown dispid 1422;
  end;

// *********************************************************************//
// Interface: ISchemaAttribute
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B6-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaAttribute = interface(ISchemaItem)
    ['{50EA08B6-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_type_: ISchemaType; safecall;
    function Get_scope: ISchemaComplexType; safecall;
    function Get_defaultValue: WideString; safecall;
    function Get_fixedValue: WideString; safecall;
    function Get_use: SCHEMAUSE; safecall;
    function Get_isReference: WordBool; safecall;
    property type_: ISchemaType read Get_type_;
    property scope: ISchemaComplexType read Get_scope;
    property defaultValue: WideString read Get_defaultValue;
    property fixedValue: WideString read Get_fixedValue;
    property use: SCHEMAUSE read Get_use;
    property isReference: WordBool read Get_isReference;
  end;

// *********************************************************************//
// DispIntf:  ISchemaAttributeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B6-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaAttributeDisp = dispinterface
    ['{50EA08B6-DD1B-4664-9A50-C2F40F4BD79A}']
    property type_: ISchemaType readonly dispid 1476;
    property scope: ISchemaComplexType readonly dispid 1469;
    property defaultValue: WideString readonly dispid 1431;
    property fixedValue: WideString readonly dispid 1438;
    property use: SCHEMAUSE readonly dispid 1479;
    property isReference: WordBool readonly dispid 1444;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaAttributeGroup
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BA-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaAttributeGroup = interface(ISchemaItem)
    ['{50EA08BA-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_anyAttribute: ISchemaAny; safecall;
    function Get_attributes: ISchemaItemCollection; safecall;
    property anyAttribute: ISchemaAny read Get_anyAttribute;
    property attributes: ISchemaItemCollection read Get_attributes;
  end;

// *********************************************************************//
// DispIntf:  ISchemaAttributeGroupDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BA-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaAttributeGroupDisp = dispinterface
    ['{50EA08BA-DD1B-4664-9A50-C2F40F4BD79A}']
    property anyAttribute: ISchemaAny readonly dispid 1425;
    property attributes: ISchemaItemCollection readonly dispid 1427;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaIdentityConstraint
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BD-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaIdentityConstraint = interface(ISchemaItem)
    ['{50EA08BD-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_selector: WideString; safecall;
    function Get_fields: ISchemaStringCollection; safecall;
    function Get_referencedKey: ISchemaIdentityConstraint; safecall;
    property selector: WideString read Get_selector;
    property fields: ISchemaStringCollection read Get_fields;
    property referencedKey: ISchemaIdentityConstraint read Get_referencedKey;
  end;

// *********************************************************************//
// DispIntf:  ISchemaIdentityConstraintDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BD-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaIdentityConstraintDisp = dispinterface
    ['{50EA08BD-DD1B-4664-9A50-C2F40F4BD79A}']
    property selector: WideString readonly dispid 1470;
    property fields: ISchemaStringCollection readonly dispid 1436;
    property referencedKey: ISchemaIdentityConstraint readonly dispid 1466;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaNotation
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BE-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaNotation = interface(ISchemaItem)
    ['{50EA08BE-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_systemIdentifier: WideString; safecall;
    function Get_publicIdentifier: WideString; safecall;
    property systemIdentifier: WideString read Get_systemIdentifier;
    property publicIdentifier: WideString read Get_publicIdentifier;
  end;

// *********************************************************************//
// DispIntf:  ISchemaNotationDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BE-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaNotationDisp = dispinterface
    ['{50EA08BE-DD1B-4664-9A50-C2F40F4BD79A}']
    property systemIdentifier: WideString readonly dispid 1473;
    property publicIdentifier: WideString readonly dispid 1465;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: IXMLDOMSelection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AA634FC7-5888-44A7-A257-3A47150D3A0E}
// *********************************************************************//
  IXMLDOMSelection = interface(IXMLDOMNodeList)
    ['{AA634FC7-5888-44A7-A257-3A47150D3A0E}']
    function Get_expr: WideString; safecall;
    procedure Set_expr(const expression: WideString); safecall;
    function Get_context: IXMLDOMNode; safecall;
    procedure _Set_context(const ppNode: IXMLDOMNode); safecall;
    function peekNode: IXMLDOMNode; safecall;
    function matches(const pNode: IXMLDOMNode): IXMLDOMNode; safecall;
    function removeNext: IXMLDOMNode; safecall;
    procedure removeAll; safecall;
    function clone: IXMLDOMSelection; safecall;
    function getProperty(const name: WideString): OleVariant; safecall;
    procedure setProperty(const name: WideString; value: OleVariant); safecall;
    property expr: WideString read Get_expr write Set_expr;
    property context: IXMLDOMNode read Get_context write _Set_context;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMSelectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AA634FC7-5888-44A7-A257-3A47150D3A0E}
// *********************************************************************//
  IXMLDOMSelectionDisp = dispinterface
    ['{AA634FC7-5888-44A7-A257-3A47150D3A0E}']
    property expr: WideString dispid 81;
    property context: IXMLDOMNode dispid 82;
    function peekNode: IXMLDOMNode; dispid 83;
    function matches(const pNode: IXMLDOMNode): IXMLDOMNode; dispid 84;
    function removeNext: IXMLDOMNode; dispid 85;
    procedure removeAll; dispid 86;
    function clone: IXMLDOMSelection; dispid 87;
    function getProperty(const name: WideString): OleVariant; dispid 88;
    procedure setProperty(const name: WideString; value: OleVariant); dispid 89;
    property item[index: Integer]: IXMLDOMNode readonly dispid 0; default;
    property length: Integer readonly dispid 74;
    function nextNode: IXMLDOMNode; dispid 76;
    procedure reset; dispid 77;
    property _newEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// DispIntf:  XMLDOMDocumentEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {3EFAA427-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  XMLDOMDocumentEvents = dispinterface
    ['{3EFAA427-272F-11D2-836F-0000F87A7782}']
    procedure ondataavailable; dispid 198;
    procedure onreadystatechange; dispid -609;
  end;

// *********************************************************************//
// Interface: IXMLDOMDocument2
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF95-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMDocument2 = interface(IXMLDOMDocument)
    ['{2933BF95-7B36-11D2-B20E-00C04F983E60}']
    function Get_namespaces: IXMLDOMSchemaCollection; safecall;
    function Get_schemas: OleVariant; safecall;
    procedure _Set_schemas(otherCollection: OleVariant); safecall;
    function validate: IXMLDOMParseError; safecall;
    procedure setProperty(const name: WideString; value: OleVariant); safecall;
    function getProperty(const name: WideString): OleVariant; safecall;
    property namespaces: IXMLDOMSchemaCollection read Get_namespaces;
    property schemas: OleVariant read Get_schemas write _Set_schemas;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMDocument2Disp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF95-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMDocument2Disp = dispinterface
    ['{2933BF95-7B36-11D2-B20E-00C04F983E60}']
    property namespaces: IXMLDOMSchemaCollection readonly dispid 201;
    property schemas: OleVariant dispid 202;
    function validate: IXMLDOMParseError; dispid 203;
    procedure setProperty(const name: WideString; value: OleVariant); dispid 204;
    function getProperty(const name: WideString): OleVariant; dispid 205;
    property doctype: IXMLDOMDocumentType readonly dispid 38;
    property implementation_: IXMLDOMImplementation readonly dispid 39;
    property documentElement: IXMLDOMElement dispid 40;
    function createElement(const tagName: WideString): IXMLDOMElement; dispid 41;
    function createDocumentFragment: IXMLDOMDocumentFragment; dispid 42;
    function createTextNode(const data: WideString): IXMLDOMText; dispid 43;
    function createComment(const data: WideString): IXMLDOMComment; dispid 44;
    function createCDATASection(const data: WideString): IXMLDOMCDATASection; dispid 45;
    function createProcessingInstruction(const target: WideString; const data: WideString): IXMLDOMProcessingInstruction; dispid 46;
    function createAttribute(const name: WideString): IXMLDOMAttribute; dispid 47;
    function createEntityReference(const name: WideString): IXMLDOMEntityReference; dispid 49;
    function getElementsByTagName(const tagName: WideString): IXMLDOMNodeList; dispid 50;
    function createNode(type_: OleVariant; const name: WideString; const namespaceURI: WideString): IXMLDOMNode; dispid 54;
    function nodeFromID(const idString: WideString): IXMLDOMNode; dispid 56;
    function load(xmlSource: OleVariant): WordBool; dispid 58;
    property readyState: Integer readonly dispid -525;
    property parseError: IXMLDOMParseError readonly dispid 59;
    property url: WideString readonly dispid 60;
    property async: WordBool dispid 61;
    procedure abort; dispid 62;
    function loadXML(const bstrXML: WideString): WordBool; dispid 63;
    procedure save(destination: OleVariant); dispid 64;
    property validateOnParse: WordBool dispid 65;
    property resolveExternals: WordBool dispid 66;
    property preserveWhiteSpace: WordBool dispid 67;
    property onreadystatechange: OleVariant writeonly dispid 68;
    property ondataavailable: OleVariant writeonly dispid 69;
    property ontransformnode: OleVariant writeonly dispid 70;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    function dataType: OleVariant; dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMDocument3
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF96-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMDocument3 = interface(IXMLDOMDocument2)
    ['{2933BF96-7B36-11D2-B20E-00C04F983E60}']
    function validateNode(const node: IXMLDOMNode): IXMLDOMParseError; safecall;
    function importNode(const node: IXMLDOMNode; deep: WordBool): IXMLDOMNode; safecall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMDocument3Disp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF96-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMDocument3Disp = dispinterface
    ['{2933BF96-7B36-11D2-B20E-00C04F983E60}']
    function validateNode(const node: IXMLDOMNode): IXMLDOMParseError; dispid 208;
    function importNode(const node: IXMLDOMNode; deep: WordBool): IXMLDOMNode; dispid 209;
    property namespaces: IXMLDOMSchemaCollection readonly dispid 201;
    property schemas: OleVariant dispid 202;
    function validate: IXMLDOMParseError; dispid 203;
    procedure setProperty(const name: WideString; value: OleVariant); dispid 204;
    function getProperty(const name: WideString): OleVariant; dispid 205;
    property doctype: IXMLDOMDocumentType readonly dispid 38;
    property implementation_: IXMLDOMImplementation readonly dispid 39;
    property documentElement: IXMLDOMElement dispid 40;
    function createElement(const tagName: WideString): IXMLDOMElement; dispid 41;
    function createDocumentFragment: IXMLDOMDocumentFragment; dispid 42;
    function createTextNode(const data: WideString): IXMLDOMText; dispid 43;
    function createComment(const data: WideString): IXMLDOMComment; dispid 44;
    function createCDATASection(const data: WideString): IXMLDOMCDATASection; dispid 45;
    function createProcessingInstruction(const target: WideString; const data: WideString): IXMLDOMProcessingInstruction; dispid 46;
    function createAttribute(const name: WideString): IXMLDOMAttribute; dispid 47;
    function createEntityReference(const name: WideString): IXMLDOMEntityReference; dispid 49;
    function getElementsByTagName(const tagName: WideString): IXMLDOMNodeList; dispid 50;
    function createNode(type_: OleVariant; const name: WideString; const namespaceURI: WideString): IXMLDOMNode; dispid 54;
    function nodeFromID(const idString: WideString): IXMLDOMNode; dispid 56;
    function load(xmlSource: OleVariant): WordBool; dispid 58;
    property readyState: Integer readonly dispid -525;
    property parseError: IXMLDOMParseError readonly dispid 59;
    property url: WideString readonly dispid 60;
    property async: WordBool dispid 61;
    procedure abort; dispid 62;
    function loadXML(const bstrXML: WideString): WordBool; dispid 63;
    procedure save(destination: OleVariant); dispid 64;
    property validateOnParse: WordBool dispid 65;
    property resolveExternals: WordBool dispid 66;
    property preserveWhiteSpace: WordBool dispid 67;
    property onreadystatechange: OleVariant writeonly dispid 68;
    property ondataavailable: OleVariant writeonly dispid 69;
    property ontransformnode: OleVariant writeonly dispid 70;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    function dataType: OleVariant; dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMSchemaCollection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {373984C8-B845-449B-91E7-45AC83036ADE}
// *********************************************************************//
  IXMLDOMSchemaCollection = interface(IDispatch)
    ['{373984C8-B845-449B-91E7-45AC83036ADE}']
    procedure add(const namespaceURI: WideString; var_: OleVariant); safecall;
    function get(const namespaceURI: WideString): IXMLDOMNode; safecall;
    procedure remove(const namespaceURI: WideString); safecall;
    function Get_length: Integer; safecall;
    function Get_namespaceURI(index: Integer): WideString; safecall;
    procedure addCollection(const otherCollection: IXMLDOMSchemaCollection); safecall;
    function Get__newEnum: IUnknown; safecall;
    property length: Integer read Get_length;
    property namespaceURI[index: Integer]: WideString read Get_namespaceURI; default;
    property _newEnum: IUnknown read Get__newEnum;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMSchemaCollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {373984C8-B845-449B-91E7-45AC83036ADE}
// *********************************************************************//
  IXMLDOMSchemaCollectionDisp = dispinterface
    ['{373984C8-B845-449B-91E7-45AC83036ADE}']
    procedure add(const namespaceURI: WideString; var_: OleVariant); dispid 3;
    function get(const namespaceURI: WideString): IXMLDOMNode; dispid 4;
    procedure remove(const namespaceURI: WideString); dispid 5;
    property length: Integer readonly dispid 6;
    property namespaceURI[index: Integer]: WideString readonly dispid 0; default;
    procedure addCollection(const otherCollection: IXMLDOMSchemaCollection); dispid 8;
    property _newEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IXMLDOMSchemaCollection2
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  IXMLDOMSchemaCollection2 = interface(IXMLDOMSchemaCollection)
    ['{50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}']
    procedure validate; safecall;
    procedure Set_validateOnLoad(validateOnLoad: WordBool); safecall;
    function Get_validateOnLoad: WordBool; safecall;
    function getSchema(const namespaceURI: WideString): ISchema; safecall;
    function getDeclaration(const node: IXMLDOMNode): ISchemaItem; safecall;
    property validateOnLoad: WordBool read Get_validateOnLoad write Set_validateOnLoad;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMSchemaCollection2Disp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  IXMLDOMSchemaCollection2Disp = dispinterface
    ['{50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}']
    procedure validate; dispid 1419;
    property validateOnLoad: WordBool dispid 1420;
    function getSchema(const namespaceURI: WideString): ISchema; dispid 1421;
    function getDeclaration(const node: IXMLDOMNode): ISchemaItem; dispid 1422;
    procedure add(const namespaceURI: WideString; var_: OleVariant); dispid 3;
    function get(const namespaceURI: WideString): IXMLDOMNode; dispid 4;
    procedure remove(const namespaceURI: WideString); dispid 5;
    property length: Integer readonly dispid 6;
    property namespaceURI[index: Integer]: WideString readonly dispid 0; default;
    procedure addCollection(const otherCollection: IXMLDOMSchemaCollection); dispid 8;
    property _newEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IXSLTemplate
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF93-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXSLTemplate = interface(IDispatch)
    ['{2933BF93-7B36-11D2-B20E-00C04F983E60}']
    procedure _Set_stylesheet(const stylesheet: IXMLDOMNode); safecall;
    function Get_stylesheet: IXMLDOMNode; safecall;
    function createProcessor: IXSLProcessor; safecall;
    property stylesheet: IXMLDOMNode read Get_stylesheet write _Set_stylesheet;
  end;

// *********************************************************************//
// DispIntf:  IXSLTemplateDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF93-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXSLTemplateDisp = dispinterface
    ['{2933BF93-7B36-11D2-B20E-00C04F983E60}']
    property stylesheet: IXMLDOMNode dispid 2;
    function createProcessor: IXSLProcessor; dispid 3;
  end;

// *********************************************************************//
// Interface: IXSLProcessor
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF92-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXSLProcessor = interface(IDispatch)
    ['{2933BF92-7B36-11D2-B20E-00C04F983E60}']
    procedure Set_input(pVar: OleVariant); safecall;
    function Get_input: OleVariant; safecall;
    function Get_ownerTemplate: IXSLTemplate; safecall;
    procedure setStartMode(const mode: WideString; const namespaceURI: WideString); safecall;
    function Get_startMode: WideString; safecall;
    function Get_startModeURI: WideString; safecall;
    procedure Set_output(pOutput: OleVariant); safecall;
    function Get_output: OleVariant; safecall;
    function transform: WordBool; safecall;
    procedure reset; safecall;
    function Get_readyState: Integer; safecall;
    procedure addParameter(const baseName: WideString; parameter: OleVariant; 
                           const namespaceURI: WideString); safecall;
    procedure addObject(const obj: IDispatch; const namespaceURI: WideString); safecall;
    function Get_stylesheet: IXMLDOMNode; safecall;
    property input: OleVariant read Get_input write Set_input;
    property ownerTemplate: IXSLTemplate read Get_ownerTemplate;
    property startMode: WideString read Get_startMode;
    property startModeURI: WideString read Get_startModeURI;
    property output: OleVariant read Get_output write Set_output;
    property readyState: Integer read Get_readyState;
    property stylesheet: IXMLDOMNode read Get_stylesheet;
  end;

// *********************************************************************//
// DispIntf:  IXSLProcessorDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF92-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXSLProcessorDisp = dispinterface
    ['{2933BF92-7B36-11D2-B20E-00C04F983E60}']
    property input: OleVariant dispid 2;
    property ownerTemplate: IXSLTemplate readonly dispid 3;
    procedure setStartMode(const mode: WideString; const namespaceURI: WideString); dispid 4;
    property startMode: WideString readonly dispid 5;
    property startModeURI: WideString readonly dispid 6;
    property output: OleVariant dispid 7;
    function transform: WordBool; dispid 8;
    procedure reset; dispid 9;
    property readyState: Integer readonly dispid 10;
    procedure addParameter(const baseName: WideString; parameter: OleVariant; 
                           const namespaceURI: WideString); dispid 11;
    procedure addObject(const obj: IDispatch; const namespaceURI: WideString); dispid 12;
    property stylesheet: IXMLDOMNode readonly dispid 13;
  end;

// *********************************************************************//
// Interface: IXMLHTTPRequest
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {ED8C108D-4349-11D2-91A4-00C04F7969E8}
// *********************************************************************//
  IXMLHTTPRequest = interface(IDispatch)
    ['{ED8C108D-4349-11D2-91A4-00C04F7969E8}']
    procedure open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; 
                   bstrUser: OleVariant; bstrPassword: OleVariant); safecall;
    procedure setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString); safecall;
    function getResponseHeader(const bstrHeader: WideString): WideString; safecall;
    function getAllResponseHeaders: WideString; safecall;
    procedure send(varBody: OleVariant); safecall;
    procedure abort; safecall;
    function Get_status: Integer; safecall;
    function Get_statusText: WideString; safecall;
    function Get_responseXML: IDispatch; safecall;
    function Get_responseText: WideString; safecall;
    function Get_responseBody: OleVariant; safecall;
    function Get_responseStream: OleVariant; safecall;
    function Get_readyState: Integer; safecall;
    procedure Set_onreadystatechange(const Param1: IDispatch); safecall;
    property status: Integer read Get_status;
    property statusText: WideString read Get_statusText;
    property responseXML: IDispatch read Get_responseXML;
    property responseText: WideString read Get_responseText;
    property responseBody: OleVariant read Get_responseBody;
    property responseStream: OleVariant read Get_responseStream;
    property readyState: Integer read Get_readyState;
    property onreadystatechange: IDispatch write Set_onreadystatechange;
  end;

// *********************************************************************//
// DispIntf:  IXMLHTTPRequestDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {ED8C108D-4349-11D2-91A4-00C04F7969E8}
// *********************************************************************//
  IXMLHTTPRequestDisp = dispinterface
    ['{ED8C108D-4349-11D2-91A4-00C04F7969E8}']
    procedure open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; 
                   bstrUser: OleVariant; bstrPassword: OleVariant); dispid 1;
    procedure setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString); dispid 2;
    function getResponseHeader(const bstrHeader: WideString): WideString; dispid 3;
    function getAllResponseHeaders: WideString; dispid 4;
    procedure send(varBody: OleVariant); dispid 5;
    procedure abort; dispid 6;
    property status: Integer readonly dispid 7;
    property statusText: WideString readonly dispid 8;
    property responseXML: IDispatch readonly dispid 9;
    property responseText: WideString readonly dispid 10;
    property responseBody: OleVariant readonly dispid 11;
    property responseStream: OleVariant readonly dispid 12;
    property readyState: Integer readonly dispid 13;
    property onreadystatechange: IDispatch writeonly dispid 14;
  end;

// *********************************************************************//
// Interface: IXMLHTTPRequest2
// Flags:     (0)
// GUID:      {E5D37DC0-552A-4D52-9CC0-A14D546FBD04}
// *********************************************************************//
  IXMLHTTPRequest2 = interface(IUnknown)
    ['{E5D37DC0-552A-4D52-9CC0-A14D546FBD04}']
    function open(pwszMethod: PWideChar; pwszUrl: PWideChar; 
                  const pStatusCallback: IXMLHTTPRequest2Callback; pwszUserName: PWideChar; 
                  pwszPassword: PWideChar; pwszProxyUserName: PWideChar; 
                  pwszProxyPassword: PWideChar): HResult; stdcall;
    function send(const pBody: ISequentialStream; cbBody: Largeuint): HResult; stdcall;
    function abort: HResult; stdcall;
    function SetCookie(var pCookie: tagXHR_COOKIE; out pdwCookieState: LongWord): HResult; stdcall;
    function SetCustomResponseStream(const pSequentialStream: ISequentialStream): HResult; stdcall;
    function setProperty(eProperty: XHR_PROPERTY; ullValue: Largeuint): HResult; stdcall;
    function setRequestHeader(pwszHeader: PWideChar; pwszValue: PWideChar): HResult; stdcall;
    function getAllResponseHeaders(out ppwszHeaders: PWideChar): HResult; stdcall;
    function GetCookie(pwszUrl: PWideChar; pwszName: PWideChar; dwFlags: LongWord; 
                       out pcCookies: LongWord; out ppCookies: PUserType1): HResult; stdcall;
    function getResponseHeader(pwszHeader: PWideChar; out ppwszValue: PWideChar): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IXMLHTTPRequest2Callback
// Flags:     (0)
// GUID:      {A44A9299-E321-40DE-8866-341B41669162}
// *********************************************************************//
  IXMLHTTPRequest2Callback = interface(IUnknown)
    ['{A44A9299-E321-40DE-8866-341B41669162}']
    function OnRedirect(const pXHR: IXMLHTTPRequest2; pwszRedirectUrl: PWideChar): HResult; stdcall;
    function OnHeadersAvailable(const pXHR: IXMLHTTPRequest2; dwStatus: LongWord; 
                                pwszStatus: PWideChar): HResult; stdcall;
    function ondataavailable(const pXHR: IXMLHTTPRequest2; const pResponseStream: ISequentialStream): HResult; stdcall;
    function OnResponseReceived(const pXHR: IXMLHTTPRequest2; 
                                const pResponseStream: ISequentialStream): HResult; stdcall;
    function OnError(const pXHR: IXMLHTTPRequest2; hrError: HResult): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISequentialStream
// Flags:     (0)
// GUID:      {0C733A30-2A1C-11CE-ADE5-00AA0044773D}
// *********************************************************************//
  ISequentialStream = interface(IUnknown)
    ['{0C733A30-2A1C-11CE-ADE5-00AA0044773D}']
    function RemoteRead(out pv: Byte; cb: LongWord; out pcbRead: LongWord): HResult; stdcall;
    function RemoteWrite(var pv: Byte; cb: LongWord; out pcbWritten: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IServerXMLHTTPRequest
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2E9196BF-13BA-4DD4-91CA-6C571F281495}
// *********************************************************************//
  IServerXMLHTTPRequest = interface(IXMLHTTPRequest)
    ['{2E9196BF-13BA-4DD4-91CA-6C571F281495}']
    procedure setTimeouts(resolveTimeout: Integer; connectTimeout: Integer; sendTimeout: Integer; 
                          receiveTimeout: Integer); safecall;
    function waitForResponse(timeoutInSeconds: OleVariant): WordBool; safecall;
    function getOption(option: SERVERXMLHTTP_OPTION): OleVariant; safecall;
    procedure setOption(option: SERVERXMLHTTP_OPTION; value: OleVariant); safecall;
  end;

// *********************************************************************//
// DispIntf:  IServerXMLHTTPRequestDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2E9196BF-13BA-4DD4-91CA-6C571F281495}
// *********************************************************************//
  IServerXMLHTTPRequestDisp = dispinterface
    ['{2E9196BF-13BA-4DD4-91CA-6C571F281495}']
    procedure setTimeouts(resolveTimeout: Integer; connectTimeout: Integer; sendTimeout: Integer; 
                          receiveTimeout: Integer); dispid 15;
    function waitForResponse(timeoutInSeconds: OleVariant): WordBool; dispid 16;
    function getOption(option: SERVERXMLHTTP_OPTION): OleVariant; dispid 17;
    procedure setOption(option: SERVERXMLHTTP_OPTION; value: OleVariant); dispid 18;
    procedure open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; 
                   bstrUser: OleVariant; bstrPassword: OleVariant); dispid 1;
    procedure setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString); dispid 2;
    function getResponseHeader(const bstrHeader: WideString): WideString; dispid 3;
    function getAllResponseHeaders: WideString; dispid 4;
    procedure send(varBody: OleVariant); dispid 5;
    procedure abort; dispid 6;
    property status: Integer readonly dispid 7;
    property statusText: WideString readonly dispid 8;
    property responseXML: IDispatch readonly dispid 9;
    property responseText: WideString readonly dispid 10;
    property responseBody: OleVariant readonly dispid 11;
    property responseStream: OleVariant readonly dispid 12;
    property readyState: Integer readonly dispid 13;
    property onreadystatechange: IDispatch writeonly dispid 14;
  end;

// *********************************************************************//
// Interface: IServerXMLHTTPRequest2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}
// *********************************************************************//
  IServerXMLHTTPRequest2 = interface(IServerXMLHTTPRequest)
    ['{2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}']
    procedure setProxy(proxySetting: SXH_PROXY_SETTING; varProxyServer: OleVariant; 
                       varBypassList: OleVariant); safecall;
    procedure setProxyCredentials(const bstrUserName: WideString; const bstrPassword: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IServerXMLHTTPRequest2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}
// *********************************************************************//
  IServerXMLHTTPRequest2Disp = dispinterface
    ['{2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}']
    procedure setProxy(proxySetting: SXH_PROXY_SETTING; varProxyServer: OleVariant; 
                       varBypassList: OleVariant); dispid 19;
    procedure setProxyCredentials(const bstrUserName: WideString; const bstrPassword: WideString); dispid 20;
    procedure setTimeouts(resolveTimeout: Integer; connectTimeout: Integer; sendTimeout: Integer; 
                          receiveTimeout: Integer); dispid 15;
    function waitForResponse(timeoutInSeconds: OleVariant): WordBool; dispid 16;
    function getOption(option: SERVERXMLHTTP_OPTION): OleVariant; dispid 17;
    procedure setOption(option: SERVERXMLHTTP_OPTION; value: OleVariant); dispid 18;
    procedure open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; 
                   bstrUser: OleVariant; bstrPassword: OleVariant); dispid 1;
    procedure setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString); dispid 2;
    function getResponseHeader(const bstrHeader: WideString): WideString; dispid 3;
    function getAllResponseHeaders: WideString; dispid 4;
    procedure send(varBody: OleVariant); dispid 5;
    procedure abort; dispid 6;
    property status: Integer readonly dispid 7;
    property statusText: WideString readonly dispid 8;
    property responseXML: IDispatch readonly dispid 9;
    property responseText: WideString readonly dispid 10;
    property responseBody: OleVariant readonly dispid 11;
    property responseStream: OleVariant readonly dispid 12;
    property readyState: Integer readonly dispid 13;
    property onreadystatechange: IDispatch writeonly dispid 14;
  end;

// *********************************************************************//
// Interface: IMXWriter
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}
// *********************************************************************//
  IMXWriter = interface(IDispatch)
    ['{4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}']
    procedure Set_output(varDestination: OleVariant); safecall;
    function Get_output: OleVariant; safecall;
    procedure Set_encoding(const strEncoding: WideString); safecall;
    function Get_encoding: WideString; safecall;
    procedure Set_byteOrderMark(fWriteByteOrderMark: WordBool); safecall;
    function Get_byteOrderMark: WordBool; safecall;
    procedure Set_indent(fIndentMode: WordBool); safecall;
    function Get_indent: WordBool; safecall;
    procedure Set_standalone(fValue: WordBool); safecall;
    function Get_standalone: WordBool; safecall;
    procedure Set_omitXMLDeclaration(fValue: WordBool); safecall;
    function Get_omitXMLDeclaration: WordBool; safecall;
    procedure Set_version(const strVersion: WideString); safecall;
    function Get_version: WideString; safecall;
    procedure Set_disableOutputEscaping(fValue: WordBool); safecall;
    function Get_disableOutputEscaping: WordBool; safecall;
    procedure flush; safecall;
    property output: OleVariant read Get_output write Set_output;
    property encoding: WideString read Get_encoding write Set_encoding;
    property byteOrderMark: WordBool read Get_byteOrderMark write Set_byteOrderMark;
    property indent: WordBool read Get_indent write Set_indent;
    property standalone: WordBool read Get_standalone write Set_standalone;
    property omitXMLDeclaration: WordBool read Get_omitXMLDeclaration write Set_omitXMLDeclaration;
    property version: WideString read Get_version write Set_version;
    property disableOutputEscaping: WordBool read Get_disableOutputEscaping write Set_disableOutputEscaping;
  end;

// *********************************************************************//
// DispIntf:  IMXWriterDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}
// *********************************************************************//
  IMXWriterDisp = dispinterface
    ['{4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}']
    property output: OleVariant dispid 1385;
    property encoding: WideString dispid 1387;
    property byteOrderMark: WordBool dispid 1388;
    property indent: WordBool dispid 1389;
    property standalone: WordBool dispid 1390;
    property omitXMLDeclaration: WordBool dispid 1391;
    property version: WideString dispid 1392;
    property disableOutputEscaping: WordBool dispid 1393;
    procedure flush; dispid 1394;
  end;

// *********************************************************************//
// Interface: ISAXDeclHandler
// Flags:     (16) Hidden
// GUID:      {862629AC-771A-47B2-8337-4E6843C1BE90}
// *********************************************************************//
  ISAXDeclHandler = interface(IUnknown)
    ['{862629AC-771A-47B2-8337-4E6843C1BE90}']
    function elementDecl(var pwchName: Word; cchName: SYSINT; var pwchModel: Word; cchModel: SYSINT): HResult; stdcall;
    function attributeDecl(var pwchElementName: Word; cchElementName: SYSINT; 
                           var pwchAttributeName: Word; cchAttributeName: SYSINT; 
                           var pwchType: Word; cchType: SYSINT; var pwchValueDefault: Word; 
                           cchValueDefault: SYSINT; var pwchValue: Word; cchValue: SYSINT): HResult; stdcall;
    function internalEntityDecl(var pwchName: Word; cchName: SYSINT; var pwchValue: Word; 
                                cchValue: SYSINT): HResult; stdcall;
    function externalEntityDecl(var pwchName: Word; cchName: SYSINT; var pwchPublicId: Word; 
                                cchPublicId: SYSINT; var pwchSystemId: Word; cchSystemId: SYSINT): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISAXLexicalHandler
// Flags:     (16) Hidden
// GUID:      {7F85D5F5-47A8-4497-BDA5-84BA04819EA6}
// *********************************************************************//
  ISAXLexicalHandler = interface(IUnknown)
    ['{7F85D5F5-47A8-4497-BDA5-84BA04819EA6}']
    function startDTD(var pwchName: Word; cchName: SYSINT; var pwchPublicId: Word; 
                      cchPublicId: SYSINT; var pwchSystemId: Word; cchSystemId: SYSINT): HResult; stdcall;
    function endDTD: HResult; stdcall;
    function startEntity(var pwchName: Word; cchName: SYSINT): HResult; stdcall;
    function endEntity(var pwchName: Word; cchName: SYSINT): HResult; stdcall;
    function startCDATA: HResult; stdcall;
    function endCDATA: HResult; stdcall;
    function comment(var pwchChars: Word; cchChars: SYSINT): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IVBSAXDeclHandler
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {E8917260-7579-4BE1-B5DD-7AFBFA6F077B}
// *********************************************************************//
  IVBSAXDeclHandler = interface(IDispatch)
    ['{E8917260-7579-4BE1-B5DD-7AFBFA6F077B}']
    procedure elementDecl(var strName: WideString; var strModel: WideString); safecall;
    procedure attributeDecl(var strElementName: WideString; var strAttributeName: WideString; 
                            var strType: WideString; var strValueDefault: WideString; 
                            var strValue: WideString); safecall;
    procedure internalEntityDecl(var strName: WideString; var strValue: WideString); safecall;
    procedure externalEntityDecl(var strName: WideString; var strPublicId: WideString; 
                                 var strSystemId: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXDeclHandlerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {E8917260-7579-4BE1-B5DD-7AFBFA6F077B}
// *********************************************************************//
  IVBSAXDeclHandlerDisp = dispinterface
    ['{E8917260-7579-4BE1-B5DD-7AFBFA6F077B}']
    procedure elementDecl(var strName: WideString; var strModel: WideString); dispid 1367;
    procedure attributeDecl(var strElementName: WideString; var strAttributeName: WideString; 
                            var strType: WideString; var strValueDefault: WideString; 
                            var strValue: WideString); dispid 1368;
    procedure internalEntityDecl(var strName: WideString; var strValue: WideString); dispid 1369;
    procedure externalEntityDecl(var strName: WideString; var strPublicId: WideString; 
                                 var strSystemId: WideString); dispid 1370;
  end;

// *********************************************************************//
// Interface: IVBSAXLexicalHandler
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {032AAC35-8C0E-4D9D-979F-E3B702935576}
// *********************************************************************//
  IVBSAXLexicalHandler = interface(IDispatch)
    ['{032AAC35-8C0E-4D9D-979F-E3B702935576}']
    procedure startDTD(var strName: WideString; var strPublicId: WideString; 
                       var strSystemId: WideString); safecall;
    procedure endDTD; safecall;
    procedure startEntity(var strName: WideString); safecall;
    procedure endEntity(var strName: WideString); safecall;
    procedure startCDATA; safecall;
    procedure endCDATA; safecall;
    procedure comment(var strChars: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXLexicalHandlerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {032AAC35-8C0E-4D9D-979F-E3B702935576}
// *********************************************************************//
  IVBSAXLexicalHandlerDisp = dispinterface
    ['{032AAC35-8C0E-4D9D-979F-E3B702935576}']
    procedure startDTD(var strName: WideString; var strPublicId: WideString; 
                       var strSystemId: WideString); dispid 1358;
    procedure endDTD; dispid 1359;
    procedure startEntity(var strName: WideString); dispid 1360;
    procedure endEntity(var strName: WideString); dispid 1361;
    procedure startCDATA; dispid 1362;
    procedure endCDATA; dispid 1363;
    procedure comment(var strChars: WideString); dispid 1364;
  end;

// *********************************************************************//
// Interface: IMXAttributes
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}
// *********************************************************************//
  IMXAttributes = interface(IDispatch)
    ['{F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}']
    procedure addAttribute(const strURI: WideString; const strLocalName: WideString; 
                           const strQName: WideString; const strType: WideString; 
                           const strValue: WideString); safecall;
    procedure addAttributeFromIndex(varAtts: OleVariant; nIndex: SYSINT); safecall;
    procedure clear; safecall;
    procedure removeAttribute(nIndex: SYSINT); safecall;
    procedure setAttribute(nIndex: SYSINT; const strURI: WideString; 
                           const strLocalName: WideString; const strQName: WideString; 
                           const strType: WideString; const strValue: WideString); safecall;
    procedure setAttributes(varAtts: OleVariant); safecall;
    procedure setLocalName(nIndex: SYSINT; const strLocalName: WideString); safecall;
    procedure setQName(nIndex: SYSINT; const strQName: WideString); safecall;
    procedure setType(nIndex: SYSINT; const strType: WideString); safecall;
    procedure setURI(nIndex: SYSINT; const strURI: WideString); safecall;
    procedure setValue(nIndex: SYSINT; const strValue: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMXAttributesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}
// *********************************************************************//
  IMXAttributesDisp = dispinterface
    ['{F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}']
    procedure addAttribute(const strURI: WideString; const strLocalName: WideString; 
                           const strQName: WideString; const strType: WideString; 
                           const strValue: WideString); dispid 1373;
    procedure addAttributeFromIndex(varAtts: OleVariant; nIndex: SYSINT); dispid 1383;
    procedure clear; dispid 1374;
    procedure removeAttribute(nIndex: SYSINT); dispid 1375;
    procedure setAttribute(nIndex: SYSINT; const strURI: WideString; 
                           const strLocalName: WideString; const strQName: WideString; 
                           const strType: WideString; const strValue: WideString); dispid 1376;
    procedure setAttributes(varAtts: OleVariant); dispid 1377;
    procedure setLocalName(nIndex: SYSINT; const strLocalName: WideString); dispid 1378;
    procedure setQName(nIndex: SYSINT; const strQName: WideString); dispid 1379;
    procedure setType(nIndex: SYSINT; const strType: WideString); dispid 1380;
    procedure setURI(nIndex: SYSINT; const strURI: WideString); dispid 1381;
    procedure setValue(nIndex: SYSINT; const strValue: WideString); dispid 1382;
  end;

// *********************************************************************//
// Interface: IVBMXNamespaceManager
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C90352F5-643C-4FBC-BB23-E996EB2D51FD}
// *********************************************************************//
  IVBMXNamespaceManager = interface(IDispatch)
    ['{C90352F5-643C-4FBC-BB23-E996EB2D51FD}']
    procedure Set_allowOverride(fOverride: WordBool); safecall;
    function Get_allowOverride: WordBool; safecall;
    procedure reset; safecall;
    procedure pushContext; safecall;
    procedure pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool); safecall;
    procedure popContext; safecall;
    procedure declarePrefix(const prefix: WideString; const namespaceURI: WideString); safecall;
    function getDeclaredPrefixes: IMXNamespacePrefixes; safecall;
    function getPrefixes(const namespaceURI: WideString): IMXNamespacePrefixes; safecall;
    function getURI(const prefix: WideString): OleVariant; safecall;
    function getURIFromNode(const strPrefix: WideString; const contextNode: IXMLDOMNode): OleVariant; safecall;
    property allowOverride: WordBool read Get_allowOverride write Set_allowOverride;
  end;

// *********************************************************************//
// DispIntf:  IVBMXNamespaceManagerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C90352F5-643C-4FBC-BB23-E996EB2D51FD}
// *********************************************************************//
  IVBMXNamespaceManagerDisp = dispinterface
    ['{C90352F5-643C-4FBC-BB23-E996EB2D51FD}']
    property allowOverride: WordBool dispid 1406;
    procedure reset; dispid 1407;
    procedure pushContext; dispid 1408;
    procedure pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool); dispid 1409;
    procedure popContext; dispid 1410;
    procedure declarePrefix(const prefix: WideString; const namespaceURI: WideString); dispid 1411;
    function getDeclaredPrefixes: IMXNamespacePrefixes; dispid 1412;
    function getPrefixes(const namespaceURI: WideString): IMXNamespacePrefixes; dispid 1413;
    function getURI(const prefix: WideString): OleVariant; dispid 1414;
    function getURIFromNode(const strPrefix: WideString; const contextNode: IXMLDOMNode): OleVariant; dispid 1415;
  end;

// *********************************************************************//
// Interface: IMXNamespaceManager
// Flags:     (16) Hidden
// GUID:      {C90352F6-643C-4FBC-BB23-E996EB2D51FD}
// *********************************************************************//
  IMXNamespaceManager = interface(IUnknown)
    ['{C90352F6-643C-4FBC-BB23-E996EB2D51FD}']
    function putAllowOverride(fOverride: WordBool): HResult; stdcall;
    function getAllowOverride(out fOverride: WordBool): HResult; stdcall;
    function reset: HResult; stdcall;
    function pushContext: HResult; stdcall;
    function pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool): HResult; stdcall;
    function popContext: HResult; stdcall;
    function declarePrefix(prefix: PWideChar; namespaceURI: PWideChar): HResult; stdcall;
    function getDeclaredPrefix(nIndex: Integer; var pwchPrefix: Word; var pcchPrefix: SYSINT): HResult; stdcall;
    function getPrefix(pwszNamespaceURI: PWideChar; nIndex: Integer; var pwchPrefix: Word; 
                       var pcchPrefix: SYSINT): HResult; stdcall;
    function getURI(pwchPrefix: PWideChar; const pContextNode: IXMLDOMNode; var pwchUri: Word; 
                    var pcchUri: SYSINT): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMXNamespacePrefixes
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C90352F4-643C-4FBC-BB23-E996EB2D51FD}
// *********************************************************************//
  IMXNamespacePrefixes = interface(IDispatch)
    ['{C90352F4-643C-4FBC-BB23-E996EB2D51FD}']
    function Get_item(index: Integer): WideString; safecall;
    function Get_length: Integer; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: WideString read Get_item; default;
    property length: Integer read Get_length;
    property _newEnum: IUnknown read Get__newEnum;
  end;

// *********************************************************************//
// DispIntf:  IMXNamespacePrefixesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C90352F4-643C-4FBC-BB23-E996EB2D51FD}
// *********************************************************************//
  IMXNamespacePrefixesDisp = dispinterface
    ['{C90352F4-643C-4FBC-BB23-E996EB2D51FD}']
    property item[index: Integer]: WideString readonly dispid 0; default;
    property length: Integer readonly dispid 1416;
    property _newEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// The Class CoDOMDocument60 provides a Create and CreateRemote method to          
// create instances of the default interface IXMLDOMDocument3 exposed by              
// the CoClass DOMDocument60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDOMDocument60 = class
    class function Create: IXMLDOMDocument3;
    class function CreateRemote(const MachineName: string): IXMLDOMDocument3;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDOMDocument60
// Help String      : W3C-DOM XML Document 6.0 (Apartment)
// Default Interface: IXMLDOMDocument3
// Def. Intf. DISP? : No
// Event   Interface: XMLDOMDocumentEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDOMDocument60Properties= class;
{$ENDIF}
  TDOMDocument60 = class(TOleServer)
  private
    FOnondataavailable: TNotifyEvent;
    FOnonreadystatechange: TNotifyEvent;
    FIntf:        IXMLDOMDocument3;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDOMDocument60Properties;
    function      GetServerProperties: TDOMDocument60Properties;
{$ENDIF}
    function      GetDefaultInterface: IXMLDOMDocument3;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IXMLDOMDocument3);
    procedure Disconnect; override;
    function validateNode(const node: IXMLDOMNode): IXMLDOMParseError;
    function importNode(const node: IXMLDOMNode; deep: WordBool): IXMLDOMNode;
    property DefaultInterface: IXMLDOMDocument3 read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDOMDocument60Properties read GetServerProperties;
{$ENDIF}
    property Onondataavailable: TNotifyEvent read FOnondataavailable write FOnondataavailable;
    property Ononreadystatechange: TNotifyEvent read FOnonreadystatechange write FOnonreadystatechange;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDOMDocument60
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDOMDocument60Properties = class(TPersistent)
  private
    FServer:    TDOMDocument60;
    function    GetDefaultInterface: IXMLDOMDocument3;
    constructor Create(AServer: TDOMDocument60);
  protected
  public
    property DefaultInterface: IXMLDOMDocument3 read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoFreeThreadedDOMDocument60 provides a Create and CreateRemote method to          
// create instances of the default interface IXMLDOMDocument3 exposed by              
// the CoClass FreeThreadedDOMDocument60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFreeThreadedDOMDocument60 = class
    class function Create: IXMLDOMDocument3;
    class function CreateRemote(const MachineName: string): IXMLDOMDocument3;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TFreeThreadedDOMDocument60
// Help String      : W3C-DOM XML Document 6.0 (Free threaded)
// Default Interface: IXMLDOMDocument3
// Def. Intf. DISP? : No
// Event   Interface: XMLDOMDocumentEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TFreeThreadedDOMDocument60Properties= class;
{$ENDIF}
  TFreeThreadedDOMDocument60 = class(TOleServer)
  private
    FOnondataavailable: TNotifyEvent;
    FOnonreadystatechange: TNotifyEvent;
    FIntf:        IXMLDOMDocument3;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TFreeThreadedDOMDocument60Properties;
    function      GetServerProperties: TFreeThreadedDOMDocument60Properties;
{$ENDIF}
    function      GetDefaultInterface: IXMLDOMDocument3;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IXMLDOMDocument3);
    procedure Disconnect; override;
    function validateNode(const node: IXMLDOMNode): IXMLDOMParseError;
    function importNode(const node: IXMLDOMNode; deep: WordBool): IXMLDOMNode;
    property DefaultInterface: IXMLDOMDocument3 read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TFreeThreadedDOMDocument60Properties read GetServerProperties;
{$ENDIF}
    property Onondataavailable: TNotifyEvent read FOnondataavailable write FOnondataavailable;
    property Ononreadystatechange: TNotifyEvent read FOnonreadystatechange write FOnonreadystatechange;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TFreeThreadedDOMDocument60
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TFreeThreadedDOMDocument60Properties = class(TPersistent)
  private
    FServer:    TFreeThreadedDOMDocument60;
    function    GetDefaultInterface: IXMLDOMDocument3;
    constructor Create(AServer: TFreeThreadedDOMDocument60);
  protected
  public
    property DefaultInterface: IXMLDOMDocument3 read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoXMLSchemaCache60 provides a Create and CreateRemote method to          
// create instances of the default interface IXMLDOMSchemaCollection2 exposed by              
// the CoClass XMLSchemaCache60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoXMLSchemaCache60 = class
    class function Create: IXMLDOMSchemaCollection2;
    class function CreateRemote(const MachineName: string): IXMLDOMSchemaCollection2;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TXMLSchemaCache60
// Help String      : XML Schema Cache 6.0
// Default Interface: IXMLDOMSchemaCollection2
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TXMLSchemaCache60Properties= class;
{$ENDIF}
  TXMLSchemaCache60 = class(TOleServer)
  private
    FIntf:        IXMLDOMSchemaCollection2;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TXMLSchemaCache60Properties;
    function      GetServerProperties: TXMLSchemaCache60Properties;
{$ENDIF}
    function      GetDefaultInterface: IXMLDOMSchemaCollection2;
  protected
    procedure InitServerData; override;
    procedure Set_validateOnLoad(validateOnLoad: WordBool);
    function Get_validateOnLoad: WordBool;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IXMLDOMSchemaCollection2);
    procedure Disconnect; override;
    procedure validate;
    function getSchema(const namespaceURI: WideString): ISchema;
    function getDeclaration(const node: IXMLDOMNode): ISchemaItem;
    property DefaultInterface: IXMLDOMSchemaCollection2 read GetDefaultInterface;
    property validateOnLoad: WordBool read Get_validateOnLoad write Set_validateOnLoad;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TXMLSchemaCache60Properties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TXMLSchemaCache60
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TXMLSchemaCache60Properties = class(TPersistent)
  private
    FServer:    TXMLSchemaCache60;
    function    GetDefaultInterface: IXMLDOMSchemaCollection2;
    constructor Create(AServer: TXMLSchemaCache60);
  protected
    procedure Set_validateOnLoad(validateOnLoad: WordBool);
    function Get_validateOnLoad: WordBool;
  public
    property DefaultInterface: IXMLDOMSchemaCollection2 read GetDefaultInterface;
  published
    property validateOnLoad: WordBool read Get_validateOnLoad write Set_validateOnLoad;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoXSLTemplate60 provides a Create and CreateRemote method to          
// create instances of the default interface IXSLTemplate exposed by              
// the CoClass XSLTemplate60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoXSLTemplate60 = class
    class function Create: IXSLTemplate;
    class function CreateRemote(const MachineName: string): IXSLTemplate;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TXSLTemplate60
// Help String      : XSL Stylesheet Cache 6.0
// Default Interface: IXSLTemplate
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TXSLTemplate60Properties= class;
{$ENDIF}
  TXSLTemplate60 = class(TOleServer)
  private
    FIntf:        IXSLTemplate;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TXSLTemplate60Properties;
    function      GetServerProperties: TXSLTemplate60Properties;
{$ENDIF}
    function      GetDefaultInterface: IXSLTemplate;
  protected
    procedure InitServerData; override;
    procedure _Set_stylesheet(const stylesheet: IXMLDOMNode);
    function Get_stylesheet: IXMLDOMNode;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IXSLTemplate);
    procedure Disconnect; override;
    function createProcessor: IXSLProcessor;
    property DefaultInterface: IXSLTemplate read GetDefaultInterface;
    property stylesheet: IXMLDOMNode read Get_stylesheet write _Set_stylesheet;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TXSLTemplate60Properties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TXSLTemplate60
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TXSLTemplate60Properties = class(TPersistent)
  private
    FServer:    TXSLTemplate60;
    function    GetDefaultInterface: IXSLTemplate;
    constructor Create(AServer: TXSLTemplate60);
  protected
    procedure _Set_stylesheet(const stylesheet: IXMLDOMNode);
    function Get_stylesheet: IXMLDOMNode;
  public
    property DefaultInterface: IXSLTemplate read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoXMLHTTP60 provides a Create and CreateRemote method to          
// create instances of the default interface IXMLHTTPRequest exposed by              
// the CoClass XMLHTTP60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoXMLHTTP60 = class
    class function Create: IXMLHTTPRequest;
    class function CreateRemote(const MachineName: string): IXMLHTTPRequest;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TXMLHTTP60
// Help String      : XML HTTP Request class 6.0
// Default Interface: IXMLHTTPRequest
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TXMLHTTP60Properties= class;
{$ENDIF}
  TXMLHTTP60 = class(TOleServer)
  private
    FIntf:        IXMLHTTPRequest;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TXMLHTTP60Properties;
    function      GetServerProperties: TXMLHTTP60Properties;
{$ENDIF}
    function      GetDefaultInterface: IXMLHTTPRequest;
  protected
    procedure InitServerData; override;
    function Get_status: Integer;
    function Get_statusText: WideString;
    function Get_responseXML: IDispatch;
    function Get_responseText: WideString;
    function Get_responseBody: OleVariant;
    function Get_responseStream: OleVariant;
    function Get_readyState: Integer;
    procedure Set_onreadystatechange(const Param1: IDispatch);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IXMLHTTPRequest);
    procedure Disconnect; override;
    procedure open(const bstrMethod: WideString; const bstrUrl: WideString); overload;
    procedure open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant); overload;
    procedure open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; 
                   bstrUser: OleVariant); overload;
    procedure open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; 
                   bstrUser: OleVariant; bstrPassword: OleVariant); overload;
    procedure setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString);
    function getResponseHeader(const bstrHeader: WideString): WideString;
    function getAllResponseHeaders: WideString;
    procedure send; overload;
    procedure send(varBody: OleVariant); overload;
    procedure abort;
    property DefaultInterface: IXMLHTTPRequest read GetDefaultInterface;
    property status: Integer read Get_status;
    property statusText: WideString read Get_statusText;
    property responseXML: IDispatch read Get_responseXML;
    property responseText: WideString read Get_responseText;
    property responseBody: OleVariant read Get_responseBody;
    property responseStream: OleVariant read Get_responseStream;
    property readyState: Integer read Get_readyState;
    property onreadystatechange: IDispatch write Set_onreadystatechange;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TXMLHTTP60Properties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TXMLHTTP60
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TXMLHTTP60Properties = class(TPersistent)
  private
    FServer:    TXMLHTTP60;
    function    GetDefaultInterface: IXMLHTTPRequest;
    constructor Create(AServer: TXMLHTTP60);
  protected
    function Get_status: Integer;
    function Get_statusText: WideString;
    function Get_responseXML: IDispatch;
    function Get_responseText: WideString;
    function Get_responseBody: OleVariant;
    function Get_responseStream: OleVariant;
    function Get_readyState: Integer;
    procedure Set_onreadystatechange(const Param1: IDispatch);
  public
    property DefaultInterface: IXMLHTTPRequest read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoFreeThreadedXMLHTTP60 provides a Create and CreateRemote method to          
// create instances of the default interface IXMLHTTPRequest2 exposed by              
// the CoClass FreeThreadedXMLHTTP60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFreeThreadedXMLHTTP60 = class
    class function Create: IXMLHTTPRequest2;
    class function CreateRemote(const MachineName: string): IXMLHTTPRequest2;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TFreeThreadedXMLHTTP60
// Help String      : Free Threaded XML HTTP Request class 6.0
// Default Interface: IXMLHTTPRequest2
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TFreeThreadedXMLHTTP60Properties= class;
{$ENDIF}
  TFreeThreadedXMLHTTP60 = class(TOleServer)
  private
    FIntf:        IXMLHTTPRequest2;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TFreeThreadedXMLHTTP60Properties;
    function      GetServerProperties: TFreeThreadedXMLHTTP60Properties;
{$ENDIF}
    function      GetDefaultInterface: IXMLHTTPRequest2;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IXMLHTTPRequest2);
    procedure Disconnect; override;
    function open(pwszMethod: PWideChar; pwszUrl: PWideChar; 
                  const pStatusCallback: IXMLHTTPRequest2Callback; pwszUserName: PWideChar; 
                  pwszPassword: PWideChar; pwszProxyUserName: PWideChar; 
                  pwszProxyPassword: PWideChar): HResult;
    function send(const pBody: ISequentialStream; cbBody: Largeuint): HResult;
    function abort: HResult;
    function SetCookie(var pCookie: tagXHR_COOKIE; out pdwCookieState: LongWord): HResult;
    function SetCustomResponseStream(const pSequentialStream: ISequentialStream): HResult;
    function setProperty(eProperty: XHR_PROPERTY; ullValue: Largeuint): HResult;
    function setRequestHeader(pwszHeader: PWideChar; pwszValue: PWideChar): HResult;
    function getAllResponseHeaders(out ppwszHeaders: PWideChar): HResult;
    function GetCookie(pwszUrl: PWideChar; pwszName: PWideChar; dwFlags: LongWord; 
                       out pcCookies: LongWord; out ppCookies: PUserType1): HResult;
    function getResponseHeader(pwszHeader: PWideChar; out ppwszValue: PWideChar): HResult;
    property DefaultInterface: IXMLHTTPRequest2 read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TFreeThreadedXMLHTTP60Properties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TFreeThreadedXMLHTTP60
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TFreeThreadedXMLHTTP60Properties = class(TPersistent)
  private
    FServer:    TFreeThreadedXMLHTTP60;
    function    GetDefaultInterface: IXMLHTTPRequest2;
    constructor Create(AServer: TFreeThreadedXMLHTTP60);
  protected
  public
    property DefaultInterface: IXMLHTTPRequest2 read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoServerXMLHTTP60 provides a Create and CreateRemote method to          
// create instances of the default interface IServerXMLHTTPRequest2 exposed by              
// the CoClass ServerXMLHTTP60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoServerXMLHTTP60 = class
    class function Create: IServerXMLHTTPRequest2;
    class function CreateRemote(const MachineName: string): IServerXMLHTTPRequest2;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TServerXMLHTTP60
// Help String      : Server XML HTTP Request 6.0 
// Default Interface: IServerXMLHTTPRequest2
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TServerXMLHTTP60Properties= class;
{$ENDIF}
  TServerXMLHTTP60 = class(TOleServer)
  private
    FIntf:        IServerXMLHTTPRequest2;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TServerXMLHTTP60Properties;
    function      GetServerProperties: TServerXMLHTTP60Properties;
{$ENDIF}
    function      GetDefaultInterface: IServerXMLHTTPRequest2;
  protected
    procedure InitServerData; override;
    function Get_status: Integer;
    function Get_statusText: WideString;
    function Get_responseXML: IDispatch;
    function Get_responseText: WideString;
    function Get_responseBody: OleVariant;
    function Get_responseStream: OleVariant;
    function Get_readyState: Integer;
    procedure Set_onreadystatechange(const Param1: IDispatch);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IServerXMLHTTPRequest2);
    procedure Disconnect; override;
    procedure open(const bstrMethod: WideString; const bstrUrl: WideString); overload;
    procedure open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant); overload;
    procedure open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; 
                   bstrUser: OleVariant); overload;
    procedure open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; 
                   bstrUser: OleVariant; bstrPassword: OleVariant); overload;
    procedure setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString);
    function getResponseHeader(const bstrHeader: WideString): WideString;
    function getAllResponseHeaders: WideString;
    procedure send; overload;
    procedure send(varBody: OleVariant); overload;
    procedure abort;
    procedure setTimeouts(resolveTimeout: Integer; connectTimeout: Integer; sendTimeout: Integer; 
                          receiveTimeout: Integer);
    function waitForResponse: WordBool; overload;
    function waitForResponse(timeoutInSeconds: OleVariant): WordBool; overload;
    function getOption(option: SERVERXMLHTTP_OPTION): OleVariant;
    procedure setOption(option: SERVERXMLHTTP_OPTION; value: OleVariant);
    procedure setProxy(proxySetting: SXH_PROXY_SETTING); overload;
    procedure setProxy(proxySetting: SXH_PROXY_SETTING; varProxyServer: OleVariant); overload;
    procedure setProxy(proxySetting: SXH_PROXY_SETTING; varProxyServer: OleVariant; 
                       varBypassList: OleVariant); overload;
    procedure setProxyCredentials(const bstrUserName: WideString; const bstrPassword: WideString);
    property DefaultInterface: IServerXMLHTTPRequest2 read GetDefaultInterface;
    property status: Integer read Get_status;
    property statusText: WideString read Get_statusText;
    property responseXML: IDispatch read Get_responseXML;
    property responseText: WideString read Get_responseText;
    property responseBody: OleVariant read Get_responseBody;
    property responseStream: OleVariant read Get_responseStream;
    property readyState: Integer read Get_readyState;
    property onreadystatechange: IDispatch write Set_onreadystatechange;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TServerXMLHTTP60Properties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TServerXMLHTTP60
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TServerXMLHTTP60Properties = class(TPersistent)
  private
    FServer:    TServerXMLHTTP60;
    function    GetDefaultInterface: IServerXMLHTTPRequest2;
    constructor Create(AServer: TServerXMLHTTP60);
  protected
    function Get_status: Integer;
    function Get_statusText: WideString;
    function Get_responseXML: IDispatch;
    function Get_responseText: WideString;
    function Get_responseBody: OleVariant;
    function Get_responseStream: OleVariant;
    function Get_readyState: Integer;
    procedure Set_onreadystatechange(const Param1: IDispatch);
  public
    property DefaultInterface: IServerXMLHTTPRequest2 read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoSAXXMLReader60 provides a Create and CreateRemote method to          
// create instances of the default interface IVBSAXXMLReader exposed by              
// the CoClass SAXXMLReader60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSAXXMLReader60 = class
    class function Create: IVBSAXXMLReader;
    class function CreateRemote(const MachineName: string): IVBSAXXMLReader;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSAXXMLReader60
// Help String      : SAX XML Reader 6.0
// Default Interface: IVBSAXXMLReader
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSAXXMLReader60Properties= class;
{$ENDIF}
  TSAXXMLReader60 = class(TOleServer)
  private
    FIntf:        IVBSAXXMLReader;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TSAXXMLReader60Properties;
    function      GetServerProperties: TSAXXMLReader60Properties;
{$ENDIF}
    function      GetDefaultInterface: IVBSAXXMLReader;
  protected
    procedure InitServerData; override;
    function Get_entityResolver: IVBSAXEntityResolver;
    procedure _Set_entityResolver(const oResolver: IVBSAXEntityResolver);
    function Get_contentHandler: IVBSAXContentHandler;
    procedure _Set_contentHandler(const oHandler: IVBSAXContentHandler);
    function Get_dtdHandler: IVBSAXDTDHandler;
    procedure _Set_dtdHandler(const oHandler: IVBSAXDTDHandler);
    function Get_errorHandler: IVBSAXErrorHandler;
    procedure _Set_errorHandler(const oHandler: IVBSAXErrorHandler);
    function Get_baseURL: WideString;
    procedure Set_baseURL(const strBaseURL: WideString);
    function Get_secureBaseURL: WideString;
    procedure Set_secureBaseURL(const strSecureBaseURL: WideString);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IVBSAXXMLReader);
    procedure Disconnect; override;
    function getFeature(const strName: WideString): WordBool;
    procedure putFeature(const strName: WideString; fValue: WordBool);
    function getProperty(const strName: WideString): OleVariant;
    procedure putProperty(const strName: WideString; varValue: OleVariant);
    procedure parse; overload;
    procedure parse(varInput: OleVariant); overload;
    procedure parseURL(const strURL: WideString);
    property DefaultInterface: IVBSAXXMLReader read GetDefaultInterface;
    property entityResolver: IVBSAXEntityResolver read Get_entityResolver write _Set_entityResolver;
    property contentHandler: IVBSAXContentHandler read Get_contentHandler write _Set_contentHandler;
    property dtdHandler: IVBSAXDTDHandler read Get_dtdHandler write _Set_dtdHandler;
    property errorHandler: IVBSAXErrorHandler read Get_errorHandler write _Set_errorHandler;
    property baseURL: WideString read Get_baseURL write Set_baseURL;
    property secureBaseURL: WideString read Get_secureBaseURL write Set_secureBaseURL;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSAXXMLReader60Properties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TSAXXMLReader60
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TSAXXMLReader60Properties = class(TPersistent)
  private
    FServer:    TSAXXMLReader60;
    function    GetDefaultInterface: IVBSAXXMLReader;
    constructor Create(AServer: TSAXXMLReader60);
  protected
    function Get_entityResolver: IVBSAXEntityResolver;
    procedure _Set_entityResolver(const oResolver: IVBSAXEntityResolver);
    function Get_contentHandler: IVBSAXContentHandler;
    procedure _Set_contentHandler(const oHandler: IVBSAXContentHandler);
    function Get_dtdHandler: IVBSAXDTDHandler;
    procedure _Set_dtdHandler(const oHandler: IVBSAXDTDHandler);
    function Get_errorHandler: IVBSAXErrorHandler;
    procedure _Set_errorHandler(const oHandler: IVBSAXErrorHandler);
    function Get_baseURL: WideString;
    procedure Set_baseURL(const strBaseURL: WideString);
    function Get_secureBaseURL: WideString;
    procedure Set_secureBaseURL(const strSecureBaseURL: WideString);
  public
    property DefaultInterface: IVBSAXXMLReader read GetDefaultInterface;
  published
    property baseURL: WideString read Get_baseURL write Set_baseURL;
    property secureBaseURL: WideString read Get_secureBaseURL write Set_secureBaseURL;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoMXXMLWriter60 provides a Create and CreateRemote method to          
// create instances of the default interface IMXWriter exposed by              
// the CoClass MXXMLWriter60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMXXMLWriter60 = class
    class function Create: IMXWriter;
    class function CreateRemote(const MachineName: string): IMXWriter;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TMXXMLWriter60
// Help String      : Microsoft XML Writer 6.0
// Default Interface: IMXWriter
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TMXXMLWriter60Properties= class;
{$ENDIF}
  TMXXMLWriter60 = class(TOleServer)
  private
    FIntf:        IMXWriter;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TMXXMLWriter60Properties;
    function      GetServerProperties: TMXXMLWriter60Properties;
{$ENDIF}
    function      GetDefaultInterface: IMXWriter;
  protected
    procedure InitServerData; override;
    procedure Set_output(varDestination: OleVariant);
    function Get_output: OleVariant;
    procedure Set_encoding(const strEncoding: WideString);
    function Get_encoding: WideString;
    procedure Set_byteOrderMark(fWriteByteOrderMark: WordBool);
    function Get_byteOrderMark: WordBool;
    procedure Set_indent(fIndentMode: WordBool);
    function Get_indent: WordBool;
    procedure Set_standalone(fValue: WordBool);
    function Get_standalone: WordBool;
    procedure Set_omitXMLDeclaration(fValue: WordBool);
    function Get_omitXMLDeclaration: WordBool;
    procedure Set_version(const strVersion: WideString);
    function Get_version: WideString;
    procedure Set_disableOutputEscaping(fValue: WordBool);
    function Get_disableOutputEscaping: WordBool;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMXWriter);
    procedure Disconnect; override;
    procedure flush;
    property DefaultInterface: IMXWriter read GetDefaultInterface;
    property output: OleVariant read Get_output write Set_output;
    property encoding: WideString read Get_encoding write Set_encoding;
    property byteOrderMark: WordBool read Get_byteOrderMark write Set_byteOrderMark;
    property indent: WordBool read Get_indent write Set_indent;
    property standalone: WordBool read Get_standalone write Set_standalone;
    property omitXMLDeclaration: WordBool read Get_omitXMLDeclaration write Set_omitXMLDeclaration;
    property version: WideString read Get_version write Set_version;
    property disableOutputEscaping: WordBool read Get_disableOutputEscaping write Set_disableOutputEscaping;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TMXXMLWriter60Properties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TMXXMLWriter60
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TMXXMLWriter60Properties = class(TPersistent)
  private
    FServer:    TMXXMLWriter60;
    function    GetDefaultInterface: IMXWriter;
    constructor Create(AServer: TMXXMLWriter60);
  protected
    procedure Set_output(varDestination: OleVariant);
    function Get_output: OleVariant;
    procedure Set_encoding(const strEncoding: WideString);
    function Get_encoding: WideString;
    procedure Set_byteOrderMark(fWriteByteOrderMark: WordBool);
    function Get_byteOrderMark: WordBool;
    procedure Set_indent(fIndentMode: WordBool);
    function Get_indent: WordBool;
    procedure Set_standalone(fValue: WordBool);
    function Get_standalone: WordBool;
    procedure Set_omitXMLDeclaration(fValue: WordBool);
    function Get_omitXMLDeclaration: WordBool;
    procedure Set_version(const strVersion: WideString);
    function Get_version: WideString;
    procedure Set_disableOutputEscaping(fValue: WordBool);
    function Get_disableOutputEscaping: WordBool;
  public
    property DefaultInterface: IMXWriter read GetDefaultInterface;
  published
    property encoding: WideString read Get_encoding write Set_encoding;
    property byteOrderMark: WordBool read Get_byteOrderMark write Set_byteOrderMark;
    property indent: WordBool read Get_indent write Set_indent;
    property standalone: WordBool read Get_standalone write Set_standalone;
    property omitXMLDeclaration: WordBool read Get_omitXMLDeclaration write Set_omitXMLDeclaration;
    property version: WideString read Get_version write Set_version;
    property disableOutputEscaping: WordBool read Get_disableOutputEscaping write Set_disableOutputEscaping;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoMXHTMLWriter60 provides a Create and CreateRemote method to          
// create instances of the default interface IMXWriter exposed by              
// the CoClass MXHTMLWriter60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMXHTMLWriter60 = class
    class function Create: IMXWriter;
    class function CreateRemote(const MachineName: string): IMXWriter;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TMXHTMLWriter60
// Help String      : Microsoft HTML Writer 6.0
// Default Interface: IMXWriter
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TMXHTMLWriter60Properties= class;
{$ENDIF}
  TMXHTMLWriter60 = class(TOleServer)
  private
    FIntf:        IMXWriter;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TMXHTMLWriter60Properties;
    function      GetServerProperties: TMXHTMLWriter60Properties;
{$ENDIF}
    function      GetDefaultInterface: IMXWriter;
  protected
    procedure InitServerData; override;
    procedure Set_output(varDestination: OleVariant);
    function Get_output: OleVariant;
    procedure Set_encoding(const strEncoding: WideString);
    function Get_encoding: WideString;
    procedure Set_byteOrderMark(fWriteByteOrderMark: WordBool);
    function Get_byteOrderMark: WordBool;
    procedure Set_indent(fIndentMode: WordBool);
    function Get_indent: WordBool;
    procedure Set_standalone(fValue: WordBool);
    function Get_standalone: WordBool;
    procedure Set_omitXMLDeclaration(fValue: WordBool);
    function Get_omitXMLDeclaration: WordBool;
    procedure Set_version(const strVersion: WideString);
    function Get_version: WideString;
    procedure Set_disableOutputEscaping(fValue: WordBool);
    function Get_disableOutputEscaping: WordBool;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMXWriter);
    procedure Disconnect; override;
    procedure flush;
    property DefaultInterface: IMXWriter read GetDefaultInterface;
    property output: OleVariant read Get_output write Set_output;
    property encoding: WideString read Get_encoding write Set_encoding;
    property byteOrderMark: WordBool read Get_byteOrderMark write Set_byteOrderMark;
    property indent: WordBool read Get_indent write Set_indent;
    property standalone: WordBool read Get_standalone write Set_standalone;
    property omitXMLDeclaration: WordBool read Get_omitXMLDeclaration write Set_omitXMLDeclaration;
    property version: WideString read Get_version write Set_version;
    property disableOutputEscaping: WordBool read Get_disableOutputEscaping write Set_disableOutputEscaping;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TMXHTMLWriter60Properties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TMXHTMLWriter60
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TMXHTMLWriter60Properties = class(TPersistent)
  private
    FServer:    TMXHTMLWriter60;
    function    GetDefaultInterface: IMXWriter;
    constructor Create(AServer: TMXHTMLWriter60);
  protected
    procedure Set_output(varDestination: OleVariant);
    function Get_output: OleVariant;
    procedure Set_encoding(const strEncoding: WideString);
    function Get_encoding: WideString;
    procedure Set_byteOrderMark(fWriteByteOrderMark: WordBool);
    function Get_byteOrderMark: WordBool;
    procedure Set_indent(fIndentMode: WordBool);
    function Get_indent: WordBool;
    procedure Set_standalone(fValue: WordBool);
    function Get_standalone: WordBool;
    procedure Set_omitXMLDeclaration(fValue: WordBool);
    function Get_omitXMLDeclaration: WordBool;
    procedure Set_version(const strVersion: WideString);
    function Get_version: WideString;
    procedure Set_disableOutputEscaping(fValue: WordBool);
    function Get_disableOutputEscaping: WordBool;
  public
    property DefaultInterface: IMXWriter read GetDefaultInterface;
  published
    property encoding: WideString read Get_encoding write Set_encoding;
    property byteOrderMark: WordBool read Get_byteOrderMark write Set_byteOrderMark;
    property indent: WordBool read Get_indent write Set_indent;
    property standalone: WordBool read Get_standalone write Set_standalone;
    property omitXMLDeclaration: WordBool read Get_omitXMLDeclaration write Set_omitXMLDeclaration;
    property version: WideString read Get_version write Set_version;
    property disableOutputEscaping: WordBool read Get_disableOutputEscaping write Set_disableOutputEscaping;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoSAXAttributes60 provides a Create and CreateRemote method to          
// create instances of the default interface IMXAttributes exposed by              
// the CoClass SAXAttributes60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSAXAttributes60 = class
    class function Create: IMXAttributes;
    class function CreateRemote(const MachineName: string): IMXAttributes;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSAXAttributes60
// Help String      : SAX Attributes 6.0
// Default Interface: IMXAttributes
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSAXAttributes60Properties= class;
{$ENDIF}
  TSAXAttributes60 = class(TOleServer)
  private
    FIntf:        IMXAttributes;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TSAXAttributes60Properties;
    function      GetServerProperties: TSAXAttributes60Properties;
{$ENDIF}
    function      GetDefaultInterface: IMXAttributes;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMXAttributes);
    procedure Disconnect; override;
    procedure addAttribute(const strURI: WideString; const strLocalName: WideString; 
                           const strQName: WideString; const strType: WideString; 
                           const strValue: WideString);
    procedure addAttributeFromIndex(varAtts: OleVariant; nIndex: SYSINT);
    procedure clear;
    procedure removeAttribute(nIndex: SYSINT);
    procedure setAttribute(nIndex: SYSINT; const strURI: WideString; 
                           const strLocalName: WideString; const strQName: WideString; 
                           const strType: WideString; const strValue: WideString);
    procedure setAttributes(varAtts: OleVariant);
    procedure setLocalName(nIndex: SYSINT; const strLocalName: WideString);
    procedure setQName(nIndex: SYSINT; const strQName: WideString);
    procedure setType(nIndex: SYSINT; const strType: WideString);
    procedure setURI(nIndex: SYSINT; const strURI: WideString);
    procedure setValue(nIndex: SYSINT; const strValue: WideString);
    property DefaultInterface: IMXAttributes read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSAXAttributes60Properties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TSAXAttributes60
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TSAXAttributes60Properties = class(TPersistent)
  private
    FServer:    TSAXAttributes60;
    function    GetDefaultInterface: IMXAttributes;
    constructor Create(AServer: TSAXAttributes60);
  protected
  public
    property DefaultInterface: IMXAttributes read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoMXNamespaceManager60 provides a Create and CreateRemote method to          
// create instances of the default interface IVBMXNamespaceManager exposed by              
// the CoClass MXNamespaceManager60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMXNamespaceManager60 = class
    class function Create: IVBMXNamespaceManager;
    class function CreateRemote(const MachineName: string): IVBMXNamespaceManager;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TMXNamespaceManager60
// Help String      : MX Namespace Manager 6.0
// Default Interface: IVBMXNamespaceManager
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TMXNamespaceManager60Properties= class;
{$ENDIF}
  TMXNamespaceManager60 = class(TOleServer)
  private
    FIntf:        IVBMXNamespaceManager;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TMXNamespaceManager60Properties;
    function      GetServerProperties: TMXNamespaceManager60Properties;
{$ENDIF}
    function      GetDefaultInterface: IVBMXNamespaceManager;
  protected
    procedure InitServerData; override;
    procedure Set_allowOverride(fOverride: WordBool);
    function Get_allowOverride: WordBool;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IVBMXNamespaceManager);
    procedure Disconnect; override;
    procedure reset;
    procedure pushContext;
    procedure pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool);
    procedure popContext;
    procedure declarePrefix(const prefix: WideString; const namespaceURI: WideString);
    function getDeclaredPrefixes: IMXNamespacePrefixes;
    function getPrefixes(const namespaceURI: WideString): IMXNamespacePrefixes;
    function getURI(const prefix: WideString): OleVariant;
    function getURIFromNode(const strPrefix: WideString; const contextNode: IXMLDOMNode): OleVariant;
    property DefaultInterface: IVBMXNamespaceManager read GetDefaultInterface;
    property allowOverride: WordBool read Get_allowOverride write Set_allowOverride;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TMXNamespaceManager60Properties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TMXNamespaceManager60
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TMXNamespaceManager60Properties = class(TPersistent)
  private
    FServer:    TMXNamespaceManager60;
    function    GetDefaultInterface: IVBMXNamespaceManager;
    constructor Create(AServer: TMXNamespaceManager60);
  protected
    procedure Set_allowOverride(fOverride: WordBool);
    function Get_allowOverride: WordBool;
  public
    property DefaultInterface: IVBMXNamespaceManager read GetDefaultInterface;
  published
    property allowOverride: WordBool read Get_allowOverride write Set_allowOverride;
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoDOMDocument60.Create: IXMLDOMDocument3;
begin
  Result := CreateComObject(CLASS_DOMDocument60) as IXMLDOMDocument3;
end;

class function CoDOMDocument60.CreateRemote(const MachineName: string): IXMLDOMDocument3;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DOMDocument60) as IXMLDOMDocument3;
end;

procedure TDOMDocument60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A05-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{2933BF96-7B36-11D2-B20E-00C04F983E60}';
    EventIID:  '{3EFAA427-272F-11D2-836F-0000F87A7782}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDOMDocument60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IXMLDOMDocument3;
  end;
end;

procedure TDOMDocument60.ConnectTo(svrIntf: IXMLDOMDocument3);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TDOMDocument60.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TDOMDocument60.GetDefaultInterface: IXMLDOMDocument3;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDOMDocument60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDOMDocument60Properties.Create(Self);
{$ENDIF}
end;

destructor TDOMDocument60.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDOMDocument60.GetServerProperties: TDOMDocument60Properties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TDOMDocument60.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    198: if Assigned(FOnondataavailable) then
         FOnondataavailable(Self);
    -609: if Assigned(FOnonreadystatechange) then
         FOnonreadystatechange(Self);
  end; {case DispID}
end;

function TDOMDocument60.validateNode(const node: IXMLDOMNode): IXMLDOMParseError;
begin
  Result := DefaultInterface.validateNode(node);
end;

function TDOMDocument60.importNode(const node: IXMLDOMNode; deep: WordBool): IXMLDOMNode;
begin
  Result := DefaultInterface.importNode(node, deep);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDOMDocument60Properties.Create(AServer: TDOMDocument60);
begin
  inherited Create;
  FServer := AServer;
end;

function TDOMDocument60Properties.GetDefaultInterface: IXMLDOMDocument3;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoFreeThreadedDOMDocument60.Create: IXMLDOMDocument3;
begin
  Result := CreateComObject(CLASS_FreeThreadedDOMDocument60) as IXMLDOMDocument3;
end;

class function CoFreeThreadedDOMDocument60.CreateRemote(const MachineName: string): IXMLDOMDocument3;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FreeThreadedDOMDocument60) as IXMLDOMDocument3;
end;

procedure TFreeThreadedDOMDocument60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A06-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{2933BF96-7B36-11D2-B20E-00C04F983E60}';
    EventIID:  '{3EFAA427-272F-11D2-836F-0000F87A7782}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TFreeThreadedDOMDocument60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IXMLDOMDocument3;
  end;
end;

procedure TFreeThreadedDOMDocument60.ConnectTo(svrIntf: IXMLDOMDocument3);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TFreeThreadedDOMDocument60.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TFreeThreadedDOMDocument60.GetDefaultInterface: IXMLDOMDocument3;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TFreeThreadedDOMDocument60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TFreeThreadedDOMDocument60Properties.Create(Self);
{$ENDIF}
end;

destructor TFreeThreadedDOMDocument60.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TFreeThreadedDOMDocument60.GetServerProperties: TFreeThreadedDOMDocument60Properties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TFreeThreadedDOMDocument60.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    198: if Assigned(FOnondataavailable) then
         FOnondataavailable(Self);
    -609: if Assigned(FOnonreadystatechange) then
         FOnonreadystatechange(Self);
  end; {case DispID}
end;

function TFreeThreadedDOMDocument60.validateNode(const node: IXMLDOMNode): IXMLDOMParseError;
begin
  Result := DefaultInterface.validateNode(node);
end;

function TFreeThreadedDOMDocument60.importNode(const node: IXMLDOMNode; deep: WordBool): IXMLDOMNode;
begin
  Result := DefaultInterface.importNode(node, deep);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TFreeThreadedDOMDocument60Properties.Create(AServer: TFreeThreadedDOMDocument60);
begin
  inherited Create;
  FServer := AServer;
end;

function TFreeThreadedDOMDocument60Properties.GetDefaultInterface: IXMLDOMDocument3;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoXMLSchemaCache60.Create: IXMLDOMSchemaCollection2;
begin
  Result := CreateComObject(CLASS_XMLSchemaCache60) as IXMLDOMSchemaCollection2;
end;

class function CoXMLSchemaCache60.CreateRemote(const MachineName: string): IXMLDOMSchemaCollection2;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_XMLSchemaCache60) as IXMLDOMSchemaCollection2;
end;

procedure TXMLSchemaCache60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A07-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TXMLSchemaCache60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IXMLDOMSchemaCollection2;
  end;
end;

procedure TXMLSchemaCache60.ConnectTo(svrIntf: IXMLDOMSchemaCollection2);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TXMLSchemaCache60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TXMLSchemaCache60.GetDefaultInterface: IXMLDOMSchemaCollection2;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TXMLSchemaCache60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TXMLSchemaCache60Properties.Create(Self);
{$ENDIF}
end;

destructor TXMLSchemaCache60.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TXMLSchemaCache60.GetServerProperties: TXMLSchemaCache60Properties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TXMLSchemaCache60.Set_validateOnLoad(validateOnLoad: WordBool);
begin
  DefaultInterface.Set_validateOnLoad(validateOnLoad);
end;

function TXMLSchemaCache60.Get_validateOnLoad: WordBool;
begin
    Result := DefaultInterface.validateOnLoad;
end;

procedure TXMLSchemaCache60.validate;
begin
  DefaultInterface.validate;
end;

function TXMLSchemaCache60.getSchema(const namespaceURI: WideString): ISchema;
begin
  Result := DefaultInterface.getSchema(namespaceURI);
end;

function TXMLSchemaCache60.getDeclaration(const node: IXMLDOMNode): ISchemaItem;
begin
  Result := DefaultInterface.getDeclaration(node);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TXMLSchemaCache60Properties.Create(AServer: TXMLSchemaCache60);
begin
  inherited Create;
  FServer := AServer;
end;

function TXMLSchemaCache60Properties.GetDefaultInterface: IXMLDOMSchemaCollection2;
begin
  Result := FServer.DefaultInterface;
end;

procedure TXMLSchemaCache60Properties.Set_validateOnLoad(validateOnLoad: WordBool);
begin
  DefaultInterface.Set_validateOnLoad(validateOnLoad);
end;

function TXMLSchemaCache60Properties.Get_validateOnLoad: WordBool;
begin
    Result := DefaultInterface.validateOnLoad;
end;

{$ENDIF}

class function CoXSLTemplate60.Create: IXSLTemplate;
begin
  Result := CreateComObject(CLASS_XSLTemplate60) as IXSLTemplate;
end;

class function CoXSLTemplate60.CreateRemote(const MachineName: string): IXSLTemplate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_XSLTemplate60) as IXSLTemplate;
end;

procedure TXSLTemplate60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A08-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{2933BF93-7B36-11D2-B20E-00C04F983E60}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TXSLTemplate60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IXSLTemplate;
  end;
end;

procedure TXSLTemplate60.ConnectTo(svrIntf: IXSLTemplate);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TXSLTemplate60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TXSLTemplate60.GetDefaultInterface: IXSLTemplate;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TXSLTemplate60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TXSLTemplate60Properties.Create(Self);
{$ENDIF}
end;

destructor TXSLTemplate60.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TXSLTemplate60.GetServerProperties: TXSLTemplate60Properties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TXSLTemplate60._Set_stylesheet(const stylesheet: IXMLDOMNode);
  { Warning: The property stylesheet has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.stylesheet := stylesheet;
end;

function TXSLTemplate60.Get_stylesheet: IXMLDOMNode;
begin
    Result := DefaultInterface.stylesheet;
end;

function TXSLTemplate60.createProcessor: IXSLProcessor;
begin
  Result := DefaultInterface.createProcessor;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TXSLTemplate60Properties.Create(AServer: TXSLTemplate60);
begin
  inherited Create;
  FServer := AServer;
end;

function TXSLTemplate60Properties.GetDefaultInterface: IXSLTemplate;
begin
  Result := FServer.DefaultInterface;
end;

procedure TXSLTemplate60Properties._Set_stylesheet(const stylesheet: IXMLDOMNode);
  { Warning: The property stylesheet has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.stylesheet := stylesheet;
end;

function TXSLTemplate60Properties.Get_stylesheet: IXMLDOMNode;
begin
    Result := DefaultInterface.stylesheet;
end;

{$ENDIF}

class function CoXMLHTTP60.Create: IXMLHTTPRequest;
begin
  Result := CreateComObject(CLASS_XMLHTTP60) as IXMLHTTPRequest;
end;

class function CoXMLHTTP60.CreateRemote(const MachineName: string): IXMLHTTPRequest;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_XMLHTTP60) as IXMLHTTPRequest;
end;

procedure TXMLHTTP60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A0A-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{ED8C108D-4349-11D2-91A4-00C04F7969E8}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TXMLHTTP60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IXMLHTTPRequest;
  end;
end;

procedure TXMLHTTP60.ConnectTo(svrIntf: IXMLHTTPRequest);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TXMLHTTP60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TXMLHTTP60.GetDefaultInterface: IXMLHTTPRequest;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TXMLHTTP60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TXMLHTTP60Properties.Create(Self);
{$ENDIF}
end;

destructor TXMLHTTP60.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TXMLHTTP60.GetServerProperties: TXMLHTTP60Properties;
begin
  Result := FProps;
end;
{$ENDIF}

function TXMLHTTP60.Get_status: Integer;
begin
    Result := DefaultInterface.status;
end;

function TXMLHTTP60.Get_statusText: WideString;
begin
    Result := DefaultInterface.statusText;
end;

function TXMLHTTP60.Get_responseXML: IDispatch;
begin
    Result := DefaultInterface.responseXML;
end;

function TXMLHTTP60.Get_responseText: WideString;
begin
    Result := DefaultInterface.responseText;
end;

function TXMLHTTP60.Get_responseBody: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.responseBody;
end;

function TXMLHTTP60.Get_responseStream: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.responseStream;
end;

function TXMLHTTP60.Get_readyState: Integer;
begin
    Result := DefaultInterface.readyState;
end;

procedure TXMLHTTP60.Set_onreadystatechange(const Param1: IDispatch);
begin
  DefaultInterface.Set_onreadystatechange(Param1);
end;

procedure TXMLHTTP60.open(const bstrMethod: WideString; const bstrUrl: WideString);
begin
  DefaultInterface.open(bstrMethod, bstrUrl, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TXMLHTTP60.open(const bstrMethod: WideString; const bstrUrl: WideString; 
                          varAsync: OleVariant);
begin
  DefaultInterface.open(bstrMethod, bstrUrl, varAsync, EmptyParam, EmptyParam);
end;

procedure TXMLHTTP60.open(const bstrMethod: WideString; const bstrUrl: WideString; 
                          varAsync: OleVariant; bstrUser: OleVariant);
begin
  DefaultInterface.open(bstrMethod, bstrUrl, varAsync, bstrUser, EmptyParam);
end;

procedure TXMLHTTP60.open(const bstrMethod: WideString; const bstrUrl: WideString; 
                          varAsync: OleVariant; bstrUser: OleVariant; bstrPassword: OleVariant);
begin
  DefaultInterface.open(bstrMethod, bstrUrl, varAsync, bstrUser, bstrPassword);
end;

procedure TXMLHTTP60.setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString);
begin
  DefaultInterface.setRequestHeader(bstrHeader, bstrValue);
end;

function TXMLHTTP60.getResponseHeader(const bstrHeader: WideString): WideString;
begin
  Result := DefaultInterface.getResponseHeader(bstrHeader);
end;

function TXMLHTTP60.getAllResponseHeaders: WideString;
begin
  Result := DefaultInterface.getAllResponseHeaders;
end;

procedure TXMLHTTP60.send;
begin
  DefaultInterface.send(EmptyParam);
end;

procedure TXMLHTTP60.send(varBody: OleVariant);
begin
  DefaultInterface.send(varBody);
end;

procedure TXMLHTTP60.abort;
begin
  DefaultInterface.abort;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TXMLHTTP60Properties.Create(AServer: TXMLHTTP60);
begin
  inherited Create;
  FServer := AServer;
end;

function TXMLHTTP60Properties.GetDefaultInterface: IXMLHTTPRequest;
begin
  Result := FServer.DefaultInterface;
end;

function TXMLHTTP60Properties.Get_status: Integer;
begin
    Result := DefaultInterface.status;
end;

function TXMLHTTP60Properties.Get_statusText: WideString;
begin
    Result := DefaultInterface.statusText;
end;

function TXMLHTTP60Properties.Get_responseXML: IDispatch;
begin
    Result := DefaultInterface.responseXML;
end;

function TXMLHTTP60Properties.Get_responseText: WideString;
begin
    Result := DefaultInterface.responseText;
end;

function TXMLHTTP60Properties.Get_responseBody: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.responseBody;
end;

function TXMLHTTP60Properties.Get_responseStream: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.responseStream;
end;

function TXMLHTTP60Properties.Get_readyState: Integer;
begin
    Result := DefaultInterface.readyState;
end;

procedure TXMLHTTP60Properties.Set_onreadystatechange(const Param1: IDispatch);
begin
  DefaultInterface.Set_onreadystatechange(Param1);
end;

{$ENDIF}

class function CoFreeThreadedXMLHTTP60.Create: IXMLHTTPRequest2;
begin
  Result := CreateComObject(CLASS_FreeThreadedXMLHTTP60) as IXMLHTTPRequest2;
end;

class function CoFreeThreadedXMLHTTP60.CreateRemote(const MachineName: string): IXMLHTTPRequest2;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FreeThreadedXMLHTTP60) as IXMLHTTPRequest2;
end;

procedure TFreeThreadedXMLHTTP60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A09-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{E5D37DC0-552A-4D52-9CC0-A14D546FBD04}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TFreeThreadedXMLHTTP60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IXMLHTTPRequest2;
  end;
end;

procedure TFreeThreadedXMLHTTP60.ConnectTo(svrIntf: IXMLHTTPRequest2);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TFreeThreadedXMLHTTP60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TFreeThreadedXMLHTTP60.GetDefaultInterface: IXMLHTTPRequest2;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TFreeThreadedXMLHTTP60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TFreeThreadedXMLHTTP60Properties.Create(Self);
{$ENDIF}
end;

destructor TFreeThreadedXMLHTTP60.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TFreeThreadedXMLHTTP60.GetServerProperties: TFreeThreadedXMLHTTP60Properties;
begin
  Result := FProps;
end;
{$ENDIF}

function TFreeThreadedXMLHTTP60.open(pwszMethod: PWideChar; pwszUrl: PWideChar; 
                                     const pStatusCallback: IXMLHTTPRequest2Callback; 
                                     pwszUserName: PWideChar; pwszPassword: PWideChar; 
                                     pwszProxyUserName: PWideChar; pwszProxyPassword: PWideChar): HResult;
begin
  Result := DefaultInterface.open(pwszMethod, pwszUrl, pStatusCallback, pwszUserName, pwszPassword, 
                                  pwszProxyUserName, pwszProxyPassword);
end;

function TFreeThreadedXMLHTTP60.send(const pBody: ISequentialStream; cbBody: Largeuint): HResult;
begin
  Result := DefaultInterface.send(pBody, cbBody);
end;

function TFreeThreadedXMLHTTP60.abort: HResult;
begin
  Result := DefaultInterface.abort;
end;

function TFreeThreadedXMLHTTP60.SetCookie(var pCookie: tagXHR_COOKIE; out pdwCookieState: LongWord): HResult;
begin
  Result := DefaultInterface.SetCookie(pCookie, pdwCookieState);
end;

function TFreeThreadedXMLHTTP60.SetCustomResponseStream(const pSequentialStream: ISequentialStream): HResult;
begin
  Result := DefaultInterface.SetCustomResponseStream(pSequentialStream);
end;

function TFreeThreadedXMLHTTP60.setProperty(eProperty: XHR_PROPERTY; ullValue: Largeuint): HResult;
begin
  Result := DefaultInterface.setProperty(eProperty, ullValue);
end;

function TFreeThreadedXMLHTTP60.setRequestHeader(pwszHeader: PWideChar; pwszValue: PWideChar): HResult;
begin
  Result := DefaultInterface.setRequestHeader(pwszHeader, pwszValue);
end;

function TFreeThreadedXMLHTTP60.getAllResponseHeaders(out ppwszHeaders: PWideChar): HResult;
begin
  Result := DefaultInterface.getAllResponseHeaders(ppwszHeaders);
end;

function TFreeThreadedXMLHTTP60.GetCookie(pwszUrl: PWideChar; pwszName: PWideChar; 
                                          dwFlags: LongWord; out pcCookies: LongWord; 
                                          out ppCookies: PUserType1): HResult;
begin
  Result := DefaultInterface.GetCookie(pwszUrl, pwszName, dwFlags, pcCookies, ppCookies);
end;

function TFreeThreadedXMLHTTP60.getResponseHeader(pwszHeader: PWideChar; out ppwszValue: PWideChar): HResult;
begin
  Result := DefaultInterface.getResponseHeader(pwszHeader, ppwszValue);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TFreeThreadedXMLHTTP60Properties.Create(AServer: TFreeThreadedXMLHTTP60);
begin
  inherited Create;
  FServer := AServer;
end;

function TFreeThreadedXMLHTTP60Properties.GetDefaultInterface: IXMLHTTPRequest2;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoServerXMLHTTP60.Create: IServerXMLHTTPRequest2;
begin
  Result := CreateComObject(CLASS_ServerXMLHTTP60) as IServerXMLHTTPRequest2;
end;

class function CoServerXMLHTTP60.CreateRemote(const MachineName: string): IServerXMLHTTPRequest2;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ServerXMLHTTP60) as IServerXMLHTTPRequest2;
end;

procedure TServerXMLHTTP60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A0B-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TServerXMLHTTP60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IServerXMLHTTPRequest2;
  end;
end;

procedure TServerXMLHTTP60.ConnectTo(svrIntf: IServerXMLHTTPRequest2);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TServerXMLHTTP60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TServerXMLHTTP60.GetDefaultInterface: IServerXMLHTTPRequest2;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TServerXMLHTTP60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TServerXMLHTTP60Properties.Create(Self);
{$ENDIF}
end;

destructor TServerXMLHTTP60.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TServerXMLHTTP60.GetServerProperties: TServerXMLHTTP60Properties;
begin
  Result := FProps;
end;
{$ENDIF}

function TServerXMLHTTP60.Get_status: Integer;
begin
    Result := DefaultInterface.status;
end;

function TServerXMLHTTP60.Get_statusText: WideString;
begin
    Result := DefaultInterface.statusText;
end;

function TServerXMLHTTP60.Get_responseXML: IDispatch;
begin
    Result := DefaultInterface.responseXML;
end;

function TServerXMLHTTP60.Get_responseText: WideString;
begin
    Result := DefaultInterface.responseText;
end;

function TServerXMLHTTP60.Get_responseBody: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.responseBody;
end;

function TServerXMLHTTP60.Get_responseStream: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.responseStream;
end;

function TServerXMLHTTP60.Get_readyState: Integer;
begin
    Result := DefaultInterface.readyState;
end;

procedure TServerXMLHTTP60.Set_onreadystatechange(const Param1: IDispatch);
begin
  DefaultInterface.Set_onreadystatechange(Param1);
end;

procedure TServerXMLHTTP60.open(const bstrMethod: WideString; const bstrUrl: WideString);
begin
  DefaultInterface.open(bstrMethod, bstrUrl, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TServerXMLHTTP60.open(const bstrMethod: WideString; const bstrUrl: WideString; 
                                varAsync: OleVariant);
begin
  DefaultInterface.open(bstrMethod, bstrUrl, varAsync, EmptyParam, EmptyParam);
end;

procedure TServerXMLHTTP60.open(const bstrMethod: WideString; const bstrUrl: WideString; 
                                varAsync: OleVariant; bstrUser: OleVariant);
begin
  DefaultInterface.open(bstrMethod, bstrUrl, varAsync, bstrUser, EmptyParam);
end;

procedure TServerXMLHTTP60.open(const bstrMethod: WideString; const bstrUrl: WideString; 
                                varAsync: OleVariant; bstrUser: OleVariant; bstrPassword: OleVariant);
begin
  DefaultInterface.open(bstrMethod, bstrUrl, varAsync, bstrUser, bstrPassword);
end;

procedure TServerXMLHTTP60.setRequestHeader(const bstrHeader: WideString; 
                                            const bstrValue: WideString);
begin
  DefaultInterface.setRequestHeader(bstrHeader, bstrValue);
end;

function TServerXMLHTTP60.getResponseHeader(const bstrHeader: WideString): WideString;
begin
  Result := DefaultInterface.getResponseHeader(bstrHeader);
end;

function TServerXMLHTTP60.getAllResponseHeaders: WideString;
begin
  Result := DefaultInterface.getAllResponseHeaders;
end;

procedure TServerXMLHTTP60.send;
begin
  DefaultInterface.send(EmptyParam);
end;

procedure TServerXMLHTTP60.send(varBody: OleVariant);
begin
  DefaultInterface.send(varBody);
end;

procedure TServerXMLHTTP60.abort;
begin
  DefaultInterface.abort;
end;

procedure TServerXMLHTTP60.setTimeouts(resolveTimeout: Integer; connectTimeout: Integer; 
                                       sendTimeout: Integer; receiveTimeout: Integer);
begin
  DefaultInterface.setTimeouts(resolveTimeout, connectTimeout, sendTimeout, receiveTimeout);
end;

function TServerXMLHTTP60.waitForResponse: WordBool;
begin
  Result := DefaultInterface.waitForResponse(EmptyParam);
end;

function TServerXMLHTTP60.waitForResponse(timeoutInSeconds: OleVariant): WordBool;
begin
  Result := DefaultInterface.waitForResponse(timeoutInSeconds);
end;

function TServerXMLHTTP60.getOption(option: SERVERXMLHTTP_OPTION): OleVariant;
begin
  Result := DefaultInterface.getOption(option);
end;

procedure TServerXMLHTTP60.setOption(option: SERVERXMLHTTP_OPTION; value: OleVariant);
begin
  DefaultInterface.setOption(option, value);
end;

procedure TServerXMLHTTP60.setProxy(proxySetting: SXH_PROXY_SETTING);
begin
  DefaultInterface.setProxy(proxySetting, EmptyParam, EmptyParam);
end;

procedure TServerXMLHTTP60.setProxy(proxySetting: SXH_PROXY_SETTING; varProxyServer: OleVariant);
begin
  DefaultInterface.setProxy(proxySetting, varProxyServer, EmptyParam);
end;

procedure TServerXMLHTTP60.setProxy(proxySetting: SXH_PROXY_SETTING; varProxyServer: OleVariant; 
                                    varBypassList: OleVariant);
begin
  DefaultInterface.setProxy(proxySetting, varProxyServer, varBypassList);
end;

procedure TServerXMLHTTP60.setProxyCredentials(const bstrUserName: WideString; 
                                               const bstrPassword: WideString);
begin
  DefaultInterface.setProxyCredentials(bstrUserName, bstrPassword);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TServerXMLHTTP60Properties.Create(AServer: TServerXMLHTTP60);
begin
  inherited Create;
  FServer := AServer;
end;

function TServerXMLHTTP60Properties.GetDefaultInterface: IServerXMLHTTPRequest2;
begin
  Result := FServer.DefaultInterface;
end;

function TServerXMLHTTP60Properties.Get_status: Integer;
begin
    Result := DefaultInterface.status;
end;

function TServerXMLHTTP60Properties.Get_statusText: WideString;
begin
    Result := DefaultInterface.statusText;
end;

function TServerXMLHTTP60Properties.Get_responseXML: IDispatch;
begin
    Result := DefaultInterface.responseXML;
end;

function TServerXMLHTTP60Properties.Get_responseText: WideString;
begin
    Result := DefaultInterface.responseText;
end;

function TServerXMLHTTP60Properties.Get_responseBody: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.responseBody;
end;

function TServerXMLHTTP60Properties.Get_responseStream: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.responseStream;
end;

function TServerXMLHTTP60Properties.Get_readyState: Integer;
begin
    Result := DefaultInterface.readyState;
end;

procedure TServerXMLHTTP60Properties.Set_onreadystatechange(const Param1: IDispatch);
begin
  DefaultInterface.Set_onreadystatechange(Param1);
end;

{$ENDIF}

class function CoSAXXMLReader60.Create: IVBSAXXMLReader;
begin
  Result := CreateComObject(CLASS_SAXXMLReader60) as IVBSAXXMLReader;
end;

class function CoSAXXMLReader60.CreateRemote(const MachineName: string): IVBSAXXMLReader;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SAXXMLReader60) as IVBSAXXMLReader;
end;

procedure TSAXXMLReader60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A0C-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{8C033CAA-6CD6-4F73-B728-4531AF74945F}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSAXXMLReader60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IVBSAXXMLReader;
  end;
end;

procedure TSAXXMLReader60.ConnectTo(svrIntf: IVBSAXXMLReader);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSAXXMLReader60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSAXXMLReader60.GetDefaultInterface: IVBSAXXMLReader;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TSAXXMLReader60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSAXXMLReader60Properties.Create(Self);
{$ENDIF}
end;

destructor TSAXXMLReader60.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSAXXMLReader60.GetServerProperties: TSAXXMLReader60Properties;
begin
  Result := FProps;
end;
{$ENDIF}

function TSAXXMLReader60.Get_entityResolver: IVBSAXEntityResolver;
begin
    Result := DefaultInterface.entityResolver;
end;

procedure TSAXXMLReader60._Set_entityResolver(const oResolver: IVBSAXEntityResolver);
  { Warning: The property entityResolver has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.entityResolver := oResolver;
end;

function TSAXXMLReader60.Get_contentHandler: IVBSAXContentHandler;
begin
    Result := DefaultInterface.contentHandler;
end;

procedure TSAXXMLReader60._Set_contentHandler(const oHandler: IVBSAXContentHandler);
  { Warning: The property contentHandler has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.contentHandler := oHandler;
end;

function TSAXXMLReader60.Get_dtdHandler: IVBSAXDTDHandler;
begin
    Result := DefaultInterface.dtdHandler;
end;

procedure TSAXXMLReader60._Set_dtdHandler(const oHandler: IVBSAXDTDHandler);
  { Warning: The property dtdHandler has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.dtdHandler := oHandler;
end;

function TSAXXMLReader60.Get_errorHandler: IVBSAXErrorHandler;
begin
    Result := DefaultInterface.errorHandler;
end;

procedure TSAXXMLReader60._Set_errorHandler(const oHandler: IVBSAXErrorHandler);
  { Warning: The property errorHandler has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.errorHandler := oHandler;
end;

function TSAXXMLReader60.Get_baseURL: WideString;
begin
    Result := DefaultInterface.baseURL;
end;

procedure TSAXXMLReader60.Set_baseURL(const strBaseURL: WideString);
  { Warning: The property baseURL has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.baseURL := strBaseURL;
end;

function TSAXXMLReader60.Get_secureBaseURL: WideString;
begin
    Result := DefaultInterface.secureBaseURL;
end;

procedure TSAXXMLReader60.Set_secureBaseURL(const strSecureBaseURL: WideString);
  { Warning: The property secureBaseURL has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.secureBaseURL := strSecureBaseURL;
end;

function TSAXXMLReader60.getFeature(const strName: WideString): WordBool;
begin
  Result := DefaultInterface.getFeature(strName);
end;

procedure TSAXXMLReader60.putFeature(const strName: WideString; fValue: WordBool);
begin
  DefaultInterface.putFeature(strName, fValue);
end;

function TSAXXMLReader60.getProperty(const strName: WideString): OleVariant;
begin
  Result := DefaultInterface.getProperty(strName);
end;

procedure TSAXXMLReader60.putProperty(const strName: WideString; varValue: OleVariant);
begin
  DefaultInterface.putProperty(strName, varValue);
end;

procedure TSAXXMLReader60.parse;
begin
  DefaultInterface.parse(EmptyParam);
end;

procedure TSAXXMLReader60.parse(varInput: OleVariant);
begin
  DefaultInterface.parse(varInput);
end;

procedure TSAXXMLReader60.parseURL(const strURL: WideString);
begin
  DefaultInterface.parseURL(strURL);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSAXXMLReader60Properties.Create(AServer: TSAXXMLReader60);
begin
  inherited Create;
  FServer := AServer;
end;

function TSAXXMLReader60Properties.GetDefaultInterface: IVBSAXXMLReader;
begin
  Result := FServer.DefaultInterface;
end;

function TSAXXMLReader60Properties.Get_entityResolver: IVBSAXEntityResolver;
begin
    Result := DefaultInterface.entityResolver;
end;

procedure TSAXXMLReader60Properties._Set_entityResolver(const oResolver: IVBSAXEntityResolver);
  { Warning: The property entityResolver has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.entityResolver := oResolver;
end;

function TSAXXMLReader60Properties.Get_contentHandler: IVBSAXContentHandler;
begin
    Result := DefaultInterface.contentHandler;
end;

procedure TSAXXMLReader60Properties._Set_contentHandler(const oHandler: IVBSAXContentHandler);
  { Warning: The property contentHandler has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.contentHandler := oHandler;
end;

function TSAXXMLReader60Properties.Get_dtdHandler: IVBSAXDTDHandler;
begin
    Result := DefaultInterface.dtdHandler;
end;

procedure TSAXXMLReader60Properties._Set_dtdHandler(const oHandler: IVBSAXDTDHandler);
  { Warning: The property dtdHandler has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.dtdHandler := oHandler;
end;

function TSAXXMLReader60Properties.Get_errorHandler: IVBSAXErrorHandler;
begin
    Result := DefaultInterface.errorHandler;
end;

procedure TSAXXMLReader60Properties._Set_errorHandler(const oHandler: IVBSAXErrorHandler);
  { Warning: The property errorHandler has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.errorHandler := oHandler;
end;

function TSAXXMLReader60Properties.Get_baseURL: WideString;
begin
    Result := DefaultInterface.baseURL;
end;

procedure TSAXXMLReader60Properties.Set_baseURL(const strBaseURL: WideString);
  { Warning: The property baseURL has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.baseURL := strBaseURL;
end;

function TSAXXMLReader60Properties.Get_secureBaseURL: WideString;
begin
    Result := DefaultInterface.secureBaseURL;
end;

procedure TSAXXMLReader60Properties.Set_secureBaseURL(const strSecureBaseURL: WideString);
  { Warning: The property secureBaseURL has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.secureBaseURL := strSecureBaseURL;
end;

{$ENDIF}

class function CoMXXMLWriter60.Create: IMXWriter;
begin
  Result := CreateComObject(CLASS_MXXMLWriter60) as IMXWriter;
end;

class function CoMXXMLWriter60.CreateRemote(const MachineName: string): IMXWriter;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MXXMLWriter60) as IMXWriter;
end;

procedure TMXXMLWriter60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A0F-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TMXXMLWriter60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IMXWriter;
  end;
end;

procedure TMXXMLWriter60.ConnectTo(svrIntf: IMXWriter);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TMXXMLWriter60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TMXXMLWriter60.GetDefaultInterface: IMXWriter;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TMXXMLWriter60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TMXXMLWriter60Properties.Create(Self);
{$ENDIF}
end;

destructor TMXXMLWriter60.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TMXXMLWriter60.GetServerProperties: TMXXMLWriter60Properties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TMXXMLWriter60.Set_output(varDestination: OleVariant);
begin
  DefaultInterface.Set_output(varDestination);
end;

function TMXXMLWriter60.Get_output: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.output;
end;

procedure TMXXMLWriter60.Set_encoding(const strEncoding: WideString);
  { Warning: The property encoding has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.encoding := strEncoding;
end;

function TMXXMLWriter60.Get_encoding: WideString;
begin
    Result := DefaultInterface.encoding;
end;

procedure TMXXMLWriter60.Set_byteOrderMark(fWriteByteOrderMark: WordBool);
begin
  DefaultInterface.Set_byteOrderMark(fWriteByteOrderMark);
end;

function TMXXMLWriter60.Get_byteOrderMark: WordBool;
begin
    Result := DefaultInterface.byteOrderMark;
end;

procedure TMXXMLWriter60.Set_indent(fIndentMode: WordBool);
begin
  DefaultInterface.Set_indent(fIndentMode);
end;

function TMXXMLWriter60.Get_indent: WordBool;
begin
    Result := DefaultInterface.indent;
end;

procedure TMXXMLWriter60.Set_standalone(fValue: WordBool);
begin
  DefaultInterface.Set_standalone(fValue);
end;

function TMXXMLWriter60.Get_standalone: WordBool;
begin
    Result := DefaultInterface.standalone;
end;

procedure TMXXMLWriter60.Set_omitXMLDeclaration(fValue: WordBool);
begin
  DefaultInterface.Set_omitXMLDeclaration(fValue);
end;

function TMXXMLWriter60.Get_omitXMLDeclaration: WordBool;
begin
    Result := DefaultInterface.omitXMLDeclaration;
end;

procedure TMXXMLWriter60.Set_version(const strVersion: WideString);
  { Warning: The property version has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.version := strVersion;
end;

function TMXXMLWriter60.Get_version: WideString;
begin
    Result := DefaultInterface.version;
end;

procedure TMXXMLWriter60.Set_disableOutputEscaping(fValue: WordBool);
begin
  DefaultInterface.Set_disableOutputEscaping(fValue);
end;

function TMXXMLWriter60.Get_disableOutputEscaping: WordBool;
begin
    Result := DefaultInterface.disableOutputEscaping;
end;

procedure TMXXMLWriter60.flush;
begin
  DefaultInterface.flush;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TMXXMLWriter60Properties.Create(AServer: TMXXMLWriter60);
begin
  inherited Create;
  FServer := AServer;
end;

function TMXXMLWriter60Properties.GetDefaultInterface: IMXWriter;
begin
  Result := FServer.DefaultInterface;
end;

procedure TMXXMLWriter60Properties.Set_output(varDestination: OleVariant);
begin
  DefaultInterface.Set_output(varDestination);
end;

function TMXXMLWriter60Properties.Get_output: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.output;
end;

procedure TMXXMLWriter60Properties.Set_encoding(const strEncoding: WideString);
  { Warning: The property encoding has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.encoding := strEncoding;
end;

function TMXXMLWriter60Properties.Get_encoding: WideString;
begin
    Result := DefaultInterface.encoding;
end;

procedure TMXXMLWriter60Properties.Set_byteOrderMark(fWriteByteOrderMark: WordBool);
begin
  DefaultInterface.Set_byteOrderMark(fWriteByteOrderMark);
end;

function TMXXMLWriter60Properties.Get_byteOrderMark: WordBool;
begin
    Result := DefaultInterface.byteOrderMark;
end;

procedure TMXXMLWriter60Properties.Set_indent(fIndentMode: WordBool);
begin
  DefaultInterface.Set_indent(fIndentMode);
end;

function TMXXMLWriter60Properties.Get_indent: WordBool;
begin
    Result := DefaultInterface.indent;
end;

procedure TMXXMLWriter60Properties.Set_standalone(fValue: WordBool);
begin
  DefaultInterface.Set_standalone(fValue);
end;

function TMXXMLWriter60Properties.Get_standalone: WordBool;
begin
    Result := DefaultInterface.standalone;
end;

procedure TMXXMLWriter60Properties.Set_omitXMLDeclaration(fValue: WordBool);
begin
  DefaultInterface.Set_omitXMLDeclaration(fValue);
end;

function TMXXMLWriter60Properties.Get_omitXMLDeclaration: WordBool;
begin
    Result := DefaultInterface.omitXMLDeclaration;
end;

procedure TMXXMLWriter60Properties.Set_version(const strVersion: WideString);
  { Warning: The property version has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.version := strVersion;
end;

function TMXXMLWriter60Properties.Get_version: WideString;
begin
    Result := DefaultInterface.version;
end;

procedure TMXXMLWriter60Properties.Set_disableOutputEscaping(fValue: WordBool);
begin
  DefaultInterface.Set_disableOutputEscaping(fValue);
end;

function TMXXMLWriter60Properties.Get_disableOutputEscaping: WordBool;
begin
    Result := DefaultInterface.disableOutputEscaping;
end;

{$ENDIF}

class function CoMXHTMLWriter60.Create: IMXWriter;
begin
  Result := CreateComObject(CLASS_MXHTMLWriter60) as IMXWriter;
end;

class function CoMXHTMLWriter60.CreateRemote(const MachineName: string): IMXWriter;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MXHTMLWriter60) as IMXWriter;
end;

procedure TMXHTMLWriter60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A10-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TMXHTMLWriter60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IMXWriter;
  end;
end;

procedure TMXHTMLWriter60.ConnectTo(svrIntf: IMXWriter);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TMXHTMLWriter60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TMXHTMLWriter60.GetDefaultInterface: IMXWriter;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TMXHTMLWriter60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TMXHTMLWriter60Properties.Create(Self);
{$ENDIF}
end;

destructor TMXHTMLWriter60.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TMXHTMLWriter60.GetServerProperties: TMXHTMLWriter60Properties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TMXHTMLWriter60.Set_output(varDestination: OleVariant);
begin
  DefaultInterface.Set_output(varDestination);
end;

function TMXHTMLWriter60.Get_output: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.output;
end;

procedure TMXHTMLWriter60.Set_encoding(const strEncoding: WideString);
  { Warning: The property encoding has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.encoding := strEncoding;
end;

function TMXHTMLWriter60.Get_encoding: WideString;
begin
    Result := DefaultInterface.encoding;
end;

procedure TMXHTMLWriter60.Set_byteOrderMark(fWriteByteOrderMark: WordBool);
begin
  DefaultInterface.Set_byteOrderMark(fWriteByteOrderMark);
end;

function TMXHTMLWriter60.Get_byteOrderMark: WordBool;
begin
    Result := DefaultInterface.byteOrderMark;
end;

procedure TMXHTMLWriter60.Set_indent(fIndentMode: WordBool);
begin
  DefaultInterface.Set_indent(fIndentMode);
end;

function TMXHTMLWriter60.Get_indent: WordBool;
begin
    Result := DefaultInterface.indent;
end;

procedure TMXHTMLWriter60.Set_standalone(fValue: WordBool);
begin
  DefaultInterface.Set_standalone(fValue);
end;

function TMXHTMLWriter60.Get_standalone: WordBool;
begin
    Result := DefaultInterface.standalone;
end;

procedure TMXHTMLWriter60.Set_omitXMLDeclaration(fValue: WordBool);
begin
  DefaultInterface.Set_omitXMLDeclaration(fValue);
end;

function TMXHTMLWriter60.Get_omitXMLDeclaration: WordBool;
begin
    Result := DefaultInterface.omitXMLDeclaration;
end;

procedure TMXHTMLWriter60.Set_version(const strVersion: WideString);
  { Warning: The property version has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.version := strVersion;
end;

function TMXHTMLWriter60.Get_version: WideString;
begin
    Result := DefaultInterface.version;
end;

procedure TMXHTMLWriter60.Set_disableOutputEscaping(fValue: WordBool);
begin
  DefaultInterface.Set_disableOutputEscaping(fValue);
end;

function TMXHTMLWriter60.Get_disableOutputEscaping: WordBool;
begin
    Result := DefaultInterface.disableOutputEscaping;
end;

procedure TMXHTMLWriter60.flush;
begin
  DefaultInterface.flush;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TMXHTMLWriter60Properties.Create(AServer: TMXHTMLWriter60);
begin
  inherited Create;
  FServer := AServer;
end;

function TMXHTMLWriter60Properties.GetDefaultInterface: IMXWriter;
begin
  Result := FServer.DefaultInterface;
end;

procedure TMXHTMLWriter60Properties.Set_output(varDestination: OleVariant);
begin
  DefaultInterface.Set_output(varDestination);
end;

function TMXHTMLWriter60Properties.Get_output: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.output;
end;

procedure TMXHTMLWriter60Properties.Set_encoding(const strEncoding: WideString);
  { Warning: The property encoding has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.encoding := strEncoding;
end;

function TMXHTMLWriter60Properties.Get_encoding: WideString;
begin
    Result := DefaultInterface.encoding;
end;

procedure TMXHTMLWriter60Properties.Set_byteOrderMark(fWriteByteOrderMark: WordBool);
begin
  DefaultInterface.Set_byteOrderMark(fWriteByteOrderMark);
end;

function TMXHTMLWriter60Properties.Get_byteOrderMark: WordBool;
begin
    Result := DefaultInterface.byteOrderMark;
end;

procedure TMXHTMLWriter60Properties.Set_indent(fIndentMode: WordBool);
begin
  DefaultInterface.Set_indent(fIndentMode);
end;

function TMXHTMLWriter60Properties.Get_indent: WordBool;
begin
    Result := DefaultInterface.indent;
end;

procedure TMXHTMLWriter60Properties.Set_standalone(fValue: WordBool);
begin
  DefaultInterface.Set_standalone(fValue);
end;

function TMXHTMLWriter60Properties.Get_standalone: WordBool;
begin
    Result := DefaultInterface.standalone;
end;

procedure TMXHTMLWriter60Properties.Set_omitXMLDeclaration(fValue: WordBool);
begin
  DefaultInterface.Set_omitXMLDeclaration(fValue);
end;

function TMXHTMLWriter60Properties.Get_omitXMLDeclaration: WordBool;
begin
    Result := DefaultInterface.omitXMLDeclaration;
end;

procedure TMXHTMLWriter60Properties.Set_version(const strVersion: WideString);
  { Warning: The property version has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.version := strVersion;
end;

function TMXHTMLWriter60Properties.Get_version: WideString;
begin
    Result := DefaultInterface.version;
end;

procedure TMXHTMLWriter60Properties.Set_disableOutputEscaping(fValue: WordBool);
begin
  DefaultInterface.Set_disableOutputEscaping(fValue);
end;

function TMXHTMLWriter60Properties.Get_disableOutputEscaping: WordBool;
begin
    Result := DefaultInterface.disableOutputEscaping;
end;

{$ENDIF}

class function CoSAXAttributes60.Create: IMXAttributes;
begin
  Result := CreateComObject(CLASS_SAXAttributes60) as IMXAttributes;
end;

class function CoSAXAttributes60.CreateRemote(const MachineName: string): IMXAttributes;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SAXAttributes60) as IMXAttributes;
end;

procedure TSAXAttributes60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A0E-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSAXAttributes60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IMXAttributes;
  end;
end;

procedure TSAXAttributes60.ConnectTo(svrIntf: IMXAttributes);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSAXAttributes60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSAXAttributes60.GetDefaultInterface: IMXAttributes;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TSAXAttributes60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSAXAttributes60Properties.Create(Self);
{$ENDIF}
end;

destructor TSAXAttributes60.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSAXAttributes60.GetServerProperties: TSAXAttributes60Properties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TSAXAttributes60.addAttribute(const strURI: WideString; const strLocalName: WideString; 
                                        const strQName: WideString; const strType: WideString; 
                                        const strValue: WideString);
begin
  DefaultInterface.addAttribute(strURI, strLocalName, strQName, strType, strValue);
end;

procedure TSAXAttributes60.addAttributeFromIndex(varAtts: OleVariant; nIndex: SYSINT);
begin
  DefaultInterface.addAttributeFromIndex(varAtts, nIndex);
end;

procedure TSAXAttributes60.clear;
begin
  DefaultInterface.clear;
end;

procedure TSAXAttributes60.removeAttribute(nIndex: SYSINT);
begin
  DefaultInterface.removeAttribute(nIndex);
end;

procedure TSAXAttributes60.setAttribute(nIndex: SYSINT; const strURI: WideString; 
                                        const strLocalName: WideString; const strQName: WideString; 
                                        const strType: WideString; const strValue: WideString);
begin
  DefaultInterface.setAttribute(nIndex, strURI, strLocalName, strQName, strType, strValue);
end;

procedure TSAXAttributes60.setAttributes(varAtts: OleVariant);
begin
  DefaultInterface.setAttributes(varAtts);
end;

procedure TSAXAttributes60.setLocalName(nIndex: SYSINT; const strLocalName: WideString);
begin
  DefaultInterface.setLocalName(nIndex, strLocalName);
end;

procedure TSAXAttributes60.setQName(nIndex: SYSINT; const strQName: WideString);
begin
  DefaultInterface.setQName(nIndex, strQName);
end;

procedure TSAXAttributes60.setType(nIndex: SYSINT; const strType: WideString);
begin
  DefaultInterface.setType(nIndex, strType);
end;

procedure TSAXAttributes60.setURI(nIndex: SYSINT; const strURI: WideString);
begin
  DefaultInterface.setURI(nIndex, strURI);
end;

procedure TSAXAttributes60.setValue(nIndex: SYSINT; const strValue: WideString);
begin
  DefaultInterface.setValue(nIndex, strValue);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSAXAttributes60Properties.Create(AServer: TSAXAttributes60);
begin
  inherited Create;
  FServer := AServer;
end;

function TSAXAttributes60Properties.GetDefaultInterface: IMXAttributes;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoMXNamespaceManager60.Create: IVBMXNamespaceManager;
begin
  Result := CreateComObject(CLASS_MXNamespaceManager60) as IVBMXNamespaceManager;
end;

class function CoMXNamespaceManager60.CreateRemote(const MachineName: string): IVBMXNamespaceManager;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MXNamespaceManager60) as IVBMXNamespaceManager;
end;

procedure TMXNamespaceManager60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A11-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{C90352F5-643C-4FBC-BB23-E996EB2D51FD}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TMXNamespaceManager60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IVBMXNamespaceManager;
  end;
end;

procedure TMXNamespaceManager60.ConnectTo(svrIntf: IVBMXNamespaceManager);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TMXNamespaceManager60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TMXNamespaceManager60.GetDefaultInterface: IVBMXNamespaceManager;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TMXNamespaceManager60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TMXNamespaceManager60Properties.Create(Self);
{$ENDIF}
end;

destructor TMXNamespaceManager60.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TMXNamespaceManager60.GetServerProperties: TMXNamespaceManager60Properties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TMXNamespaceManager60.Set_allowOverride(fOverride: WordBool);
begin
  DefaultInterface.Set_allowOverride(fOverride);
end;

function TMXNamespaceManager60.Get_allowOverride: WordBool;
begin
    Result := DefaultInterface.allowOverride;
end;

procedure TMXNamespaceManager60.reset;
begin
  DefaultInterface.reset;
end;

procedure TMXNamespaceManager60.pushContext;
begin
  DefaultInterface.pushContext;
end;

procedure TMXNamespaceManager60.pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool);
begin
  DefaultInterface.pushNodeContext(contextNode, fDeep);
end;

procedure TMXNamespaceManager60.popContext;
begin
  DefaultInterface.popContext;
end;

procedure TMXNamespaceManager60.declarePrefix(const prefix: WideString; 
                                              const namespaceURI: WideString);
begin
  DefaultInterface.declarePrefix(prefix, namespaceURI);
end;

function TMXNamespaceManager60.getDeclaredPrefixes: IMXNamespacePrefixes;
begin
  Result := DefaultInterface.getDeclaredPrefixes;
end;

function TMXNamespaceManager60.getPrefixes(const namespaceURI: WideString): IMXNamespacePrefixes;
begin
  Result := DefaultInterface.getPrefixes(namespaceURI);
end;

function TMXNamespaceManager60.getURI(const prefix: WideString): OleVariant;
begin
  Result := DefaultInterface.getURI(prefix);
end;

function TMXNamespaceManager60.getURIFromNode(const strPrefix: WideString; 
                                              const contextNode: IXMLDOMNode): OleVariant;
begin
  Result := DefaultInterface.getURIFromNode(strPrefix, contextNode);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TMXNamespaceManager60Properties.Create(AServer: TMXNamespaceManager60);
begin
  inherited Create;
  FServer := AServer;
end;

function TMXNamespaceManager60Properties.GetDefaultInterface: IVBMXNamespaceManager;
begin
  Result := FServer.DefaultInterface;
end;

procedure TMXNamespaceManager60Properties.Set_allowOverride(fOverride: WordBool);
begin
  DefaultInterface.Set_allowOverride(fOverride);
end;

function TMXNamespaceManager60Properties.Get_allowOverride: WordBool;
begin
    Result := DefaultInterface.allowOverride;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TDOMDocument60, TFreeThreadedDOMDocument60, TXMLSchemaCache60, TXSLTemplate60, 
    TXMLHTTP60, TFreeThreadedXMLHTTP60, TServerXMLHTTP60, TSAXXMLReader60, TMXXMLWriter60, 
    TMXHTMLWriter60, TSAXAttributes60, TMXNamespaceManager60]);
end;

end.
