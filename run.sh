#!/usr/bin/env bash

# Copyright (c) 2017, Hassan Salehe Matar
# All rights reserved.
#
# This file is part of KaStORSauto. For details, see
# https://github.com/hassansalehe/KaStORSauto. Please also see the LICENSE.md file
# for additional BSD notice
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions 
# are met:
#
# * Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in the
#   documentation and/or other materials provided with the distribution.
#
# * Neither the name of the copyright holder nor the names of its 
#   contributors may be used to endorse or promote products derived from 
#   this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE 
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
# GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT 
# OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

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
