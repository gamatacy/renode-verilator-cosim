# Manual

## Update submodules and download Syntacore Risc-V Toolkit
```
git submodule update --init --recursive
gdown 1dww_ZMX68nTf5UmlDzDN3fJy4yLr2i4u sw/sc-dt
```
## Build test
```
cd sw && make TARGET=<test_name>
```
## Build Verilator and run CoSim
```
make run_robot
```
