# TODO '--link'가 없어야 합니다.

# TODO ENTRYPOINT 섹션에서 'tail -f' 또는 백그라운드에서 실행되는 명령이 표시되면 평가가 이제 종료됩니다. 'bash' 또는 'sh'가 사용되지만 스크립트를 실행하지 않는 경우에도 마찬가지입니다(예: 'nginx & bash' 또는 'bash').

# TODO 진입점이 스크립트(예: ENTRYPOINT ["sh", "my_entrypoint.sh"], ENTRYPOINT["bash", "my_entrypoint.sh"])인 경우 백그라운드에서 프로그램을 실행하지 않는지 확인합니다(예: 'nginx & 배쉬').
# TODO ‘sleep infinity’, ‘tail -f /dev/null’, ‘tail -f /dev/random’

# TODO NGINX는 포트 443에서만 액세스할 수 있는지 확인합니다. 완료되면 페이지를 엽니다.
# TODO SSL/TLS 인증서가 사용되는지 확인합니다.

# TODO WordPress 웹사이트가 제대로 설치 및 구성되었는지 확인합니다(WordPress 설치 페이지가 표시되지 않아야 함). 액세스하려면 브라우저에서 https://login.42.fr을 여십시오. 여기서 로그인은 평가된 학생의 로그인입니다. http://login.42.fr을 통해 사이트에 액세스할 수 없어야 합니다.


# TODO Docker 이미지는 해당 서비스와 이름이 같아야 합니다.
# TODO Dockerfile이 'FROM alpine' 또는 'FROM debian:buster' 또는 기타 로컬 이미지로 시작
# TODO http(포트 80)를 통해 서비스에 접속하여 접속이 되지 않는지 확인
# TODO 브라우저에서 https://login.42.fr을 엽니다. 여기서 로그인은 평가된 학생의 로그인입니다. 표시된 페이지는 구성된 WordPress 웹사이트여야 합니다(WordPress 설치 페이지가 표시되지 않아야 함).

# TODO TLS v1.2/v1.3 인증서의 사용은 필수이며 입증되어야 합니다. SSL/TLS 인증서는 인식하지 않아도 됩니다. 자체 서명된 인증서 경고가 나타날 수 있습니다. 위의 사항 중 하나라도 명확하게 설명되지 않고 정확하지 않은 경우 평가 프로세스가 종료됩니다.


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
