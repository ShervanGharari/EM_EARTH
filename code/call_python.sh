#
cd
module reset
module purge
deactivate

module load python/3.8.10

rm -rf ~/EM-EARTH-env
virtualenv ~/EM-EARTH-env
source ~/EM-EARTH-env/bin/activate
pip install --no-index --upgrade pip
pip install --no-index jupyter

cd # go to home
rm -rf CMIP6_downlaod
git clone https://github.com/ShervanGharari/CMIP6_downlaod.git
cd CMIP6_downlaod/code
jupyter nbconvert download_EM_EARTH.ipynb --to python
python download_EM_EARTH.py
