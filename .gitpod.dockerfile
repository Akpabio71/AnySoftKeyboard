FROM gitpod/workspace-full

# Install Java
USER root
RUN apt-get update && apt-get install -y openjdk-17-jdk wget unzip && apt-get clean

# Install Android SDK Command Line Tools
ENV ANDROID_HOME=/workspace/android-sdk
RUN mkdir -p $ANDROID_HOME/cmdline-tools
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip -O /tmp/cmdline-tools.zip \
    && unzip /tmp/cmdline-tools.zip -d $ANDROID_HOME/cmdline-tools \
    && mkdir -p $ANDROID_HOME/cmdline-tools/latest \
    && mv $ANDROID_HOME/cmdline-tools/cmdline-tools/* $ANDROID_HOME/cmdline-tools/latest/ \
    && rm /tmp/cmdline-tools.zip

# Set environment variables
ENV PATH=${PATH}:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

USER gitpod
