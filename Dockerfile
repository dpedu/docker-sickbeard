FROM ubuntu:trusty

ADD start /start

RUN useradd sick ;\
    apt-get update ;\
    apt-get install -y git python-setuptools ;\
    easy_install pip ;\
    cd /opt/ ;\
    git clone https://github.com/midgetspy/Sick-Beard.git Sick-Beard ;\
    pip install -r Sick-Beard/requirements.txt ;\
    mkdir /opt/sick-data ;\
    chown sick:sick /opt/sick-data/ ;\
    chmod +x /start

VOLUME ["/opt/sick-data/"]

ENTRYPOINT ["/start"]
