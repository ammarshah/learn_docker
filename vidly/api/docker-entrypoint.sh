#!/bin/sh -e

# If running the node server then migrate existing database
if [ "${1}" == "npm" ] && [ "${2}" == "start" ]; then
  npm run db:up
fi

echo "Migrating database..."
exec "${@}"