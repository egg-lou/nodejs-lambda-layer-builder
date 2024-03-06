FROM amazonlinux:2023
RUN curl -sL https://rpm.nodesource.com/setup_18.x | bash -
RUN yum clean all && yum -y update
RUN yum -y install nodejs zip
RUN mkdir /app
WORKDIR /app
COPY package.json /app
RUN npm install
RUN mkdir nodejs && mv node_modules nodejs/
RUN zip -r node_modules.zip nodejs/node_modules
