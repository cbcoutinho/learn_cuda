
FF=gfortran-4.8

build: cuda_test.f90 cuda_test.cu
	$(FF) -c cuda_test.f90 -o cuda_testf.o
	nvcc -c cuda_test.cu -o cuda_testc.o --compiler-bindir /usr/bin
	$(FF) cuda_testc.o cuda_testf.o -lcudart -lstdc++

run: build
	./a.out

clean:
	rm -rf *.mod *.o cuda_test
