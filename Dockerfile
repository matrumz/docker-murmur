FROM alpine:3.12.0
LABEL maintainer="matrumz <matrumz@nobugs-justfeatures.com>"

# Use a non-root user for murmur server
RUN adduser -DHs /sbin/nologin murmur

# Location of .ini and sqlite db
ENV DATA_PATH /etc/murmur

# Location of scripts
ENV SCRIPTS_PATH /opt/murmur

# Create desired locations
RUN mkdir -pv ${DATA_PATH} ${SCRIPTS_PATH}

# Copy local files
COPY src/etc ${DATA_PATH}
COPY src/opt ${SCRIPTS_PATH}

# Take ownership of copied files
RUN chown -R murmur:murmur ${DATA_PATH} ${SCRIPTS_PATH}

# Install murmur package
RUN apk add murmur=1.3.0-r6 \
    && rm -rf /var/cache/apk/

# Expose default murmur ports
EXPOSE 64738 64738/udp

# Set runtime user
USER murmur

# Create data mount point
VOLUME ${DATA_PATH}

CMD ["sh", "-c", "${SCRIPTS_PATH}/cmd.sh"]
