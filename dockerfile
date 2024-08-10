# Use the official PostgreSQL image
FROM postgres:14

# Set environment variables for PostgreSQL
ENV POSTGRES_DB=mydatabase
ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword

# Copy the custom entrypoint script and SQL file into the container
COPY entrypoint.sh /docker-entrypoint.sh
COPY init.sql /init.sql

# Make the entrypoint script executable
RUN chmod +x /docker-entrypoint.sh

# Set the custom entrypoint script
ENTRYPOINT ["/docker-entrypoint.sh"]

# Expose PostgreSQL port
EXPOSE 5432
