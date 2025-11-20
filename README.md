# Laravel Cypress Test Runner

## Configuration
- - Login to docker hub in docker desktop
- Run `docker buildx create --name multiplatform-builder --use
multiplatform-builder`
- Run `docker buildx build --platform linux/amd64,linux/arm64 \
  -t kennethcarlybanez/laravel-cypress-test-runner:latest \
  --push .`