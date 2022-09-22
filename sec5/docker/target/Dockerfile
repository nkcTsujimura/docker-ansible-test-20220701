# Amazon EC2
#FROM amazonlinux:latest
#FROM centos:centos7
FROM centos:centos7.4.1708

# yumでOpenSSｈサーバをインストールする
RUN yum -y install openssh-server

# sudo コマンドをインストールする。
RUN yum -y install sudo

# sshd起動時に公開鍵が必要なため、作成
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
RUN ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa

# rootでログインできるようにする
RUN sed -ri 's/^#PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config

# rootのパスワードを指定
RUN echo "root:" | chpasswd


# 作業用ユーザーansibleの作成
RUN useradd "ansible" && echo "ansible ALL=NOPASSWD: ALL" >> /etc/sudoers
# ansibleのパスワードを指定（なし）
RUN echo "ansible:" | chpasswd

# SElinuxのインストール（両方必要）
#https://kokichiblog.com/it/1003/
RUN yum install -y libselinux-python
RUN yum -y install selinux-policy-targeted setools

# SElinuxのインストール（両方必要）
#RUN yum -y install firewalld


EXPOSE 22

## sshdを起動
#CMD ["/usr/sbin/sshd", "-D"]


# /sbin/initから起動する
#https://www.suzu6.net/posts/324-docker-compose-centos-privileged/
CMD ["/usr/sbin/init"]