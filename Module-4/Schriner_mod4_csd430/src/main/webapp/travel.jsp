<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="firstBean.TravelHistory" %>
<%@ page import="firstBean.CountryVisit" %>

<jsp:useBean id="history" class="firstBean.TravelHistory" scope="request" />

<!-- 
    Jason Schriner
    Module 4
    6/14/25
    
    I used the same css file from mod 2
-->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Countries I have Visited</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h1>My Personal Travel Destinations</h1>
    <p>This table lists the countries I’ve visited, along with the City and Year.</p>

    <table>
        <thead>
            <tr>
                <th>Country</th>
                <th>City</th>
                <th>Year Visited</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<CountryVisit> visits = history.getVisits();
                for (CountryVisit visit : visits) {
            %>
                <tr>
                    <td><%= visit.getCountry() %></td>
                    <td><%= visit.getCity() %></td>
                    <td><%= visit.getYearVisited() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
