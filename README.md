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
$ make TCL script to run on lc_shell to convert all libraries sky130*.lib copied to BabySoc/src/lib
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

After titghen the sel line the logic get spread - area increases a bit (set_max_delay 0.1 -from sel -to [all_outputs])
select goes directly to the output instead of staying in the input stages a before  (mux are close to the output)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/53eff487-570e-4a55-b300-c7f47d837c83)

Constrainng the area to 800 (set_max_area 800) Tool gives better results for are (sel still tight) and still meeting timing 

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/efc9246a-5e21-42d7-a263-ac06ce3dfdea)

Lab example ->  DFF sequential optimization

To avoid gate of FF's to be connected directly to VDD/GND to prevent any transients or surges to damage the cells. Use TIE CELLS for driving directly 1'b1/1'b0

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/2e5bce1b-7c72-47bd-80e0-b103cc383eef)

In this other case the design is optimized to a constant high (a TIE CELL is used for that purpose)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/dc7bb0ff-b542-42eb-8241-5910174cecb5)

If in the previous case we had instructed the tools not to the constant optimization (set compile_seqmap_propagate_constant false) FF would still be there

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/777b6202-4db2-4383-9fcd-cedd618d55b5)

In this case the FF's cells are present and D tied to a constant high using a TIE CELL

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/3c663b71-5bc7-428a-9fb4-cee4848ab859)

### Special optimizations

- Retiming case -> Brake down a large combo logic into small pieces and distributted to sequential consecutive FF's (Disadvantage as we are braking the logic we are modifying the original 
netlist). Can create issues with Functional DV (design verifiation)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/be8ed823-75a2-43bc-b1f5-6ddbd3bd3f7e)

- Boundary optimization (Disolve boundaries in modules and merge them) It changes the hierarchie and netlist.  Can create issues with Functional DV (design verifiation)
   set_boundary_optimization module_1 false/true
  
- Multicycle paths

- In this particular design the enable to the MUX (D input of FF) comes also from another FF, this enable will last for one entire clock cycle (inputs A and B are supposed to be estable all that time)
- In this case we do not expect any changes on main FF (PROD_REG) adter the next cycle so effecively we can expect a response after the second clock cycle. This is indicated in the constraint showing 
   multicyle 2 cycles (logic is sampled only once every 2 clock samples). Otherwise the tool will try to over=optimize that path in just one cycle.

  ![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/a217ab02-f27c-4837-a00a-d7aaeba33cdb)

  - False Paths
    No temporal correlation between two clocks, path become a false path (In the example clk1 and clk2  and clkA and clkB)

    ![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/ac0b9752-b2ee-4c89-8a0d-5983e278f059)

- External loads vs Internal loads
- In the cuitcuit shown, if an external module is added, it will increase the overall load of output and increase the delay. A consraint (set isolate_ports -type buffer [get_ports OUT_Y]) can be added to 
  isolate the output, adding a buffer to prevent the load to affect the timing path of the circuit.
- 
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/8596432a-e7b3-44c3-8a1a-dd8b4a2dae16)


# Day 11 - INTRODUCTION TO BABY SOC

- SOC single die chip that has different IP cores
- The design of an SOC includes a CPU, memory, IO's secondary storage devices and peripheral interfaces like timers, usb, bluetooth, uart
- Depending on the requirements in summary it can consist of a digital/analog mixed signal units, fixed/floating point unit
  Used on mobile computing, communications, control

- Functional comoponents: Processor cores, memories DSP's 
- Intermodule communication:  Bus-based communication, netowrk on a chip. Network interface module

  Basic flow to build an SoC
  - Specification requirements
  - Basic Logic Design (Using an HDL language)
  - Logic verification and iteration if issues found
  - Physical design (including libraries and cells)
  - Physical verification and iteration if differences found
  - Chip Fabrication     
  
  ![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/aeead06a-5234-44dc-887f-3997b6e8a2bd)
  
### example: snapdragon soc - arm architecture 
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/49e42a7f-22e0-428c-99c2-3338cfa4dfee)


### Types of SOC
- SOC build around a microcontroller
- SOC's build around microprocessors, often found in cell  phones
- Spsciaalized ASIC's SOC's designed for very specific applications

### Baby SoC components:

- Wrapper SoC
- RVMYTH: Simple RISC SOC core
- PLL : Phase-lock loop, generates an output whose phase is in sync with input phase. It is used for Clock generation, synchronization and distribution
- DAC: Converts a digital signal into an analog one used in communiction systems

  ![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/45f0e00d-5464-4967-af97-090258311986)


# Day 12 - BABYSOC MODELING
### Modeling Baby SoC (3 basic components)
- PLL
- - DAC
RVMYTH

### Modeling uses of physical and logical represention on a system that helps to generate data and help determine decisions nd predictions about the system

### Purpose of modeling:

Support analysis and specification
Design
Verification
Validation,
Generate documentation

### Why we model: 
Give intial vector signals to our circuit and see how it reacts. e.g PLL will start and clock will be applied to all rvmyth which will do all computations and generate output values, some will be analog values generated by a DAC

### RVMYTH - Risc V
Reduced set computer architecture
RISC-V ISA defined using open instruction set architecture (ISA) , this base integer instruction set is characterized by the width of the integer registers and size of address space and by the number of integer registers. There are 2 primary base integer variants RV32I and RV64I (32bits and 64 bits integer operations CPU)

### A simple one cycle CPU for RISC-V (pipelined processing instructions)

Five main pipelining stages
- PC stage: Update program counter to point to next instruction
- Fecth stage: Get instruction from instruction memory
- Decode stage : Determine type of instruction
- Reade Memory stage: Read data (operand) from instruction memory to perform operation
- Write back: Store back to data memory

- ![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/a42da095-ff12-4677-bdcc-948684fc84da)


### Pipeline hazards: 
Are dependencies which disrupt the normal execution in the pipeline. When a hazard occurs, instruction cannot execute in the designated clock cycle as it may result in incorrect computation results or flow of control. As a result, the pipeline may be forced to stall until the instruction can be successfully executed.

- Structural Hazards
- Control Hazards
- Data Hazards

### PLL
Phase locked loop, electronic cirtcuit with a voltage driver oscillator (VCO) that constantly match the frequency/phase of an output signal with input signal using a control loop, an error phase is generated and that varies the voltage on vco to adjust the output value. A divided down value of frequency can also be obtained with this PLL by using a frequency counter in control loop. PLL's are used to generate, synchronize, stabilize external clock frequencies. Reduce jitter delays due to long wires, adjust ppm error values (parts per million e.g 20ppm quarts translates to 20/1e6 = 2e-5 =1.73 sec per day)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/2b1feb07-4ffe-4593-a25b-5f6c4320da44)

### DAC (Digital to Analog converter) - 2 types of DAC

- Wieghed resgister DAC (resisters and switches are tuened on/off to obtain the voltage required), R values could be 

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/e921ec17-4be6-4717-9895-5738674c88a5)

- R2Rladder

Produces an analog output, which is equal to the digital input representation using a R2R ladder with gives the equivalent of the total voltage represented in the bits of the DAC'with the array of resistances.

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/91e2d804-d910-4fa0-b3b4-d528c373eb6f)

Verilog can't synthesize analog design, we will use real data constructions non-synthesisable to represent analog modules. We will simulate logical correctness of the design using iverlog -Icarus (compile) and check waveforms with gtkwave

Here the repo we used as a reference to model the RVMYTH.
https://github.com/shivanishah269/risc-v-core
Here is the repo we used as a reference to model the PLL.
https://github.com/vsdip/rvmyth_avsdpll_interface
Here is the repo we used as a reference to model the DAC.
https://github.com/vsdip/rvmyth_avsddac_interface

```
 $ sudo apt install make python python3 python3-pip git iverilog gtkwave docker.io
 $ sudo chmod 666 /var/run/docker.sock
 $ cd ~
 $ pip3 install pyyaml click sandpiper-saas
 ```
```
 /////////////////////////////////////////////////////////////////////////////////////// 
  WARNING: The script sandpiper-saas is installed in '/home/josep/.local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
//////////////////////////////////////////////////////////////////////////////////
modifying .profile  export PATH=$PATH:$HOME/.local/bin
//////////////////////////////////////////////////////////////////////////////////
```
```
git clone https://github.com/manili/VSDBabySoC.git       - clone this repo containing VSDBabySoC design files and testbench.
cd /home/jose/VSDBabySoC
sandpiper-saas -i ./src/module/*.tlv -o rvmyth.v --bestsv --noline -p verilog --outdir ./src/module/   - to translate .tlv definition of rvmyth into .v definition.

iverilog -o output/pre_synth_sim.out -DPRE_SYNTH_SIM src/module/testbench.v -I src/include -I src/module   - to compile and simulate vsdbabysoc design.
cd output
./pre_synth_sim.out             - To generate pre_synth_sim.vcd file,which is our simulation waveform file.
gtkwave pre_synth_sim.vcd         - to open simulation waveform in gtkwave tool.
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/0a5bac3d-4894-4e8b-8139-0ad17985ad2d)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/14828c96-1bbc-475b-9cf2-e545657ae224)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/a89904dc-2b22-40e6-927c-a4d7cea67647)

zoom of the previous output

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/9e094893-fe0c-4b80-bc1b-b7454cb06437)

- PLL basic sim
```
iverilog avsd_pll_1v8.v pll_tb.v
./a.out
gtkwave test.vcd
```

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/65e1d000-31af-4951-adfc-d8c23cab6fcf)



# Day 12 - POST-SYNTHESIS
`
Pre-synthesis: Simulatiom is done according to the logic we designed it is only Functional Simulation. So, after synthesis we need to hook up again pll & dac and check again.

Post syntheesis simulation or gate level simulation (GLS) is done after synthesis considering each and every gate delays into account, it reports violations in functionality and timing. It shows also the mismatches due to wrong usage of operators and the inference of latches. 
Nomencalture: Using X in simulation and Unknown/Don't care in synthesis.

Gate level refers to the netlist view of a circuit produced by logic synthesis. So RTL simulation is pre-synthesis, GLS is post-synthesis. The netlsit view is a list showing the complete connection of gates and IP models with full functionality and timing behavior.

RTL simulation is a zero delay simulation, GLS can be also zero delay but it is mostly used in unit delay or full timing mode Gate level simulation. Bassically improves the confidence we have in the implementation of a design and it can help verify dynamic behavior, thing that can not be achieved using static methods.

We will use design compier for post-synthesis simulation

e.g rvmyth_avsddac.v

Invoke DC and Read the verilog file -> rvmyth_avsddac.v
Read .db file and set target_lib -> sky130_fd_sc_hd__tt_025C_1v80.lib, 
avsddac.lib

Using synopsys’s lc_shell(Library Compiler)
Follow these commands to convert .lib to .dc
1. lc_shell
2. read_lib library.lib(if in the same directory as the .lib) 
Else - > read_lib <your_path>/library.lib
3. write_lib library -format db -output library.db

read_lib sky130_fd_sc_hd__tt_025C_1v80.lib
write_lib -output sky130_fd_sc_hd__tt_025C_1v80.db sky130_fd_sc_hd__tt_025C_1v80

Library Conversion

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/1606a9c3-0a60-4a60-b270-a29efddeafd8)

Same for DAC and PLL libraries
read_lib avsddac.lib
write_lib -output avsddac.db avsddac

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/b7f6fe55-91fa-4c2d-8de4-971a93b9f90d)

Found errors when traslating PLL library:
read_lib avsdpll.lib 
write_lib -output avsdpll.db avsdpll

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/6df12722-2ea1-43bd-bbc3-e4e54b65b38f)

Fixing issues:

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/0c7edbef-ea8e-4bf0-a83a-2e1b78e8f8b1)

Compiling with Synopsys DC Compiler
```
 set target_library /home/jose/DC_WORKSHOP/lib/sky130_fd_sc_hd__tt_025C_1v80.db
 set link_library {* /home/jose/DC_WORKSHOP/lib/sky130_fd_sc_hd__tt_025C_1v80.db /home/jose/VSDBabySoC/src/lib/avsdpll.db /home/jose/VSDBabySoC/src/lib/avsddac.db}
 ```
```
 set search_path {/home/jose/VSDBabySoC/src/include /home/jose/VSDBabySoC/src/module} # Include all paths where tool will search for design modules/files.
 read_file {sandpiper_gen.vh  sandpiper.vh  sp_default.vh  sp_verilog.vh clk_gate.v rvmyth.v rvmyth_gen.v vsdbabysoc.v} -autoread -top vsdbabysoc # read 
 and indicated files and set top to `vsdbabysoc`
 link #link design with library and resolve all references
 compile_ultra #Problem found only compile seems to work (fixed)
 write_file -format verilog -hierarchy -output /home/jose/VSDBabySoC/output/vsdbabysoc_net.v # write out netlist file in verilog format at specified output location
```
 when using compile_ultra an issue is found -> power optimiztion kicks in and a insufficient physical memory error happens

 ![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/8c14518b-32ac-4539-b211-3a8ea178bbfc)

 Using compile alone it seems to work

 ![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/1a84fe08-cf03-4d68-84f3-9e348336b91d)

 Compiling netlist with iverilog for post-synthesis simulation:
```
 iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 -o ./output/post_synth_sim.out -I src/include -I src/module -I src/gls_model ./output/vsdbabysoc_net.v  ./src/module/testbench.v
 cd output
 ./post_synth_sim.out
 gtkwave post_synth_sim.vcd
```
 Showing both simulations pre-synthesis and post-synthesis, they look similar (second snapshot is a zoom version)

 ![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/2c100e71-fc13-47be-9b06-3ebb2efefe15)

 ![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/0190abb7-f828-49e7-a97d-24a3e161e11d)

### After resetting computer from Prof. Kunal compile_ultra seems to be working fine. Trying again with new netlist and compile_ultra

 ![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/dde24b79-5a82-47f2-a934-2ddd7c34a56c)

