FROM mathworks/matlab:r2022b

# install some dependencies
RUN apt update
RUN apt install -y matlab-jsonlab

# Do anything you need to install tool dependencies here
RUN echo "Replace this line with a tool"

# create the tool input structure
RUN mkdir /in
COPY ./in /in
RUN mkdir /out
RUN mkdir /src
COPY ./src /src

# download yq to convert yaml files
RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /src/yq && chmod +x /src/yq

WORKDIR /src
CMD ["matlab", "-batch", "runTool"]