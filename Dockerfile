# Use Tomcat 10 image with JDK 17
FROM tomcat:10.1.15-jdk17-temurin

# Add your WAR file to the Tomcat webapps directory
COPY target/comp367-webapp.war /usr/local/tomcat/webapps/comp367-webapp.war

# Expose the port the app runs on
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
