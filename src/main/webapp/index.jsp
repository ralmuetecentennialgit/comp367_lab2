<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to COMP367</title>
</head>
<body>
<h1>
    <%
        java.util.Date currentTime = new java.util.Date();
        int hour = java.time.LocalTime.now().getHour();

        String greeting;
        if (hour >= 0 && hour < 12) {
            greeting = "Good morning";
        } else if (hour >= 12 && hour < 17) {
            greeting = "Good afternoon";
        } else {
            greeting = "Good evening";
        }

        String name = "Rowel";
        out.println("Today is " + currentTime);
        out.println("<br><br>");
        out.println(greeting + ", " + name + ", Welcome to COMP367!");
    %>
</h1>
</body>
</html>
