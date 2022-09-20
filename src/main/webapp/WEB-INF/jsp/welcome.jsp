<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><tiles:insertAttribute name="title" /></title>

</head>
<body>
	<div><tiles:insertAttribute name="header" /></div>
		<div style="float:left;padding:10px;width:15%;"><tiles:insertAttribute name="menu" /></div>
		<div style="float:left;padding:10px;width:80%;border-left:1px solid pink;">
		<tiles:insertAttribute name="body" /></div>
    	<div style="clear:both"><tiles:insertAttribute name="footer" /></div>
	<%-- <tiles:insertAttribute name="header" />
	<br />
	<tiles:insertAttribute name="body" />
	<br />
	<tiles:insertAttribute name="footer" /> --%>
</body>
</html>