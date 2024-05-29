# Day 0 - Tools Installation
### Yosys
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
### Iverilog
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
### gtkwave
```
Steps to install gtkwave
sudo apt-get update
sudo apt install gtkwave
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/367e34c5-bba1-4285-ba17-7d27ab235b0a)

### OpenSTA
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
### ngspice
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

### magic
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

### OpenLANE
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
###  To run openlane

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
### Installs PDKs and Tools
```
cd $HOME
git clone https://github.com/The-OpenROAD-Project/OpenLane
cd OpenLane
make
make test
```

# Day 1 - Introduction to Verilog Design an Synthesis

RTL Design: Implementation of a spec. The design has the verilog code which implements the intended functionality to meet the specifications
RTL simulation: Check the design for the adherance of the spec using the simulator
Simulator: Tools used to simulate the design
Test Bench: Setup used (using some verilog code) to apply certain stimulus (test vectors) to check the design meets the required functionality


### Test bench (TB) set up: Simulator Tool looks only for changes in the inputs and show the corresponding changes in the outputs

Design is instantiated in the test bench. Design can have more than one primary input and output.
There are two other main end blocks in the test bench, the stimulus generator and the stimulus obseerver (checker)
The TB itself does not have a primary input or primary output

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/9f5a27d9-db4c-48b0-8708-c7dc489f2f0b)

### iverilog simulation flow: Any simulator Tool looks only for changes in the inputs and show the changes in the outputs (VCD - value change dump)
gtkwave will show the waveforms from VCD

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/ab678167-3814-46fc-9270-bccb4a613bdc)

### LAB1 -  Good Mux (combinatorial 2-input mux)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/8a574296-026a-49b1-9ef2-11f770a0cddd)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/4895c157-64ec-4ae9-8d68-04923f7bcf6b)
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/f2a415e3-91cf-438d-ae1a-52dc859e7ebc)
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/afd5dc46-02e3-4e6c-a667-4630673e1178)

### Introduction to yosys RTL synthesizer (converts RTL to netlist. Netlist is the representation of the design in standard cells as presented in .lib):

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/0f1688d8-805e-4dcc-a213-92344d607f60)

Verifying the design. Using the Test becnh using in RTL phase (Using the same stimulus used for RTL, the output expected should be the same as the one obtained in RTL phase)
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/b5c69994-cd9a-4ef0-9d92-3f27012b6463)

### Synthesis 
### Process to do RTL to gate level translation, a netlist is generated
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/002bff08-3c1a-48be-bd48-98d1037a289d)

### .lib - Collection of different flaviors of stanadard cells, different functionalities, inputs, etc and different models (speed: slow, medium, high), they can implement any logic functionality

### Max clock = Propagation delay of FF + Tcombinatorial + setup time (data estable before clk arrives)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/dd3dd6f1-38fc-47c0-b118-ea3e99d4c077)

### Library has different models as not all cells required need to be fast, there is also  a need for slow cells. In general a circuit needs to fullfill 2 requirements cells have to fast enough to meet setup time but some others cells have to be slow enough to meet hold time (hold time - time the data need to be remain stable after clock happens)

### Faster cells vs slower cells -> need to propagate the output faster so its capacitance is such that charges/discharges fast so transistors sourcing more current (wider transistor), therefore wider transistors imply low delay but more area and power and narrow transistors imply longer delays but less area and power
### We need to guide the synthesizer, providing some constraints, so it can use the adequate model of the library cells and the final design meets setup time and hold time
### Illustrative example showing the work of the synthesizer, translating RTL spec into logic gates (netlist)
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/fc664017-5e4f-4bc6-91d0-1a15f7737ba7)

#### Using yosys
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/75e085a4-85c4-4f9b-b1d8-276ab2195d2a)
Synthesis result:
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/d10ab18c-089a-4841-a40b-f1d0c46c4534)

#### Next step is to use ABC program which will take file generated and used specified library to generate the netlist
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/0f332c88-64bf-42a8-8b99-d6e9ec2fae8b)

ABC has implemented the design using a mux cell 3 inputs (io, i1, sel), 1 output y

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/fcdc6d49-35d8-4872-92a2-bf5fc1cd8214)

#### MUX 2x1 library used:
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/5f82ec6b-5c1f-40c3-a65a-d7ccfbb0d407)

### Creating the netlist (removing attributes to make it more readable)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/512f664f-a24b-4e35-b146-dd878f64aa5d)

# Day 2 - Timing libs, hierarchical vs flat synthesis and efficient flop coding styles

### 3 Important parameters determine the operating condition:
### P : Process (variations due to fabrication)  V : Voltage  T : Temperature
### In the sk130 example:  tt = typical process  25 = temperature  1v00 = voltage
### Comparing for the and2 cell case showing different flaviors: when using wider/narrower cells (wider = faster but more power consumptiom)
### In the snapshot below we observe from left to right the increase in area and increase in power but decrease in delay of the cell

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/7114b297-7c4b-4a18-9fa0-bff85aa34f0f)ab

### Hierarchical vs Flat Synthesis Lab

### Invoking yosys to synthesize example multiple_modules.v
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/c7a9eee3-c3ca-4ced-a4c0-0117e5a5e9fc)

### Final statistics
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/e6e348d6-e26d-4e19-b560-3fd5a550d788)

### Invoking abc to link libraries - showing hierarchical view (internal sub-modules)
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/a80e1299-d098-4b72-a81d-325c8ad2253b)

### Details of the hierarchical implementation

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/0d435723-1bdb-4285-9041-c612f8a18c93)
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/58059b91-5f52-42db-8a78-69d7ae29cc10)

### After flattening the netlist
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/1e36bcd4-2f23-47d6-86c9-1e1f4d81fd55)

### Details of flattened netlist (no more sub-modules, only present primitive cells)
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/6e07504e-cef0-40ca-86e8-bc215650f172)

### On which cases is more convenient a hierarchical (sub module based synthesis)
#### 1. When we have multiple instances of the same module
#### 2. Massif design (divice and conquer approach)

### Example: Synthesizing only sub_module1 in design multiple_modules.v 
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/586789ad-8c18-43dc-95ae-b6bb26cbcf38)

### Flops and Flop coding styles
#### Combinatorial circuits can generate glitches when cascading them in the circuit until settle to a final value. We need FLip FLops to store those final values and allow to change the value with an external signal calculated so that combinatorial logic has already settle to a value. The output Q of the Flip Flop is shielded from changes in on the input D. The Set/reset signals are used to initialize the value of the FF so at the beginning the intial output of Q is a known value.

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/43e2994f-4406-4e09-aa39-9b9e80fd4593)

#### Showing different coding styles for asynch/synch reset/set - asynch logic has precedence over clock (acts irrespective of clock) in synch logic the if/else will determine the priority
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/ddc522e5-232e-49da-8a5b-5e2b38fcb5ed)

#### Showing the case of both synch and asynch reset
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/4d923f41-3a31-4980-8635-2c7e61663b4b)

#### LAB - Showing synch_reset simulation (see markers where rest happens and next time FF goes to 1 again
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/9e6a772a-0dbe-4506-94b0-d6d360385983)

#### LAB - Showing the case for asynch reset simulation (in this case Q goes to low irrespective of the clock)
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/7ea98927-4cb8-462e-a5c0-14ae66ffaf5f)

#### LAB - Showing the case for asynch set simulation (in this case Q goes to high irrespective of the clock)
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/c4eb3a98-f486-481e-9cf6-2f36bfeb2b3d)

#### LAB - Showing the case for synch and asynch reset simulation (asynch reset has precedence of synch reset and clock)
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/196f7eb1-b2e4-4094-a5e2-f8cca0188f99)

#### when asynch reset is low, synch reset controls the reset behavior and waits for clk
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/d1ad662e-272c-4553-9339-66dd8d63e33e)

#### Synthesizing files
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/bb533434-6098-41be-8edf-b980803ce941)

#### As flop's are present, telling the tool which library use to link them
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/e1b323c6-1ea4-4aaa-a42d-92de0b0de582)

#### Then invoking abc to finish synthesis
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/ef64763b-c8fa-491a-b8df-faae622df88d)

#### Showing final netlist and FF cell included, an inverter is added to asynch input as internal reset of FF has the opposite polarity
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/e993848d-d9bf-4b85-9498-961ed59cb855)

#### Repeating the same process for the case with synch_reset 
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/5cacc7b6-bca7-48eb-8ca7-fcd969077750)
In this case the sync reset is implemented as NOR(sync_reset, NOT(d)) = (NOT(sync_reset) AND d) which implements a MUX on input d of FF
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/c41c9a6f-14d0-41e8-a335-fb75038be47d)

#### Special cases: 
#### a)Multiplying by 2^n is equivalent to shift left by n bits
#### b)Multiplying a 3 bit number by 9 (8 +1) which is equivalent to have 2 consecutive versions of the number
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/e917256f-2733-4a64-8241-657b54e1d5d9)

#### In the firt case, after synth ABC has nothing to do (no mapping) as only a shift right of the input vector is needed
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/0932b717-2b83-4c34-9df6-d080b11fc252)
#### In the second case
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/3f081f49-adf5-4063-9cfa-289e0f402715)
#### final rtl also show the expected output for case b
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/ec06f1bf-6d70-4473-9a50-61650afaa214)


# Day 3 - Combinational and sequential optmizations

#### Constant propagation - One or mor inputs are stuck to a fixed logic value, equation can be simplified
```
Y = /((AB) + C)

