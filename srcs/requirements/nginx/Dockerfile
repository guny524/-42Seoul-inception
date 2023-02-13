FROM debian:buster
RUN apt update && apt install -y nginx openssl && \
    mkdir -p /var/www/html/wordpress /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/conf.d/

# https://www.openssl.org/docs/man3.0/man1/openssl-req.html
# https://docs.oracle.com/cd/E24191_01/common/tutorials/authz_cert_attributes.html
# https://www.baeldung.com/openssl-self-signed-cert
RUN openssl req -newkey rsa:2048 -x509 -nodes \
    -subj "/C=KR/ST=Seoul/L=Gang-nam/O=42seoul/OU=Gon/CN=min-jo" \
    -keyout /etc/nginx/ssl/min-jo.42.fr.key \
    -out /etc/nginx/ssl/min-jo.42.fr.crt

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
