#!/bin/sh

# variant="$1"; shift
# echo $variant
# agrs=""
args="--predict --predict_input=ud-2.2-conll18/ru_syntagrus/ru_syntagrus-ud-test.conllu --predict_output=output.txt --checkpoint=logs/ud_parser.py-2021-07-27_113644-b=ru_syntagrus,bs=32,b2=0.99,cd=0,c=,cd=256,d=0.5,e=None,e=40:1e-3,20:1e-4,ls=0.03,lac=0,p=1,pdd=128,pl=1,rc=LSTM,rcd=512,rl=2,rlp=1,rlt=1,tl=1,t=UPOS,XPOS,FEATS,LEMMAS,t=8,wd=512,wd=0.2/checkpoint-inference-best-91560.data-00000-of-00001"
# while true; do
#   case "$1" in
#     -*) args="$args $1"; shift 1; continue;;
#   esac
#   break
# done

for code in "$@"; do
  d=ud-2.2-conll18/$code
  # qsub -q gpu*@dll* -cwd -b y -l gpu=1,gpu_cc_min3.5=1 -j y withcuda 
  python ud_parser.py $d/$code $args
done
