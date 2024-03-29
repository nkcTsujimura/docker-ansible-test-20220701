# Amazon EC2
FROM alpine:latest

# yumでOpenSSｈサーバをインストールする
RUN apk add openssh-server

# sshd起動時に公開鍵が必要なため、作成
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
RUN ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa

# rootでログインできるようにする
RUN sed -ri 's/^#PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config
RUN sed -ri 's/^#UsePAM no/UsePAM no/' /etc/ssh/sshd_config
# rootのパスワードを指定
#RUN echo "root:" | chpasswd

EXPOSE 22

# sshdを起動
CMD ["/usr/sbin/sshd", "-D"]
