# CMIP6_downlaod

```
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

cd # go to project space
rm -rf EM_EARTH
git clone https://github.com/ShervanGharari/EM_EARTH.git
cd EM_EARTH/code
jupyter nbconvert download_EM_EARTH.ipynb --to python
python download_EM_EARTH.py
```
