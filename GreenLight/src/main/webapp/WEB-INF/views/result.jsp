<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page import="com.raonsecure.touchenkey.*"%> --%>
<%
//String privateKey = new String("E:/Eclipse/workspace/nxKey_1.0.0.75_20210924/WebContent/WEB-INF/raon_config/nxkey/Private2048.key.der");
String privateKey = new String("C:/Users/2jiwo/git/repository/GreenLight/src/main/webapp/raon_config/nxkey/Private2048.key.der");

// E2ECrypto Tk = new E2ECrypto(request, session, privateKey);

// int LastError = Tk.getLastError();
// if (LastError != 0) {
//    System.out.println("[raonsecure] TouchEnKey ERROR_CODE :[ " + LastError+ " ] , ERROR_Message [" + Tk.getLastErrorMessage()   + " ]");
// }

%>
<%-- txt2 : <%=Tk.getDecryptedAttribute("txt2")%><br/> --%>
<%-- pwd1 : <%=Tk.getDecryptedAttribute("pwd1")%><br/> --%>
<%-- pwd2 : <%=Tk.getDecryptedAttribute("pwd2")%><br/> --%>
<%-- pwd4 : <%=Tk.getDecryptedAttribute("pwd4")%><br/> --%>