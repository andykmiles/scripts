FROM python
ARG USER_ID
ARG GROUP_ID

RUN apt update
RUN apt install -y git && apt install -y curl

RUN addgroup --gid $GROUP_ID andy 
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID andy
USER andy

ENV PATH="/home/andy/.local/bin:/home/andy/.poetry/bin:${PATH}"
RUN git config --global user.email "me@andykmiles.com"
RUN git config --global user.name "Andy Miles"

RUN python -m pip install \
        pyscaffold \
        ansible
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

