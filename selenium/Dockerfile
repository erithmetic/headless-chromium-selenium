FROM selenium/node-base:3.3.1

# Selenium Configuration
ENV NODE_MAX_INSTANCES 1
ENV NODE_MAX_SESSION 1
ENV NODE_PORT 5555
ENV NODE_REGISTER_CYCLE 5000
ENV NODE_POLLING 5000
ENV NODE_UNREGISTER_IF_STILL_DOWN_AFTER 60000
ENV NODE_DOWN_POLLING_LIMIT 2
ENV NODE_APPLICATION_NAME ""

USER root

COPY generate_config /opt/selenium/generate_config

RUN chown -R seluser:seluser /opt/selenium

WORKDIR /

RUN apt-get update && apt-get install -y \
  curl \
  git \
  libgconf2-4 \
  unzip
  #libpangocairo-1.0-0 \
  #libglib2.0-0 \
  #libnss3 \
  #libxcomposite1 \
  #libxcursor1 \
  #libxrandr2 \
  #libxss1

RUN git clone https://github.com/scheib/chromium-latest-linux.git
ENV RELEASE=466352
RUN cd chromium-latest-linux && ./update.sh $RELEASE
RUN chown -R seluser:seluser /chromium-latest-linux

ADD chromedriver/build /chromedriver

RUN chown -R seluser:seluser /chromedriver

RUN echo "DBUS_SESSION_BUS_ADDRESS=/dev/null" >> /etc/environment

ENV PATH=$PATH:/chromedriver

USER seluser

CMD ["java","-jar","/opt/selenium/selenium-server-standalone.jar"]
