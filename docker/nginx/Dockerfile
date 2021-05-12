FROM nginx:1.18.0


RUN apt-get update -y 

ADD ./conf.d/demo.conf /etc/nginx/conf.d/demo.conf
# ADD ./cert/etrustcloud.com.crt /etc/nginx/conf.d/cert/etrustcloud.com.crt
# ADD ./cert/etrustcloud.com.key /etc/nginx/conf.d/cert/etrustcloud.com.key

# ENV DOMAIN_NAME="localhost"

EXPOSE 80 443
