FROM node:carbon
RUN apt-get update && \
    apt-get -y install git
RUN git clone https://github.com/GermaVinsmoke/bmi-calculator.git && \
    cd bmi-calculator
# Create app directory
WORKDIR /usr/src/docker-react-sample
# Install app dependencies
#install git
RUN apt-get update \
    && apt-get install -y git
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
# COPY package*.json ./
RUN npm install
#To bundle your app’s source code inside the Docker image, use the COPY instruction:
COPY . .
#Your app binds to port 3000 so you’ll use the EXPOSE instruction to have it mapped by the docker daemon:
EXPOSE 3000
CMD [“npm”, “start”]