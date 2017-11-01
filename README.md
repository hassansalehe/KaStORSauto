# KaStORSauto
A bash script to automate the compilation and execution of [KaStORS OpenMP dataflow Benchmarks](https://gforge.inria.fr/projects/kastors/)
under [Archer race detection tool](https://github.com/PRUNERS/archer).

## Usage
Run:
```bash
./run.sh
```

The `run.sh` file contains the script to perform the following tasks
* Downloading the KaStORS benchmark suite from the repository
* Configuring the scripts necessary to build the application
* Compiling the applications
* Running them.


## Prerequisites
* Linux environment, preferably [Ubuntu](https://www.ubuntu.com/).
* [Git](https://git-scm.com/download/linux).
* [LLVM/Clang](https://llvm.org).
* [Archer](https://github.com/PRUNERS/archer), OpenMP race detection tool.

