FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN sudo apt-get update
RUN sudo apt-get install -y nginx
