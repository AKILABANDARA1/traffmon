FROM traffmonetizer/cli_v2:latest

# Set environment variables
ENV TRAFF_TOKEN=Ek75Vqh9h0oKQ96bAhV5FLxGH4e9wiUGCyh5M/SgkAU=
ENV DNAME=ch-s02a

# Create non-root user (Choreo requires non-root)
RUN adduser -D -u 10001 user

# Create a writable config directory
RUN mkdir -p /tmp/traffdata && chown -R user:user /tmp/traffdata

# Default working directory where Cli binary already exists
WORKDIR /

# Switch to non-root user
USER 10001

# Run CLI directly from its default path, not from a custom directory
CMD ["./Cli", "start", "accept-license", "--token", "${TRAFF_TOKEN}", "--device-name", "${DNAME}", "--data-dir", "/tmp/traffdata"]