```
 iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 -o ./output/post_synth_sim.out -I src/include -I src/module -I src/gls_model ./output/vsdbabysoc_net.v  ./src/module/testbench.v
 cd output
 ./post_synth_sim.out
 gtkwave post_synth_sim.vcd
```
Simulations for post-synthesis seem similar to the ones obtained in pre-synthesis

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/42ac83ce-120f-4ee3-aef9-a72cbe4651c5)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/e269dd30-8b00-4aaa-9273-313e9ccee008)

# Day 13 - Synposys DC And timing Analysis

### TCL scripts were created to facilitate the repetitive work:

TCL script to run on lc_shell to convert all libraries sky130*.lib copied to BabySoc/src/lib

```
set libfiles [glob sky*.lib]
foreach f $libfiles {
    read_lib $f
    set fblib [file rootname [file tail $f]]
    write_lib $fblib  -format db -output $fblib.db
}

```
The second script runs on dc_shell and genrates the synthesis, apply the constraint and generate the reports:

```
set libfiles [glob /home/jose/VSDBabySoC/src/lib/sky*.db]
foreach f $libfiles {
set fblib [file rootname [file tail $f]]

set target_library $f
set link_library [concat * $target_library \ /home/jose/VSDBabySoC/src/lib/avsdpll.db \  /home/jose/VSDBabySoC/src/lib/avsddac.db]
set search_path {/home/jose/VSDBabySoC/src/include /home/jose/VSDBabySoC/src/module}
read_file {sandpiper_gen.vh  sandpiper.vh  sp_default.vh  sp_verilog.vh clk_gate.v rvmyth.v rvmyth_gen.v vsdbabysoc.v} -autoread -top vsdbabysoc
link
read_sdc /home/jose/VSDBabySoC/src/sdc/vsdbabysoc_synthesis.sdc
compile_ultra
set bnet "/home/jose/VSDBabySoC/output/vsdbabysoc_net_${fblib}.v"
set brep "/home/jose/VSDBabySoC/report/report_qor_${fblib}.txt"
set trep "/home/jose/VSDBabySoC/report/report_timing_${fblib}.txt"

set crep "/home/jose/VSDBabySoC/report/report_clock_${fblib}.txt"

write_file -format verilog -hierarchy -output $bnet
report_qor > $brep
report_timing > $trep

report_clock > $crep

reset_design
remove_design -all
}
```

Constraints that are being considered at this point:
```
set_units -time ns
create_clock [get_pins pll/CLK] -name clk -period 10 -waveform {0 5}
set_load -pin_load 0.5 [get_ports OUT]
set_load -min -pin_load 0.1 [get_ports OUT]
set_clock_latency 2 [get_clocks clk]
set_clock_latency -source 2 [get_clocks clk]
set_clock_uncertainty 0.5  [get_clocks clk]
set_clock_uncertainty -setup 0.5  [get_clocks clk]
set_clock_uncertainty -hold 0.5  [get_clocks clk]
set_max_delay 10 -from [get_pins dac/OUT] -to [get_ports OUT]
set_input_delay -clock clk -max 4 [get_ports VCO_IN]
set_input_delay -clock clk -min 1 [get_ports VCO_IN]
set_input_delay -clock clk -max 4 [get_ports ENb_CP]
set_input_delay -clock clk -min 1 [get_ports ENb_CP]
set_input_transition -max 0.4 [get_ports VCO_IN]
set_input_transition -min 0.1 [get_ports VCO_IN]
set_input_transition -max 0.4 [get_ports ENb_CP]
set_input_transition -min 0.1 [get_ports ENb_CP]
```

Data obtained after running the scripts:			

![image](https://github.com/user-attachments/assets/ade1e072-182b-4c4b-ad56-65d13183a73b)

			
![image](https://github.com/user-attachments/assets/29ec6d5a-1058-4223-a369-3e610713afd9)


#### POWER REPORT (POST SYNTHESIS)
```
dc_shell> report_power -v
Information: Updating design information... (UID-85)
 
****************************************
Report : power
        -analysis_effort low
        -verbose
Design : vsdbabysoc
Version: T-2022.03-SP5-6
Date   : Tue Jun 25 09:56:56 2024
****************************************


Library(s) Used:

    sky130_fd_sc_hd__ff_n40C_1v56 (File: /home/jose/VSDBabySoC/src/lib/sky130_fd_sc_hd__ff_n40C_1v56.db)
    avsddac (File: /home/jose/VSDBabySoC/src/lib/avsddac.db)
    avsdpll (File: /home/jose/VSDBabySoC/src/lib/avsdpll.db)


Operating Conditions: ff_n40C_1v56   Library: sky130_fd_sc_hd__ff_n40C_1v56
Wire Load Model Mode: top

Design        Wire Load Model            Library
------------------------------------------------
vsdbabysoc             Small             sky130_fd_sc_hd__ff_n40C_1v56


Global Operating Voltage = 1.56 
Power-specific unit information :
    Voltage Units = 1V
    Capacitance Units = 1.000000pf
    Time Units = 1ns
    Dynamic Power Units = 1mW    (derived from V,C,T units)
    Leakage Power Units = 1nW


Attributes
----------
i - Including register clock pin internal power


  Cell Internal Power  =   2.1146 mW   (83%)
  Net Switching Power  = 437.6778 uW   (17%)
                         ---------
Total Dynamic Power    =   2.5523 mW  (100%)

Cell Leakage Power     =   1.3800 nW

                 Internal         Switching           Leakage            Total                         Cell
Power Group      Power            Power               Power              Power   (   %    )  Attrs  Count
---------------------------------------------------------------------------------------------------------
io_pad             0.0000            0.0000            0.0000            0.0000  (   0.00%)            0
memory             0.0000            0.0000            0.0000            0.0000  (   0.00%)            0
black_box          0.0000            0.3258            0.0000            0.3258  (  12.77%)            2
clock_network      2.0436            0.0000            0.0000            2.0436  (  80.07%)            0
                                                                                             i
register       3.3141e-02        1.6702e-02            0.6584        4.9845e-02  (   1.95%)            676
sequential         0.0000            0.0000            0.0000            0.0000  (   0.00%)            0
combinational  3.7884e-02        9.5162e-02            0.7216            0.1330  (   5.21%)            2064
---------------------------------------------------------------------------------------------------------
Total              2.1146 mW         0.4377 mW         1.3800 nW         2.5523 mW
1
dc_shell> 
```

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/5e87c62b-227c-4e48-8322-4c579cd4ac9a)

```
****************************************
Report : area
Design : vsdbabysoc
Version: T-2022.03-SP5-6
Date   : Tue Jun 25 10:27:12 2024
****************************************

Library(s) Used:

    sky130_fd_sc_hd__ff_n40C_1v56 (File: /home/jose/VSDBabySoC/src/lib/sky130_fd_sc_hd__ff_n40C_1v56.db)
    avsddac (File: /home/jose/VSDBabySoC/src/lib/avsddac.db)
    avsdpll (File: /home/jose/VSDBabySoC/src/lib/avsdpll.db)

Number of ports:                           19
Number of nets:                          2773
Number of cells:                         2743
Number of combinational cells:           2064
Number of sequential cells:               676
Number of macros/black boxes:               2
Number of buf/inv:                        131
Number of references:                       4

Combinational area:              11345.881325
Buf/Inv area:                      491.721585
Noncombinational area:           13532.978775
Macro/Black Box area:                0.000000
Net Interconnect area:      undefined  (Wire load has zero net area)

Total cell area:                 24878.860100
Total area:                 undefined

```



# Day 14 - Inception of EDA and PDK

Reviewing BabySOC process using opencore tools

### Pre-synthesis:

make pre_synth_sim
gtkwave output/pre_synth_sim/pre_synth_sim.vcd

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/622c3337-72b6-48aa-95e9-00caf0ef8e61)

### Post-synthesis:  Netlist generated

 make synth
 output/synth/vsdbabysoc.synth.v
GLS sim

make post_synth_sim

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/b60b7226-cba6-458f-9ff1-1fff98910467)

Yosys report:

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/6a3a12fa-48bc-4ddc-8c48-5bb1ed8179f2)

### Static timing analysis:

make sta

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/8341f8df-b6fb-49e9-b0c2-333a9069ea02)


# Day 15 - Floor Planning and Power Planning Labs using ICC2 tool

### ASIC Design flow

Starting the cycle with Design specification -> customer input -> functionality wanted

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/8cc821bc-2c4c-4436-8e08-9aaac256c97f)

### Basically two cycles types in this flow are identified:
```
• Front end design -> design spec, rtl descriotion, rtl verification
• Backend design   -> logic design (logic synthesis gate level) , physical design
  (used open source tools in previous course, now using synposys) -> ncluding floorplaning and Place and Route
```

Figure showing areas included in physical design flow:

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/068eee67-be5b-443b-8fea-0be245a4b3e1)

### Design using ICC2 Synopsys too:

Synopsys IC Compiler™ II is the industry leading place and route solution that delivers best-in-class quality-of-results (QoR). Synopsys IC Compiler II includes innovations for flat and hierarchical design planning, early design exploration, congestion aware placement and optimization, clock tree synthesis, advanced node routing convergence, manufacturing compliance, and signoff closure.

### Input/Output files used by the tool to perform Physical Design:

• Inputs:
• Technology file (.tf or .db, mostly describing parasitics resistances, cpacitamces in the components ..etc)
• Physical Libraries (In general Lef of GDS file for all design elements like macro, std Cell, IO pads etc)
• Timing, Logical and Power Libraries
• TDF file (.tdf or .io mostly describing pads pin arragements) 
• Constraints (.sdc : time, area) 

• Physical Design Exchange Format –PDEF (optional)  (describing some placemnnt locations)
• Design Exchange Format –DEF (optional)

• Outputs:
• Standard delay format (.sdf -> timing detais information, reference libraires)
• Parasitic format (.spef, .dspf -> (resitance and cpacitances of cells nets))
• Post routed Netlist (.v -> (connectivity information of all the cells, it can be flatten or unflatten)
• Physical Layout (.gds -> files to foundry)
• Design Excahnge format (.def -> raw placemeent locations)

Libraries uses in Physical Design:
• Technology File Libraries (describes the basic characteristic of cell library pertaining to a particular technology)
• Standard Cell Libraries, I/O Cell Libraries, Special Cell Libraries (collection of pre designed layout of basic logic gates like inverters, buffers, ANDs, ORs, NANDs etc)

### Floorplaong Goal

Plan the sillicon area and create a robust and clear power distribution network to power every component (input to this stage is the syntheisized netlist including macos, libs, etc). To achieve that purpose power routing includes thr creation of Power ring, Stripes, Rails

  In Summary Power Planning involves:
• Calculating number of power pins required
• Number of Rings, Stripes
• Width of Rings and Stripes
• IR Drop

### Objectives\ of Floorplanning: (core area is calculated by the tool)
• Minimize Area
• Reducing the wire length
• Making routing easy
• Minimizing delay
• Less IR Drop
```
The power supply (VDD and VSS) in a chip is uniformly distributed through the metal rails and stripes which is called Power Delivery Network (PDN) or power grid. Each metal layers used in PDN has finite resistivity. When current flow through the power delivery network, a part of the applied voltage will be dropped in PDN as per the Ohm’s law. The amount of voltage drop will be V = I.R, which is called the IR drop. Figure-1 shows the IR drop in the Power net. Any metal net can be assumed as a combination of small R and C. If the resistivity of metal wire is high or the amount of current following through the power net is high, A significant amount of voltage may be dropped in the power delivery network which will cause a lesser amount of voltage available to the standard cells than the actual amount of voltage applied, this phenomenon is call IR Drop.
When the IO's are not switching it is called Static IR Drop and when the IO's are switching at a certain rate is called Dynamoc IR Drop
```
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/98c64f9c-4473-4500-b35e-81f96070ea13)

• Issues with Bad Floor plan: Congestion, IR Drop, Reduced lifespan of IC, Noise, Increased Area, Routing, etc 

Floorplaning main parameters: 
• Aspect ratio   (Horizontal routing resources/vertical routing resources)
• Core utilization (Area of STD cells + macros + PAD's)/Area of the Chip

 Types:
• Abutted
• Non-Abutted
• Mixed

### Some examples with figures found online concerning floorplan types:

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/14470f65-6d7c-4fa7-81ce-c19f9eb17ded)

Steps followed in floorplanning (This is should generic regardless of the tool used)

• Links Netlist with physical library
• Creates initial core
• Creates I/O pin placement and pad rings
• Place macros and standard cells
• Creates placement blockages
• Specifies power nets and ground nets
• Creates power rings and macro rings
• Creates power and ground nets
• Routes power and ground nets
• Checks for violations

### Getting the example repository synopsys_ICC2flow_130nm (synopsys icc2 flow for skywater 130nm PDK)

Steps to setup the environment:

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/96fc81d4-98ab-446d-bc42-5feb6cbce23f)

Files involved in this flow:

• LEF file - The LEF file is the abstract view of cells. It only gives the idea about PR boundary, pin position and metal layer information of a cell.
• Milkyway file/ Technology file.
• Interconnet technology file(.itf) - It defines cross section profile of the process this is an ordered list of conductor and dielectric layer definition statements the layers are defined from topmost dielectric layer to the bottom most dielectric layer excluding substrate.
• Technology file(.tf) - Technology File is the most critical input for physical design tools. It provides technology-specific information like the names and physical and electrical characteristics of each metal/via layers and the routing design rules.
• TLU/TLU+ files - These modles are set of models contains advanced process effects that can be used by parasitic extractor in PnR tools for modelling these are generated from ITF filesTLUPlus is a binary table format that stores the RC coefficients. The TLUPlus models enable accurate RC extraction results by including the effects of width, space, density, and temperature on the resistance coefficients.(.itf is used to generate these files)

### Getting files needed:

grdgenxo -itf2TLUplus -i <.ITF file> -o  <.TLU+ file> (command to get TLU files from ITF)  

