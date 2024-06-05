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
```
Second example:
y = a? 1:b ;
simplifying  y = a + b;
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/fc66e323-1fd0-4b20-8085-903f8f94eb1f)
```
Third example:
y = a? (c? b:0) :0 ;
simplifying y = abc;
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/1a39bb03-b849-4d96-ba03-2271fc431e94)
```
Example with multiple modules
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/c7b7b5bf-ef9b-4f8e-8def-08cc545d7a4b)

```
After synthesis and flatten
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/d3acd5ac-8a2d-4c52-b2cd-01585905a78f)
```
which corresponds to the simplify equations
```
```
Sequential logic optimizations lab
```
```
In this case D input of FF is stuck to high (simulation shown below) but changes after clk so a FF will be infered
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/f5542bbb-9e74-4d77-b252-6e77088a2d94)
```
Running synthesis and mapping and showing result, a FF was infered
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/1c8fbe5a-bc56-4274-b195-0ab8b890f482)

Second example, in this case the output i always stuck to high regardless of clk, simulation is shown below
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/ad601c51-0859-4290-938c-37e08cba2167)
```
Running synthesis and mapping and showing result in this case no FF is inferred
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/471c92a1-a9f2-480b-a6e5-c6a7bcf1300d)
```
Third example - A cascade of two FF's on with D input stuck to high and the output of this FF going into another FF which is first set to high asynch. Simulation results:
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/09b06bba-9047-415b-8e45-ecf366115da5)
```
In this case 2 FF's are infered 
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/0c8e8688-1a42-4069-a06d-c23ea9211374)
```
Fourth example - A cascade of two FF's on with D input stuck to high and both FF asynchronously are set to high at the beginning. In this case we expect the FF's Q outputs to be constant high regardless of the clk
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/dd880d64-eca7-4ffd-9157-31ed58b7dd52)
```
In this case No FF's is infered 
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/3faef3a2-064e-46f9-b1db-d7533e5ee1a5)
```
Fifth example - A cascade of two FF's being reset at the begining, one FF with D input tied to high and output Q cascading to the next FF. In this case we expect 2 FF's being inferred.
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/1e00343a-3672-423a-96b0-6d96bb4f393e)
```
In this case 2 FF's are infered 
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/290607ca-46c4-4796-9f0e-ffa21f04ea16)

#### Advanced 
```
State Optimization - Removing unused states
Retiming - Improving performance of the circuit (frequency), by balancing intermediate combinatorial logic delays between paths of sequential pipelining
Sequential logic cloning - replicating portions of sequential logic to reduce the fan out and creating parallel paths to ease meet timing
```
#### Sequential optimzations for unused outputs lab
```
In this example a 4 bit counter is modeled in RTL but the output only uses the LSB, the unused outputs will be optimized out. In this particular case the output will toggle at every clock cycle so /Q -> D. Synthesis shows only one FF is kept.
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/77d57f29-08fc-45b2-8b05-d8161341607a)
```
Changing the code to generate an output dependent of the 4 bits of the counter in this case
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/078b0aaa-2db4-4a76-8459-4fb0a6a48796)
```
In this case all the 4 bits of the counter are required to formed the final output so all four FF's are kept and we see the combinatorial logic used to form the output and the combinatorial logic to implement the incrementing logic
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/6d9fd49b-dc66-4be7-96df-768e0d656dd9)

# Day 4 - GLS (Gate level simulation), blocking vs non-blocking and Synthesis-Simulation mismatch
```
Running the test bench using the Netlist (generated after syntheis) as Design under test (DUT)
Netlist is logically equivalent to RTL
GLS is used to verify logical correctness of the design after syntheis and to verify timing is met (adding delay annotation to GLS). GLS flow using iverilog (If gate level models are time annotated then GLS can be used for timing verification)
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/712d3d5d-2afc-458a-8236-495e1af96164)

```
Gate level verilog models are used with Netlist to run simulation. Models can be only functional (behavioral) or timing aware (in that case a timing validation is possible)
```
### Synthesis-Simulation mismatch (probably causes)
```
Simulator looks for activity (any change on the signals) and as result evaluate the outputs to reflect the change in the inputs
```
#### Missing sensitivity list 
```I
n simulation Always blocks are only evaluated when one of the signals in the sensitivity list changes. Wild characters can be used in case we need to evaluate the always block when any signal changes e.g always@(*) . Otherwise if a signal is not included in the senstivity list will not trigger the evaluation of the always block and acts as a latch (value does not change). 
In synthesis the compiler looks for the functionality not the sensitivity list, so it will infer the right components. If a missing signal in the sensitiviy list exist there will be differences between the simulation and synthesis.
```
#### Blocking vs Non-blocking assigment
```
BlockingAndNonBlockingStatementsInVerilog (only when we use an always block)
Using "=" to make assigments will create a Blocking statement and all the statements will be executed sequentially (like in C). so order where the statements are written is important. 
Using "<=" to make assigments will create a non-Blocking statement and all the statements in RHS (right hand side) will be evaluated in parallel. Non blocking will be used everytime we want to create a sequential circuit
Caveats with blocking statements
```
#### Non standard verilog coding - using weird verilog constructions
```
Example of a blocking statement Lab - MUX 2x1
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/9cce1cdb-f476-470b-bc80-0dd69af7736a)
```
synthesis also shows a mux is infered
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/194571b7-3a74-4bdd-89c1-2f0ec369d42d)
```
GLS simulation. Write netlist and use iverilog to simulate the design using: this neetlist, the behavioral models of cells and the same test bench used with RTL. We see the same MUX behavior which confirms what was obsrved using RTL simulation
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/b9d60e7a-67e1-42a5-b27e-98406a6130e3)
```
Example showing a missmatch (Bad MUX with onlly sel in sensitivity list of always block)
In this case RTL simulation does not behave completely as a MUX. Output does not follow I0 and I1 and output behaves as a latch, keeping previous value.
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/4faf10ad-c6b0-4e11-a84e-51c99ecdd0cf)
```
synthesis infers the correct MUX
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/68d194af-f951-43b5-baad-507b89518485)
```
GLS simulation shows the correct MUX behavior
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/9c805352-8114-433e-941a-102ca8121f98)
```
In summary because of the problem with sensitivity list RTL simulation does not match GLS simulation
```

# Day 5 - Design for Testability

#### Testability A characteristics of an item's design which allows to know the status (operable, inoperable, degraded) of that item to be confident we are in control of the operation of the circuit. In VLSI a design should be well controllable and observable

DFT (Design for Testability) - Techniques used to facilitate the testing of the design once it is manufactured. (Adding an extra design to make sure the design can be tested after being fabricated). e.g MBist Test (Memory built in test - A self-testing and repair mechanism which tests the devices using an effective set of algorithms to detect all the faults
DFT makes testing easier after tape out. 

#### 3 level of testing:
```
Chip level
Board level
System level
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/b87cd2ac-480c-49e0-8650-83b9beb22c17)
#### Pro's
```
Reduces Tester complexity
Reduces Tester time
Reduces the chances of going into loss due to a faulty device
```
#### Con's
```
Adds complexity to the design flow
Increase area, power and package pins
Decreases performance (max speed of overall design)
Increases Design time/effort
```

