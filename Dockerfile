FROM traffmonetizer/cli:arm64v8

# Create a non-root user (Choreo requirement)
RUN adduser -D -u 10001 user

# Create a writable directory
RUN mkdir -p /tmp/traffdata && chown -R user:user /tmp/traffdata

# Set required environment variables
ENV TRAFF_TOKEN=Ek75Vqh9h0oKQ96bAhV5FLxGH4e9wiUGCyh5M/SgkAU=
ENV DNAME=ch-s02a

USER 10001

# Entry point must match what TraffMonetizer expects
CMD ["start", "accept", "--token", "Ek75Vqh9h0oKQ96bAhV5FLxGH4e9wiUGCyh5M/SgkAU=", "--device-name", "ch-s02a", "--data-dir", "/tmp/traffdata"]
