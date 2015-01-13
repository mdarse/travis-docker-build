FROM ubuntu:latest

RUN sudo apt-get update -qq && sudo apt-get install -qq nginx
