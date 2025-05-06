FROM traffmonetizer/cli_v2:latest

# Set environment variables
ENV TRAFF_TOKEN=Ek75Vqh9h0oKQ96bAhV5FLxGH4e9wiUGCyh5M/SgkAU=
ENV DNAME=ch-s02a

# Create non-root user with UID 10001
RUN adduser -D -u 10001 user

# Use /tmp instead of /app to avoid read-only FS issue
RUN mkdir -p /tmp/traffmonetizer && chown -R user:user /tmp/traffmonetizer

# Set working directory to writable path
WORKDIR /tmp/traffmonetizer

# Switch to non-root user
USER 10001

# Add debugging command to check file structure and verify permissions
CMD ["sh", "-c", "ls -la / && echo 'Listing /app contents' && ls -la /app && echo 'Listing /tmp' && ls -la /tmp && ./Cli start accept-license --token ${TRAFF_TOKEN} --device-name ${DNAME}"]
