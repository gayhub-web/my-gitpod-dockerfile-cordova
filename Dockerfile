FROM   tensorflow/tensorflow:1.9.0-py3



# Give back control
USER root
RUN apt-get update && apt-get install -y libgl1-mesa-glx  python3-tk 
# Cleaning
RUN apt-get clean