LEF/DEF/.db(.lib file) file from Skywater github repo/ few .db files specific to the design

(https://github.com/google/skywater-pdk.git)

(https://github.com/bharath19-gs/synopsys_ICC2flow_130nm)

Gate level netlist - is the RTL synthesized file(post-synthesis RTL file) done with DC compiler

### Running icc2 in linux
```
iccs_shell
after the prompt to launch gui  start_gui
```

To convert libraries itf and generate TLUPlus file we use the  grdgenxo converter

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/ffb053c8-035a-4b7e-bab2-20d5d9572e21)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/32ad5c58-0ba5-4720-b0df-bd2bdd96a85c)

I Was playing before with floorplaning parameters, last one used a rectangular shape ...noticed that different shapes might lead the tool to take more processing time ..

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/cd6d7c92-32b7-401b-9e7b-cad6caadbc0b)

After several changes in the scripts, it looks like script is not brealing and tool is still running for more than one hour ...last snapshot taken

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/5c142b7c-a096-405b-a8f0-1c23e20ce750)

Lots of violations in this long run, still not finished ..Prof. Kunal suggessted lower utilization factor to 0.3. So will modify scripts and run again.

In the next try main script top.tcl seems to finish completely. Continue doing more experiments

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/66760df0-9bb5-4869-9d2b-4e812a97dd0d)

### Still seeing very long cpmpiling time, lowering utilization to 0.03 :
  Doing some preliminary checkings. Logical Hierarchie

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/b18e252a-d73b-4049-891c-3eb1e5bd45d7)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/77e2c8a8-1e1b-4c0c-95bf-6c824ff167fb)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/c19db996-2321-4425-8002-bbc69b81f72f)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/30964381-0a2f-417d-a990-32074747f4c3)

See some unconnected in/out ....need to check

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/cf789762-d438-4caf-a9c3-19d2b00d1d81)

Using default script values. macros seem to be place in an specific place, checking preferred location file:

```
set_macro_constraints -preferred_location {0.004 0.88} [get_cells pll]
set_macro_constraints -preferred_location {0.124 0.941} [get_cells dac]
```
Checking where the Macros and Core are located in layout

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/dfd01173-0dee-477e-8666-78b842d44f78)

Showing we are using the core libraries sky130 :

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/5fcb3247-582d-47e0-984e-bb604325fae1)

Playing with the placing commands including some preferred locations directives:

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/dc433c4e-2b15-487b-a745-a0ae22418f09)

Values seems to be takes as they are transferred into the output/prefered_location file

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/45474011-8199-4f61-a1b8-3ed751a988dd)

Checking some of the reports for this run:

```
[icc2-lic Sat Sep 10 22:40:15 2022] Sending count request for 'ICCompilerII-4' 
[icc2-lic Sat Sep 10 22:40:15 2022] Count request for 'ICCompilerII-4' returned 1 
[icc2-lic Sat Sep 10 22:40:15 2022] Check-out of main set of keys directly with queueing was successful
****************************************
Report : qor
Design : rvmyth
Version: T-2022.03
Date   : Sat Sep 10 22:40:15 2022
****************************************


Scenario           'func1::estimated_corner'
Timing Path Group  '**in2reg_default**'
----------------------------------------
Levels of Logic:                      0
Critical Path Length:              5.00
Critical Path Slack:               4.45
Critical Path Clk Period:         10.00
Total Negative Slack:              0.00
No. of Violating Paths:               0
----------------------------------------

Scenario           'func1::estimated_corner'
Timing Path Group  'MYCLK'
----------------------------------------
Levels of Logic:                     41
Critical Path Length:              3.01
Critical Path Slack:               6.44
Critical Path Clk Period:         10.00
Total Negative Slack:              0.00
No. of Violating Paths:               0
----------------------------------------


Cell Count
----------------------------------------
Hierarchical Cell Count:              0
Hierarchical Port Count:              0
Leaf Cell Count:                   2330
Buf/Inv Cell Count:                 130
Buf Cell Count:                      41
Inv Cell Count:                      89
CT Buf/Inv Cell Count:                0
Combinational Cell Count:          1631
   Single-bit Isolation Cell Count:                        0
   Multi-bit Isolation Cell Count:                         0
   Isolation Cell Banking Ratio:                           0.00%
   Single-bit Level Shifter Cell Count:                    0
   Multi-bit Level Shifter Cell Count:                     0
   Level Shifter Cell Banking Ratio:                       0.00%
   Single-bit ELS Cell Count:                              0
   Multi-bit ELS Cell Count:                               0
   ELS Cell Banking Ratio:                                 0.00%
Sequential Cell Count:              699
   Integrated Clock-Gating Cell Count:                     0
   Sequential Macro Cell Count:                            0
   Single-bit Sequential Cell Count:                       699
   Multi-bit Sequential Cell Count:                        0
   Sequential Cell Banking Ratio:                          0.00%
   BitsPerflop:                                            1.00
Macro Count:                          0
----------------------------------------


Area
----------------------------------------
Combinational Area:             1998.99
Noncombinational Area:          3160.88
Buf/Inv Area:                     83.79
Total Buffer Area:                32.98
Total Inverter Area:              50.81
Macro/Black Box Area:              0.00
Net Area:                             0
Net XLength:                    3819.98
Net YLength:                    1895.89
----------------------------------------
Cell Area (netlist):                           5159.87
Cell Area (netlist and physical only):         5159.87
Net Length:                     5715.86


Design Rules
----------------------------------------
Total Number of Nets:              3170
Nets with Violations:                 6
Max Trans Violations:                 2
Max Cap Violations:                   5
----------------------------------------

```
```
[icc2-lic Wed Jun 26 01:16:47 2024] Check-out of alternate set of keys directly with queueing was successful
****************************************
Report : timing
        -path_type full
        -delay_type max
        -max_paths 1
        -report_by design
Design : vsdbabysoc
Version: T-2022.03-SP5
Date   : Wed Jun 26 01:16:47 2024
****************************************

  Startpoint: core/CPU_is_addi_a3_reg (rising edge-triggered flip-flop clocked by clk)
  Endpoint: core/CPU_Xreg_value_a4_reg[19][31] (rising edge-triggered flip-flop clocked by clk)
  Mode: func1
  Corner: estimated_corner
  Scenario: func1::estimated_corner
  Path Group: clk
  Path Type: max

  Point                                            Incr      Path       Delta Incr     Analysis
  ----------------------------------------------------------------------------------------------------
  clock clk (rise edge)                            0.00      0.00
  clock network delay (ideal)                      3.00      3.00

  core/CPU_is_addi_a3_reg/CLK (sky130_fd_sc_hd__dfxtp_1)
                                                   0.00      3.00 r      0.00
  core/CPU_is_addi_a3_reg/Q (sky130_fd_sc_hd__dfxtp_1)
                                                   0.29      3.29 r ~    0.00        Size: None
  core/U560/Y (sky130_fd_sc_hd__clkinv_1)          0.27      3.56 f ~    0.18        Size: None
  core/U563/Y (sky130_fd_sc_hd__nand2_1)           0.12 e    3.67 r ~   -0.01        Size: sky130_fd_sc_hd__nand2_8
  core/U33/Y (sky130_fd_sc_hd__inv_2)              0.07 e    3.75 f ~   -0.11        Size: sky130_fd_sc_hd__inv_12
  core/U570/Y (sky130_fd_sc_hd__nand2_1)           0.09 e    3.84 r ~   -0.07        Size: sky130_fd_sc_hd__nand2_4
  core/U572/Y (sky130_fd_sc_hd__nand2_1)           0.05 e    3.89 f ~   -0.03        Size: sky130_fd_sc_hd__nand2_4
  core/U573/X (sky130_fd_sc_hd__xor2_1)            0.18      4.07 f ~    0.11        Size: None
  core/U52/X (sky130_fd_sc_hd__or2_1)              0.25      4.33 f ~   -0.02        Size: None
  core/U21/Y (sky130_fd_sc_hd__a21oi_1)            0.23 e    4.56 r ~   -0.06        Size: sky130_fd_sc_hd__a21oi_4
  core/U20/Y (sky130_fd_sc_hd__o21ai_0)            0.08 e    4.63 f ~   -0.17        Size: sky130_fd_sc_hd__o21ai_4
  core/U19/Y (sky130_fd_sc_hd__a21oi_1)            0.25 e    4.88 r ~   -0.09        Size: sky130_fd_sc_hd__a21oi_4
  core/U18/Y (sky130_fd_sc_hd__o21ai_0)            0.08 e    4.96 f ~   -0.13        Size: sky130_fd_sc_hd__o21ai_4
  core/U17/Y (sky130_fd_sc_hd__a21oi_1)            0.22 e    5.19 r ~   -0.10        Size: sky130_fd_sc_hd__a21oi_4
  core/U48/Y (sky130_fd_sc_hd__o21ai_0)            0.05 e    5.24 f ~   -0.22        Size: sky130_fd_sc_hd__o21ai_4
  core/U16/Y (sky130_fd_sc_hd__a21oi_1)            0.28 e    5.53 r ~   -0.25        Size: sky130_fd_sc_hd__a21oi_4
  core/U46/Y (sky130_fd_sc_hd__o21ai_0)            0.07 e    5.59 f ~   -0.18        Size: sky130_fd_sc_hd__o21ai_4
  core/U15/Y (sky130_fd_sc_hd__a21oi_1)            0.21 e    5.80 r ~   -0.08        Size: sky130_fd_sc_hd__a21oi_4
  core/U44/Y (sky130_fd_sc_hd__o21ai_0)            0.06 e    5.87 f ~   -0.11        Size: sky130_fd_sc_hd__o21ai_4
  core/U14/Y (sky130_fd_sc_hd__a21oi_1)            0.21 e    6.08 r ~   -0.07        Size: sky130_fd_sc_hd__a21oi_4
  core/U42/Y (sky130_fd_sc_hd__o21ai_0)            0.07 e    6.15 f ~   -0.11        Size: sky130_fd_sc_hd__o21ai_4
  core/U10/Y (sky130_fd_sc_hd__a21oi_1)            0.20 e    6.36 r ~   -0.05        Size: sky130_fd_sc_hd__a21oi_4
  core/U40/Y (sky130_fd_sc_hd__o21ai_0)            0.07 e    6.42 f ~   -0.11        Size: sky130_fd_sc_hd__o21ai_4
  core/U9/Y (sky130_fd_sc_hd__a21oi_1)             0.26 e    6.68 r ~   -0.17        Size: sky130_fd_sc_hd__a21oi_4
  core/U54/Y (sky130_fd_sc_hd__o21ai_0)            0.07 e    6.75 f ~   -0.18        Size: sky130_fd_sc_hd__o21ai_4
  core/U8/Y (sky130_fd_sc_hd__a21oi_1)             0.21 e    6.97 r ~   -0.09        Size: sky130_fd_sc_hd__a21oi_4
  core/U38/Y (sky130_fd_sc_hd__o21ai_0)            0.07 e    7.03 f ~   -0.14        Size: sky130_fd_sc_hd__o21ai_4
  core/U1101/Y (sky130_fd_sc_hd__a21oi_2)          0.15 e    7.18 r ~   -0.03        Size: sky130_fd_sc_hd__a21oi_4
  core/U7/Y (sky130_fd_sc_hd__clkinv_1)            0.04 e    7.22 f ~   -0.05        Size: sky130_fd_sc_hd__inv_2
  core/U467/COUT (sky130_fd_sc_hd__fa_1)           0.39      7.61 f ~    0.00        Size: None
  core/U13/X (sky130_fd_sc_hd__a21o_1)             0.19 e    7.80 f ~   -0.01        Size: None
  core/U466/COUT (sky130_fd_sc_hd__fa_1)           0.35      8.15 f ~    0.00        Size: None
  core/U465/COUT (sky130_fd_sc_hd__fa_1)           0.36      8.51 f ~   -0.00        Size: None
  core/U464/COUT (sky130_fd_sc_hd__fa_1)           0.37      8.89 f ~    0.00        Size: None
  core/U469/COUT (sky130_fd_sc_hd__fa_1)           0.37      9.25 f ~    0.00        Size: None
  core/U463/COUT (sky130_fd_sc_hd__fa_1)           0.38 e    9.63 f ~   -0.05        Size: sky130_fd_sc_hd__fa_2
  core/U12/X (sky130_fd_sc_hd__a21o_1)             0.21 e    9.83 f ~   -0.02        Size: None
  core/U462/COUT (sky130_fd_sc_hd__fa_1)           0.38     10.21 f ~    0.00        Size: None
  core/U56/COUT (sky130_fd_sc_hd__fa_1)            0.36     10.57 f ~   -0.01        Size: None
  core/U11/COUT (sky130_fd_sc_hd__fa_1)            0.40     10.97 f ~   -0.01        Size: None
  core/U468/COUT (sky130_fd_sc_hd__fa_1)           0.31 e   11.28 f ~   -0.07        Size: sky130_fd_sc_hd__fah_1
  core/U1366/X (sky130_fd_sc_hd__xor2_1)           0.37     11.64 r ~    0.00        Size: None
  core/U1367/Y (sky130_fd_sc_hd__nand2_1)          0.12 e   11.76 f ~   -0.26        Size: sky130_fd_sc_hd__nand2_8
  core/U1369/Y (sky130_fd_sc_hd__o21ai_0)          0.17 e   11.93 r ~   -0.25        Size: sky130_fd_sc_hd__o21ai_2
  core/CPU_Xreg_value_a4_reg[19][31]/D (sky130_fd_sc_hd__dfxtp_1)
                                                   0.00 e   11.93 r      0.00        Buff: Short net
  data arrival time                                         11.93       -3.02        Delta arrival

  clock clk (rise edge)                           10.00     10.00
  clock network delay (ideal)                      3.00     13.00
  core/CPU_Xreg_value_a4_reg[19][31]/CLK (sky130_fd_sc_hd__dfxtp_1)
                                                   0.00     13.00 r      0.00
  clock uncertainty                               -0.50     12.50
  library setup time                              -0.07     12.43
  data required time                                        12.43
  ----------------------------------------------------------------------------------------------------
  data required time                                        12.43
  data arrival time                                        -11.93
  ----------------------------------------------------------------------------------------------------
  slack (MET)                                                0.50

```

