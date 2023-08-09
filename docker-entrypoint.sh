#!/bin/sh

set -e

./mev-boost-relay tool migrate --db "postgresql://postgres:postgres@$DB_HOST:$DB_PORT/postgres?sslmode=disable"
./mev-boost-relay housekeeper --db "postgresql://postgres:postgres@$DB_HOST:$DB_PORT/postgres?sslmode=disable"
./mev-boost-relay api \
  --db "postgresql://postgres:postgres@$DB_HOST:$DB_PORT/postgres?sslmode=disable" \
  --redis-uri "$REDIS_HOST:$REDIS_PORT" \
  --listen-addr "0.0.0.0:9062" \
  --beacon-uris "http://$BEACON_HOST:$BEACON_PORT" \
  --secret-key "0x3dd5f69c2e334a81ee84deb2f2da0e460b0b90aca2cd2e7d948cce056982c119"
