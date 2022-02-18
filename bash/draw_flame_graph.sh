#!/bin/bash

if [ -d FlameGraph-master ]; then
  echo "FlameGraph-master directory already exists"
else
  wget https://github.com/brendangregg/FlameGraph/archive/refs/heads/master.zip
  mv master.zip FlameGraph-master.zip
  unzip FlameGraph-master.zip
fi

# 1. Capture stacks
# generate perf.data(stack samples in binary format)
# -a means all-cpus, we can choose sample scope by
#   -p for process
#   -t for thread
#   -e for the specific events(cycles by default)
# --call-graph dwarf is important when -fomit-frame-pointer is set while compiling, ref: https://blog.csdn.net/pwl999/article/details/107569603
perf record -a --call-graph dwarf -F 997 sleep 10
PERF_DATA_FILESIZE=$(stat -c %s perf.data)
if (( PERF_DATA_FILESIZE > 1024*1024*1024 )); then
    while true; do
        read -p "the file size of perf.data is larger than 1G, it will take too long to decode, do you want to Y: continue or N: resample a smaller one? " user_input
        case $user_input in
            [Yy]* ) break;;
            [Nn]* ) exit;;
            * ) echo "Please answer Y or N";;
        esac
    done
fi
# decode perf.data into human-readable stack samples
perf script > perf.stack

# 2. Fold stacks, one-line per stack
FlameGraph-master/stackcollapse-perf.pl perf.stack > perf.folded_stack

# 3. Draw flame graph
FlameGraph-master/flamegraph.pl perf.folded_stack > perf.flame_graph.svg