### Doing more experiments with floorplan command. In theory if directed correctly the tool itslef should be able to provide a much better floorplan, for larger designs we will not be able to manually generate the layout (in this case by specifying better dimension in rect command)

```
initialize_floorplan -control_type core -shape Rect -side_length {1700 900} -core_utilization 0.07  -coincident_boundary false -core_offset {20}
```
### That command seems to produce a better and a smaller floorplan:

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/28e8aacb-a8a1-43e1-a692-074ed48722cf)

## Basic Investigation on floorplanning command:

#### According to user guide:

#### Shapes allowed:
![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/8660516c-efae-4463-a790-b6f77232e94b)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/343349a6-6c68-4e96-9ca3-7304a6c98902)

#### We can specify side_ratio and side_length  -core_offset is the gap between core and die (keep out zone)

```
Results for last experiment made with flooplan command. Two possible choices. side_ratio which would have preserved the dimensions,
and side_length using actual values. Second approach was used, vary the lengths values until do not see any errors or violations.
There could be an iterative procedure to determine the optimal sizes starting from an initial estimate. It is also possible sizes
for core/die are somehow pre-defined and specified at the beginning for customer. The tool seems to place the components/macros
inside the defined floorplan.
```
Last command used in tl script:  
```
initialize_floorplan -control_type core -shape Rect -side_length {1700 900} -core_utilization 0.07  -coincident_boundary false -core_offset {20}
```
#### Checking the report files to see if this command is actually applied:

File: preferred_macro_location.tcl that is generated after running the whole process  (outputs_icc2 folder):

This seems to show coordinates relatives to 1

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/3efb2c12-0d93-44e0-ab9d-71a5fd56eda6)

Checking another report file located in:  /home/jose/VSDBabySoC_ICC2/standaloneFlow/write_data_dir/vsdbabysoc/vsdbabysoc.icc2.floorplan

That file shows more precise locations where the macros and IO's were included after floorplaning command, that file seems to show the tool is using the dimensions indicated in the floorplan command:

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/1fc2e031-2298-4615-a3c9-8aeaf15dce52)

#### After running script, libraries ndm are created in work area:
/home/jose/VSDBabySoC_ICC2/standaloneFlow/work/vsdbabysocSkywater

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/b4f8dea9-136a-453d-8fe7-8c9ebba74402)

## Modifying flow to generate parasitics file (SPEF) on final routed design:
## First approach : Calculating parastics inside icc2 flow (top.tcl script)

-  Added route_opt, write parastiis (in this first try just one corner will be investigated)
```  
route_auto -max_detail_route_iterations 10 
write_parasitics -corner func1 -output vsdbabysoc_parasitics
```
```
icc2_shell> report_extraction_options
Corner: func1

icc2_shell> report_extraction_options -all

Corner: func1
 late_cap_scale = 1
 late_res_scale = 1
 late_ccap_scale = 1
 late_vr_horizontal_cap_scale = 1
 late_vr_vertical_cap_scale = 1
 late_vr_horizontal_res_scale = 1
 late_vr_vertical_res_scale = 1
 late_vr_via_res_scale = 1
 late_rde_cap_scale = 1
 late_rde_res_scale = 1
 early_cap_scale = 1
 early_res_scale = 1
 early_ccap_scale = 1
 early_vr_horizontal_cap_scale = 1
 early_vr_vertical_cap_scale = 1
 early_vr_horizontal_res_scale = 1
 early_vr_vertical_res_scale = 1
 early_vr_via_res_scale = 1
 early_rde_cap_scale = 1
 early_rde_res_scale = 1

Global options:
 late_ccap_threshold = 0.003
 late_ccap_ratio = 0.03
 early_ccap_threshold = 0.003
 early_ccap_ratio = 0.03
 reference_direction = use_from_tluplus
 real_metalfill_extraction = none
 virtual_metalfill_extraction = none
 virtual_metalfill_parameter_file = None
 virtual_shield_extraction = true
 enable_ccap_or_filtering = false
 honor_mask_constraints = false
 dielectricfill_extraction = none
 include_pin_resistance = true
 process_scale = 1.000000
 operating_frequency = 0.000000
1
icc2_shell> 

```
```
When more corners are added the collection will show the new elements:
icc2_shell> get_corners
{func1}
icc2_shell>
```
After running the new modified scripts, the parasitic files (SPEF format) are created:

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/2fa2e1b3-9eb4-43f9-9ff2-e2585ae1f074)


### Using that last case we are still meeting timing: (This is at the placement stage)

```
*[icc2-lic Thu Jun 27 04:28:54 2024] Command 'report_timing' requires licenses
[icc2-lic Thu Jun 27 04:28:54 2024] Attempting to check-out alternate set of keys directly with queueing
[icc2-lic Thu Jun 27 04:28:54 2024] Sending count request for 'ICCompilerII-8' 
[icc2-lic Thu Jun 27 04:28:54 2024] Count request for 'ICCompilerII-8' returned 1 
[icc2-lic Thu Jun 27 04:28:54 2024] Sending check-out request for 'ICCompilerII-8' (1) with wait option
[icc2-lic Thu Jun 27 04:28:54 2024] Check-out request for 'ICCompilerII-8' with wait option succeeded
[icc2-lic Thu Jun 27 04:28:54 2024] Sending checkout check request for 'ICCompilerII-8' 
[icc2-lic Thu Jun 27 04:28:54 2024] Checkout check request for 'ICCompilerII-8' returned 0 
[icc2-lic Thu Jun 27 04:28:54 2024] Sending count request for 'ICCompilerII-8' 
[icc2-lic Thu Jun 27 04:28:54 2024] Count request for 'ICCompilerII-8' returned 1 
[icc2-lic Thu Jun 27 04:28:54 2024] Sending count request for 'ICCompilerII-NX' 
[icc2-lic Thu Jun 27 04:28:54 2024] Count request for 'ICCompilerII-NX' returned 1 
[icc2-lic Thu Jun 27 04:28:54 2024] Sending check-out request for 'ICCompilerII-NX' (1) with wait option
[icc2-lic Thu Jun 27 04:28:54 2024] Check-out request for 'ICCompilerII-NX' with wait option succeeded
[icc2-lic Thu Jun 27 04:28:54 2024] Sending checkout check request for 'ICCompilerII-NX' 
[icc2-lic Thu Jun 27 04:28:54 2024] Checkout check request for 'ICCompilerII-NX' returned 0 
[icc2-lic Thu Jun 27 04:28:54 2024] Sending count request for 'ICCompilerII-NX' 
[icc2-lic Thu Jun 27 04:28:54 2024] Count request for 'ICCompilerII-NX' returned 1 
[icc2-lic Thu Jun 27 04:28:54 2024] Check-out of alternate set of keys directly with queueing was successful
****************************************
Report : timing
        -path_type full
        -delay_type max
        -max_paths 1
        -report_by design
Design : vsdbabysoc
Version: T-2022.03-SP5
Date   : Thu Jun 27 04:28:54 2024
****************************************

  Startpoint: core/CPU_is_addi_a3_reg (rising edge-triggered flip-flop clocked by clk)
  Endpoint: core/CPU_Xreg_value_a4_reg[24][31] (rising edge-triggered flip-flop clocked by clk)
  Mode: func1
  Corner: estimated_corner
  Scenario: func1::estimated_corner
  Path Group: clk
  Path Type: max

  Point                                            Incr      Path       Delta Incr     Analysis
  ----------------------------------------------------------------------------------------------------
  clock clk (rise edge)                            0.00      0.00
  clock network delay (ideal)                      3.00      3.00

  core/CPU_is_addi_a3_reg/CLK (sky130_fd_sc_hd__dfxtp_1)
                                                   0.00      3.00 r      0.00
  core/CPU_is_addi_a3_reg/Q (sky130_fd_sc_hd__dfxtp_1)
                                                   0.28      3.28 r ~    0.00        Size: None
  core/U560/Y (sky130_fd_sc_hd__clkinv_1)          0.27      3.55 f ~    0.18        Size: None
  core/U563/Y (sky130_fd_sc_hd__nand2_1)           0.12 e    3.68 r ~   -0.04        Size: sky130_fd_sc_hd__nand2_8
  core/U33/Y (sky130_fd_sc_hd__inv_2)              0.08 e    3.76 f ~   -0.18        Size: sky130_fd_sc_hd__inv_12
  core/U570/Y (sky130_fd_sc_hd__nand2_1)           0.10 e    3.86 r ~   -0.10        Size: sky130_fd_sc_hd__nand2_4
  core/U572/Y (sky130_fd_sc_hd__nand2_1)           0.05 e    3.90 f ~   -0.03        Size: sky130_fd_sc_hd__nand2_4
  core/U573/X (sky130_fd_sc_hd__xor2_1)            0.18      4.09 f ~    0.11        Size: None
  core/U52/X (sky130_fd_sc_hd__or2_1)              0.27 e    4.36 f ~    0.00        Size: sky130_fd_sc_hd__or2_4
  core/U21/Y (sky130_fd_sc_hd__a21oi_1)            0.22 e    4.58 r ~   -0.04        Size: sky130_fd_sc_hd__a21oi_4
  core/U20/Y (sky130_fd_sc_hd__o21ai_0)            0.07 e    4.65 f ~   -0.13        Size: sky130_fd_sc_hd__o21ai_4
  core/U19/Y (sky130_fd_sc_hd__a21oi_1)            0.24 e    4.89 r ~   -0.06        Size: sky130_fd_sc_hd__a21oi_4
  core/U18/Y (sky130_fd_sc_hd__o21ai_0)            0.08 e    4.97 f ~   -0.09        Size: sky130_fd_sc_hd__o21ai_4
  core/U17/Y (sky130_fd_sc_hd__a21oi_1)            0.27 e    5.23 r ~   -0.16        Size: sky130_fd_sc_hd__a21oi_4
  core/U48/Y (sky130_fd_sc_hd__o21ai_0)            0.09 e    5.32 f ~   -0.25        Size: sky130_fd_sc_hd__o21ai_4
  core/U16/Y (sky130_fd_sc_hd__a21oi_1)            0.21 e    5.53 r ~   -0.12        Size: sky130_fd_sc_hd__a21oi_4
  core/U46/Y (sky130_fd_sc_hd__o21ai_0)            0.06 e    5.59 f ~   -0.10        Size: sky130_fd_sc_hd__o21ai_4
  core/U15/Y (sky130_fd_sc_hd__a21oi_1)            0.20 e    5.80 r ~   -0.04        Size: sky130_fd_sc_hd__a21oi_4
  core/U44/Y (sky130_fd_sc_hd__o21ai_0)            0.08 e    5.87 f ~   -0.16        Size: sky130_fd_sc_hd__o21ai_4
  core/U14/Y (sky130_fd_sc_hd__a21oi_1)            0.20 e    6.08 r ~   -0.10        Size: sky130_fd_sc_hd__a21oi_4
  core/U42/Y (sky130_fd_sc_hd__o21ai_0)            0.08 e    6.16 f ~   -0.16        Size: sky130_fd_sc_hd__o21ai_4
  core/U10/Y (sky130_fd_sc_hd__a21oi_1)            0.22 e    6.38 r ~   -0.13        Size: sky130_fd_sc_hd__a21oi_4
  core/U40/Y (sky130_fd_sc_hd__o21ai_0)            0.07 e    6.44 f ~   -0.12        Size: sky130_fd_sc_hd__o21ai_4
  core/U9/Y (sky130_fd_sc_hd__a21oi_1)             0.26 e    6.70 r ~   -0.16        Size: sky130_fd_sc_hd__a21oi_4
  core/U54/Y (sky130_fd_sc_hd__o21ai_0)            0.06 e    6.77 f ~   -0.14        Size: sky130_fd_sc_hd__o21ai_4
  core/U8/Y (sky130_fd_sc_hd__a21oi_1)             0.22 e    6.99 r ~   -0.09        Size: sky130_fd_sc_hd__a21oi_4
  core/U38/Y (sky130_fd_sc_hd__o21ai_0)            0.07 e    7.05 f ~   -0.14        Size: sky130_fd_sc_hd__o21ai_4
  core/U1101/Y (sky130_fd_sc_hd__a21oi_2)          0.17 e    7.22 r ~   -0.04        Size: sky130_fd_sc_hd__a21oi_4
  core/U7/Y (sky130_fd_sc_hd__clkinv_1)            0.04 e    7.26 f ~   -0.06        Size: sky130_fd_sc_hd__inv_2
  core/U467/COUT (sky130_fd_sc_hd__fa_1)           0.37 e    7.63 f ~   -0.04        Size: sky130_fd_sc_hd__fa_2
  core/U13/X (sky130_fd_sc_hd__a21o_1)             0.19 e    7.82 f ~   -0.02        Size: None
  core/U466/COUT (sky130_fd_sc_hd__fa_1)           0.35      8.18 f ~   -0.01        Size: None
  core/U465/COUT (sky130_fd_sc_hd__fa_1)           0.30 e    8.48 f ~   -0.08        Size: sky130_fd_sc_hd__fah_1
  core/U464/COUT (sky130_fd_sc_hd__fa_1)           0.33 e    8.80 f ~   -0.08        Size: sky130_fd_sc_hd__fah_1
  core/U469/COUT (sky130_fd_sc_hd__fa_1)           0.31 e    9.11 f ~   -0.07        Size: sky130_fd_sc_hd__fah_1
  core/U463/COUT (sky130_fd_sc_hd__fa_1)           0.41      9.52 f ~    0.00        Size: None
  core/U12/X (sky130_fd_sc_hd__a21o_1)             0.19 e    9.71 f ~   -0.02        Size: None
  core/U462/COUT (sky130_fd_sc_hd__fa_1)           0.34     10.05 f ~    0.00        Size: None
  core/U56/COUT (sky130_fd_sc_hd__fa_1)            0.37     10.42 f ~   -0.02        Size: None
  core/U11/COUT (sky130_fd_sc_hd__fa_1)            0.33 e   10.75 f ~   -0.08        Size: sky130_fd_sc_hd__fah_1
  core/U468/COUT (sky130_fd_sc_hd__fa_1)           0.31 e   11.05 f ~   -0.07        Size: sky130_fd_sc_hd__fah_1
  core/U1366/X (sky130_fd_sc_hd__xor2_1)           0.52     11.57 r ~    0.22        Size: None
  core/U1367/Y (sky130_fd_sc_hd__nand2_1)          0.11 e   11.69 f ~   -0.20        Size: sky130_fd_sc_hd__nand2_8
  core/U1392/Y (sky130_fd_sc_hd__o21ai_0)          0.14 e   11.83 r ~   -0.19        Size: sky130_fd_sc_hd__o21ai_2
  core/CPU_Xreg_value_a4_reg[24][31]/D (sky130_fd_sc_hd__dfxtp_1)
                                                   0.00 e   11.83 r      0.00        Buff: Short net
  data arrival time                                         11.83       -2.97        Delta arrival

  clock clk (rise edge)                           10.00     10.00
  clock network delay (ideal)                      3.00     13.00
  core/CPU_Xreg_value_a4_reg[24][31]/CLK (sky130_fd_sc_hd__dfxtp_1)
                                                   0.00     13.00 r      0.00
  clock uncertainty                               -0.50     12.50
  library setup time                              -0.07     12.43
  data required time                                        12.43
  ----------------------------------------------------------------------------------------------------
  data required time                                        12.43
  data arrival time                                        -11.83
  ----------------------------------------------------------------------------------------------------
  slack (MET)                                                0.60

```

