
build:
	gfortran -O3 cuda_mem.f90 -L/usr/local/cuda/lib64 -lcudart -o cuda_mem

run: build
	./cuda_mem

clean:
	rm -rf *.o *.mod cuda_mem
