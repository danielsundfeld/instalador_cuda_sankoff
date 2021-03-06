sudo apt-get update -y ; 
sudo apt-get upgrade -y ; 
sudo apt-get install python3-pip -y ; 
sudo apt-get install dos2unix -y ; 
sudo apt-get install -y pkg-config ; 
sudo apt-get install -y imagemagick-6.q16 ; 
mkdir ferramenta_final ; 
cd ferramenta_final ; 
git clone -b upload_otimizado https://github.com/cacotsuki/servidor_apresentacao.git ; 
git clone https://www.github.com/danielsundfeld/cuda_sankoff ; 
cd cuda_sankoff ; 
wget https://www.tbi.univie.ac.at/RNA/download/sourcecode/2_3_x/ViennaRNA-2.3.3.tar.gz ; 
tar xf ViennaRNA-2.3.3.tar.gz ; 
cd ViennaRNA-2.3.3 ; 
autoreconf ; 
./configure && make ; 
cd .. ;
make ; 
if [ ! -e ./bin/cuda_sankoff ]; then
    ln -s sankoff ./bin/cuda_sankoff
fi
cd .. ; 
sudo ./home/ubuntu/ferramenta_final/servidor_apresentacao/ferramenta/move_file/move_arquivos.sh ; 
cd servidor_apresentacao/ferramenta ; 
pip3 install virtualenv==20.0.23 ; 
virtualenv venv ; 
source venv/bin/activate ; 
pip3 install -r requirements.txt ; 
cd move_file ; 
sudo ./move_arquivos.sh ; 
cd .. ;
cd policy_img ; 
sudo ./altera_policy.sh ;
cd .. ; 
cd ferramenta ; 
python3 manage.py runserver 0.0.0.0:8000 ;
