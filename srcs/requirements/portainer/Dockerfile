FROM alpine:3.20

# Install necessary packages
RUN apk add --no-cache curl tar

# Download and extract Portainer from GitHub
RUN curl -L https://github.com/portainer/portainer/releases/download/2.18.4/portainer-2.18.4-linux-amd64.tar.gz -o portainer.tar.gz \
    && tar -xvzf portainer.tar.gz --strip-components=1 \
    && mv portainer /usr/local/bin/portainer \
    && rm -rf portainer.tar.gz

# Install Docker Compose plugin
RUN curl -L https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# Change the bind_address of Portainer
# RUN sed -i 's/9000/9042/' /usr/local/bin/portainer

# Expose the necessary ports
EXPOSE 9443

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/portainer"]