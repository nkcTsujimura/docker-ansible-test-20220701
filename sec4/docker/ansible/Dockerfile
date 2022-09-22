FROM ubuntu

ENV ANSIBLE_HOST_KEY_CHECKING False

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    #バージョン管理　apt-add-repository ppa:ansible/ansible-2.0 && \
    apt-get install -y ansible

## version via python pip
# https://qiita.com/rh_/items/80d082bafcdae31bc95c
#RUN apt install -y curl
#    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
#    python3 get-pip.py --user && \
#    apt-get install python3-distutils && \
#    python3 -m pip install --user ansible


CMD /bin/bash
