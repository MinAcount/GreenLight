/**
****************************************************
TouchEnNx_config.js
****************************************************
| Version     작성자        수정일        변경사항 
 ---------  -------  -----------  ----------
 | v1.0.0.13   최광민    2023.10.05
 | v1.0.0.12   강남준    2023.04.12
 | v1.0.0.11   강남준    2023.02.14
 | v1.0.0.10   강남준    2023.02.01
 | v1.0.0.9    강남준    2021.08.14
 | v1.0.0.8    강남준    2021.01.29
 | v1.0.0.7    강남준    2020.02.17
 | v1.0.0.6    강남준    2019.07.05
 | v1.0.0.5    강남준    2018.12.14
 | v1.0.0.4    백서린    2018.11.12
 | v1.0.0.3    강남준    2018.05.14
 | v1.0.0.2    허혜림    2018.01.31
 | v1.0.0.1    허혜림    2017.12.20          

****************************************************
 Copyright ⒞ RaonSecure Co., Ltd. 
****************************************************
**/

var nxKeyConfig ={};
nxKeyConfig.version = {
	
	extension :   {
		exChromeExtVer		:	"1.0.0.0",
		exFirefoxExtVer		:	"1.0.2.5",
		exFirefoxJpmExtVer	:	"1.0.1.12",
		exOperaExtVer		:	"1.0.1.14"
	},
		
	/** 키보드보안 설정 */
		tkappiver			:	"1.0.0.80",
		tkappmver			:	"1.0.0.68",
		exWinVer			:	"1.0.0.84",
		exWin64Ver			:	"1.0.0.84",
		exWinProtocolVer	:	"1.0.1.1547",
		daemonVer			:   "1.0.2.11",
		macDaemonVer		:   "1.0.1.8",
		linuxDaemonVer		:   "1.0.0.1",
		exMacVer			:	"1.0.0.16",
		exMacProtocolVer	:	"1.0.1.1547"
};


nxKeyConfig.module = {
		
		extension	:{
			//exChromeExtDownURL	: "https://chrome.google.com/webstore/detail/dncepekefegjiljlfbihljgogephdhph",
			exChromeExtDownURL	: "https://download.raonsecure.com/extension/chrome/chrome.html",
			exFirefoxExtDownURL	: TouchEnNxConfig.path.base + "/extension/touchenex_firefox.xpi",
			exFirefoxJpmExtDownURL	: TouchEnNxConfig.path.base + "/extension/jpm_touchenex_firefox.xpi",
			exOperaExtDownURL	: TouchEnNxConfig.path.base + "/extension/touchenex_opera.nex"														
		},
		
			exWinClient		            :	TouchEnNxConfig.path.base + "/nxKey/module/TouchEn_nxKey_32bit.exe",
			exWin64Client            	:	TouchEnNxConfig.path.base + "/nxKey/module/TouchEn_nxKey_64bit.exe",
			daemonDownURL				:	TouchEnNxConfig.path.base + "/nxKey/module/TouchEn_nxKey_32bit.exe",
			macDaemonDownURL			:	TouchEnNxConfig.path.base + "/nxKey/module/TouchEn_nxKey_Installer.pkg",
		//	ubuntu32DaemonDownURL		:	TouchEnNxConfig.path.base + "/nxKey/module/CrossEXService_32bit.deb",
		//	ubuntu64DaemonDownURL		:	TouchEnNxConfig.path.base + "/nxKey/module/CrossEXService_64bit.deb",
		//	fedora32DaemonDownURL		:	TouchEnNxConfig.path.base + "/nxKey/module/CrossEXService_32bit.rpm",
		//	fedora64DaemonDownURL		:	TouchEnNxConfig.path.base + "/nxKey/module/CrossEXService_64bit.rpm",
			exMacClient					:	TouchEnNxConfig.path.base + "/nxKey/module/TouchEn_nxKey_Installer.pkg",
			exMacProtocolDownURL		: 	TouchEnNxConfig.path.base + "/nxKey/module/TouchEn_nxKey_Installer.pkg"
	};