### First Try - Timing report obtained using icc2 after the Routing Stage (final filler stage), the parasitics obtained in that stage will be used on the primetime tool  - There is a 3.1ns violation

```
[icc2-lic Sat Jul  6 22:45:57 2024] Command 'report_timing' requires licenses
[icc2-lic Sat Jul  6 22:45:57 2024] Attempting to check-out alternate set of keys directly with queueing
[icc2-lic Sat Jul  6 22:45:57 2024] Sending count request for 'ICCompilerII-8' 
[icc2-lic Sat Jul  6 22:45:57 2024] Count request for 'ICCompilerII-8' returned 1 
[icc2-lic Sat Jul  6 22:45:57 2024] Sending check-out request for 'ICCompilerII-8' (1) with wait option
[icc2-lic Sat Jul  6 22:45:57 2024] Check-out request for 'ICCompilerII-8' with wait option succeeded
[icc2-lic Sat Jul  6 22:45:57 2024] Sending checkout check request for 'ICCompilerII-8' 
[icc2-lic Sat Jul  6 22:45:57 2024] Checkout check request for 'ICCompilerII-8' returned 0 
[icc2-lic Sat Jul  6 22:45:57 2024] Sending count request for 'ICCompilerII-8' 
[icc2-lic Sat Jul  6 22:45:57 2024] Count request for 'ICCompilerII-8' returned 1 
[icc2-lic Sat Jul  6 22:45:57 2024] Sending count request for 'ICCompilerII-NX' 
[icc2-lic Sat Jul  6 22:45:57 2024] Count request for 'ICCompilerII-NX' returned 1 
[icc2-lic Sat Jul  6 22:45:57 2024] Sending check-out request for 'ICCompilerII-NX' (1) with wait option
[icc2-lic Sat Jul  6 22:45:57 2024] Check-out request for 'ICCompilerII-NX' with wait option succeeded
[icc2-lic Sat Jul  6 22:45:57 2024] Sending checkout check request for 'ICCompilerII-NX' 
[icc2-lic Sat Jul  6 22:45:57 2024] Checkout check request for 'ICCompilerII-NX' returned 0 
[icc2-lic Sat Jul  6 22:45:57 2024] Sending count request for 'ICCompilerII-NX' 
[icc2-lic Sat Jul  6 22:45:57 2024] Count request for 'ICCompilerII-NX' returned 1 
[icc2-lic Sat Jul  6 22:45:57 2024] Check-out of alternate set of keys directly with queueing was successful
****************************************
Report : timing
        -path_type full
        -delay_type max
        -max_paths 1
        -report_by design
        -transition_time
        -capacitance
        -physical
        -process
        -voltage
Design : vsdbabysoc
Version: T-2022.03-SP5
Date   : Sat Jul  6 22:45:57 2024
****************************************

  Startpoint: core/CPU_is_addi_a3_reg (rising edge-triggered flip-flop clocked by clk)
  Endpoint: core/CPU_Xreg_value_a4_reg[18][31] (rising edge-triggered flip-flop clocked by clk)
  Mode: func1
  Corner: func1
  Scenario: func1
  Path Group: clk
  Path Type: max

  Point                                            Cap      Trans      Incr      Path          Location        Voltage         Process
  ----------------------------------------------------------------------------------------------------------------------------------------------
  clock clk (rise edge)                                                0.00      0.00
  clock network delay (ideal)                                          3.00      3.00

  core/CPU_is_addi_a3_reg/CLK (sky130_fd_sc_hd__dfxtp_1)     0.00      0.00      3.00 r    (835.12,755.92)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/CPU_is_addi_a3_reg/Q (sky130_fd_sc_hd__dfxtp_1)
                                                   0.00      0.03      0.26      3.26 f ~  (841.94,755.98)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U560/Y (sky130_fd_sc_hd__clkinv_1)          0.01      0.07      0.07      3.33 r ~  (843.39,750.08)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U35/Y (sky130_fd_sc_hd__inv_2)              0.15      0.29      0.22      3.55 f ~  (846.10,749.51)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U34/Y (sky130_fd_sc_hd__nor2_4)             0.17      1.20      1.06      4.61 r ~  (848.56,758.25)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U575/Y (sky130_fd_sc_hd__nor2_1)            0.01      0.21      0.19      4.80 f ~  (834.04,707.71)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U21/Y (sky130_fd_sc_hd__a21oi_1)            0.01      0.23      0.32      5.12 r ~  (829.47,710.08)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U20/Y (sky130_fd_sc_hd__o21ai_0)            0.01      0.12      0.18      5.30 f ~  (832.31,710.70)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U19/Y (sky130_fd_sc_hd__a21oi_1)            0.01      0.37      0.36      5.66 r ~  (833.72,719.68)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U18/Y (sky130_fd_sc_hd__o21ai_0)            0.01      0.12      0.20      5.86 f ~  (823.38,706.56)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U17/Y (sky130_fd_sc_hd__a21oi_1)            0.01      0.31      0.32      6.17 r ~  (826.27,705.54)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U48/Y (sky130_fd_sc_hd__o21ai_0)            0.03      0.30      0.33      6.50 f ~  (847.57,704.99)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U16/Y (sky130_fd_sc_hd__a21oi_1)            0.01      0.24      0.35      6.86 r ~  (993.70,669.27)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U46/Y (sky130_fd_sc_hd__o21ai_0)            0.01      0.10      0.15      7.01 f ~  (999.93,660.87)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U15/Y (sky130_fd_sc_hd__a21oi_1)            0.01      0.26      0.26      7.28 r ~  (999.41,661.03)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U44/Y (sky130_fd_sc_hd__o21ai_0)            0.01      0.16      0.21      7.49 f ~  (992.84,668.71)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U14/Y (sky130_fd_sc_hd__a21oi_1)            0.01      0.29      0.32      7.80 r ~  (908.11,677.25)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U42/Y (sky130_fd_sc_hd__o21ai_0)            0.01      0.12      0.19      7.99 f ~  (896.15,670.94)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U10/Y (sky130_fd_sc_hd__a21oi_1)            0.02      0.43      0.41      8.40 r ~  (893.59,682.82)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U40/Y (sky130_fd_sc_hd__o21ai_0)            0.01      0.16      0.24      8.64 f ~  (894.65,750.42)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U9/Y (sky130_fd_sc_hd__a21oi_1)             0.01      0.32      0.34      8.98 r ~  (908.26,751.18)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U54/Y (sky130_fd_sc_hd__o21ai_0)            0.01      0.11      0.18      9.16 f ~  (863.26,760.88)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U8/Y (sky130_fd_sc_hd__a21oi_1)             0.01      0.27      0.28      9.44 r ~  (861.09,768.26)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U38/Y (sky130_fd_sc_hd__o21ai_0)            0.01      0.17      0.22      9.66 f ~  (864.66,778.82)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U1101/Y (sky130_fd_sc_hd__a21oi_2)          0.01      0.19      0.26      9.92 r ~  (885.62,770.34)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U7/Y (sky130_fd_sc_hd__clkinv_1)            0.01      0.09      0.13     10.06 f ~  (911.34,741.32)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U467/COUT (sky130_fd_sc_hd__fa_1)           0.02      0.15      0.44     10.50 f ~  (914.83,721.75)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U13/X (sky130_fd_sc_hd__a21o_1)             0.01      0.05      0.23     10.73 f ~  (990.96,761.92)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U466/COUT (sky130_fd_sc_hd__fa_1)           0.01      0.08      0.35     11.08 f ~  (990.17,770.07)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U465/COUT (sky130_fd_sc_hd__fa_1)           0.01      0.09      0.37     11.45 f ~  (982.52,774.70)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U464/COUT (sky130_fd_sc_hd__fa_1)           0.01      0.12      0.41     11.86 f ~  (986.25,765.84)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U469/COUT (sky130_fd_sc_hd__fa_1)           0.01      0.09      0.38     12.24 f ~  (999.13,728.24)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U463/COUT (sky130_fd_sc_hd__fa_1)           0.01      0.10      0.38     12.63 f ~  (997.81,739.55)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U12/X (sky130_fd_sc_hd__a21o_1)             0.01      0.04      0.20     12.82 f ~  (998.26,743.77)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U462/COUT (sky130_fd_sc_hd__fa_1)           0.01      0.10      0.37     13.19 f ~  (996.16,735.14)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U56/COUT (sky130_fd_sc_hd__fa_1)            0.01      0.09      0.38     13.58 f ~  (977.12,752.31)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U11/COUT (sky130_fd_sc_hd__fa_1)            0.02      0.13      0.42     14.00 f ~  (984.78,752.93)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U468/COUT (sky130_fd_sc_hd__fa_1)           0.01      0.08      0.38     14.39 f ~  (986.33,684.37)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U1366/X (sky130_fd_sc_hd__xor2_1)           0.02      0.46      0.41     14.79 r ~  (983.98,675.75)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U1367/Y (sky130_fd_sc_hd__nand2_1)          0.04      0.48      0.34     15.13 f ~  (928.70,677.40)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/U1396/Y (sky130_fd_sc_hd__o21ai_0)          0.00      0.30      0.39     15.52 r ~  (926.05,646.56)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  core/CPU_Xreg_value_a4_reg[18][31]/D (sky130_fd_sc_hd__dfxtp_1)
                                                             0.30      0.00     15.53 r    (920.09,642.22)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  data arrival time                                                             15.53

  clock clk (rise edge)                                               10.00     10.00
  clock network delay (ideal)                                          3.00     13.00
  core/CPU_Xreg_value_a4_reg[18][31]/CLK (sky130_fd_sc_hd__dfxtp_1)
                                                             0.00      0.00     13.00 r    (918.85,642.33)     1.56 (rail VPWR)~
                                                                                                                           1.0 (pane 0)
  clock uncertainty                                                   -0.50     12.50
  library setup time                                                  -0.12     12.38
  data required time                                                            12.38
  ----------------------------------------------------------------------------------------------------------------------------------------------
  data required time                                                            12.38
  data arrival time                                                            -15.53
  ----------------------------------------------------------------------------------------------------------------------------------------------
  slack (VIOLATED)                                                              -3.15

```

### Second Try - Trying to improve Setup time

#### Commands that seem to have helped improving timing:

- Adding another stage after placement:

   refine_placement  -effort high -congestion high

- Set the clock to propagated clock (no source latency in our case clock is generated by PLL not external)

set_propagated_clock [all_clocks]

 - Before generating the clock tree (clock opt), apply some routing rules, force using a sink net

set_clock_routing_rules -clocks clk -net_type sink -default_rule
clock_opt

See some spreading of the logic of processor:

