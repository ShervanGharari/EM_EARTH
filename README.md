# EM_EARTH

## download EM_EARTH
```
cd
module reset
module purge
deactivate

module load StdEnv/2020 gcc/9.3.0 openmpi/4.0.3
module load gdal/3.5.1 libspatialindex/1.8.5
module load python/3.8.10 scipy-stack/2022a mpi4py/3.0.3

rm -rf ~/EM-EARTH-env
virtualenv ~/EM-EARTH-env
source ~/EM-EARTH-env/bin/activate
pip install --no-index --upgrade pip
pip install --no-index requests
pip install --no-index base64
pip install --no-index hashlib
pip install --no-index glob
pip install --no-index xarray
pip install --no-index matplotlib
pip install --no-index jupyter
pip install --no-index netcdf4
pip install --no-index h5netcdf

cd /project/rpp-kshook/shg096/ # or go to project space
rm -rf /EM_EARTH
git clone https://github.com/ShervanGharari/EM_EARTH.git
cd EM_EARTH/code
jupyter nbconvert download_EM_EARTH.ipynb --to python
python download_EM_EARTH.py
```
