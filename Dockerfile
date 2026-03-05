#-------------------------------stage 1 builds the image------------------------------------#
FROM maven:3.9.9-eclips-tumerin-17 AS build 
#------creating the working directory inside the root folder------#
WORKDIR /app
#---------copying the pom.xml to /app folder-----------#
COPY pom.xml .
#-------copy soruce code---------#
COPY src ./src
#-----------------building the jar file-----------------------#
RUN mvn clean package -DskipTests

#-----------stage 2 creating new Smaller image---------------#
FROM  eclips-temurin:17-jdk-jammy
#-------------create working directry-----------------#
WORKDIR /app
#-----------copying the jar file from build stage-------------#
COPY --from=build /app/target/*.jar app.jar
#--------Exposing the Port-----------------#
EXPOSE 8761

ENTRYPOINT [ "java","-jar","app.jar" ]


