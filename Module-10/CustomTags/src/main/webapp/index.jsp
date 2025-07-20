<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://example.com/mytags" prefix="my" %>

 <!-- JSP using our custom tag -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Custom Tag example</title>
</head>
<body>
<h1>Welcome to Custom Tags in JSP!</h1>
    
    <!-- Using the custom tag -->
    <my:greeting message="Hello from the custom tag!"/>
</body>
</html>