# EM_EARTH

## download EM_EARTH

## Create the virtual ENV

```
cd
module reset
module purge
deactivate

module load StdEnv/2020 gcc/9.3.0 openmpi/4.0.3
module load gdal/3.5.1 libspatialindex/1.8.5
module load python/3.8.10 scipy-stack/2022a mpi4py/3.0.3

# create the env on log in node
rm -rf ~/EM-EARTH-env
virtualenv ~/EM-EARTH-env
source ~/EM-EARTH-env/bin/activate
pip install --upgrade pip
pip install requests
pip install base64
pip install hashlib
pip install glob
pip install xarray
pip install matplotlib
pip install jupyter
pip install re
```

### Activate the virtual ENV

```
source ~/EM-EARTH-env/bin/activate
```

### Clone the repo and run the scritp

```
git clone https://github.com/ShervanGharari/EM_EARTH.git
cd EM_EARTH/code
jupyter nbconvert download_EM_EARTH.ipynb --to python
python download_EM_EARTH.py
```