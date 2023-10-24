BASE_DIR=$(pwd)
VG_DIR=datasets/vg
mkdir -p $VG_DIR

wget https://cs.stanford.edu/people/rak248/VG_100K_2/images.zip -O $VG_DIR/images.zip
wget https://cs.stanford.edu/people/rak248/VG_100K_2/images2.zip -O $VG_DIR/images2.zip

unzip $VG_DIR/images.zip -d $VG_DIR/images
unzip $VG_DIR/images2.zip -d $VG_DIR/images

cd $BASE_DIR && mkdir pretrained && cd pretrained && wget https://ommer-lab.com/files/latent-diffusion/vq-f8.zip
unzip vq-f8.zip && rm vq-f8.zip && cd ..