
build:
	gfortran -O3 cuda_mem.f90 -lcudart

run: build
	./a.out

clean:
	rm -rf *.o *.mod cuda_mem
