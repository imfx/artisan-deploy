#!/bin/bash

# Install dependencies
composer install --no-interaction --prefer-dist --optimize-autoloader --no-dev

# Generate env file
cp -p .env.example .env

# Generate key
php artisan key:generate

# Assign permissions and owners
chown -R apache:users bootstrap/cache storage && chmod -R 775 bootstrap/cache storage
