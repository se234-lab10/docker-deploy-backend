FROM openjdkL16-jdk-alpine
RUN addgroup -s spring && adduser -s spring -G spring
EXPOSE 8080

ENV JAVA_PROFILE prod
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT_INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META_INF
COPY ${DEPENDENCY}/BOOT_INF/classes /app

ENTRYPOINT [ "java", "-Dspring.profiles.active=${ JAVA_PROFILE}", \
            "-cp","app:app/lib/*","camt.se234.lab10.Lab10Application"]


