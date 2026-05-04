FROM ghdl/ext:ls-vunit AS base

RUN apt-get -y update && apt-get install -y git &&  git clone https://github.com/VUnit/vunit/
