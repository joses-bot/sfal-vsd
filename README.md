# Day 0 - Tools Installation
# Yosys
```
$ sudo apt-get update
$ git clone https://github.com/YosysHQ/yosys.git
$ cd yosys
$ sudo apt install make (If make is not installed please install it) 
$ sudo apt-get install build-essential clang bison flex \
    libreadline-dev gawk tcl-dev libffi-dev git \
    graphviz xdot pkg-config python3 libboost-system-dev \
    libboost-python-dev libboost-filesystem-dev zlib1g-dev
$ make config-gcc
$ make 
$ sudo make install
```
```
josep@josep-VirtualBox:~/Desktop$ yosys

 /----------------------------------------------------------------------------\
 |  yosys -- Yosys Open SYnthesis Suite                                       |
 |  Copyright (C) 2012 - 2024  Claire Xenia Wolf <claire@yosyshq.com>         |
 |  Distributed under an ISC-like license, type "license" to see terms        |
 \----------------------------------------------------------------------------/
 Yosys 0.41+101 (git sha1 c71262f66, g++ 11.4.0-1ubuntu1~22.04 -fPIC -Os)

yosys> 
```
# Iverilog
```
Steps to install iverilog
sudo apt-get update
sudo apt-get install iverilog
```
```
josep@josep-VirtualBox:~/Desktop$ iverilog -h
Usage: iverilog [-EiSuvV] [-B base] [-c cmdfile|-f cmdfile]
                [-g1995|-g2001|-g2005|-g2005-sv|-g2009|-g2012] [-g<feature>]
                [-D macro[=defn]] [-I includedir] [-L moduledir]
                [-M [mode=]depfile] [-m module]
                [-N file] [-o filename] [-p flag=value]
                [-s topmodule] [-t target] [-T min|typ|max]
                [-W class] [-y dir] [-Y suf] [-l file] source_file(s)

See the man page for details.
```
# gtkwave
```
Steps to install gtkwave
sudo apt-get update
sudo apt install gtkwave
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/367e34c5-bba1-4285-ba17-7d27ab235b0a)

# OpenSTA
```
https://github.com/The-OpenROAD-Project/OpenSTA

git clone https://github.com/parallaxsw/OpenSTA.git
sudo apt install libeigen3-dev
sudo apt-get install -y swig

cd OpenSTA
mkdir build
cd build
cmake ..
make
```
# ngspice
```
After downloading the tarball from https://sourceforge.net/projects/ngspice/files/ to a local directory, unpack it using:
sudo apt-get install libxaw7-dev
$ tar -zxvf ngspice-42.tar.gz
$ cd ngspice-42
$ mkdir release
$ cd release
$ ../configure  --with-x --with-readline=yes --disable-debug
$ make
$ sudo make install
```
```
josep@josep-VirtualBox:~/Desktop$ ngspice 
******
** ngspice-42 : Circuit level simulation program
** Compiled with Sparse Direct Linear Solver
** The U. C. Berkeley CAD Group
** Copyright 1985-1994, Regents of the University of California.
** Copyright 2001-2023, The ngspice team.
** Please get your ngspice manual from https://ngspice.sourceforge.io/docs.html
** Please file your bug-reports at http://ngspice.sourceforge.net/bugrep.html
** Creation Date: Thu May 23 05:26:04 UTC 2024
******
ngspice 1 -> 
```

# magic
```
$   sudo apt-get install m4
$   sudo apt-get install tcsh
$   sudo apt-get install csh
$   sudo apt-get install libx11-dev
$   sudo apt-get install tcl-dev tk-dev
$   sudo apt-get install libcairo2-dev
$   sudo apt-get install mesa-common-dev libglu1-mesa-dev
$   sudo apt-get install libncurses-dev
git clone https://github.com/RTimothyEdwards/magic
cd magic
./configure
make
make install
```

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/e0b57d05-ddda-40ce-9183-7cfa8fd2b869)

# OpenLANE
```
sudo apt-get update
sudo apt-get upgrade
sudo apt install -y build-essential python3 python3-venv python3-pip make git

sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io

sudo docker run hello-world

sudo groupadd docker
sudo usermod -aG docker $USER
sudo reboot 

###################################
# To run openlane

cd OpenLane
make mount
./flow.tcl -design spm
./flow.tcl -interactive

After reboot

docker run hello-world

Check dependencies 
git --version
docker --version
python3 --version
python3 -m pip --version
make --version
python3 -m venv -h
```
```
josep@josep-VirtualBox:~/Desktop/OpenLane$ make mount
cd /home/josep/Desktop/OpenLane && \
	docker run --rm -v /home/josep:/home/josep -v /home/josep/Desktop/OpenLane:/openlane -v /home/josep/Desktop/OpenLane/empty:/openlane/install -v /home/josep/.volare:/home/josep/.volare -e PDK_ROOT=/home/josep/.volare -e PDK=sky130A  --user 1000:1000 -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/josep/.Xauthority:/.Xauthority --network host --security-opt seccomp=unconfined -ti efabless/openlane:77eb5ffc00966b47b36e332ccbf42103eb95e974-amd64
penLane Container:/openlane% ./flow.tcl -interactive
OpenLane 77eb5ffc00966b47b36e332ccbf42103eb95e974
All rights reserved. (c) 2020-2023 Efabless Corporation and contributors.
Available under the Apache License, version 2.0. See the LICENSE file for more details.

% package require openlane 0.9
0.9
% prep -design spm
[INFO]: Using configuration in 'designs/spm/config.json'...
[INFO]: PDK Root: /home/josep/.volare
[INFO]: Process Design Kit: sky130A
[INFO]: Standard Cell Library: sky130_fd_sc_hd
[INFO]: Optimization Standard Cell Library: sky130_fd_sc_hd
[INFO]: Run Directory: /openlane/designs/spm/runs/RUN_2024.05.23_06.15.26
[INFO]: Saving runtime environment...
[INFO]: Preparing LEF files for the nom corner...
[INFO]: Preparing LEF files for the min corner...
[INFO]: Preparing LEF files for the max corner...
% run_synthesis
[STEP 1]
[INFO]: Running Synthesis (log: designs/spm/runs/RUN_2024.05.23_06.15.26/logs/synthesis/1-synthesis.log)...
[STEP 2]
[INFO]: Running Single-Corner Static Timing Analysis (log: designs/spm/runs/RUN_2024.05.23_06.15.26/logs/synthesis/2-sta.log)...
% 
```
# Installs PDKs and Tools
```
cd $HOME
git clone https://github.com/The-OpenROAD-Project/OpenLane
cd OpenLane
make
make test
```

# Day 1 - Introduction to Verilog Design an Synthesis

### Test bench block diagram

Design can have more than one primary input and output:

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/9f5a27d9-db4c-48b0-8708-c7dc489f2f0b)

### iverilog simulation flow: Tool only check for changes in the inputs and show the corresponding changes in the outputs

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/ab678167-3814-46fc-9270-bccb4a613bdc)








