FROM gitpod/workspace-full:latest

USER root

RUN apt-get update \
    && apt-get install -y default-jdk  libgl1-mesa-glx  \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

RUN wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh && bash Anaconda3-2020.07-Linux-x86_64.sh



# Give back control
USER root
# Cleaning
RUN apt-get clean