/** 키보드보안 E2E 를 사용하지 않을 경우 주석해제*/
//var TNK_SR = "";

/**	클라이언트 솔루션별 동작 설정*/
TouchEnNxConfig.solution={
		nxkey : {
				tekOption : {
					"pki": "TouchEnkeyEx",
				    "keyboardonly": "false",
				    "defaultenc": "false",
				    "verify": "1",
				    "defaultpaste": "true",
				    "iframename": "",
				    "usegetenc": "false",
				    "clearbufferonempty": "true",
				    "refreshsession": "true",
				    "improve": "true",
					"bstart": 0,
				    "setcallback": "false",
				    "usebspress": "false",
				    "ignoreprogress": "true",
				    "ignoreprogress2": "true",
				    "exformname": "",
				    "idbase": "false",
				    "allcrypt": "false",
					"browserinfo" : "",
					"cert" : "-----BEGIN CERTIFICATE-----MIIDETCCAfmgAwIBAgIJAO4t+//wr+fZMA0GCSqGSIb3DQEBCwUAMGcxCzAJBgNVBAYTAktSMR0wGwYDVQQKExRSYW9uU2VjdXJlIENvLiwgTHRkLjEaMBgGA1UECxMRUXVhbGl0eSBBc3N1cmFuY2UxHTAbBgNVBAMTFFJhb25TZWN1cmUgQ28uLCBMdGQuMB4XDTI0MDIwODA3MzYzM1oXDTI0MDUwODA3MzYzM1owDTELMAkGA1UEBhMCS1IwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDZcDc4iD3GZ1Sz7igYGfUQTp0WaV5aggegi31UE+dr31Ig/F0j6TSRwM5I+rnPDZi0jH0v2RS3xzBLFKfBIa31AxyQUhFEHJEORjWNs8qj0n30V9fG/tikWjwRNLXH2F7CYLkN75k9sFSWMn6oSct0uCNaB8kA1jtkZcOxqUHAbI33NuHs5CYJ5wIUBrRRFw8rd/JRxtPePtzV9ocbfQogQ9/CA22rejnl1Y0LPQ1JTsNHrMtPd6d6lgYOshUUvmet5VnDBLtRBZYNGym6scoi+qqiOn3DA0hFonVWb/qY9v4R4PbOMwppVpMQmSqVMRkwAxVEfuRLn637RsINRT1TAgMBAAGjGjAYMAkGA1UdEwQCMAAwCwYDVR0PBAQDAgXgMA0GCSqGSIb3DQEBCwUAA4IBAQAGPd5b6GpRyqoQtdjWa3zRuglFpOdQ/2EwnL0Hft5cvoRMtRqRhxFJxwGlB49xO7yn3t9DGaZvTGNmDdtPqs/fLEtK5l8obHcGXUX1i5HK00rBDak0lVlac9qGf+uUFplSUJjXGvjJsNs4Jmhrejo5R/xU6p83L8RR2RJGJIJ/DUt0KfbRVzRd5X3lfFrr5efbbQR3RR+UAfo5Dhm6RHKkK58fL5+dUYf6y8u26sglyWAjHKkJ7HwkFSne6awdUEF/OTEOtqv3J690WeKVgPJZXDTs3YRNVKVOlD0ZXWOrfgQp8Xi+6R7kILumTZY11uf35HMTTgylgU+vPvzu1Vdi-----END CERTIFICATE-----",
					"srdk": TNK_SR,
					"generate_event": "false",
					"driverexcept": "0",
					"delayedck": "false",
					"shiftbypass": "true",
					"allowdup": "false",
					"enc2": "false",
				    "searchformname":"",
					"runtype": TouchEnNxConfig.runtype,
					"tk_isRunningSecurity" : "false", 
					"isAllowIdOverlap" : "true", //히든필드 중복오류 수정시 false설정 및 서버버전 v2.0.3.3 적용필요
					"defaultsecurityid" : "true",
					"newModule" : "true",
					"useWebSquarePast" : "false",
					"cmvp15" : "false",
					"senseReader":"false"
				}
		}
};