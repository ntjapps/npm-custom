# Base pinned by digest (multi-arch index): `docker buildx imagetools inspect node:lts-alpine`, copy the top-level "Digest:".
# Dependabot (docker, target dev) opens a PR when the digest moves. Global npm packages are version-pinned: bump them
# deliberately (`npm view <pkg> version`).
FROM node:lts-alpine@sha256:6bd9ab43c0ec0190ca7b2d193906cb8b7edf6e7f4afa43ddeccd6452710bffb5

# Set Cypress Environment Variables
ENV CYPRESS_CACHE_FOLDER=/var/cache/Cypress

# Install git
RUN apk --no-cache update && apk --no-cache upgrade && \
    apk add --no-cache openssh git && \
    mkdir -p ~/.ssh && \
    ssh-keyscan github.com >> ~/.ssh/known_hosts && \
    mkdir -p /var/cache/Cypress && chmod a+rwx /var/cache/Cypress && \
    npm install -g pnpm@12.18.0 npm@12.2.2 && \
    npm install -g @vue/cli@5.0.9 @angular/cli@22.2.6

# Check NPM test
RUN npm --version
