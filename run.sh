home=`pwd`

colorSt="\033[1;32m"

echo -e "${colorSt}@KaStORSauto ===== Downloding the KaStORS benchmark =====\033[m"
if [ ! -e "${home}/kastors" ]; then
  git clone https://scm.gforge.inria.fr/anonscm/git/kastors/kastors.git kastors
fi

echo -e "${colorSt}@StORSauto ===== Generating config files =====\033[m"
cd kastors && ./autogen.sh

cd $home && rm -rf build
mkdir build && cd build

echo -e "${colorSt}@KaStORSauto ===== Configuring for KaStORS apps=====\033[m"
$home/kastors/configure CC="clang-archer"

echo -e "${colorSt}@KaStORSauto ===== Compiling OpenMP dependence task benchmarks =====\033[m"
cd strassen
make strassen_taskdep
cd - && cd jacobi
make jacobi_taskdep
cd ..

echo -e "${colorSt}@KaStORSauto ===== Running the Benchmarks =====\033[m"
strassen/strassen_taskdep
jacobi/jacobin_taskdep

echo -e "${colorSt}@KaStORSauto ===== End =====\033[m"
