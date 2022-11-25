FROM openjdk:8-jdk-alpine as build
WORKDIR /workspace/app

ARG PROGRESS="--plain"
ARG CACHE="--no-cache"
ARG BUILDKIT="DOCKER_BUILDKIT=0"

RUN echo "Running copy mvnw to ./"
COPY mvnw .
RUN echo "Finsished copy mvnw"

RUN echo "Displaying volume contents"
RUN echo */* --no-cache

RUN echo "Running copy .mvn to ./mvn/"
COPY .mvn .mvn
RUN echo "Finsished copy mvn"

RUN echo "Displaying volume contents"
RUN echo */*


RUN echo "Running copy pom.xml to ./"
COPY pom.xml .
RUN echo "Finsished copy pom.xml"

RUN echo "Displaying volume contents"
RUN echo */*


RUN echo "Running copy src to ./src/"
COPY src src
RUN echo "Finsished copy src"

RUN echo "Displaying volume contents"
RUN echo */*


# RUN chmod +x ./mvnw
# RUN ./mvnw install -DskipTests
# RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)
# FROM openjdk:8-jdk-alpine
# VOLUME /tmp
# ARG DEPENDENCY=/workspace/app/target/dependency
# COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
# COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
# COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
# ENTRYPOINT ["java","-cp","app:app/lib/*","com.github.curriculeon.DemoApplication"]
