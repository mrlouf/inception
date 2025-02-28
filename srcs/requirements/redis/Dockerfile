FROM alpine:3.20

RUN apk update && apk add --no-cache redis

RUN mkdir -p /data /etc/redis

COPY conf/redis.conf /etc/redis/redis.conf

EXPOSE 6379

# Command to run Redis server
CMD ["redis-server", "/etc/redis/redis.conf"]

# Watch Redis memory usage
# docker exec -it redis sh -c "redis-cli info memory | grep used_memory_human"

# Monitor Redis in real-time
# docker exec -it redis sh -c "redis-cli monitor"