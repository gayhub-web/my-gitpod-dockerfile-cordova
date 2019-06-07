FROM gitpod/workspace-full:latest

USER root

RUN apt-get update \
    && apt-get install -y default-jdk \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

RUN mkdir -p /home/gitpod/rocksetta/logs                        \ 
    && mkdir -p /home/gitpod/rocksetta/android                  \ 
    && mkdir -p /home/gitpod/rocksetta/qrcode-cordova           \
    && touch /home/gitpod/rocksetta/logs/mylogs.txt             \
    && wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip       \
    && unzip sdk-tools-linux-4333796.zip -d /home/gitpod/rocksetta/android             \
    && rm sdk-tools-linux-4333796.zip                                                  \              
    && chmod 755 /home/gitpod/rocksetta/android/tools/bin/sdkmanager                   
 
    # && chmod 755 -R /home/gitpod/rocksetta    
 
 
 ENV ANDROID_SDK_ROOT /home/gitpod/rocksetta/android
 ENV ANDROID_HOME /home/gitpod/rocksetta/android
 ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools
 
 
 #RUN #!/bin/bash /usr/bin/expect -c ' set timeout -1; spawn '"${ANDROID_HOME}"'/tools/bin/sdkmanager --licenses; expect { "y/N" { exp_send "y\r" ; exp_continue } eof} '
 
 #RUN #!/bin/bash /usr/bin/expect -c ' set timeout -1; spawn  sdkmanager --licenses; expect { "y/N" { exp_send "y\r" ; exp_continue } eof} '
 
 RUN #!/bin/bash /usr/bin/expect -c ' set timeout -1; spawn  sdkmanager --licenses "platform-tools" "build-tools;28.0.3" "platforms;android-28"    ; expect { "y/N" { exp_send "y\r" ; exp_continue } eof} '


# --- Install Gradle from PPA

# Gradle PPA
RUN apt-get update \
 && apt-get -y install gradle \
 && gradle -v


# ----install Cordova, could also install ionic here

RUN npm install -g cordova qrcode
 
#----- specific to gitpod
USER gitpod
   #RUN chmod +x a01-create.sh && chmod +x a02-re-build.sh && chmod +x a03-copy-to-folder.sh
   
   




# Give back control
USER root

# Cleaning
RUN apt-get clean
