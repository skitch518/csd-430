<%-- 
    Jason Schriner 
    Module 3 
    6/8/25 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Submission</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<%
    if(request.getMethod().equals("POST")) {
%>
    <h2>Customer Experience Feedback</h2>
    <table>
        <tr><th>Field</th><th>Response</th></tr>
        <tr>
            <td>How did you hear about us?</td>
            <td><%= request.getParameter("how_did_you_hear") %></td>
        </tr>
        <tr>
            <td>Overall Experience</td>
            <td><%= request.getParameter("experience") %></td>
        </tr>
        <tr>
            <td>Likelihood to Dine Again</td>
            <td><%= request.getParameter("dineAgain") %></td>
        </tr>
        <tr>
            <td>Things Enjoyed</td>
            <td>
                <%
                    String[] enjoyed = request.getParameterValues("enjoyed");
                    if(enjoyed != null) {
                        for(String item : enjoyed) {
                            out.print(item + "<br/>");
                        }
                    } else {
                        out.print("None selected");
                    }
                %>
            </td>
        </tr>
        <tr>
            <td>Additional Comments</td>
            <td><%= request.getParameter("textarea") %></td>
        </tr>
    </table>
<%
    }
%>
</body>
</html>
