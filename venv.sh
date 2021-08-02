#!/bin/sh

# python3 -m venv venv
# venv/bin/pip3 install tensorflow$1==1.5.0
# venv/bin/pip3 install cython
# venv/bin/pip3 install git+https://github.com/andersjo/dependency_decoding



conda create -n py36 python=3.6
conda activate py36

pip install tensorflow==1.5.0
conda install -c anaconda cython 
pip install git+https://github.com/andersjo/dependency_decoding

# Download Russian data:
cd ud-2.2-conll18
mkdir ru_syntagrus
curl https://raw.githubusercontent.com/UniversalDependencies/UD_Russian-SynTagRus/master/ru_syntagrus-ud-train.conllu -O
curl https://raw.githubusercontent.com/UniversalDependencies/UD_Russian-SynTagRus/master/ru_syntagrus-ud-dev.conllu -O
curl https://raw.githubusercontent.com/UniversalDependencies/UD_Russian-SynTagRus/master/ru_syntagrus-ud-test.conllu -O


# import tensorflow.compat.v1 as tf 

# tf.enable_eager_execution(tf.ConfigProto(log_device_placement=True)) 

# print(tf.add([1.0, 2.0], [3.0, 4.0]))  


# Or just:
# sess = tf.Session(config=tf.ConfigProto(log_device_placement=True))
# Then just check with: watch -n 2 nvidia-smi