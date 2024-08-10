#!/bin/bash
set -e

# Start PostgreSQL in the background
docker-entrypoint.sh postgres &

# Wait for PostgreSQL to start
until pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB"; do
  echo "Waiting for PostgreSQL to start..."
  sleep 1
done

# Execute SQL commands from init.sql
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /init.sql

# Bring PostgreSQL to the foreground
wait
