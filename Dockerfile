FROM  tensorflow/tensorflow:1.9.0



# Give back control
USER root
# Cleaning
RUN apt-get clean
