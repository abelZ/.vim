cmake3 -S llvm -B build -G "Unix Makefiles" -DLLVM_ENABLE_PROJECTS='clang;clang-tools-extra' -DCMAKE_INSTALL_PREFIX=/data/llvm-build -DCMAKE_BUILD_TYPE=Release
