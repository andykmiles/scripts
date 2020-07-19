FROM python
ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID andy 
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID andy
RUN mkdir /project && chown -R andy /project
USER andy

ENV PATH="/home/andy/.local/bin:${PATH}"

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1

WORKDIR '/project'
RUN     python -m pip install --user \
        black \
        mypy \
        pylint \
        loguru \
        pysnooper \
        pytest \
        pytest-cov \
        pytest-bdd \
        pytest-mock
        
RUN echo 'PS1="\npydev\n$ "' >> ~/.bashrc
ENTRYPOINT ["/bin/bash"]
