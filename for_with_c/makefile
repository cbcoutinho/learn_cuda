
FF=gfortran-4.8

build: cuda_test.f90 cuda_test.cu
	$(FF) -c cuda_test.f90 -o cuda_testf.o
	nvcc -c cuda_test.cu -o cuda_testc.o --compiler-bindir /usr/bin
	$(FF) cuda_testc.o cuda_testf.o -o cuda_test -L/usr/local/cuda/lib64 -lcudart -lstdc++

run: build
	./cuda_test

clean:
	rm -rf *.mod *.o cuda_test
