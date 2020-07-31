FROM python

RUN apt update
RUN apt install -y git && apt install -y curl

RUN if ! getent passwd andy; then groupadd -g 1000 andy && useradd -u 1000 -g 1000 -d /home/andy -m -s /bin/bash andy; fi \
    && echo andy:andy | chpasswd \
    && echo 'andy ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && mkdir -p /etc/sudoers.d \
    && echo 'andy ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/andy \
    && chmod 0440 /etc/sudoers.d/andy

USER andy

ENV PATH="/home/andy/.local/bin:/home/andy/.poetry/bin:${PATH}"
RUN git config --global user.email "me@andykmiles.com"
RUN git config --global user.name "Andy Miles"

RUN python -m pip install \
        pyscaffold \
        ansible
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

