# Wireless Sensor Networks Project
Our goal is to make a simulation of a tracking network that uses sensors and a wireless backhaul. We want to experiment with providing additional sensors and keeping track of something called 'Quality of Tracking' to indicate when to use which sensor.

# Setting up the environment
To run OmNet++ and Castalia, this code was run using WSL on Windows running an Ubuntu flavor (22)

## Update repos
* apt-add-repository universe
* apt update

## install the dependencies – OmNet++ and Castalia 
* apt install software-properties-common
* apt install wget build-essential gcc g++ bison flex perl python-is-python3 python3 libqt5opengl5-dev tcl-dev tk-dev libxml2-dev zlib1g-dev default-jre doxygen graphviz libwebkitgtk-6.0-4 libgtk2.0-0 python2
* apt install openmpi-bin libopenmpi-dev

## Clone project
* git clone --recurse-submodules <url>

## Switch to OmNet++
* cd omnetpp

### If you choose to use OpenSceneGraph (only available on ubuntu 20)
* apt install libopenscenegraph-dev libgeos-dev
* sed -i 's/^#OSGEARTH_LIBS=/OSGEARTH_LIBS=" -losgEarth -losgEarthUtil -lgeos_c "/' configure.user.dist

### If you don't care (if you're using ubuntu 22, and not 20 like recommended)
* sed -i 's/^WITH_OSG=yes/WITH_OSG=no/' configure.user.dist
* sed -i 's/^WITH_OSGEARTH=yes/WITH_OSGEARTH=no/' configure.user.dist

## Compile
* source setenv
* ./configure
* make -j

### Optional! Add to your bash / zsh profile
* [ -f "<git root dir>/omnetpp/setenv" ] && source "<git root dir>/omnetpp/setenv
Or just manually source when you want to get the environment going

# Go back to Root Dir & Clone Castalia
* cd ..
* git submodule update

## Build Castalia
* cd Castalia
* ./makemake
* make -j

## You're Done!
omnetpp to run the ide, you can check out the aloha sample in the omnetpp directory. You could even run one of the Castalia examples in the command line and generate data!
