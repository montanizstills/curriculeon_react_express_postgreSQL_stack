FROM openjdk:8-jdk-alpine as build
WORKDIR /workspace/app
# COPY mvnw .
# COPY .mvn .mvn

RUN echo "the quick brown fox"
CMD ["ls", "."]
# ARG --progress=plain --no-cache


# COPY pom.xml .
# COPY src/ src
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
