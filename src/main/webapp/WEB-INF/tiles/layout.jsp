<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<style>
.header {
	height: 20%;
	width: 100%;
	float: top;
	position: fixed;
	top: 0;
	padding: 10px;
}

.menu {
	float: left; 
	padding: 20px;
    width: 25%;
}

.body {
	float: right; 
	padding: 10px; 
	width: 85%; 
	height: 75%;
	margin-top: 90px;
}

.footer {
	float:right;
	text-align: center; 
	padding: 3px; 
	background-color: DarkSalmon; 
	color: white; 
	bottom: 0px; 
	width: 100%; 
	height: 5%; 
	position: fixed;
}
</style>
</head>
<body>
	<div class="header">
		<tiles:insertAttribute name="header" />
	</div>
	<div class="menu">
		<tiles:insertAttribute name="menu" />
	</div>
	<div class="body">
		<tiles:insertAttribute name="body" />
	</div>
	<div class="footer">
		<tiles:insertAttribute name="footer" />
	</div>

</body>
</html>
