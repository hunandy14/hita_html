$path=$PSScriptRoot

$bin=$path+"\Portable Python-3.9.4 x64\App\Python"
$bin2=$path+"\Portable Python-3.9.4 x64\App\Python\Scripts"
$env:path= $env:path+";$bin;$bin2"

# reintall pip
python -m pip install --upgrade --force-reinstall pip

# Test Numpy
"import numpy as np; print(np.array(['Hello', 'Numpy']));" > TestNumpy.py
python .\TestNumpy.py
