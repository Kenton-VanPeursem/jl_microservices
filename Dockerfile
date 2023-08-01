FROM julia:1.9

RUN ["mkdir", "/app"]

RUN apt-get update && apt-get install -y neovim

COPY . /app/

WORKDIR /app
ENTRYPOINT ["julia", "-t", "auto", "--project", "src/main.jl"]

