<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    /*
    * Jason Schriner
    * Module 2
    * 6/1/25
    */
    
    // Java class for travel records
    class CountryVisit {
        String country;
        String city;
        String yearVisited;
       
        // Constructor
        CountryVisit(String country, String city, String yearVisited) {
            this.country = country;
            this.city = city;
            this.yearVisited = yearVisited;
        }
    }

    java.util.ArrayList<CountryVisit> visits = new java.util.ArrayList<>();
    visits.add(new CountryVisit("Japan", "Misawa", "2003"));
    visits.add(new CountryVisit("Mexico", "Cozumel", "2006"));
    visits.add(new CountryVisit("Panama", "Panama City", "2006"));
    visits.add(new CountryVisit("Ukraine", "Cherkassy", "2017"));
    visits.add(new CountryVisit("Ukraine", "Kiev", "2018"));

%>    

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
                for (CountryVisit visit : visits) {
            %>
                <tr>
                    <td><%= visit.country %></td>
                    <td><%= visit.city %></td>
                    <td><%= visit.yearVisited %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

</body>
</html>