#### Basic Terminology

```
Controllability - 0's and 1's are propagated to all the nodes of the target device
A node is controllable if both 0's and 1's propagate through scan patterns
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/89d5f06a-e79c-4bd1-93d0-077d5c0b5846)

In the example adding a simple MUX in between, makes the node accessible but adds more complexity (Changes power, area and performance)

Observability -  Be able to observe each node and measure the logical value at that node. We say that a node is observable if its value can be shifted out through scan chains and can be observed through scan out ports.

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/54d6fd0a-eb5e-4fe8-b164-b08c0e54c869)

In the snapshot a register was added to observe the value of the node if the circuitry that is located after the node fails and its output gets stuck to a certain value with this added register we can observe the internal behavior of the node and get a better idea of what is happening. This added-regisger does not affect the timing but the area and power of the entire module


Fault - stuck at a logic value becausse of a physical damage or a defect
Error - Caused by  fault. System goes into an error state condition
Failure - The system does not provide the expected service
Chain of events: A fault causes and error and that leads to a failure
Fault coverage - Percentage of the total number of faults that can be tested with a given test set
Defect Level - similar to yield. Fraction of shipped parts that are defective. The proportion of faulty chips that were missclasiffied as good ones

#### Scan chain Technique
```
Specifying thee scan constraint
Specifying scan ports and scan enables
Compiling the dft
Identifying the number of scan chains
```

DFT compiler tool converts normal FF's into scan FF's so they can be accessed through a scan chain
Scan chain are the elements in scan-based designs that are used to shif-in and shift-out the test patterns
A scan chain is formed by FF's connected back to back in a chain where the output of one FF is connected to input of another one
The input of the first FF is connected to the input pin of th chip (scan-in) where the scan data is fed. The output of the last flop is connected to the output pin of the chip (scan-out) that is used to shift data out
There are three different scan flops configurations: multiplexed, clocked, lssd (level sensitive scan)

```
example multiplexed scan flop (MUX functional data and test data)
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/19ef898c-fda0-4d7f-bc4a-db8f7da8607b)
```
Purpose of the scan Flops
Test stuck-at faults in manufactured devices
Test the paths in the manufactured devices for delay - test if the path is working at the required functional frequency
(if there are metastability issues they can be captured by reading the sequence of test pattern obtained on the output)
```

FAQ for scan chain
How long one single scan chain can be: (the numner of FF's in a single scan chain)
The larger the chain the more number of cycles is required to shift the data in and out. Smaller chains means more number of input/output ports required.

#### Try to keep all the chains more or less equal in size.

Number of ports required = 2 x Number of scan chains (basically affecting overall area)
Number of cycles required to run a pattern = lenght of the largest scan chain in the design.
As the number of pattern combinations grows exponentially when the number of FF's present in chain increases, in order to generate the test pattern we use the ATPG (Automatic test Pattern generator) and ATE (Automatic test equipment)


DFT compiler - tool used to insert the scan chains in the design - some commands for the tool
- set scan configuration
- preview scan
- insert scan
- set scan_path
- set scan_signal

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/0820c299-0d4c-48f0-8c18-f3beac02843a)

#### circuit to analyze
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/e5cc0dd8-bff1-458e-a544-53ee7cc84cf7)

MUX controls where to run functional data or a test pattern. When test data is enabled (scan_enable), Start sending data from FF which is furthest to the left and keep shifting that data to FF number 2 and number 3 (FF furthest to the right) then data can be captured on the output port. To test intermediate nodes de-assert scan_enable for one or two clock pulses depending on the output we want to capture (data will pass through the combinatorial logic associated to that FF and then it will be captured

# Day 5 - Introduction to Synthosis Logic
```
FLOW  RTL Source -> Translatee (HDL compiler) -> Optimize & Mapping (Design Compiler)
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/f4f15383-fea1-41ac-a554-2e68103577df)


Drsign Compiler (Synopsys tool)
dc_shell (text)  Design Vision (GUI)
Format used for libraries  .db
Format design Information .ddc
SDC (constraints file TCL) Power, timing and areaa constraints
FLOW : sset and link .db -> Read verilog HDL -> Read constraints (SDC) - >  Integrate design Info & Cell Libraries -> Synthesize -> Obtain Reports -> QOR (Quality of Report) - > write Netlist

```
The design is writen in terms of standard cells (gates, FF's mux's, etc)  .db format 
The Target library (Standard cell library database) binary format locatedd in  cell area/ins/timing/data
(Specifie for specific Process, Temperature and Voltage) PVT corner
Other libraries can be appended with  link library
```

Difference from open compiler: Need to specify target, link library taking care of other formats while writing nrtlist or ddc e.g  write -format ddc -hierarchie -o file.ddc

```
Invoking compiler
dc_shell (text)  gui_start
design_vision (GUI)
Uses GTECH lib when verilog is read when no libraries specified
Multiple libraries with PVT corners and cell elements can be specified
.synposis_dc.setup  (can provide libraries without any additional commands to automate process)
```

#### BASICS OF DIGITAL LOGIC DESIGN AND SYNTHESIS

Digital Logic (switching, Automation & Decision making )  -> Behavioral Model of the design using HDL (VHDL, Verilog, System Verilog)  RTL
RTL Translation to gate level + include libraries (Synthesis) -> includes all interconnections among the different elements -> final product of this step is the netlist

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/084d802a-3115-4042-a605-6a22f9a18d9a)
```
.lib (collection of logical modules inchuding different flaviors of same gate
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/ebe3f863-02a3-4e03-ac7b-02e80298d128)
```
Dealing with different flaviors of libraries. In snapshot the max delay constraint path is shown
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/d9bd8955-653f-4480-8276-6058e332597f)

```
Timing labels: TCQ clock to Q delay   TCOMBI (delay combinatorial logic)   TSETUP (Setpup time FF)
Mosfet equation in all operating regios  ID ~ [W/L]
For Setup -> fastest logic cells (Wider transistors, decrease delay, increase area, increase current and power)
For Hold -> slowest logic cells(Narror transistors, increase delay, decrease area, decrease current and power)

Need to guide the Syntheesizer to select cells to optimize design using constraints

Goal of Design synthesis:  Logically and electrically correct and Meeting Timing
```
```
Comparing Different implementation of the same logic specification
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/c576f055-2b59-44d7-9c38-b52b7b78aac3)
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/d07378b8-990a-407a-a566-dbd25b091847)
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/28c26780-ae45-4f1b-af76-3007e5e87e45)

