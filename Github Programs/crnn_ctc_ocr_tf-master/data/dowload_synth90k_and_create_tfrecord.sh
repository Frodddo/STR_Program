#!/bin/sh

COUNT=50000

# download synth90k
wget -c http://www.robots.ox.ac.uk/~vgg/data/text/mjsynth.tar.gz
tar -xzvf mjsynth.tar.gz

# create synth90k image_list.txt
# xxx/xxx/1234_AbCd_8888.jpg
find ./mnt/ | xargs ls -d | grep jpg > image_list_all.txt

# use some of data to train and eval
cat image_list_all.txt | head -n ${COUNT} > image_list.txt

# create tfrecord
python3 create_synth90k_tfrecord.py --image_dir '' --anno_file ./image_list.txt --char_map_json_file ../char_map/char_map.json



