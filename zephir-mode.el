;;; zephir-mode.el --- a Zephir mode for emacs

(defconst zephir-mode-version-number "0.1.0" "Zephir Mode version number.")
(defconst zephir-mode-modified "2014-07-17" "Zephir Mode build date.")

(defun zephir-mode-version ()
  "Display string describing the version of Zephir mode."
  (interactive)
  (message "Zephir mode %s of %s"
           zephir-mode-version-number zephir-mode-modified))

(defconst zephir-constants
  (regexp-opt
   (append
    '("__LINE__" "__FILE__" "__DIR__" "__FUNCTION__" "__CLASS__" "__TRAIT__"
      "__METHOD__" "__NAMESPACE__" "__COMPILER_HALT_OFFSET__"
      "PHP_OS" "PHP_VERSION" "PHP_MINOR_VERSION" "PHP_MAJOR_VERSION"
      "PHP_RELEASE_VERSION" "PHP_VERSION_ID" "PHP_EXTRA_VERSION"
      "TRUE" "FALSE" "NULL"
      "E_ERROR" "E_NOTICE" "E_PARSE" "E_WARNING" "E_ALL" "E_STRICT"
      "E_USER_ERROR" "E_USER_WARNING" "E_USER_NOTICE" "E_CORE_ERROR"
      "E_CORE_WARNING" "E_COMPILE_ERROR" "E_COMPILE_WARNING"
      "E_DEPRECATED" "E_USER_DEPRECATED"
      "DEFAULT_INCLUDE_PATH" "PEAR_INSTALL_DIR" "PEAR_EXTENSION_DIR"
      "PHP_BINDIR" "PHP_LIBDIR" "PHP_DATADIR" "PHP_SYSCONFDIR"
      "PHP_LOCALSTATEDIR" "PHP_CONFIG_FILE_PATH" "PHP_EOL" "PHP_ZTS"
      "PHP_DEBUG" "PHP_MAXPATHLEN" "PHP_SAPI" "PHP_INT_MAX" "PHP_INT_SIZE"
      "PHP_EXTENSION_DIR" "PHP_PREFIX" "PHP_MANDIR" "PHP_CONFIG_FILE_SCAN_DIR"
      "PHP_WINDOWS_VERSION_MAJOR" "PHP_WINDOWS_VERSION_MINOR"
      "PHP_WINDOWS_VERSION_BUILD" "PHP_WINDOWS_VERSION_PLATFORM"
      "PHP_WINDOWS_VERSION_SP_MAJOR" "PHP_WINDOWS_VERSION_SP_MINOR"
      "PHP_WINDOWS_VERSION_SUITEMASK" "PHP_WINDOWS_VERSION_PRODUCTTYPE"
      "PHP_WINDOWS_NT_DOMAIN_CONTROLLER" "PHP_WINDOWS_NT_SERVER"
      "PHP_WINDOWS_NT_WORKSTATION"
      "STDIN" "STDOUT" "STDERR"
      "DATE_ATOM" "DATE_COOKIE" "DATE_ISO8601" "DATE_RFC822" "DATE_RFC850"
      "DATE_RFC1036" "DATE_RFC1123" "DATE_RFC2822" "DATE_RFC3339"
      "DATE_RSS" "DATE_W3C"
      "UPLOAD_ERR_CANT_WRITE" "UPLOAD_ERR_EXTENSION"
      "UPLOAD_ERR_FORM_SIZE" "UPLOAD_ERR_INI_SIZE"
      "UPLOAD_ERR_NO_FILE" "UPLOAD_ERR_NO_TMP_DIR"
      "UPLOAD_ERR_OK" "UPLOAD_ERR_PARTIAL"
      "EXTR_OVERWRITE" "EXTR_PREFIX_SAME" "EXTR_PREFIX_INVALID" "EXTR_IF_EXISTS"
      "SORT_DESC" "SORT_NUMERIC" "CASE_LOWER" "COUNT_NORMAL" "ASSERT_ACTIVE"
      "ASSERT_BAIL" "ASSERT_QUIET_EVAL" "CONNECTION_NORMAL"
      "INI_USER" "INI_SYSTEM"
      "M_E" "M_LOG10E" "M_LN10" "M_PI_2" "M_1_PI" "M_2_SQRTPI" "M_SQRT1_2"
      "CRYPT_STD_DES" "CRYPT_MD5"
      "DIRECTORY_SEPARATOR"
      "SEEK_SET" "SEEK_CUR" "SEEK_END"
      "LOCK_SH" "LOCK_EX" "LOCK_UN" "LOCK_NB"
      "GLOB_BRACE" "GLOB_ONLYDIR" "GLOB_MARK" "GLOB_NOSORT"
      "GLOB_NOCHECK" "GLOB_NOESCAPE" "GLOB_AVAILABLE_FLAGS"
      "FILE_USE_INCLUDE_PATH" "FILE_NO_DEFAULT_CONTEXT" "FILE_APPEND"
      "FILE_IGNORE_NEW_LINES" "FILE_SKIP_EMPTY_LINES" "FILE_BINARY" "FILE_TEXT"
      "INI_SCANNER_NORMAL" "INI_SCANNER_RAW"
      "FNM_NOESCAPE" "FNM_PATHNAME" "FNM_PERIOD" "FNM_CASEFOLD"
      "HTML_SPECIALCHARS"
      "ENT_COMPAT" "ENT_QUOTES" "ENT_NOQUOTES" "ENT_IGNORE" "ENT_SUBSTITUTE"
      "ENT_DISALLOWED" "ENT_HTML401" "ENT_XML1" "ENT_XHTML" "ENT_HTML5"
      "INFO_CREDITS" "INFO_MODULES" "INFO_VARIABLES" "INFO_ALL"
      "CREDITS_GENERAL" "CREDITS_MODULES" "CREDITS_FULLPAGE" "CREDITS_ALL"
      "STR_PAD_RIGHT"
      "PATHINFO_DIRNAME" "PATHINFO_BASENAME"
      "PATHINFO_EXTENSION" "PATHINFO_FILENAME"
      "CHAR_MAX"
      "LC_NUMERIC" "LC_COLLATE" "LC_ALL"
      "ABDAY_1" "ABDAY_3" "ABDAY_5" "ABDAY_7"
      "DAY_2" "DAY_4" "DAY_6"
      "ABMON_1" "ABMON_3" "ABMON_5" "ABMON_7" "ABMON_9" "ABMON_11"
      "MON_1" "MON_3" "MON_5" "MON_7" "MON_9" "MON_11"
      "AM_STR" "D_T_FMT" "T_FMT"
      "ERA" "ERA_D_T_FMT" "ERA_T_FMT"
      "INT_CURR_SYMBOL" "CRNCYSTR" "MON_THOUSANDS_SEP" "POSITIVE_SIGN"
      "INT_FRAC_DIGITS" "P_CS_PRECEDES" "N_CS_PRECEDES" "P_SIGN_POSN"
      "DECIMAL_POINT" "THOUSANDS_SEP" "GROUPING" "NOEXPR" "NOSTR"
      "LOG_EMERG" "LOG_CRIT" "LOG_WARNING" "LOG_INFO" "LOG_KERN" "LOG_MAIL"
      "LOG_AUTH" "LOG_LPR" "LOG_UUCP" "LOG_AUTHPRIV" "LOG_LOCAL1" "LOG_LOCAL3"
      "LOG_LOCAL5" "LOG_LOCAL7" "LOG_CONS" "LOG_NDELAY" "LOG_PERROR"
      "INPUT_POST" "INPUT_GET" "INPUT_COOKIE" "INPUT_ENV" "INPUT_SERVER"
      "INPUT_SESSION" "INPUT_REQUEST"
      "FILTER_FLAG_NONE" "FILTER_REQUIRE_SCALAR" "FILTER_REQUIRE_ARRAY"
      "FILTER_FORCE_ARRAY" "FILTER_NULL_ON_FAILURE" "FILTER_VALIDATE_INT"
      "FILTER_VALIDATE_BOOLEAN" "FILTER_VALIDATE_FLOAT" "FILTER_VALIDATE_REGEXP"
      "FILTER_VALIDATE_URL" "FILTER_VALIDATE_EMAIL" "FILTER_VALIDATE_IP"
      "FILTER_DEFAULT" "FILTER_UNSAFE_RAW" "FILTER_SANITIZE_STRING"
      "FILTER_SANITIZE_STRIPPED" "FILTER_SANITIZE_ENCODED"
      "FILTER_SANITIZE_SPECIAL_CHARS" "FILTER_SANITIZE_FULL_SPECIAL_CHARS"
      "FILTER_SANITIZE_EMAIL" "FILTER_SANITIZE_URL" "FILTER_SANITIZE_NUMBER_INT"
      "FILTER_SANITIZE_NUMBER_FLOAT" "FILTER_SANITIZE_MAGIC_QUOTES"
      "FILTER_CALLBACK" "FILTER_FLAG_ALLOW_OCTAL" "FILTER_FLAG_ALLOW_HEX"
      "FILTER_FLAG_STRIP_LOW" "FILTER_FLAG_STRIP_HIGH" "FILTER_FLAG_ENCODE_LOW"
      "FILTER_FLAG_ENCODE_HIGH" "FILTER_FLAG_ENCODE_AMP"
      "FILTER_FLAG_NO_ENCODE_QUOTES" "FILTER_FLAG_EMPTY_STRING_NULL"
      "FILTER_FLAG_ALLOW_FRACTION" "FILTER_FLAG_ALLOW_THOUSAND"
      "FILTER_FLAG_ALLOW_SCIENTIFIC" "FILTER_FLAG_PATH_REQUIRED"
      "FILTER_FLAG_QUERY_REQUIRED" "FILTER_FLAG_IPV4" "FILTER_FLAG_IPV6"
      "FILTER_FLAG_NO_RES_RANGE" "FILTER_FLAG_NO_PRIV_RANGE"
      "PASSWORD_DEFAULT" "PASSWORD_BCRYPT"
      "PREG_PATTERN_ORDER" "PREG_SET_ORDER" "PREG_OFFSET_CAPTURE"
      "PREG_SPLIT_NO_EMPTY" "PREG_SPLIT_DELIM_CAPTURE"
      "PREG_SPLIT_OFFSET_CAPTURE" "PREG_NO_ERROR" "PREG_INTERNAL_ERROR"
      "PREG_BACKTRACK_LIMIT_ERROR" "PREG_RECURSION_LIMIT_ERROR"
      "PREG_BAD_UTF8_ERROR" "PREG_BAD_UTF8_OFFSET_ERROR" "PCRE_VERSION"
      "CURLOPT_AUTOREFERER" "CURLOPT_COOKIESESSION"
      "CURLOPT_DNS_USE_GLOBAL_CACHE" "CURLOPT_DNS_CACHE_TIMEOUT"
      "CURLOPT_FTP_SSL" "CURLFTPSSL_TRY" "CURLFTPSSL_ALL" "CURLFTPSSL_CONTROL"
      "CURLFTPSSL_NONE" "CURLOPT_PRIVATE" "CURLOPT_FTPSSLAUTH" "CURLOPT_PORT"
      "CURLOPT_FILE" "CURLOPT_INFILE" "CURLOPT_INFILESIZE" "CURLOPT_URL"
      "CURLOPT_PROXY" "CURLOPT_VERBOSE" "CURLOPT_HEADER" "CURLOPT_HTTPHEADER"
      "CURLOPT_NOPROGRESS" "CURLOPT_NOBODY" "CURLOPT_FAILONERROR"
      "CURLOPT_UPLOAD" "CURLOPT_POST" "CURLOPT_FTPLISTONLY" "CURLOPT_FTPAPPEND"
      "CURLOPT_FTP_CREATE_MISSING_DIRS" "CURLOPT_NETRC" "CURLOPT_FOLLOWLOCATION"
      "CURLOPT_FTPASCII" "CURLOPT_PUT" "CURLOPT_MUTE" "CURLOPT_USERPWD"
      "CURLOPT_PROXYUSERPWD" "CURLOPT_RANGE" "CURLOPT_TIMEOUT"
      "CURLOPT_TIMEOUT_MS" "CURLOPT_TCP_NODELAY" "CURLOPT_POSTFIELDS"
      "CURLOPT_PROGRESSFUNCTION" "CURLOPT_REFERER" "CURLOPT_USERAGENT"
      "CURLOPT_FTPPORT" "CURLOPT_FTP_USE_EPSV" "CURLOPT_LOW_SPEED_LIMIT"
      "CURLOPT_LOW_SPEED_TIME" "CURLOPT_RESUME_FROM" "CURLOPT_COOKIE"
      "CURLOPT_SSLCERT" "CURLOPT_SSLCERTPASSWD" "CURLOPT_WRITEHEADER"
      "CURLOPT_SSL_VERIFYHOST" "CURLOPT_COOKIEFILE" "CURLOPT_SSLVERSION"
      "CURLOPT_TIMECONDITION" "CURLOPT_TIMEVALUE" "CURLOPT_CUSTOMREQUEST"
      "CURLOPT_STDERR" "CURLOPT_TRANSFERTEXT" "CURLOPT_RETURNTRANSFER"
      "CURLOPT_QUOTE" "CURLOPT_POSTQUOTE" "CURLOPT_INTERFACE"
      "CURLOPT_KRB4LEVEL" "CURLOPT_HTTPPROXYTUNNEL" "CURLOPT_FILETIME"
      "CURLOPT_WRITEFUNCTION" "CURLOPT_READFUNCTION" "CURLOPT_PASSWDFUNCTION"
      "CURLOPT_HEADERFUNCTION" "CURLOPT_MAXREDIRS" "CURLOPT_MAXCONNECTS"
      "CURLOPT_CLOSEPOLICY" "CURLOPT_FRESH_CONNECT" "CURLOPT_FORBID_REUSE"
      "CURLOPT_RANDOM_FILE" "CURLOPT_EGDSOCKET" "CURLOPT_CONNECTTIMEOUT"
      "CURLOPT_CONNECTTIMEOUT_MS" "CURLOPT_SSL_VERIFYPEER" "CURLOPT_CAINFO"
      "CURLOPT_CAPATH" "CURLOPT_COOKIEJAR" "CURLOPT_SSL_CIPHER_LIST"
      "CURLOPT_BINARYTRANSFER" "CURLOPT_NOSIGNAL" "CURLOPT_PROXYTYPE"
      "CURLOPT_BUFFERSIZE" "CURLOPT_HTTPGET" "CURLOPT_HTTP_VERSION"
      "CURLOPT_SSLKEY" "CURLOPT_SSLKEYTYPE" "CURLOPT_SSLKEYPASSWD"
      "CURLOPT_SSLENGINE" "CURLOPT_SSLENGINE_DEFAULT" "CURLOPT_SSLCERTTYPE"
      "CURLOPT_CRLF" "CURLOPT_ENCODING" "CURLOPT_PROXYPORT"
      "CURLOPT_UNRESTRICTED_AUTH" "CURLOPT_FTP_USE_EPRT"
      "CURLOPT_HTTP200ALIASES" "CURLOPT_HTTPAUTH" "CURLAUTH_BASIC"
      "CURLAUTH_DIGEST" "CURLAUTH_GSSNEGOTIATE" "CURLAUTH_NTLM" "CURLAUTH_ANY"
      "CURLAUTH_ANYSAFE" "CURLOPT_PROXYAUTH" "CURLOPT_MAX_RECV_SPEED_LARGE"
      "CURLOPT_MAX_SEND_SPEED_LARGE" "CURLCLOSEPOLICY_LEAST_RECENTLY_USED"
      "CURLCLOSEPOLICY_LEAST_TRAFFIC" "CURLCLOSEPOLICY_SLOWEST"
      "CURLCLOSEPOLICY_CALLBACK" "CURLCLOSEPOLICY_OLDEST" "CURLINFO_PRIVATE"
      "CURLINFO_EFFECTIVE_URL" "CURLINFO_HTTP_CODE" "CURLINFO_HEADER_OUT"
      "CURLINFO_HEADER_SIZE" "CURLINFO_REQUEST_SIZE" "CURLINFO_TOTAL_TIME"
      "CURLINFO_NAMELOOKUP_TIME" "CURLINFO_CONNECT_TIME"
      "CURLINFO_PRETRANSFER_TIME" "CURLINFO_SIZE_UPLOAD"
      "CURLINFO_SIZE_DOWNLOAD" "CURLINFO_SPEED_DOWNLOAD" "CURLINFO_SPEED_UPLOAD"
      "CURLINFO_FILETIME" "CURLINFO_SSL_VERIFYRESULT"
      "CURLINFO_CONTENT_LENGTH_DOWNLOAD" "CURLINFO_CONTENT_LENGTH_UPLOAD"
      "CURLINFO_STARTTRANSFER_TIME" "CURLINFO_CONTENT_TYPE"
      "CURLINFO_REDIRECT_TIME" "CURLINFO_REDIRECT_COUNT"
      "CURL_TIMECOND_IFMODSINCE" "CURL_TIMECOND_IFUNMODSINCE"
      "CURL_TIMECOND_LASTMOD" "CURL_VERSION_IPV6" "CURL_VERSION_KERBEROS4"
      "CURL_VERSION_SSL" "CURL_VERSION_LIBZ" "CURLVERSION_NOW"
      "CURLE_OK" "CURLE_UNSUPPORTED_PROTOCOL" "CURLE_FAILED_INIT"
      "CURLE_URL_MALFORMAT" "CURLE_URL_MALFORMAT_USER"
      "CURLE_COULDNT_RESOLVE_PROXY" "CURLE_COULDNT_RESOLVE_HOST"
      "CURLE_COULDNT_CONNECT" "CURLE_FTP_WEIRD_SERVER_REPLY"
      "CURLE_FTP_ACCESS_DENIED" "CURLE_FTP_USER_PASSWORD_INCORRECT"
      "CURLE_FTP_WEIRD_PASS_REPLY" "CURLE_FTP_WEIRD_USER_REPLY"
      "CURLE_FTP_WEIRD_PASV_REPLY" "CURLE_FTP_WEIRD_227_FORMAT"
      "CURLE_FTP_CANT_GET_HOST" "CURLE_FTP_CANT_RECONNECT"
      "CURLE_FTP_COULDNT_SET_BINARY" "CURLE_PARTIAL_FILE"
      "CURLE_FTP_COULDNT_RETR_FILE" "CURLE_FTP_WRITE_ERROR"
      "CURLE_FTP_QUOTE_ERROR" "CURLE_HTTP_NOT_FOUND" "CURLE_WRITE_ERROR"
      "CURLE_MALFORMAT_USER" "CURLE_FTP_COULDNT_STOR_FILE" "CURLE_READ_ERROR"
      "CURLE_OUT_OF_MEMORY" "CURLE_OPERATION_TIMEOUTED"
      "CURLE_FTP_COULDNT_SET_ASCII" "CURLE_FTP_PORT_FAILED"
      "CURLE_FTP_COULDNT_USE_REST" "CURLE_FTP_COULDNT_GET_SIZE"
      "CURLE_HTTP_RANGE_ERROR" "CURLE_HTTP_POST_ERROR" "CURLE_SSL_CONNECT_ERROR"
      "CURLE_FTP_BAD_DOWNLOAD_RESUME" "CURLE_FILE_COULDNT_READ_FILE"
      "CURLE_LDAP_CANNOT_BIND" "CURLE_LDAP_SEARCH_FAILED"
      "CURLE_LIBRARY_NOT_FOUND" "CURLE_FUNCTION_NOT_FOUND"
      "CURLE_ABORTED_BY_CALLBACK" "CURLE_BAD_FUNCTION_ARGUMENT"
      "CURLE_BAD_CALLING_ORDER" "CURLE_HTTP_PORT_FAILED"
      "CURLE_BAD_PASSWORD_ENTERED" "CURLE_TOO_MANY_REDIRECTS"
      "CURLE_UNKNOWN_TELNET_OPTION" "CURLE_TELNET_OPTION_SYNTAX"
      "CURLE_OBSOLETE" "CURLE_SSL_PEER_CERTIFICATE" "CURLE_GOT_NOTHING"
      "CURLE_SSL_ENGINE_NOTFOUND" "CURLE_SSL_ENGINE_SETFAILED"
      "CURLE_SEND_ERROR" "CURLE_RECV_ERROR" "CURLE_SHARE_IN_USE"
      "CURLE_SSL_CERTPROBLEM" "CURLE_SSL_CIPHER" "CURLE_SSL_CACERT"
      "CURLE_BAD_CONTENT_ENCODING" "CURLE_LDAP_INVALID_URL"
      "CURLE_FILESIZE_EXCEEDED" "CURLE_FTP_SSL_FAILED" "CURLFTPAUTH_DEFAULT"
      "CURLFTPAUTH_SSL" "CURLFTPAUTH_TLS" "CURLPROXY_HTTP" "CURLPROXY_SOCKS5"
      "CURL_NETRC_OPTIONAL" "CURL_NETRC_IGNORED" "CURL_NETRC_REQUIRED"
      "CURL_HTTP_VERSION_NONE" "CURL_HTTP_VERSION_1_0" "CURL_HTTP_VERSION_1_1"
      "CURLM_CALL_MULTI_PERFORM" "CURLM_OK" "CURLM_BAD_HANDLE"
      "CURLM_BAD_EASY_HANDLE" "CURLM_OUT_OF_MEMORY" "CURLM_INTERNAL_ERROR"
      "CURLMSG_DONE" "CURLOPT_KEYPASSWD" "CURLOPT_SSH_AUTH_TYPES"
      "CURLOPT_SSH_HOST_PUBLIC_KEY_MD5" "CURLOPT_SSH_PRIVATE_KEYFILE"
      "CURLOPT_SSH_PUBLIC_KEYFILE" "CURLSSH_AUTH_ANY" "CURLSSH_AUTH_DEFAULT"
      "CURLSSH_AUTH_HOST" "CURLSSH_AUTH_KEYBOARD" "CURLSSH_AUTH_NONE"
      "CURLSSH_AUTH_PASSWORD" "CURLSSH_AUTH_PUBLICKEY"
      "PHP_SESSION_DISABLED" "PHP_SESSION_NONE" "PHP_SESSION_ACTIVE"
      "NIL" "OP_DEBUG" "OP_READONLY" "OP_ANONYMOUS" "OP_SHORTCACHE" "OP_SILENT"
      "OP_PROTOTYPE" "OP_HALFOPEN" "OP_EXPUNGE" "OP_SECURE" "CL_EXPUNGE"
      "FT_UID" "FT_PEEK" "FT_NOT" "FT_INTERNAL" "FT_PREFETCHTEXT"
      "ST_UID" "ST_SILENT" "ST_SET"
      "CP_UID" "CP_MOVE"
      "SE_UID" "SE_FREE" "SE_NOPREFETCH"
      "SO_FREE" "SO_NOSERVER"
      "SA_MESSAGES" "SA_RECENT" "SA_UNSEEN" "SA_UIDNEXT" "SA_UIDVALIDITY"
      "SA_ALL"
      "LATT_NOINFERIORS" "LATT_NOSELECT" "LATT_MARKED" "LATT_UNMARKED"
      "SORTDATE" "SORTARRIVAL" "SORTFROM" "SORTSUBJECT" "SORTTO"
      "SORTCC" "SORTSIZE"
      "TYPETEXT" "TYPEMULTIPART" "TYPEMESSAGE" "TYPEAPPLCATION" "TYPEAUDIO"
      "TYPEIMAGE" "TYPEVIDEO" "TYPEOTHER"
      "ENC7BIT" "ENC8BIT" "ENCBINARY" "ENCBASE64"
      "ENCQUOTEDPRINTABLE" "ENCOTHER"
      "IMAP_OPENTIMEOUT" "IMAP_READTIMEOUT"
      "IMAP_WRITETIMEOUT" "IMAP_CLOSETIMEOUT"
      "LATT_REFERRAL" "LATT_HASCHILDREN" "LATT_HASNOCHILDREN"
      "TYPEMODEL" "IMAP_GC_ELT" "IMAP_GC_ENV" "IMAP_GC_TEXTS")))
  "Zephir constants.")