Implementation 3 seems to be the better one but there would be cases where this design in in the critical hold path and required hold time is bigger than the propagation delay and buffers
will have to added to meet hold time which at the same time will increase area, so, for this particular case maybe implementaion 2 might be the best one

#### Terminology used in DC compiler
    SDC (synopsys design constraints) used across EDA implementation tools
    .LIB library which contains standard cells
    .DB same as LIB but different format DC uses .db format for cell libraries
    .DDC format to store design information  .DC can read and write out in .DDC
    .DESIGN  RTL models

#### SDC Format
    Constraints for power, area and timing
    SDC syntax is based on TCL
    
Elements used in Design Compiler

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/85fd431c-68d1-4273-826f-3c9a2da341d5)

General Flow for ASIC Implementation

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/59963956-38b4-45f4-bd1a-1e53362cdfaf)

DC deals with Synthesis portion of the flow

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/9c5bf9b4-9232-45f0-905c-ba71ab00a9e1)

 #### lab - Invoking dc basic setup 
```
 csh
 dc_shell
```
 ![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/d9d2b596-8c36-45e9-8428-0e2a2e24b2fe)

 Find out pointers to libraries

echo $target_library
echo $link_library

Responses for your_library.db (dummy pointers to Non existing library, need to initialize properly). Libraries not intialized

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/2e6dd3a9-95f2-47e6-a452-ac21d628089d)

Libraries properly intialiazied (link command should show libraries used), {*  ] used to indicate to preserve previous existing licenses and do not overrride them with the new setting

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/e0a89874-c732-401b-9716-e91cb3ced580)

after compiling (cmd: compile) and writing netlist, file shows the correct libraries are taken

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/fb9dce6a-15e7-4f44-b1ef-6811b8f841d5)

Invoking the Synposis compiler GUI
```
csh
design_vision
```
First writing synposis information file to open it up with GUI (DCC file has all the information required for the project including libraries)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/f0901c4f-a0d9-4e63-9050-af882a3b37bd)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/7750fd33-b1c9-4bd3-a3bb-fa6097a72bcf)

Loading the design in GUI, showing schematics and cells used

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/9e440368-908d-4840-a1b6-dfeb4fb13f5a)

Intialization script all takss needed for setup the tool: .synposis_dc.setup

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/ad147d04-eb91-4d8c-a259-5ae91358a915)


### TCL QUick refresher

### BASIC COMMNANDS

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/0921f38e-e790-495d-819e-472297160d34)

## Basics of STA

Edge Trigerred FF setup/hold time

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/d735672d-a67f-4f7f-9c47-f01afd6d1ded)

MAX MIN DELAY Constraints

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/40feb9da-b77c-4198-af08-cd56f8f3e2a0)

TCK   > TCQ + TMAX + TS
THOLD < TCQ + TMIN

Delay of a gate cell = function( input transition and output capacitance)

Timing ARCS

Indicate where the different sources of delays can come from

COMB LOGIC:  From any input or combination of inputs to output
SEQ  LOGIC: Delay from CLK to Q from D to Q (for a latch)  A latch is level sensitive only operates when level is active (low or high) othrwise latch is transpararent

Table for sequential elements indicating where to measure setup/hold (FF's LATCH)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/ce22a890-ec91-4fe3-8977-0084291e17a6)

Example showing timing paths

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/a0ecd4f6-7996-4f04-9117-d0a0349b86ed)

For the 2 paths:

tck1 < 0.5 + 1.2 + 0.5 = 2.2 ns
tck2 < 0.5 + 0.7 + 0.5 = 1.7 ns

tck1 > tck2  (tck1 critical path)

To reduce the critical path and increase the frquency we use the constraints to tell the tool to choose logical cell with adequate delay to meet the require timning

TIMING PARTS

Timing paths start at an input point and ends at an output port

clk to D       -> reg to reg timing constraint (constraints by clk) 
clk to output  -> input to output constraints  ReG 2 OUTPUT (IO constriants)
input to D     -> input to output constraints  REG 2 INPUT (IO constriants)
input to Output -> IO PATH (ideally the y should not be part of the constraints)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/642a7b2b-8166-47df-bfdf-89f77c4993a0)

Once the dessired frequency (period) of operation is set all the reg to reg path will be limited by that value
To meet the perior the toll will try to optimize all the logic around (choose appropriate cells)

All synchronous paths using the same clock needs to be constraint. Summary of constraints to apply

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/68b14d7e-7bcc-41ea-9b6a-ecefda7484bf)

REG 2 OUT (output External Delay) In 2 REG (Input External Delay)
External delays IO Delay Modeling -> Std Interface Speficication (coming from tht external module manufacturer)

## LAB  Timing .lib

Checking library parameters (technology, delay/power model, capacity, fanout, , type). For every pin in the cell (power, timing information)
For every cell
Delay mode lookup table (LUT)  f(input transition, ouput capacitance)
Power consumed by the cell (input/output) LUT
From tables real values are found by interpolation 

Comparaison between similar cells, example cells nand2 -> nand_2 faster than nand_0 (bigger area, leakage, power consumption)
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/d15bd1ed-3db8-4d7b-91b2-a65ffa50f868)

Unate concept: (Tool uses this concept to propagate the transition (indicated on the functionallity of output of cell) - Combinatorial cells (timing type combinatorial)
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/ca5d488f-22fa-4f4b-972a-0d80954c3c24)

For sequential cells (rising/falling edge). Setup time will have to specify also if it is measure with respect to positive/negative edge
SETUP time is always measured before sampling point (depending on type of FF it can be pos-edge or neg-edge, same for LATCHES) 

Case of FF's

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/7bd76aa6-1a15-4d51-8e71-dbc9306e76e4)


Cases of latches:

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/967d1744-522d-41de-9b93-715b1808f114)

## LAB  Query Properties of libraries inside .dc_shell

List different flaviors of and gates

