#!/bin/sh
set -e

if [ "${RUN_MIGRATIONS:-true}" = "true" ]; then
  echo "Running database migrations..."

  if [ -f pnpm-lock.yaml ]; then
    pnpm run db:migrate
  elif [ -f yarn.lock ]; then
    yarn db:migrate
  else
    npm run db:migrate
  fi
fi

echo "Starting Pages CMS..."

if [ -f pnpm-lock.yaml ]; then
  exec pnpm run start
elif [ -f yarn.lock ]; then
  exec yarn start
else
  exec npm run start
fi
