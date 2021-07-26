#!/bin/sh

# variant="$1"; shift
# echo $variant
args=""
while true; do
  case "$1" in
    -*) args="$args $1"; shift 1; continue;;
  esac
  break
done
# echo $args
for code in "$@"; do
  # echo $code
  d=ud-2.2-conll18/$code
  # qsub -q gpu*@dll* -cwd -b y -l gpu=1,gpu_cc_min3.5=1 -j y withcuda 
  python ud_parser.py $d/$code $args
done
