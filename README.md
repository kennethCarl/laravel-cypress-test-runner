# Laravel Cypress Test Runner

## Publish to docker hub
- Login to docker hub in docker desktop
- Run `docker buildx use multiplatform-builder` (or create it first with `docker buildx create --name multiplatform-builder --use` if it doesn't exist)
- Run `docker buildx build --platform linux/amd64,linux/arm64 -t kennethcarlybanez/laravel-cypress-test-runner:v2 --no-cache . --push`