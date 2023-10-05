/// untuk httpstatus
class HttpStatus {
  static const int continueCode = 100;
  static const int switchingProtocols = 101;
  static const int ok = 200;
  static const int created = 201;
  static const int accepted = 202;
  static const int nonAuthoritativeInformation = 203;
  static const int noContent = 204;
  static const int resetContent = 205;
  static const int partialContent = 206;
  static const int multipleChoices = 300;
  static const int movedPermanently = 301;
  static const int found = 302;
  static const int seeOther = 303;
  static const int notModified = 304;
  static const int useProxy = 305;
  static const int temporaryRedirect = 307;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int paymentRequired = 402;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int methodNotAllowed = 405;
  static const int notAcceptable = 406;
  static const int proxyAuthenticationRequired = 407;
  static const int requestTimeout = 408;
  static const int conflict = 409;
  static const int gone = 410;
  static const int lengthRequired = 411;
  static const int preconditionFailed = 412;
  static const int requestEntityTooLarge = 413;
  static const int requestUriTooLong = 414;
  static const int unsupportedMediaType = 415;
  static const int requestedRangeNotSatisfiable = 416;
  static const int expectationFailed = 417;
  static const int internalServerError = 500;
  static const int notImplemented = 501;
  static const int badGateway = 502;
  static const int serviceUnavailable = 503;
  static const int gatewayTimeout = 504;
  static const int httpVersionNotSupported = 505;

  static String getMessage(int statusCode) {
    switch (statusCode) {
      case continueCode:
        return 'Continue';
      case switchingProtocols:
        return 'Switching Protocols';
      case ok:
        return 'OK';
      case created:
        return 'Created';
      case accepted:
        return 'Accepted';
      case nonAuthoritativeInformation:
        return 'Non-Authoritative Information';
      case noContent:
        return 'No Content';
      case resetContent:
        return 'Reset Content';
      case partialContent:
        return 'Partial Content';
      case multipleChoices:
        return 'Multiple Choices';
      case movedPermanently:
        return 'Moved Permanently';
      case found:
        return 'Found';
      case seeOther:
        return 'See Other';
      case notModified:
        return 'Not Modified';
      case useProxy:
        return 'Use Proxy';
      case temporaryRedirect:
        return 'Temporary Redirect';
      case badRequest:
        return 'Bad Request';
      case unauthorized:
        return 'Unauthorized';
      case paymentRequired:
        return 'Payment Required';
      case forbidden:
        return 'Forbidden';
      case notFound:
        return 'Not Found';
      case methodNotAllowed:
        return 'Method Not Allowed';
      case notAcceptable:
        return 'Not Acceptable';
      case proxyAuthenticationRequired:
        return 'Proxy Authentication Required';
      case requestTimeout:
        return 'Request Timeout';
      case conflict:
        return 'Conflict';
      case gone:
        return 'Gone';
      case lengthRequired:
        return 'Length Required';
      case preconditionFailed:
        return 'Precondition Failed';
      case requestEntityTooLarge:
        return 'Request Entity Too Large';
      case requestUriTooLong:
        return 'Request-URI Too Long';
      case unsupportedMediaType:
        return 'Unsupported Media Type';
      case requestedRangeNotSatisfiable:
        return 'Requested Range Not Satisfiable';
      case expectationFailed:
        return 'Expectation Failed';
      case internalServerError:
        return 'Internal Server Error';
      case notImplemented:
        return 'Not Implemented';
      case badGateway:
        return 'Bad Gateway';
      case serviceUnavailable:
        return 'Service Unavailable';
      case gatewayTimeout:
        return 'Gateway Timeout';
      case httpVersionNotSupported:
        return 'HTTP Version Not Supported';
      default:
        return 'Unknown Status Code';
    }
  }
}
