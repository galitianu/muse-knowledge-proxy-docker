# Use an official OpenJDK image as the base
FROM openjdk:8-jdk

# Set environment variables for installation
ENV INSTALL_DIR="/opt/muse"
ENV LICENSE_FILE="/opt/muse/license.lic"
ENV PROXY_PORT="9797"
ENV SSL_PROXY_PORT="9443"
ENV ADMIN_PASSWORD="admin1234"

# Copy installation files (adjust this based on actual installation files)
COPY muse-proxy-setup.jar /tmp/muse-proxy-setup.jar
COPY license.lic $LICENSE_FILE

# Create a silent install options file using environment variables
RUN echo "\
-W serialNumberPanel.serialPropertiesPath=${LICENSE_FILE} \n\
-W licenseELS.selection=1 \n\
-P installLocation=${INSTALL_DIR} \n\
-W setupTypes.selectedSetupTypeId=typical \n\
-W ProxyhostsEditorAdministrator.proxyPort=${PROXY_PORT} \n\
-W ProxyhostsEditorAdministrator.SSLProxyPort=${SSL_PROXY_PORT} \n\
-W ProxyAdministratorPanel.password=${ADMIN_PASSWORD} \n\
-W ProxyMKPFUPPanel.password=${ADMIN_PASSWORD} \n\
-W ProxyMuseProxyFoundationUPPanel.password=${ADMIN_PASSWORD} \n\
-W ProxyAnonymousUPPanel.password=${ADMIN_PASSWORD} \n\
-W installServicesPanel.proxyServiceDefaultStatus=0 \n" > /tmp/muse-options.txt

# Install Muse Proxy in silent mode
RUN java -jar /tmp/muse-proxy-setup.jar -options /tmp/muse-options.txt -silent

# Expose ports for HTTP and HTTPS
EXPOSE ${PROXY_PORT} ${SSL_PROXY_PORT}

# Start Muse Proxy when the container runs
CMD ["sh", "-c", "$INSTALL_DIR/proxy/startMuseProxy"]