(defconst zephir-types
  (eval-when-compile
    (regexp-opt
     '("boolean" "string" "char" "resource" "object" "array" "callable" "as"
       "get" "__toString" "set" "abstract" "double" "float" "int" "interface"
       "long" "var" "void" "ulong" "uint" "uchar" "unsigned" "self")))
  "Zephir types.")

(defconst zephir-keywords
  (eval-when-compile
    (regexp-opt
     '("echo" "require" "break" "case" "catch" "let" "var" "continue" "default"
        "do" "else" "for" "goto" "if" "return" "switch" "throw" "try" "while"
        "loop" "in" "reverse" "instanceof" "new" "typeof" "const" "fetch"
        "empty" "likely" "unlikely" "isset" "unset" "extends" "final"
        "implements" "private" "protected" "public" "static" "scoped" "inline"
        "throws" "clone" "use" "function")))
  "Zephir keywords.")

(defconst zephir-font-lock-keywords-1
  (append
   (list
    (cons
     (concat "[^_]?\\<\\(" zephir-constants "\\)\\>[^_]?")
     '(1 font-lock-constant-face))
    (cons
     (concat "[^_]?\\<\\(" zephir-keywords "\\)\\>[^_]?")
     '(1 font-lock-keyword-face)))
   )
  "Subdued level highlighting for Zephir mode.")

(defconst zephir-font-lock-keywords-2
  (append
   zephir-font-lock-keywords-1
   (list
    '("\\<\\(namespace\\|class\\)\\s-+\\(\\(?:\\sw\\|\\\\\\)+\\)?"
      (1 font-lock-keyword-face)
      (2 font-lock-type-face nil t))

    '("\\<\\(new\\|extends\\|implements\\)\\s-+\\$?\\(\\(:?\\sw\\|\\\\\\)+\\)"
      (1 font-lock-keyword-face)
      (2 font-lock-type-face nil t))

    '("\\<use\\s-+\\(\\(?:\\sw\\|\\(?:,\\s-*\\)\\|\\\\\\)+\\)"
      (1 font-lock-type-face))

    '("\\<use\\s-+\\(\\(?:\\sw\\|\\\\\\)+\\)\\s-+as\\s-+\\(\\(?:\\sw\\|\\\\\\)+\\)"
      (1 font-lock-type-face)
      (2 font-lock-type-face))

    '("\\<function\\s-+&?\\(\\sw+\\)\\s-*(\\([^)]*\\))"
      (1 font-lock-function-name-face)
      (2 font-lock-variable-name-face keep t))
    '("\\(?:\\s-\\|\\n\\)+->\\(?:\\s-\\|\\n\\)+\\(\\(?:\\sw\\|\\\\\\|[<>]\\)+\\)"
      (1 font-lock-keyword-face))

    '("\\<\\(self\\)\\(?:::\\)" (1 font-lock-constant-face nil nil))
    '("\\<\\(parent\\)\\(?:::\\|\\s-*(\\)" (1 font-lock-constant-face nil nil))
    '("\\<\\(static\\)\\(?:::\\)" (1 font-lock-constant-face t nil))
    ))
  "Medium level highlighting for Zephir mode.")

