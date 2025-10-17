# Use official MySQL image as base
FROM mysql:8.0

# Copy initialization scripts
COPY ./init /docker-entrypoint-initdb.d/

# Environment variables for database setup
ENV MYSQL_DATABASE=gti_record_keeping_v2
ENV MYSQL_USER=gti_record_keeping
ENV MYSQL_PASSWORD=Asd$123!
ENV MYSQL_ROOT_PASSWORD=root
