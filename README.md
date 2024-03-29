# EM_EARTH

## download EM_EARTH

### An Example of Creating the virtual ENV for download and merge

```
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
pip install --no-index --upgrade pip

# clone repo and install requirments
rm -rf EM_EARTH
git clone https://github.com/ShervanGharari/EM_EARTH.git
cd EM_EARTH
cat requirements.txt | xargs -n 1 pip install --no-index
```

### Activate existing virtual ENV

```
module reset
module purge
deactivate

module load StdEnv/2020 gcc/9.3.0 openmpi/4.0.3
module load gdal/3.5.1 libspatialindex/1.8.5
module load python/3.8.10 scipy-stack/2022a mpi4py/3.0.3

source ~/EM-EARTH-env/bin/activate
```

### Runnign the code, cd to the code folder inside the EM_EARTH folder

```
jupyter nbconvert download_EM_EARTH.ipynb --to python # convert to python
python download_EM_EARTH.py --years ['1970'] --months ['02'] --groups ['probabilistic_daily'] --regions ['Africa']
```

### Inside a job using the existing virtual env
```
#!/bin/bash
#SBATCH --account=rpp-kshook
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=128G
#SBATCH --time=3:00:00    # time (DD-HH:MM)
#SBATCH --job-name=EM-EARTH-MERG
#SBATCH --error=errors1

# load needed modules
module load StdEnv/2020 gcc/9.3.0 openmpi/4.0.3
module load gdal/3.5.1 libspatialindex/1.8.5
module load python/3.8.10 scipy-stack/2022a mpi4py/3.0.3

# create virtual env inside the job
virtualenv --no-download $SLURM_TMPDIR/env
source $SLURM_TMPDIR/env/bin/activate
pip install --no-index --upgrade pip
pip install --no-index requests
pip install --no-index base64
pip install --no-index hashlib
pip install --no-index glob
pip install --no-index xarray
pip install --no-index matplotlib
pip install --no-index jupyter
pip install --no-index re
pip install --no-index netcdf4
pip install --no-index h5netcdf
pip install --no-index gdown


python merging_EM_EARTH.py
```