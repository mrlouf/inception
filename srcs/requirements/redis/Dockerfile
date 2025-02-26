FROM alpine:3.14

# Install Redis
RUN apk update && apk add --no-cache redis

# Expose Redis port
EXPOSE 6379

# Command to run Redis server
CMD ["redis-server", "--protected-mode", "no"]