# =========================
# Stage 1: Build the JAR
# =========================
FROM eclipse-temurin:21-jdk AS builder

WORKDIR /app

# Copy pom.xml and download dependencies first (better caching)
COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

RUN ./mvnw dependency:go-offline -B

# Copy source and build the app
COPY src src
RUN ./mvnw clean package -DskipTests

# =========================
# Stage 2: Run the JAR
# =========================
FROM eclipse-temurin:21-jre AS runtime

WORKDIR /app

# Copy only the built jar from builder stage
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