(defconst zephir-font-lock-keywords-3
  (append
   zephir-font-lock-keywords-2
   (list
    `(,(concat "(\\s-*\\(" zephir-types "\\)\\s-*)") 1 font-lock-type-face)

    '("\\(\\(\\sw\\|\\\\\\)+\\)::\\sw+\\s-*(?" . (1 font-lock-type-face))

    '("::\\(\\(?:\\sw\\|\\s_\\)+\\>\\)[^(]" . (1 font-lock-constant-face))

    '("\\<use\\s-+\\(\\sw+\\)\\s-*;" . (1 font-lock-type-face))
    ))

  "Gauchy level highlighting for Zephir mode.")

(define-derived-mode zephir-mode php-mode "Zephir"
  "Major mode for editing Zephir code.\n\n\\{zephir-mode-map}"
  (c-add-language 'zephir-mode 'php-mode)

  (set (make-local-variable 'c-doc-comment-style) '((zephir-mode . javadoc)))

  (make-local-variable 'font-lock-defaults)
  (setq font-lock-defaults
        '((zephir-font-lock-keywords-1
           zephir-font-lock-keywords-2
           zephir-font-lock-keywords-3)
          nil                ; KEYWORDS-ONLY
          t                  ; CASE-FOLD
          (("_" . "w"))      ; SYNTAX-ALIST
          nil))              ; SYNTAX-BEGIN

  (modify-syntax-entry ?_    "_" zephir-mode-syntax-table)
  (modify-syntax-entry ?`    "\"" zephir-mode-syntax-table)
  (modify-syntax-entry ?\"   "\"" zephir-mode-syntax-table)
  (modify-syntax-entry ?#    "< b" zephir-mode-syntax-table)
  (modify-syntax-entry ?\n   "> b" zephir-mode-syntax-table)

  (set (make-local-variable 'syntax-propertize-via-font-lock)
       '(("\\(\"\\)\\(\\\\.\\|[^\"\n\\]\\)*\\(\"\\)" (1 "\"") (3 "\""))
         ("\\(\'\\)\\(\\\\.\\|[^\'\n\\]\\)*\\(\'\\)" (1 "\"") (3 "\""))))
  )

(defcustom zephir-mode-hook nil
  "*Hook called by `zephir-mode'."
  :type 'hook
  :group 'zephir)

(defun zephir-coding-style-setup ()
  (c-set-offset 'substatement '0))

(add-hook 'zephir-mode-hook 'zephir-coding-style-setup)

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.zep$" . zephir-mode))

(provide 'zephir-mode)

;;; zephir-mode.el ends here
