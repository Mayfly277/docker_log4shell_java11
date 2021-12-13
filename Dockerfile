FROM maven:3-openjdk-11
COPY rogue-jndi/ /app
WORKDIR /app
RUN mvn clean package -DskipTests
ENTRYPOINT ["java","-jar","target/RogueJndi-1.1.jar"]
