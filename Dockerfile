FROM continuumio/anaconda3:latest



# Give back control
USER root
# Cleaning
RUN apt-get clean
