<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<body>
		<div style="height: 20%;"><tiles:insertAttribute name="header" /></div>
		<div style="float:left;padding:10px;width:25%;"><tiles:insertAttribute name="menu" /></div>
		<div style="float:right;padding:10px;width:85%;height: 70%;">
		<tiles:insertAttribute name="body"/></div>
    	<div style="clear:both ; text-align: center; padding: 3px;background-color: DarkSalmon;color: white;  bottom: 0px; width: 100%;height: 10%;"><tiles:insertAttribute name="footer" /></div>

</body>
</html>
