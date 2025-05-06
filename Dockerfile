FROM traffmonetizer/cli_v2:latest

# Set environment variables
ENV TRAFF_TOKEN=Ek75Vqh9h0oKQ96bAhV5FLxGH4e9wiUGCyh5M/SgkAU=
ENV DNAME=ch-s02a

# Create a non-root user with UID 10001
RUN adduser -D -u 10001 user

# Make sure the app directory exists and is owned by the user
RUN mkdir -p /app && chown -R user:user /app

# Switch to non-root user
USER 10001

# Set working directory
WORKDIR /app

# Start the TraffMonetizer CLI with required flags
CMD ["start", "accept-license", "--token", "${TRAFF_TOKEN}", "--device-name", "${DNAME}"]
