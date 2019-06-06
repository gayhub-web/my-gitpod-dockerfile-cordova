FROM gitpod/workspace-full:latest

USER root


RUN /bin/bash -c 'source $HOME/.bashrc; echo $HOME'


# Install custom tools, runtime, etc.
RUN apt-get update \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*




# Give back control
#USER root
