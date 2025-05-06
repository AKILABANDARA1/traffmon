FROM traffmonetizer/cli_v2

# Create a non-root user (Choreo requirement)
RUN adduser -D -u 10001 user

# Create a writable directory for TraffMonetizer
RUN mkdir -p /tmp/traffdata && chown -R user:user /tmp/traffdata

# Set environment variables
ENV TRAFF_TOKEN=Ek75Vqh9h0oKQ96bAhV5FLxGH4e9wiUGCyh5M/SgkAU=
ENV DNAME=ch-s02a
ENV DATA_DIR=/tmp/traffdata  # Ensure the application uses a writable directory

# Switch to non-root user
USER 10001

# Ensure the correct entrypoint for the container to run
ENTRYPOINT ["./Cli"]

# Command to start TraffMonetizer with necessary parameters
CMD ["start", "accept", "--token", "$TRAFF_TOKEN", "--device-name", "$DNAME", "--data-dir", "$DATA_DIR"]
