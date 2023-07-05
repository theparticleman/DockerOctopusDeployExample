FROM --platform=linux/amd64 ubuntu:22.10

# RUN apt-get update && apt-get install -y openssh-server
# RUN echo 'root:Password1' | chpasswd
# RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# # SSH login fix. Otherwise user is kicked off after login
# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# ENV NOTVISIBLE "in users profile"
# RUN echo "export VISIBLE=now" >> /etc/profile
# EXPOSE 22
# CMD ["/usr/sbin/sshd", "-D"]

RUN apt update && apt install  openssh-server sudo nginx -y

ADD run_servers.sh /

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 

RUN chmod g+w /var/www/html

RUN  echo 'test:test' | chpasswd

RUN service ssh start

EXPOSE 80 22

CMD ["sh","/run_servers.sh"]