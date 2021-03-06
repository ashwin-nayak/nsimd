# Copyright (c) 2019 Agenium Scale
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

NS2_ROOT         = ../../../_install
NS2_INCLUDE_DIR  = $(NS2_ROOT)/include
NS2_LIBRARY_DIR  = $(NS2_ROOT)/lib
CXX              = c++
CXX_FLAGS        = -O3 -Wall -Wextra -pedantic -std=c++11 -I$(NS2_INCLUDE_DIR) 
CXX_LDFLAGS      = -L$${PWD} -lns2 '-Wl,-rpath=$$ORIGIN'

all: md2html

md2html: libns2.so md2html.cpp Makefile.nix
	$(CXX) $(CXX_FLAGS) md2html.cpp -o $@ $(CXX_LDFLAGS)

libns2.so: $(NS2_LIBRARY_DIR)/libns2.so Makefile.nix
	cp -f "$(NS2_LIBRARY_DIR)/$@" "$@"
