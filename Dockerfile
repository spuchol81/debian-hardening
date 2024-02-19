ARG APP_IMAGE=spuregistry.azurecr.io/source-images/debian:bookworm
FROM $APP_IMAGE
ENV ALT_DATE="2024-01-01"
# Remove interactive login shell for everybody
RUN sed -i -r 's#^(.*):[^:]*$#\1:/sbin/nologin#' /etc/passwd
# Disable password login for everybody
RUN while IFS=: read -r username _; do passwd -l "$username"; done < /etc/passwd || true