list_lib
get_lib_cells */*and*

foreach_in_collection my_lib_cell [get_lib_cells */*and*] {
set my_lib_cell_name [get_object_name $my_lib_cell]; echo $my_lib_cell_name;
}

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/140c311a-c12b-432a-8821-5fb3c064e841)

get_lib_pins sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__and2_0/*  (response is a collection -> getting pin attributes)

foreach_in_collection my_pins [get_lib_pins sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__and2_0/*] {
set my_pin_name [get_object_name $my_pins];
set pin_dir [get_lib_attribute $my_pin_name direction];
echo $my_pin_name $pin_dir;
}
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/bbe4ed4a-9d0b-4800-b84b-e3924b0c5253)

Doing different queries on the attributes on example cells obtained

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/b43ce39c-7ee3-47d7-a473-12c839e9f9af)

### More examples for other types of cells NAND
get_lib_pins sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__nand2_8/* 

foreach_in_collection my_pins [get_lib_pins sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__nand2_8/*] {
set my_pin_name [get_object_name $my_pins];
set pin_dir [get_lib_attribute $my_pin_name direction];
echo $my_pin_name $pin_dir;
}

get_lib_attribute sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__nand2_8/Y function 

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/5d907554-2797-47ed-bf43-a52ba2c12bde)

sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__and3_4 (another example for and3 cell

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/8082598a-7606-4902-868c-658321b3ed33)

More examples on cells:

sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__and4b_1
sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__and4bb_1

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/07eb657b-92ab-4d2f-b435-3b0c973503f1)
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/8e9a5717-0f1a-4ea6-920f-5e60f2744b28)

Querying other attributes:
get_lib_attribute get_lib_attribute sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__and4bb_1 area
get_lib_attribute sky130_fd_sc_hd__tt_025C_1v80/sky130_fd_sc_hd__and4bb_1/X capacitance

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/4adc9564-205a-4854-8dc0-2081f2769481)

List_attributes -app

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/eb7788bc-b984-419b-9b88-83e2f7c0067d)


## Advanced Constraints

## Clock Tree Modelling - Uncertainty 

CLK Generation (All are affected by jitter - random noise)

PLL
Oscillator
External Source

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/4af3cc7b-3c35-49e9-ab48-9ae1a1373061)

To include jitter setup equation is modified:

After CTS and buffer insertion CLK SKEW cnan happen, besides that to take into account the random nature of clk generation Tck - Tskew + Tjitter >= (Tcq + T combi + T setup)  

Synthesis ->  Jitter + Skew
Post CTS  -> Only Jiteer
In Summary for clkc constraint -> Period, Latency, Uncertainty (Skew + Jitter Synthesis)  & Jitter (Post CTS)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/a278a7a5-c25e-4a8d-913a-f12e0c9a4a34)

Writing SDC constraints. Design terminology:

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/aeec1890-ca06-4b33-aeb8-ceddac0d1014)

Net -> Connection of 2 pins or connection IO pins to internal pins of design

Get Commands (ports, clock, cells)

get_ports * -filter  condition

get_clocks * -filter  condition
get_attribute objet attribute -? get_attribute [get_clocks *] period
report_clocks *

Querying cells:

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/100e4a10-e175-4951-94bf-478d833f2959)

When specifying Cells, in the example (combo logic) are specified indicating weather they are a phyisical cell (exist in design) or part of another block (hyerarchical cell), using  -hier  for that 

Writing Constraints:

CLK: (Only on clock geenrated (PLL, OSC, External IO pins) (hierachical pins can be created)
create_clock -name my_clk -per 5 [get_ports CLK]
set_clock_latency 3 my_clock
set_clock_uncertainty 0.5 my_clk

For Post CTS (Only jitter)
set_clock_uncertainty 0.5 my_clk

Varying intial Phase and duty cycle:

create_clock -name my_clk -per 10 [get_ports CLK] -wave {5 10}   # -wave {first rise edge, next false edge}
with perod tool will create the rest of edges
create_clock -name my_clk -per 10 [get_ports CLK] -wave {0 2.5}  # DC = 2.5/10

IO's: (Will depend on particular design or type of IO)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/898bd902-b392-48d1-b0be-0ec58c73c33c)

## Constraint LABS

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/c69ce6bc-030f-4576-a964-6d7db5822097)

Performing some queries on compiled design:

get_ports rst
get_attribute [get_ports rst] direction

foreach_in_collection my_port [get_ports *] {
set my_port_name [get_object_name $my_port];
set dir [get_attribute [get_ports $my_port_name] direction];

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/85a80154-9a04-4e94-aa35-6786e276cf43)

Get reference name of cells used in design

foreach_in_collection my_cell [get_cells * -hier] { \
set my_cell_name [get_object_name $my_cell]; \
set rname [get_attribute [get_cells $my_cell_name] ref_name]; \
echo $my_cell_name $rname; }

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/416dd816-d9a3-4c0b-81b6-56a296d7cfa8)

Looking at the design in the GUI

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/7356b655-4bc1-4eb3-a6d7-ee52950eab65)

No Multidriver NETS in logical design. e.g check net connections, only one driver for each net (in/out)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/57be870d-c887-40a6-852f-31bbda620385)

List of all the pins in design:

foreach_in_collection my_pin [get_pins *] {
set pin_name [get_object_name $my_pin];
echo $pin_name;
}

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/e796c31e-8bf0-4fe5-8009-f64109ec02fc)

Find clock capable pins:  (Need to define a clock before in SDC)

get_attribute [get_pins REGC_reg/RESET_B] clock
get_attribute [get_pins REGC_reg/CLK] clock

foreach_in_collection my_pin [get_pins *] {
set my_pin_name [get_object_name $my_pin];
set dir [get_attribute [get_pins $my_pin_name] direction];
if { [regexp $dir in] } {
if { [get_attribute [get_pins $my_pin_name] clock] } {
echo $my_pin_name;
}
}
}

create_clock -name MYCLK -per 10 [get_ports clk]

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/3353134b-c13c-4e0c-8360-b713d075d0f6)

report_clocks (show all clocks in design)
remove a clock:  remove_clk clk_name

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/48f6b81b-0a77-4dc3-b68c-678eeedbb336)
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/e17029c8-626f-4e70-879a-e5f8136a4887)

After creating clock and adding uncertaintues, Timing slack got reduced

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/35bc76f8-84c4-4996-8cf5-dfe9c4a39080)

```
dc_shell> report_timing
Information: Updating design information... (UID-85)
 
****************************************
Report : timing
        -path full
        -delay max
        -max_paths 1
Design : lab8_circuit
Version: T-2022.03-SP5-6
Date   : Mon Jun  3 10:21:53 2024
****************************************

Operating Conditions: tt_025C_1v80   Library: sky130_fd_sc_hd__tt_025C_1v80
Wire Load Model Mode: top

  Startpoint: REGC_reg (rising edge-triggered flip-flop)
  Endpoint: OUT_Y (output port)
  Path Group: (none)
  Path Type: max

  Point                                        Incr       Path
  ---------------------------------------------------------------
  REGC_reg/CLK (sky130_fd_sc_hd__dfrtp_1)      0.00       0.00 r
  REGC_reg/Q (sky130_fd_sc_hd__dfrtp_1)        0.34       0.34 f
  U10/Y (sky130_fd_sc_hd__clkinv_1)            0.03       0.36 r
  OUT_Y (out)                                  0.00       0.36 r
  data arrival time                                       0.36
  ---------------------------------------------------------------
  (Path is unconstrained)


1
dc_shell> 


After defyning main clock


dc_shell> create_clock -name MYCLK -per 10 [get_ports clk]
1
dc_shell> 
dc_shell> report_timing
Information: Updating design information... (UID-85)
 
****************************************
Report : timing
        -path full
        -delay max
        -max_paths 1
Design : lab8_circuit
Version: T-2022.03-SP5-6
Date   : Mon Jun  3 10:23:30 2024
****************************************

Operating Conditions: tt_025C_1v80   Library: sky130_fd_sc_hd__tt_025C_1v80
Wire Load Model Mode: top

  Startpoint: REGB_reg (rising edge-triggered flip-flop clocked by MYCLK)
  Endpoint: REGC_reg (rising edge-triggered flip-flop clocked by MYCLK)
  Path Group: MYCLK
  Path Type: max

  Point                                        Incr       Path
  ---------------------------------------------------------------
  clock MYCLK (rise edge)                      0.00       0.00
  clock network delay (ideal)                  0.00       0.00
  REGB_reg/CLK (sky130_fd_sc_hd__dfrtp_1)      0.00       0.00 r
  REGB_reg/Q (sky130_fd_sc_hd__dfrtp_1)        0.29       0.29 r
  U14/Y (sky130_fd_sc_hd__nand2_1)             0.04       0.34 f
  REGC_reg/D (sky130_fd_sc_hd__dfrtp_1)        0.00       0.34 f
  data arrival time                                       0.34

  clock MYCLK (rise edge)                     10.00      10.00
  clock network delay (ideal)                  0.00      10.00
  REGC_reg/CLK (sky130_fd_sc_hd__dfrtp_1)      0.00      10.00 r
  library setup time                          -0.12       9.88
  data required time                                      9.88
  ---------------------------------------------------------------
  data required time                                      9.88
  data arrival time                                      -0.34
  ---------------------------------------------------------------
  slack (MET)                                             9.55


1
dc_shell> 


After adding uncertainties

dc_shell> set_clock_latency -source 2 [get_clocks MYCLK]        
1
dc_shell> 
dc_shell> set_clock_latency 1         [get_clocks MYCLK]       
1
dc_shell> 
dc_shell> set_clock_uncertainty -setup 0.5  [get_clocks MYCLK] 
1
dc_shell> 
dc_shell> set_clock_uncertainty -hold 0.1  [get_clocks MYCLK]
1

dc_shell> report_timing
Information: Updating design information... (UID-85)
 
****************************************
Report : timing
        -path full
        -delay max
        -max_paths 1
Design : lab8_circuit
Version: T-2022.03-SP5-6
Date   : Mon Jun  3 10:26:26 2024
****************************************

Operating Conditions: tt_025C_1v80   Library: sky130_fd_sc_hd__tt_025C_1v80
Wire Load Model Mode: top

  Startpoint: REGB_reg (rising edge-triggered flip-flop clocked by MYCLK)
  Endpoint: REGC_reg (rising edge-triggered flip-flop clocked by MYCLK)
  Path Group: MYCLK
  Path Type: max

  Point                                        Incr       Path
  ---------------------------------------------------------------
  clock MYCLK (rise edge)                      0.00       0.00
  clock network delay (ideal)                  3.00       3.00
  REGB_reg/CLK (sky130_fd_sc_hd__dfrtp_1)      0.00       3.00 r
  REGB_reg/Q (sky130_fd_sc_hd__dfrtp_1)        0.29       3.29 r
  U14/Y (sky130_fd_sc_hd__nand2_1)             0.04       3.34 f
  REGC_reg/D (sky130_fd_sc_hd__dfrtp_1)        0.00       3.34 f
  data arrival time                                       3.34

  clock MYCLK (rise edge)                     10.00      10.00
  clock network delay (ideal)                  3.00      13.00
  clock uncertainty                           -0.50      12.50
  REGC_reg/CLK (sky130_fd_sc_hd__dfrtp_1)      0.00      12.50 r
  library setup time                          -0.12      12.38
  data required time                                     12.38
  ---------------------------------------------------------------
  data required time                                     12.38
  data arrival time                                      -3.34
  ---------------------------------------------------------------
  slack (MET)                                             9.05


1
dc_shell> 

```

Comparing timing report for max and min delay (setup/hold) uncertainties substracted and added depending on the report chosen 

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/b8d4777f-220e-436b-90c5-14ca33ca98f0)

Relevant Equations shown in the timing report: arrival time/ reqquired time

TCQ + TCOMBI + Tsetup <= Tclk
TCQ + TCOMBI = arrival time
TCK - Tsetup = required time

Thold + Tskew < (TCQ + TCOMBI) min  (For hold time skew is getting added)  Skew is helping hold

Overall report should show which ports are constraints and which do not:  report_port -verbose

```
dc_shell> report_port -verbose
 
****************************************
Report : port
        -verbose
Design : lab8_circuit
Version: T-2022.03-SP5-6
Date   : Mon Jun  3 10:37:05 2024
****************************************


                       Pin      Wire     Max     Max     Connection
Port           Dir     Load     Load     Trans   Cap     Class      Attrs
--------------------------------------------------------------------------------
IN_A           in      0.0000   0.0000   --      --      --         
IN_B           in      0.0000   0.0000   --      --      --         
clk            in      0.0000   0.0000   --      --      --         
rst            in      0.0000   0.0000   --      --      --         
OUT_Y          out     0.0000   0.0000   --      --      --         
out_clk        out     0.0000   0.0000   --      --      --         


              External  Max             Min                Min       Min
              Number    Wireload        Wireload           Pin       Wire
Port          Points    Model           Model              Load      Load
--------------------------------------------------------------------------------
IN_A               1      --              --              --        -- 
IN_B               1      --              --              --        -- 
clk                1      --              --              --        -- 
rst                1      --              --              --        -- 
OUT_Y              1      --              --              --        -- 
out_clk            1      --              --              --        -- 

                    Input Delay
                  Min             Max       Related   Max
Input Port    Rise    Fall    Rise    Fall   Clock  Fanout
--------------------------------------------------------------------------------
IN_A          --      --      --      --      --      -- 
IN_B          --      --      --      --      --      -- 
clk           --      --      --      --      --      -- 
rst           --      --      --      --      --      -- 


               Max Drive      Min Drive      Resistance    Min    Min       Cell
Input Port    Rise    Fall   Rise    Fall   Max     Min    Cap    Fanout    Deg
--------------------------------------------------------------------------------
IN_A          --      --     --      --     --      --     --     --        -- 
IN_B          --      --     --      --     --      --     --     --        -- 
clk           --      --     --      --     --      --     --     --        -- 
rst           --      --     --      --     --      --     --     --        -- 


               Max Tran        Min Tran
Input Port    Rise    Fall    Rise    Fall
--------------------------------------------------------------------------------
IN_A          --      --      --      -- 
IN_B          --      --      --      -- 
clk           --      --      --      -- 
rst           --      --      --      -- 


                    Output Delay
                  Min             Max      Related  Fanout
Output Port   Rise    Fall    Rise    Fall  Clock     Load
--------------------------------------------------------------------------------
OUT_Y         --      --      --      --      --      0.00
out_clk       --      --      --      --      --      0.00

1
dc_shell>

```

### Adding IO Delay constraints

set_input_delay -max 5 -clock [get_clocks MYCLK] [get_ports IN_A]
set_input_delay -max 5 -clock [get_clocks MYCLK] [get_ports IN_B]
set_input_delay -min 1 -clock [get_clocks MYCLK] [get_ports IN_A]
set_input_delay -min 1 -clock [get_clocks MYCLK] [get_ports IN_B]


set_input_transition -max 0.3  [get_ports IN_A]
set_input_transition -max 0.3  [get_ports IN_B]
set_input_transition -max 0.1  [get_ports IN_A]
set_input_transition -max 0.1  [get_ports IN_B]

report_timing -from IN_A -delay min -trans -net -cap -nosplit
report_timing -from IN_A -delay max -trans -net -cap -nosplit

```
dc_shell> set_input_delay -max 5 -clock [get_clocks MYCLK] [get_ports IN_A]
1
dc_shell> 
dc_shell> set_input_delay -max 5 -clock [get_clocks MYCLK] [get_ports IN_B]
1
dc_shell> 
dc_shell> set_input_delay -min 1 -clock [get_clocks MYCLK] [get_ports IN_A]
1
dc_shell> 
dc_shell> set_input_delay -min 1 -clock [get_clocks MYCLK] [get_ports IN_B]
1
dc_shell> set_input_transition -max 0.3  [get_ports IN_A]
1
dc_shell> 
dc_shell> set_input_transition -max 0.3  [get_ports IN_B]
1
dc_shell> 
dc_shell> set_input_transition -max 0.1  [get_ports IN_A]
1
dc_shell> 
dc_shell> set_input_transition -max 0.1  [get_ports IN_B]
1
dc_shell> 
dc_shell> report_timing -from IN_A -delay min -trans -net -cap -nosplit
Information: Updating design information... (UID-85)
 
****************************************
Report : timing
        -path full
        -delay min
        -nets
        -max_paths 1
        -transition_time
        -capacitance
Design : lab8_circuit
Version: T-2022.03-SP5-6
Date   : Mon Jun  3 11:20:24 2024
****************************************

Operating Conditions: tt_025C_1v80   Library: sky130_fd_sc_hd__tt_025C_1v80
Wire Load Model Mode: top

  Startpoint: IN_A (input port clocked by MYCLK)
  Endpoint: REGB_reg (rising edge-triggered flip-flop clocked by MYCLK)
  Path Group: MYCLK
  Path Type: min

  Point                          Fanout       Cap     Trans      Incr       Path
  ---------------------------------------------------------------------------------
  clock MYCLK (rise edge)                                        0.00       0.00
  clock network delay (ideal)                                    3.00       3.00
  input external delay                                           1.00       4.00 r
  IN_A (in)                                            0.10      0.00       4.00 r
  IN_A (net)                       2         0.00                0.00       4.00 r
  U12/Y (sky130_fd_sc_hd__a21oi_1)                     0.04      0.07       4.07 f
  N1 (net)                         1         0.00                0.00       4.07 f
  REGB_reg/D (sky130_fd_sc_hd__dfrtp_1)                0.04      0.00       4.07 f


  clock MYCLK (rise edge)                                        0.00       0.00
  clock network delay (ideal)                                    3.00       3.00
  clock uncertainty                                              0.10       3.10
  REGB_reg/CLK (sky130_fd_sc_hd__dfrtp_1)                        0.00       3.10 r
  library hold time                                             -0.05       3.05
  data required time                                                        3.05
  ---------------------------------------------------------------------------------
  data required time                                                        3.05
  data arrival time                                                        -4.07
  ---------------------------------------------------------------------------------
  slack (MET)                                                               1.02


1
dc_shell> report_timing -from IN_A -delay max -trans -net -cap -nosplit
 
****************************************
Report : timing
        -path full
        -delay max
        -nets
        -max_paths 1
        -transition_time
        -capacitance
Design : lab8_circuit
Version: T-2022.03-SP5-6
Date   : Mon Jun  3 11:20:54 2024
****************************************

Operating Conditions: tt_025C_1v80   Library: sky130_fd_sc_hd__tt_025C_1v80
Wire Load Model Mode: top

  Startpoint: IN_A (input port clocked by MYCLK)
  Endpoint: REGA_reg (rising edge-triggered flip-flop clocked by MYCLK)
  Path Group: MYCLK
  Path Type: max

  Point                          Fanout       Cap     Trans      Incr       Path
  ---------------------------------------------------------------------------------
  clock MYCLK (rise edge)                                        0.00       0.00
  clock network delay (ideal)                                    3.00       3.00
  input external delay                                           5.00       8.00 f
  IN_A (in)                                            0.10      0.00       8.00 f
  IN_A (net)                       2         0.00                0.00       8.00 f
  U11/Y (sky130_fd_sc_hd__nor2_1)                      0.13      0.15       8.15 r
  n5 (net)                         2         0.01                0.00       8.15 r
  U13/Y (sky130_fd_sc_hd__clkinv_1)                    0.04      0.07       8.22 f

  REGA_reg/D (sky130_fd_sc_hd__dfrtp_1)                0.04      0.00       8.22 f
  data arrival time                                                         8.22

  clock MYCLK (rise edge)                                       10.00      10.00
  clock network delay (ideal)                                    3.00      13.00
  clock uncertainty                                             -0.50      12.50
  REGA_reg/CLK (sky130_fd_sc_hd__dfrtp_1)                        0.00      12.50 r
  library setup time                                            -0.12      12.38
  data required time                                                       12.38
  ---------------------------------------------------------------------------------
  data required time                                                       12.38
  data arrival time                                                        -8.22
  ---------------------------------------------------------------------------------
  slack (MET)                                                               4.16


```

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/9566880e-dab3-4727-ab64-cbf825e266ef)


Adding output IO constraints

set_output_delay -max 5   -clock [get_clocks MYCLK] [get_ports OUT_Y]
set_output_delay -min 0.1 -clock [get_clocks MYCLK] [get_ports OUT_Y]

Adding output load capacitance

set_load -max 0.4 [get_ports OUT_Y]
set_load -min 0.1 [get_ports OUT_Y]

report_timing -to OUT_Y -trans -net -cap -nosplit

```
dc_shell> set output_delay -min 0.1 -clock [get_clocks MYCLK] [get_ports OUT_Y]
Error: wrong # args: should be "set varName ?newValue?"
	Use error_info for more info. (CMD-013)
dc_shell> set_output_delay -max 5   -clock [get_clocks MYCLK] [get_ports OUT_Y]
1
dc_shell> 
dc_shell> set_output_delay -min 0.1 -clock [get_clocks MYCLK] [get_ports OUT_Y]
1
dc_shell> set_load -max 0.4 [get_ports OUT_Y]
1
dc_shell> 
dc_shell> set_load -min 0.1 [get_ports OUT_Y]
1
dc_shell> report_timing -to OUT_Y -trans -net -cap -nosplit
Information: Updating design information... (UID-85)
 
****************************************
Report : timing
        -path full
        -delay max
        -nets
        -max_paths 1
        -transition_time
        -capacitance
Design : lab8_circuit
Version: T-2022.03-SP5-6
Date   : Mon Jun  3 11:27:18 2024
****************************************

Operating Conditions: tt_025C_1v80   Library: sky130_fd_sc_hd__tt_025C_1v80
Wire Load Model Mode: top

  Startpoint: REGC_reg (rising edge-triggered flip-flop clocked by MYCLK)
  Endpoint: OUT_Y (output port clocked by MYCLK)
  Path Group: MYCLK
  Path Type: max

  Point                            Fanout       Cap     Trans      Incr       Path
  -----------------------------------------------------------------------------------
  clock MYCLK (rise edge)                                          0.00       0.00
  clock network delay (ideal)                                      3.00       3.00
  REGC_reg/CLK (sky130_fd_sc_hd__dfrtp_1)                0.00      0.00       3.00 r
  REGC_reg/Q (sky130_fd_sc_hd__dfrtp_1)                  0.05      0.30       3.30 r
  REGC (net)                         1         0.00                0.00       3.30 r
  U10/Y (sky130_fd_sc_hd__clkinv_1)                      3.07      2.32       5.62 f
  OUT_Y (net)                        1         0.40                0.00       5.62 f
  OUT_Y (out)                                            3.07      0.00       5.62 f


  clock MYCLK (rise edge)                                         10.00      10.00
  clock network delay (ideal)                                      3.00      13.00
  clock uncertainty                                               -0.50      12.50
  output external delay                                           -5.00       7.50
  data required time                                                          7.50
  -----------------------------------------------------------------------------------
  data required time                                                          7.50
  data arrival time                                                          -5.62
  -----------------------------------------------------------------------------------
  slack (MET)                                                                 1.88


```

check report of ports constraints:  report port -verbose

```
dc_shell> report_port -verbose
 
****************************************
Report : port
        -verbose
Design : lab8_circuit
Version: T-2022.03-SP5-6
Date   : Mon Jun  3 11:29:47 2024
****************************************


                       Pin      Wire     Max     Max     Connection
Port           Dir     Load     Load     Trans   Cap     Class      Attrs
--------------------------------------------------------------------------------
IN_A           in      0.0000   0.0000   --      --      --         
IN_B           in      0.0000   0.0000   --      --      --         
clk            in      0.0000   0.0000   --      --      --         
rst            in      0.0000   0.0000   --      --      --         
OUT_Y          out     0.4000   0.0000   --      --      --         
out_clk        out     0.0000   0.0000   --      --      --         


              External  Max             Min                Min       Min
              Number    Wireload        Wireload           Pin       Wire
Port          Points    Model           Model              Load      Load
--------------------------------------------------------------------------------
IN_A               1      --              --              --        -- 
IN_B               1      --              --              --        -- 
clk                1      --              --              --        -- 
rst                1      --              --              --        -- 
OUT_Y              1      --              --              0.1000    -- 
out_clk            1      --              --              --        -- 

                    Input Delay
                  Min             Max       Related   Max
Input Port    Rise    Fall    Rise    Fall   Clock  Fanout
--------------------------------------------------------------------------------
IN_A          1.00    1.00    5.00    5.00  MYCLK     --    
IN_B          1.00    1.00    5.00    5.00  MYCLK     --    
clk           --      --      --      --      --      -- 
rst           --      --      --      --      --      -- 


               Max Drive      Min Drive      Resistance    Min    Min       Cell
Input Port    Rise    Fall   Rise    Fall   Max     Min    Cap    Fanout    Deg
--------------------------------------------------------------------------------
IN_A          --      --     --      --     --      --     --     --        -- 
IN_B          --      --     --      --     --      --     --     --        -- 
clk           --      --     --      --     --      --     --     --        -- 
rst           --      --     --      --     --      --     --     --        -- 


               Max Tran        Min Tran
Input Port    Rise    Fall    Rise    Fall
--------------------------------------------------------------------------------
IN_A          0.10    0.10    --      -- 
IN_B          0.10    0.10    --      -- 
clk           --      --      --      -- 
rst           --      --      --      -- 


                    Output Delay
                  Min             Max      Related  Fanout
Output Port   Rise    Fall    Rise    Fall  Clock     Load
--------------------------------------------------------------------------------
OUT_Y         0.10    0.10    5.00    5.00  MYCLK     0.00  
out_clk       --      --      --      --      --      0.00

``` 

### SDC Part3 generated_clk 

Output CLK out of our module (from a master clock in our desoign)

In the snapshot: create_generated_clock -name MY_GEN_CLK - master [get_clocks MY_CLK] -source [get_ports CLK] =div 1 [get_ports OUT_CLK]

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/6ee75c07-d2df-4a3f-962c-2b9d6b8fb908)

In case of several sources of clock driving a pin by a selection line, constraint is done for one path at a time, never simultaneously

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/8aa5cbd5-6301-4d79-a9d5-223709c4b6c1)

### LAB

create_generated_clock -name MY_GEN_CLK -master [get_clocks MYCLK] -source [get_ports clk] -div 1 [get_ports out_clk]

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/0d80d591-fb61-42da-a88f-a1e8b9b0a2e7)

The generated clkc is defined, master source is specified, also division ratio

set_clock_latency -max 5 [get_clocks MY_GEN_CLK]

next step annotate the delay

set_output_delay -max 5 [get_ports OUT_Y] -clock [get_clocks MY_GEN_CLK]
set_output_delay -min 1 [get_ports OUT_Y] -clock [get_clocks MY_GEN_CLK]

report_port -verbose  # Showing output port

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/c87ac6d8-0f31-4592-9824-d792eead6353)

report_timing -to OUT_Y -trans -net -cap -nosplit  ## Now showing the capture FF with respect to the new generated clock

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/87559086-347b-4fef-b09b-17ffc20b4384)

After adding a new output clk (div/2) with respect to master clock

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/0db6650f-8321-433e-bb0e-471ca138fa22)

#### vclk, max_latency, rise_fall IODelays 

INPUTS:

POS DELAY -> Data comes after  clock
NEG DELAY -> Data comes before clock

Input delay MAX (setup)
Negative delay for max is relaxing time  Availabletime = [clk_period - Uncert - input_delay]
Posiive delay for max is tighten time  
Input delay MIN (hold)
Negative delay for min -> needs to delay data to meet hold (tighten)
Posiive delay for min ease hold timing  (relax) 

OUTPUTS:

OUTPUTS:

Availabletime = [clk_period - Uncert - ext_delay]

output delay MAX (setup)
Negative delay for max is relaxing time  Availabletime = [clk_period - Uncert - input_delay]
Posiive delay for max is tighten time  
output delay MIN (hold)
Negative delay for min -> needs to delay data to meet hold (tighten)
Posiive delay for min ease hold timing  (relax)

For virtual clocks there is no latency and no actual definition of it. The tool infers a virtual clock (In the snapshot the combo logic is just specificed from input to output)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/15035d9a-50f8-4667-ba97-4867515d453c)

Revised IO constraints -> considering the source path of the data for inputs and destination path for outputs:
In the first case launch and capture points are rising edges of consecutive clock pulses while in the second example the launch happens in the negative edge (clk neg) and capture happens in the rising edge  (the argument -fall tells the tool to use falling edge of clock) -add (append this constraint and do not override any previous one to this path). The same is valid for the output path (second FF is also a negative-edge triggered)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/3a559d7b-a1ac-405e-8b8a-d90dcff3a70c)

There is a recommendation to indicate the constraint for a load on a particular IO input depending on where the IO is located:

- For TOP level primary io's (board level for example)
  set-input_transition -max 3 (get_port IN_A)   # (If value considereed is meaningfull it could also be used for the case below but that second constraint is closer to reality)
- For module level IO (Internal interconnection between modules of the design)
   set_driving_cell -lib_cell <lib_cell_name>  <ports>

### LAB Set_Max_delay

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/4c09553c-9fea-48e8-8c7f-a06b1d38c45d)

New commands:

all_inputs
all_outputs
all_clocks
all_registers

all_registers -clock MYGEN_DIV_CLK
all_registers -clock MYGEN_CLK
all_registers -clock MYCLK

all_fanout from - IN_A
all_fanout -flat -endpoints_only -from IN_A
all_fanin  -to REGA_reg/D -flat -startpoints_only

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/a87d90de-914d-43cb-b87c-0471d4be2af8)

New combinatorial path added in lab14 from input to output only combinatorial. Assoaciated constraint:

set_max_delay 0.1 -from [all_inputs] -to [get_port OUT_Z]
report_timing -to OUT_Z  -sig 4
Then linking and compile_ultra to check timing report: 

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/4c3c8026-24fd-4ed6-bacf-5fa7de25a1e6)

Timing is met in this case. (constraint max_delay is taken)

Showing in GUI new combinatorial path added and optmization done by compiler adding inverter in path:

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/80333af2-077f-42ac-9de9-fc191ef573a1)

2nd methid: Adding a virtual clock

Setting all atributes with respect to that virtual clock
create_clock -name MYVCLK -per 10
set_input_delay -max 5 [get_ports IN_C] -clock [get_clocks MYVCLK]
set_input_delay -max 5 [get_ports IN_D] -clock [get_clocks MYVCLK]
set_output_delay -max 4.9 [get_ports OUT_Z] -clock [get_clocks MYVCLK]

Timing is met. Same as previous method

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/4af5eeab-69cd-47a7-aa04-df5a1d69a63a)

## OPTIMIZATIONS
Optimiztion parameters: Tool will try to find the optimal way for the implementation so that the three parameters are meet (timing, area, power). Each parameter has its own cost function, all of them are analyzed and the best values are chosen.

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/a35d3c92-e83c-45b9-bfa0-2d5de71a7ec1)

timing -> cost function iodelay, period
area   -> set value
power  -> set value and related to the other 2

Combinatorial Optimization
- Constant propagation (use fix logic values and see how they propagate through out the design to reduce logic)
- Boolean Optimization (Resource sharing, logic sharing, simplify equations)
- Balance vs preferential implementation (Right impelementation will depend on what is acceptable and margens in term of parameters needed to meet)

Sequential Optimization
- Sequential constant propagaton
- Retiming
- Unused FLop removal
- Clock gating
- Sequential Logic cloning
- State optimization

  Examples of optimization by constant propagation on sequential circuits

  ![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/2d421e8c-5e22-4989-8221-8f97204494a6)

Lab example -> Optimization of a mux and combo logic

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/c577d7ca-87e7-4c50-b06f-614f091bf8c9)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/f5a5ba8f-e5f3-4f9e-8bc3-edc8f815d574)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/61819682-ac3e-4bc7-839a-0049af88db94)

After titghen the sel line the logic get spread - area increases a bit set_max_delay 0.1 -from sel -to [all_outputs]

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/ca08b065-dfdf-4f13-b33e-e7bef43105d6)






  




  













   






































































































































































 






    

    
    
    


























 




























































   













