where A = 0 (input A is stuck at 0)
Y = /C (output got reduced to an inverter - less area and power)
```
#### Boolean Optimization 

#### Combinatorial - Simplifying logic equations
```
assign y = a? (b? c:(c? a:0)): (!c)

equation is composed of 3 muxes, which is equivalent to: 
1st mux ac
2nd mux /bac +bc
3rd mux /a/c + a[bc + /bac]

simpifying  y = /a/c + ac = a xor c (got reduced to an xor)
```
#### Sequential
#### Basic - Sequential constant propagation
```
One of the sequential element e.g FF is stuck to a constant value and that is propagated to the output
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/a93523c8-a9ec-4696-a2b6-fab227785e08)
```
Optimizations:
y1 = a and b
y2  = /c
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/77cb151b-6e8e-44af-b657-9334b41d896e)

```
Using  opt_clean -purge (simplify logic)
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/aa084887-46db-4844-9e16-95419b666f58)

Second example:
y = a? 1:b ;
simplifying  y = a + b;

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/fc66e323-1fd0-4b20-8085-903f8f94eb1f)

#### Advanced 
```
State Optimization - Removing unused states
Retiming - Improving performance of the circuit (frequency), by balancing intermediate combinatorial logic delays between paths of sequential pipelining
Sequential logic cloning - replicating portions of sequential logic to reduce the fan out and creating parallel paths to ease meet timing
```


























   













