![image](https://github.com/user-attachments/assets/2daf18c1-fe4c-490f-8cb3-b76fd6cd8b9e)

### Post Route constraints File - Using library sky130_fd_sc_hd__tt_100C_1v80.db

```
[icc2-lic Sat Jul 20 22:45:03 2024] Command 'report_timing' requires licenses
[icc2-lic Sat Jul 20 22:45:03 2024] Attempting to check-out alternate set of keys directly with queueing
[icc2-lic Sat Jul 20 22:45:03 2024] Sending count request for 'ICCompilerII-8' 
[icc2-lic Sat Jul 20 22:45:03 2024] Count request for 'ICCompilerII-8' returned 1 
[icc2-lic Sat Jul 20 22:45:03 2024] Sending check-out request for 'ICCompilerII-8' (1) with wait option
[icc2-lic Sat Jul 20 22:45:03 2024] Check-out request for 'ICCompilerII-8' with wait option succeeded
[icc2-lic Sat Jul 20 22:45:03 2024] Sending checkout check request for 'ICCompilerII-8' 
[icc2-lic Sat Jul 20 22:45:03 2024] Checkout check request for 'ICCompilerII-8' returned 0 
[icc2-lic Sat Jul 20 22:45:03 2024] Sending count request for 'ICCompilerII-8' 
[icc2-lic Sat Jul 20 22:45:03 2024] Count request for 'ICCompilerII-8' returned 1 
[icc2-lic Sat Jul 20 22:45:03 2024] Sending count request for 'ICCompilerII-NX' 
[icc2-lic Sat Jul 20 22:45:03 2024] Count request for 'ICCompilerII-NX' returned 1 
[icc2-lic Sat Jul 20 22:45:03 2024] Sending check-out request for 'ICCompilerII-NX' (1) with wait option
[icc2-lic Sat Jul 20 22:45:03 2024] Check-out request for 'ICCompilerII-NX' with wait option succeeded
[icc2-lic Sat Jul 20 22:45:03 2024] Sending checkout check request for 'ICCompilerII-NX' 
[icc2-lic Sat Jul 20 22:45:03 2024] Checkout check request for 'ICCompilerII-NX' returned 0 
[icc2-lic Sat Jul 20 22:45:03 2024] Sending count request for 'ICCompilerII-NX' 
[icc2-lic Sat Jul 20 22:45:03 2024] Count request for 'ICCompilerII-NX' returned 1 
[icc2-lic Sat Jul 20 22:45:03 2024] Check-out of alternate set of keys directly with queueing was successful
****************************************
Report : timing
        -path_type full
        -delay_type max
        -max_paths 1
        -report_by design
Design : vsdbabysoc
Version: T-2022.03-SP5
Date   : Sat Jul 20 22:45:03 2024
****************************************

  Startpoint: core/CPU_is_add_a3_reg (rising edge-triggered flip-flop clocked by clk)
  Endpoint: core/CPU_Xreg_value_a4_reg[24][31] (rising edge-triggered flip-flop clocked by clk)
  Mode: func1
  Corner: func1
  Scenario: func1
  Path Group: clk
  Path Type: max

  Point                                            Incr      Path  
  ------------------------------------------------------------------------
  clock clk (rise edge)                            0.00      0.00
  clock network delay (propagated)                 1.21      1.21

  core/CPU_is_add_a3_reg/CLK (sky130_fd_sc_hd__dfxtp_1)
                                                   0.00      1.21 r
  core/CPU_is_add_a3_reg/Q (sky130_fd_sc_hd__dfxtp_1)
                                                   0.35      1.56 f
  core/U475/Y (sky130_fd_sc_hd__nor2_1)            0.14      1.70 r
  core/U477/X (sky130_fd_sc_hd__and2_0)            0.21      1.91 r
  core/HFSBUF_622_506/X (sky130_fd_sc_hd__clkbuf_1)
                                                   0.28      2.19 r
  core/gre_mt_inst_4564/X (sky130_fd_sc_hd__clkbuf_4)
                                                   0.26      2.46 r
  core/ctmTdsLR_2_580/Y (sky130_fd_sc_hd__xnor2_1)
                                                   0.10      2.56 f
  core/U39/X (sky130_fd_sc_hd__or2_0)              0.25      2.80 f
  core/ctmTdsLR_1_629/Y (sky130_fd_sc_hd__a21boi_1)
                                                   0.23      3.03 r
  core/U577/Y (sky130_fd_sc_hd__o21ai_1)           0.14      3.17 f
  core/ctmTdsLR_1_652/Y (sky130_fd_sc_hd__a21boi_2)
                                                   0.20      3.37 r
  core/U584/Y (sky130_fd_sc_hd__o21ai_1)           0.13      3.49 f
  core/ctmTdsLR_1_658/Y (sky130_fd_sc_hd__a21boi_2)
                                                   0.20      3.70 r
  core/U590/Y (sky130_fd_sc_hd__o21ai_1)           0.13      3.83 f
  core/ctmTdsLR_1_659/Y (sky130_fd_sc_hd__a21boi_2)
                                                   0.19      4.02 r
  core/U207/Y (sky130_fd_sc_hd__o21ai_1)           0.13      4.15 f
  core/ctmTdsLR_1_660/Y (sky130_fd_sc_hd__a21boi_2)
                                                   0.19      4.34 r
  core/U205/Y (sky130_fd_sc_hd__o21ai_1)           0.13      4.46 f
  core/ctmTdsLR_1_661/Y (sky130_fd_sc_hd__a21boi_2)
                                                   0.21      4.67 r
  core/U206/Y (sky130_fd_sc_hd__o21ai_1)           0.12      4.79 f
  core/ctmTdsLR_1_662/Y (sky130_fd_sc_hd__a21boi_1)
                                                   0.24      5.04 r
  core/U215/Y (sky130_fd_sc_hd__o21ai_2)           0.12      5.16 f
  core/gre_mt_inst_4568/X (sky130_fd_sc_hd__buf_4)
                                                   0.18      5.33 f
  core/ctmTdsLR_1_663/Y (sky130_fd_sc_hd__nand2_1)
                                                   0.06      5.40 r
  core/ctmTdsLR_2_664/Y (sky130_fd_sc_hd__nand2_1)
                                                   0.06      5.46 f
  core/U946/COUT (sky130_fd_sc_hd__fa_1)           0.40      5.86 f
  core/ctmTdsLR_1_665/Y (sky130_fd_sc_hd__nand2_1)
                                                   0.08      5.93 r
  core/ctmTdsLR_2_666/Y (sky130_fd_sc_hd__nand2_1)
                                                   0.06      5.99 f
  core/U909/COUT (sky130_fd_sc_hd__fa_1)           0.38      6.37 f
  core/U891/COUT (sky130_fd_sc_hd__fa_1)           0.39      6.76 f
  core/U1371/COUT (sky130_fd_sc_hd__fa_1)          0.40      7.16 f
  core/U87/COUT (sky130_fd_sc_hd__fa_2)            0.37      7.53 f
  core/U85/Y (sky130_fd_sc_hd__clkinv_1)           0.05      7.58 r
  core/U616/Y (sky130_fd_sc_hd__o21ai_0)           0.08      7.67 f
  core/U360/COUT (sky130_fd_sc_hd__fa_1)           0.39      8.06 f
  core/U358/COUT (sky130_fd_sc_hd__fa_1)           0.41      8.47 f
  core/U35/COUT (sky130_fd_sc_hd__fa_1)            0.41      8.87 f
  core/U34/COUT (sky130_fd_sc_hd__fa_2)            0.37      9.24 f
  core/ctmTdsLR_1_667/Y (sky130_fd_sc_hd__nand2_1)
                                                   0.07      9.31 r
  core/ctmTdsLR_2_668/Y (sky130_fd_sc_hd__nand2_1)
                                                   0.06      9.37 f
  core/U357/COUT (sky130_fd_sc_hd__fa_1)           0.38      9.75 f
  core/U359/COUT (sky130_fd_sc_hd__fa_1)           0.38     10.14 f
  core/U622/X (sky130_fd_sc_hd__xor2_1)            0.20     10.33 r
  core/U31/Y (sky130_fd_sc_hd__nand2_1)            0.23     10.56 f
  core/HFSBUF_147_75/X (sky130_fd_sc_hd__buf_2)    0.24     10.80 f
  core/U654/Y (sky130_fd_sc_hd__o22ai_1)           0.11     10.91 r
  core/CPU_Xreg_value_a4_reg[24][31]/D (sky130_fd_sc_hd__dfxtp_4)
                                                   0.00     10.91 r
  data arrival time                                         10.91

  clock clk (rise edge)                           10.00     10.00
  clock network delay (propagated)                 1.09     11.09
  core/CPU_Xreg_value_a4_reg[24][31]/CLK (sky130_fd_sc_hd__dfxtp_4)
                                                   0.00     11.09 r
  clock uncertainty                               -0.10     10.99
  library setup time                              -0.06     10.93
  data required time                                        10.93
  ------------------------------------------------------------------------
  data required time                                        10.93
  data arrival time                                        -10.91
  ------------------------------------------------------------------------
  slack (MET)                                                0.01


1

```
Setup and for hold seem to be met. Trans also met, cap has some small violations (will check later)


![image](https://github.com/user-attachments/assets/aa5cd4f0-d836-4958-87fd-0ea413cf0343)

```
[icc2-lic Sat Jul 20 22:41:21 2024] Command 'report_qor' requires licenses
[icc2-lic Sat Jul 20 22:41:21 2024] Attempting to check-out alternate set of keys directly with queueing
[icc2-lic Sat Jul 20 22:41:21 2024] Sending count request for 'ICCompilerII-8' 
[icc2-lic Sat Jul 20 22:41:21 2024] Count request for 'ICCompilerII-8' returned 1 
[icc2-lic Sat Jul 20 22:41:21 2024] Sending check-out request for 'ICCompilerII-8' (1) with wait option
[icc2-lic Sat Jul 20 22:41:21 2024] Check-out request for 'ICCompilerII-8' with wait option succeeded
[icc2-lic Sat Jul 20 22:41:21 2024] Sending checkout check request for 'ICCompilerII-8' 
[icc2-lic Sat Jul 20 22:41:21 2024] Checkout check request for 'ICCompilerII-8' returned 0 
[icc2-lic Sat Jul 20 22:41:21 2024] Sending count request for 'ICCompilerII-8' 
[icc2-lic Sat Jul 20 22:41:21 2024] Count request for 'ICCompilerII-8' returned 1 
[icc2-lic Sat Jul 20 22:41:21 2024] Sending count request for 'ICCompilerII-NX' 
[icc2-lic Sat Jul 20 22:41:21 2024] Count request for 'ICCompilerII-NX' returned 1 
[icc2-lic Sat Jul 20 22:41:21 2024] Sending check-out request for 'ICCompilerII-NX' (1) with wait option
[icc2-lic Sat Jul 20 22:41:21 2024] Check-out request for 'ICCompilerII-NX' with wait option succeeded
[icc2-lic Sat Jul 20 22:41:21 2024] Sending checkout check request for 'ICCompilerII-NX' 
[icc2-lic Sat Jul 20 22:41:21 2024] Checkout check request for 'ICCompilerII-NX' returned 0 
[icc2-lic Sat Jul 20 22:41:21 2024] Sending count request for 'ICCompilerII-NX' 
[icc2-lic Sat Jul 20 22:41:21 2024] Count request for 'ICCompilerII-NX' returned 1 
[icc2-lic Sat Jul 20 22:41:21 2024] Check-out of alternate set of keys directly with queueing was successful
****************************************
Report : qor
Design : vsdbabysoc
Version: T-2022.03-SP5
Date   : Sat Jul 20 22:41:21 2024
****************************************


Scenario           'func1'
Timing Path Group  'clk'
----------------------------------------
Levels of Logic:                     44
Critical Path Length:              9.70
Critical Path Slack:               0.01
Critical Path Clk Period:         10.00
Total Negative Slack:              0.00
No. of Violating Paths:               0
Worst Hold Violation:             -0.00
Total Hold Violation:             -0.00
No. of Hold Violations:               1
----------------------------------------


Cell Count
----------------------------------------
Hierarchical Cell Count:              1
Hierarchical Port Count:             14
Leaf Cell Count:                   3503
Buf/Inv Cell Count:                1325
Buf Cell Count:                     777
Inv Cell Count:                     548
CT Buf/Inv Cell Count:                0
Combinational Cell Count:          2827
   Single-bit Isolation Cell Count:                        0
   Multi-bit Isolation Cell Count:                         0
   Isolation Cell Banking Ratio:                           0.00%
   Single-bit Level Shifter Cell Count:                    0
   Multi-bit Level Shifter Cell Count:                     0
   Level Shifter Cell Banking Ratio:                       0.00%
   Single-bit ELS Cell Count:                              0
   Multi-bit ELS Cell Count:                               0
   ELS Cell Banking Ratio:                                 0.00%
Sequential Cell Count:              676
   Integrated Clock-Gating Cell Count:                     0
   Sequential Macro Cell Count:                            0
   Single-bit Sequential Cell Count:                       676
   Multi-bit Sequential Cell Count:                        0
   Sequential Cell Banking Ratio:                          0.00%
   BitsPerflop:                                            1.00
Macro Count:                          2
----------------------------------------


Area
----------------------------------------
Combinational Area:            14665.32
Noncombinational Area:         15957.80
Buf/Inv Area:                   5387.67
Total Buffer Area:              2996.62
Total Inverter Area:            2391.04
Macro/Black Box Area:         671652.37
Net Area:                             0
Net XLength:                   50726.29
Net YLength:                   51476.64
----------------------------------------
Cell Area (netlist):                         702275.49
Cell Area (netlist and physical only):      1608826.20
Net Length:                   102202.93


Design Rules
----------------------------------------
Total Number of Nets:              3525
Nets with Violations:               147
Max Trans Violations:                 0
Max Cap Violations:                 147
----------------------------------------

1
```

### Some Caps violations so far even thouhg in most cases the violation is close to 0

```
[icc2-lic Sat Jul 20 22:50:06 2024] Command 'report_constraints' requires licenses
[icc2-lic Sat Jul 20 22:50:06 2024] Attempting to check-out alternate set of keys directly with queueing
[icc2-lic Sat Jul 20 22:50:06 2024] Sending count request for 'ICCompilerII-8' 
[icc2-lic Sat Jul 20 22:50:06 2024] Count request for 'ICCompilerII-8' returned 1 
[icc2-lic Sat Jul 20 22:50:06 2024] Sending check-out request for 'ICCompilerII-8' (1) with wait option
[icc2-lic Sat Jul 20 22:50:06 2024] Check-out request for 'ICCompilerII-8' with wait option succeeded
[icc2-lic Sat Jul 20 22:50:06 2024] Sending checkout check request for 'ICCompilerII-8' 
[icc2-lic Sat Jul 20 22:50:06 2024] Checkout check request for 'ICCompilerII-8' returned 0 
[icc2-lic Sat Jul 20 22:50:06 2024] Sending count request for 'ICCompilerII-8' 
[icc2-lic Sat Jul 20 22:50:06 2024] Count request for 'ICCompilerII-8' returned 1 
[icc2-lic Sat Jul 20 22:50:06 2024] Sending count request for 'ICCompilerII-NX' 
[icc2-lic Sat Jul 20 22:50:06 2024] Count request for 'ICCompilerII-NX' returned 1 
[icc2-lic Sat Jul 20 22:50:06 2024] Sending check-out request for 'ICCompilerII-NX' (1) with wait option
[icc2-lic Sat Jul 20 22:50:06 2024] Check-out request for 'ICCompilerII-NX' with wait option succeeded
[icc2-lic Sat Jul 20 22:50:06 2024] Sending checkout check request for 'ICCompilerII-NX' 
[icc2-lic Sat Jul 20 22:50:06 2024] Checkout check request for 'ICCompilerII-NX' returned 0 
[icc2-lic Sat Jul 20 22:50:06 2024] Sending count request for 'ICCompilerII-NX' 
[icc2-lic Sat Jul 20 22:50:06 2024] Count request for 'ICCompilerII-NX' returned 1 
[icc2-lic Sat Jul 20 22:50:06 2024] Check-out of alternate set of keys directly with queueing was successful
[icc2-lic Sat Jul 20 22:50:06 2024] Attempting to check-out alternate set of keys directly with queueing
[icc2-lic Sat Jul 20 22:50:06 2024] Sending count request for 'ICCompilerII-8' 
[icc2-lic Sat Jul 20 22:50:06 2024] Count request for 'ICCompilerII-8' returned 1 
[icc2-lic Sat Jul 20 22:50:06 2024] Sending check-out request for 'ICCompilerII-8' (1) with wait option
[icc2-lic Sat Jul 20 22:50:06 2024] Check-out request for 'ICCompilerII-8' with wait option succeeded
[icc2-lic Sat Jul 20 22:50:06 2024] Sending checkout check request for 'ICCompilerII-8' 
[icc2-lic Sat Jul 20 22:50:06 2024] Checkout check request for 'ICCompilerII-8' returned 0 
[icc2-lic Sat Jul 20 22:50:06 2024] Sending count request for 'ICCompilerII-8' 
[icc2-lic Sat Jul 20 22:50:06 2024] Count request for 'ICCompilerII-8' returned 1 
[icc2-lic Sat Jul 20 22:50:06 2024] Sending count request for 'ICCompilerII-NX' 
[icc2-lic Sat Jul 20 22:50:06 2024] Count request for 'ICCompilerII-NX' returned 1 
[icc2-lic Sat Jul 20 22:50:06 2024] Sending check-out request for 'ICCompilerII-NX' (1) with wait option
[icc2-lic Sat Jul 20 22:50:06 2024] Check-out request for 'ICCompilerII-NX' with wait option succeeded
[icc2-lic Sat Jul 20 22:50:06 2024] Sending checkout check request for 'ICCompilerII-NX' 
[icc2-lic Sat Jul 20 22:50:06 2024] Checkout check request for 'ICCompilerII-NX' returned 0 
[icc2-lic Sat Jul 20 22:50:06 2024] Sending count request for 'ICCompilerII-NX' 
[icc2-lic Sat Jul 20 22:50:06 2024] Count request for 'ICCompilerII-NX' returned 1 
[icc2-lic Sat Jul 20 22:50:06 2024] Check-out of alternate set of keys directly with queueing was successful
****************************************
Report : constraint
        -all_violators
Design : vsdbabysoc
Version: T-2022.03-SP5
Date   : Sat Jul 20 22:50:06 2024
****************************************

   late_timing
   -----------

Endpoint                         Path Delay     Path Required       CRP    Slack Group    Scenario
----------------------------------------------------------------------------------------------------------
No paths.

   early_timing
   -----------

Endpoint                         Path Delay     Path Required       CRP    Slack Group    Scenario
----------------------------------------------------------------------------------------------------------
No paths

   Mode: func1 Corner: func1
   Scenario: func1
  ---------------------------------------------------------------------------
   Number of max_transition violation(s): 0

   Mode: func1 Corner: func1
   Scenario: func1
   max_capacitance                                                             
                             Required        Actual                            
   Net                      Capacitance    Capacitance       Slack  Violation  
  ---------------------------------------------------------------------------
   OUT                          0.03           1.00          -0.97  (VIOLATED) 
     PIN : gre_mt_inst_4698/X
                                0.03           1.00          -0.97  (VIOLATED) 

   gre_net_270                  0.03           0.12          -0.09  (VIOLATED) 
     PIN : gre_mt_inst_4647/X
                                0.03           0.12          -0.09  (VIOLATED) 

   gre_net_267                  0.03           0.11          -0.08  (VIOLATED) 
     PIN : gre_mt_inst_4644/X
                                0.03           0.11          -0.08  (VIOLATED) 

   gre_net_265                  0.03           0.11          -0.08  (VIOLATED) 
     PIN : gre_mt_inst_4642/X
                                0.03           0.11          -0.08  (VIOLATED) 

   gre_a_BUF_141_f_0            0.03           0.08          -0.05  (VIOLATED) 
     PIN : gre_a_BUF_141_f_inst_4894/X
                                0.03           0.08          -0.05  (VIOLATED) 

   gre_a_BUF_59_f_0             0.03           0.04          -0.01  (VIOLATED) 
     PIN : gre_a_BUF_59_f_inst_4892/X
                                0.03           0.04          -0.01  (VIOLATED) 

   core/gre_net_336             0.03           0.04          -0.01  (VIOLATED) 
     PIN : core/gre_mt_inst_4938/X
                                0.03           0.04          -0.01  (VIOLATED) 

   core/gre_net_222             0.03           0.04          -0.01  (VIOLATED) 
     PIN : core/gre_mt_inst_4599/X
                                0.03           0.04          -0.01  (VIOLATED) 

   core/gre_net_325             0.03           0.04          -0.01  (VIOLATED) 
     PIN : core/gre_mt_inst_4927/X
                                0.03           0.04          -0.01  (VIOLATED) 

   core/gre_net_199             0.03           0.04          -0.01  (VIOLATED) 
     PIN : core/gre_mt_inst_4576/X
                                0.03           0.04          -0.01  (VIOLATED) 

   core/gre_net_196             0.03           0.04          -0.01  (VIOLATED) 
     PIN : core/gre_mt_inst_4573/X
                                0.03           0.04          -0.01  (VIOLATED) 

   core/gre_net_324             0.03           0.04          -0.01  (VIOLATED) 
     PIN : core/gre_mt_inst_4926/X
                                0.03           0.04          -0.01  (VIOLATED) 

   core/gre_net_333             0.03           0.04          -0.01  (VIOLATED) 
     PIN : core/gre_mt_inst_4935/X
                                0.03           0.04          -0.01  (VIOLATED) 

   core/gre_net_326             0.03           0.04          -0.01  (VIOLATED) 
     PIN : core/gre_mt_inst_4928/X
                                0.03           0.04          -0.01  (VIOLATED) 

   core/gre_net_329             0.03           0.04          -0.01  (VIOLATED) 
     PIN : core/gre_mt_inst_4931/X
                                0.03           0.04          -0.01  (VIOLATED) 

   core/gre_net_327             0.03           0.04          -0.01  (VIOLATED) 
     PIN : core/gre_mt_inst_4929/X
                                0.03           0.04          -0.01  (VIOLATED) 

   core/gre_net_221             0.03           0.04          -0.01  (VIOLATED) 
     PIN : core/gre_mt_inst_4598/X
                                0.03           0.04          -0.01  (VIOLATED) 

   core/gre_net_311             0.03           0.04          -0.01  (VIOLATED) 
     PIN : core/gre_mt_inst_4688/X
                                0.03           0.04          -0.01  (VIOLATED) 

   core/gre_net_313             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4690/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_284             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4661/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_194             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4571/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_309             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4686/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_305             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4682/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_286             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4663/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_307              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_377_328/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_a_BUF_3398_0        0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_a_BUF_3398_inst_4916/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_216             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4593/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_303             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4680/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_354             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4956/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_348              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSINV_1491_371/Y
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_315             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4692/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_353             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4955/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_293             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4670/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_202             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4579/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_298             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4675/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_348             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4950/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_256             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4633/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_273             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4650/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_214             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4591/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_231             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4608/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_283             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4660/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_274             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4651/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_349             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4951/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_208             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4585/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/ctosc_drc_8             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/ctosc_drc_inst_1490/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_304             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4681/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_287             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4664/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_72               0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_595_92/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_334             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4936/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/n412                    0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/U211/Y          0.03           0.03          -0.00  (VIOLATED) 

   core/ZBUF_161_1              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/ZBUF_161_inst_4350/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_357             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4959/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_260             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4637/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_197             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4574/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/n1512                   0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/U649/Y          0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_294             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4671/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_332             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4934/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_299             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4676/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_331             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4933/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_288             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4665/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_262             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4639/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_302              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_299_323/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_203             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4580/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/n1333                   0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/U1004/Y         0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_279             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4656/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_338             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4940/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/CPU_imem_rd_addr_a1[0]
                                0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/CPU_imem_rd_addr_a1_reg[0]/Q
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_337             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4939/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/n1285                   0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/U1133/Y         0.03           0.03          -0.00  (VIOLATED) 

   core/ZBUF_357_15             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/ZBUF_357_inst_873/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_128              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_228_149/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_228             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4605/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_306             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4683/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_268              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_440_289/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_219             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4596/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_198             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4575/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_243             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4620/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_195             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4572/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_206             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4583/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/ctosc_drc_23            0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/ctosc_drc_inst_1505/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_339             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4941/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_292             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4669/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_a_BUF_2272_0        0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_a_BUF_2272_inst_4913/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_212             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4589/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/n1218                   0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/U231/X          0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_240             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4617/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_358             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4960/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_402              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_141_428/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_237             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4614/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_230             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4607/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/n1488                   0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/U635/Y          0.03           0.03          -0.00  (VIOLATED) 

   core/n1381                   0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/U892/Y          0.03           0.03          -0.00  (VIOLATED) 

   core/n1413                   0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/U840/Y          0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_519              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_1671_546/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_302             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4679/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_46               0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_447_66/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_191              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_472_212/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_301             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4678/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_229             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4606/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_296             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4673/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_263             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4640/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_318             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4695/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/n1184                   0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/U1292/Y         0.03           0.03          -0.00  (VIOLATED) 

   core/n1228                   0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/U1288/Y         0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_347             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4949/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_298              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_967_319/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/ZCTSNET_546             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/ZCTSBUF_17055_1016/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/CPU_reset_a3            0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/CPU_reset_a3_reg/Q
                                0.03           0.03          -0.00  (VIOLATED) 

   core/n1558                   0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/U1950/Y         0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_422              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_1349_448/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_211             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4588/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_328             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4930/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_333              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_707_355/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_245             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4622/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/n1555                   0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/U514/Y          0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_225             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4602/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_330             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4932/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_434              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_358_460/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_276             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4653/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/ctosc_drc_5             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/ctosc_drc_inst_1487/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/n1507                   0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/U671/Y          0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_356             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4958/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_247              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_221_268/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_18               0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_379_38/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/ccd_drc_3               0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/ccd_drc_inst_4890/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_350             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4952/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_236             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4613/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_264             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4641/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/ZCTSNET_636             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/ZCTSBUF_10325_1106/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/n817                    0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/U495/Y          0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_99               0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_193_119/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/ZCTSNET_544             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/ZCTSBUF_18451_1014/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_209             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4586/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_204             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4581/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/ZBUF_87_2               0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/ZBUF_87_inst_1741/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_130              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_612_151/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_254             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4631/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_503              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_1444_530/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_352             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4954/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/n1532                   0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/U661/Y          0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_491              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_800_518/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/ZBUF_45_0               0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/ZBUF_45_inst_728/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_a_BUF_1509_0        0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_a_BUF_1509_inst_4919/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_218             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4595/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/HFSNET_223              0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/HFSBUF_1183_244/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/gre_net_189             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/gre_mt_inst_4566/X
                                0.03           0.03          -0.00  (VIOLATED) 

   core/ZCTSNET_561             0.03           0.03          -0.00  (VIOLATED) 
     PIN : core/ZCTSBUF_21065_1031/X
                                0.03           0.03          -0.00  (VIOLATED) 

  ---------------------------------------------------------------------------
   Number of max_capacitance violation(s): 147



   Total number of violation(s): 147
1

```


#### Exploring some of the icc2 capabilities to show clocks and internal cells

![image](https://github.com/user-attachments/assets/94b1980f-666a-4fa5-ae53-b9d689ee89ad)

![image](https://github.com/user-attachments/assets/73f12ba0-4612-4836-b44a-f156b5b27f61)

![image](https://github.com/user-attachments/assets/c6448d2b-0bd9-4ee7-bd3d-1c2dc7a416b6)

![image](https://github.com/user-attachments/assets/4f3e7270-5cc8-436a-acec-c8e2224f1cd0)

![image](https://github.com/user-attachments/assets/0ca1c590-6134-4c2e-a028-f282d1db3b30)

![image](https://github.com/user-attachments/assets/76833870-79fa-4c21-aab9-c72dc44a8331)


# UPDATING PRIMETIME WITH THE NEW TIMING IMPROVEMENTS - INVESTIGATION ON PRIMETIME TOOL

Prime time is one of the most accurate timing tools available in the industry to analyze static timing and in case of timing violations, it provides hints and also allows designers to test them using the tool and later create eco's to modify the design netlist so timing can be met.

Reading design files and parasitics using primetime tool:
```
set target_library  /home/jose/synopsys_ICC2flow_130nm/synopsys_skywater_flow_nominal/collateral/sky130_fd_sc_hd__tt_025C_1v80.db
set link_library [concat * $target_library \ /home/jose/VSDBabySoC/src/lib/avsdpll.db \  /home/jose/VSDBabySoC/src/lib/avsddac.db]
read_verilog  vsdbabysoc_route.v 
link_design vsdbabysoc
read_parasitics vsdbabysoc_parasitics.temp1_25.spef
read_sdc /home/jose/synopsys_ICC2flow_130nm/synopsys_skywater_flow_nominal/collateral/vsdbabysoc_PR.sdc
extract_model -output vsdbabysoc_model_extracted
report_analysis_coverage
report_constraint
report_timing
save_session

```
### Parasitics  extraction
![image](https://github.com/user-attachments/assets/5f0daa4e-d7e4-433f-bf80-c9b1f1f6ccfd)

### Some primetime gui snapshots 

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/a82bfa5f-da79-4ff9-922b-e5c9eef8d88b)

![image](https://github.com/joses-bot/sfal-vsd/assets/83429049/0e94731d-c481-43b0-b4ba-4868450ce06e)

Showing some paths in clock Tree

![image](https://github.com/user-attachments/assets/28e7276f-1da4-4cb1-8b39-88b3e9380e92)

Looks like after optimization buffers were added to some nets from core to dac

![image](https://github.com/user-attachments/assets/8af12a31-ae9a-44ef-8ec9-af6d2823c90c)


![image](https://github.com/user-attachments/assets/f5f0469a-107e-453e-ae19-cab5071f9146)

Schematics view

![image](https://github.com/user-attachments/assets/f11762c6-9458-46c8-9e75-58d6f5c1e7a7)

![image](https://github.com/user-attachments/assets/e643dede-a3f3-4303-94a8-a0530adeaa49)

### Only some small caps err remaining 

![image](https://github.com/user-attachments/assets/79b46c5e-435e-4d2b-a1bf-1d1238ee9708)

### Checking some of the primetime reports : (timing report, coverage) 

```
pt_shell> report_timing
****************************************
Report : timing
	-path_type full
	-delay_type max
	-max_paths 1
	-sort_by slack
Design : vsdbabysoc
Version: T-2022.03-SP5-4
Date   : Sun Jul 21 03:38:21 2024
****************************************


  Startpoint: core/CPU_is_add_a3_reg
               (rising edge-triggered flip-flop clocked by clk)
  Endpoint: core/CPU_Xreg_value_a4_reg[24][31]
               (rising edge-triggered flip-flop clocked by clk)
  Last common pin: pll/CLK
  Path Group: clk
  Path Type: max

  Point                                                   Incr       Path
  ------------------------------------------------------------------------------
  clock clk (rise edge)                                   0.00       0.00
  clock network delay (propagated)                        1.21       1.21
  core/CPU_is_add_a3_reg/CLK (sky130_fd_sc_hd__dfxtp_1)
                                                          0.00       1.21 r
  core/CPU_is_add_a3_reg/Q (sky130_fd_sc_hd__dfxtp_1)     0.35 &     1.57 f
  core/U475/Y (sky130_fd_sc_hd__nor2_1)                   0.14 &     1.71 r
  core/U477/X (sky130_fd_sc_hd__and2_0)                   0.21 &     1.92 r
  core/HFSBUF_622_506/X (sky130_fd_sc_hd__clkbuf_1)       0.28 &     2.20 r
  core/gre_mt_inst_4564/X (sky130_fd_sc_hd__clkbuf_4)     0.26 &     2.46 r
  core/ctmTdsLR_2_580/Y (sky130_fd_sc_hd__xnor2_1)        0.10 &     2.56 f
  core/U39/X (sky130_fd_sc_hd__or2_0)                     0.25 &     2.81 f
  core/ctmTdsLR_1_629/Y (sky130_fd_sc_hd__a21boi_1)       0.23 &     3.04 r
  core/U577/Y (sky130_fd_sc_hd__o21ai_1)                  0.14 &     3.18 f
  core/ctmTdsLR_1_652/Y (sky130_fd_sc_hd__a21boi_2)       0.20 &     3.38 r
  core/U584/Y (sky130_fd_sc_hd__o21ai_1)                  0.13 &     3.50 f
  core/ctmTdsLR_1_658/Y (sky130_fd_sc_hd__a21boi_2)       0.20 &     3.70 r
  core/U590/Y (sky130_fd_sc_hd__o21ai_1)                  0.13 &     3.84 f
  core/ctmTdsLR_1_659/Y (sky130_fd_sc_hd__a21boi_2)       0.19 &     4.02 r
  core/U207/Y (sky130_fd_sc_hd__o21ai_1)                  0.13 &     4.16 f
  core/ctmTdsLR_1_660/Y (sky130_fd_sc_hd__a21boi_2)       0.19 &     4.34 r
  core/U205/Y (sky130_fd_sc_hd__o21ai_1)                  0.13 &     4.47 f
  core/ctmTdsLR_1_661/Y (sky130_fd_sc_hd__a21boi_2)       0.21 &     4.68 r
  core/U206/Y (sky130_fd_sc_hd__o21ai_1)                  0.12 &     4.80 f
  core/ctmTdsLR_1_662/Y (sky130_fd_sc_hd__a21boi_1)       0.24 &     5.04 r
  core/U215/Y (sky130_fd_sc_hd__o21ai_2)                  0.12 &     5.17 f
  core/gre_mt_inst_4568/X (sky130_fd_sc_hd__buf_4)        0.18 &     5.34 f
  core/ctmTdsLR_1_663/Y (sky130_fd_sc_hd__nand2_1)        0.06 &     5.41 r
  core/ctmTdsLR_2_664/Y (sky130_fd_sc_hd__nand2_1)        0.06 &     5.47 f
  core/U946/COUT (sky130_fd_sc_hd__fa_1)                  0.40 &     5.87 f
  core/ctmTdsLR_1_665/Y (sky130_fd_sc_hd__nand2_1)        0.08 &     5.94 r
  core/ctmTdsLR_2_666/Y (sky130_fd_sc_hd__nand2_1)        0.06 &     6.00 f
  core/U909/COUT (sky130_fd_sc_hd__fa_1)                  0.38 &     6.38 f
  core/U891/COUT (sky130_fd_sc_hd__fa_1)                  0.39 &     6.77 f
  core/U1371/COUT (sky130_fd_sc_hd__fa_1)                 0.40 &     7.17 f
  core/U87/COUT (sky130_fd_sc_hd__fa_2)                   0.37 &     7.53 f
  core/U85/Y (sky130_fd_sc_hd__clkinv_1)                  0.06 &     7.59 r
  core/U616/Y (sky130_fd_sc_hd__o21ai_0)                  0.08 &     7.67 f
  core/U360/COUT (sky130_fd_sc_hd__fa_1)                  0.39 &     8.06 f
  core/U358/COUT (sky130_fd_sc_hd__fa_1)                  0.41 &     8.47 f
  core/U35/COUT (sky130_fd_sc_hd__fa_1)                   0.41 &     8.88 f
  core/U34/COUT (sky130_fd_sc_hd__fa_2)                   0.37 &     9.24 f
  core/ctmTdsLR_1_667/Y (sky130_fd_sc_hd__nand2_1)        0.07 &     9.31 r
  core/ctmTdsLR_2_668/Y (sky130_fd_sc_hd__nand2_1)        0.06 &     9.37 f
  core/U357/COUT (sky130_fd_sc_hd__fa_1)                  0.38 &     9.75 f
  core/U359/COUT (sky130_fd_sc_hd__fa_1)                  0.38 &    10.14 f
  core/U622/X (sky130_fd_sc_hd__xor2_1)                   0.20 &    10.33 r
  core/U31/Y (sky130_fd_sc_hd__nand2_1)                   0.23 &    10.56 f
  core/HFSBUF_147_75/X (sky130_fd_sc_hd__buf_2)           0.24 &    10.80 f
  core/U654/Y (sky130_fd_sc_hd__o22ai_1)                  0.11 &    10.91 r
  core/CPU_Xreg_value_a4_reg[24][31]/D (sky130_fd_sc_hd__dfxtp_4)
                                                          0.00 &    10.91 r
  data arrival time                                                 10.91

  clock clk (rise edge)                                  10.00      10.00
  clock network delay (propagated)                        1.09      11.09
  clock reconvergence pessimism                           0.00      11.09
  clock uncertainty                                      -0.10      10.99
  core/CPU_Xreg_value_a4_reg[24][31]/CLK (sky130_fd_sc_hd__dfxtp_4)
                                                                    10.99 r
  library setup time                                     -0.06      10.93
  data required time                                                10.93
  ------------------------------------------------------------------------------
  data required time                                                10.93
  data arrival time                                                -10.91
  ------------------------------------------------------------------------------
  slack (MET)                                                        0.02


1
pt_shell> 


pt_shell> report_global_timing
****************************************
Report : global_timing
	-format { narrow }
Design : vsdbabysoc
Version: T-2022.03-SP5-4
Date   : Sat Jul 20 23:15:05 2024
****************************************

No setup violations found.

No hold violations found.
1


pt_shell> report_analysis_coverage 
****************************************
Report : analysis_coverage
Design : vsdbabysoc
Version: T-2022.03-SP5-4
Date   : Sun Jul 21 03:40:25 2024
****************************************

Type of Check         Total              Met         Violated         Untested
--------------------------------------------------------------------------------
setup                   676       675 (100%)         0 (  0%)         1 (  0%)
hold                    676       674 (100%)         0 (  0%)         1 (  0%)
min_pulse_width        1352      1352 (100%)         0 (  0%)         0 (  0%)
--------------------------------------------------------------------------------
All Checks             2704      2701 (100%)         1 (  0%)         2 (  0%)

1


pt_shell> report_constraint
****************************************
Report : constraint
Design : vsdbabysoc
Version: T-2022.03-SP5-4
Date   : Sun Jul 21 00:46:53 2024
****************************************

                                                   Weighted
    Group (max_delay/setup)      Cost     Weight     Cost
    -----------------------------------------------------
    clk                          0.00      1.00      0.00
    -----------------------------------------------------
    max_delay/setup                                  0.00

                                                   Weighted
    Group (min_delay/hold)       Cost     Weight     Cost
    -----------------------------------------------------
    clk                          0.00      1.00      0.00
    -----------------------------------------------------
    min_delay/hold                                   0.00

    Constraint                                       Cost
    -----------------------------------------------------
    max_delay/setup                                  0.00  (MET)
    min_delay/hold                                   0.00  (MET)
    sequential_clock_pulse_width                     0.00  (MET)
    max_capacitance                                  1.56  (VIOLATED)
    max_transition                                   0.00  (MET)

1
pt_shell> 
```

### Using PrimeTime for corner analysys using sky130 library

Dominant corner: tt_025C (will be used to calculate the netlist - final route verilog file)

We will generate the timing report using PrimeTime for all sky130 libraries:

Showing for example spurious ports e.g in pll instantiation: VDD#2, VDD#3, GND#2 that need to be fixed to import the verilog file into primetime

![image](https://github.com/user-attachments/assets/539d5ac3-a65f-4ece-956e-8372904f875e)

In this exercise we will not compile individually using icc2 each library ( which would imply, changes in tcl script, fix ports in netlist, etc). We will use the dominant corner to calculate the netlist and the run the script we were using for Primetime to calculage set up/hold time slacks
n
### PVT Corner Table obtained with PrimeTime
   
![image](https://github.com/user-attachments/assets/b362d987-a17f-4eaa-8ee4-264455d3a081)

![image](https://github.com/user-attachments/assets/d82db804-ef9b-49da-ae47-011ef1054c65)


The main differences between post-route STA  and initial STA done after synthesis with DC are the following:

	Wires - DC uses ideal wires whereas after routing we have the real wires on the netlist
	Clock - Ideal clock vs Propagated clock, calculated after clock tree is instantiated in the design
 	Tools - DC (Synthesis tool, preliminary STA) , icc2 (P & R tool) uses PrimeTime as STA engine


### ICC2 Experimet

Using the values obtained from previous corner table,  compiling directly with icc2 for the values where the timing failures were bigger. 
In this case, running icc2 compiler directly using the correct libraries other than ff_25 (only for n40 1v76 the timing errors are very small), then exporting the environment to Primetime to calculate setup/hold time:

	set wns [get_attribute [get_timing_paths -delay_type max -max_paths 1] slack]
 	set whs [get_attribute [get_timing_paths -delay_type min -max_paths 1] slack]
			
			
![image](https://github.com/user-attachments/assets/342fda1b-4387-44af-a9ed-22de0b169c15)

Not really a corner analysis but it might show the effect of compiling with icc2 using scripts and the timing we could get using the libraries

For parasitics in all cases we are reading a nominal tluplus file (that depends mostly on the process):  skywater130.nominal.tluplus 
				
![image](https://github.com/user-attachments/assets/45f0c4fe-c05a-4d74-9741-704774da86b5)


### ECO (Engineering change order)

In the ECO cycle, various analysis are performed one by one for every check which we need to close but not closed till PnR stage. There are specialized signoff tools that help us to analyze the issue and also suggest the changes we need to do in order to close the issue. The suggested change is captured in an eco file. 

 What conditions cause an Engineering Change Order: ECO are needed when the process steps are needed to be executed in an incremental manner. This may be due to-
    Some functionality enhancement of the existing device. This functionality enhancement change may be too small to undergo all the process steps again
    There may be some design bug that needs to be fixed and was caught very late in the design cycle. It is very costly to re-run all the process cycle 
    steps for each bug in terms of time and cost. Hence, these changes need to be taken incrementally.

Once we generate the ECO file for the fixes, we implement that on the PnR database on which we have performed the analysis (icc2 in our case). After the implementation of ECO file, we save the updated database which we carry forward for the next ECO generation and implementation. We repeat this ECO cycle for every open issue and close one by one all issues. There are chances that we might need multiple ECO cycle to close a single issue. 

Types of ECO's

    All layers ECO: In this, the design change is implemented using all layers.
    Metal-only ECO: to reduce costs, sometimes, it may not be practical to use all the layers (base + metal) to do the ECO.

Steps to follow in an ECO: 

Specification of Changes,  Netlist Comparison. Placement and Routing Updates, Forma; Verification

	The RTL with ECO implemented is synthesized and compared with the golden netlist.
	The delta is implemented into the golden netlist. The modified netlist is then again compared with the
 	synthesized netlist to ensure the logic has been implemented correctly.
	The logic is the placed incrementally until the last modifications are done.

 

    





















































































 


 

 































  










    
  


  
- 
  






















  




  













   






































































































































































 






    

    
    
    


























 




























































   













































