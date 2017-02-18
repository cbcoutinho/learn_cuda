!=======================================================================================================================
!Interface to cuda C functions
!=======================================================================================================================
module cuda_test

  use iso_c_binding

  interface
     !
     integer(c_int) function cudatestfunc(idata, isize) bind(C, name="cudatestfunc")
       use iso_c_binding
       implicit none
       type(c_ptr),value :: idata
       integer(c_int),value :: isize
     end function cudatestfunc
     !
  end interface

end module cuda_test



!=======================================================================================================================
program main
!=======================================================================================================================

  use iso_c_binding

  use cuda_test

  type(c_ptr) :: mydata
  integer*4, target   :: mysize,myresult
  integer*4,dimension(:),allocatable,target :: darray
  mysize = 100
  allocate(darray(mysize))
  darray = (/ (1, I = 1, mysize) /)
  mydata = c_loc(darray)
  myresult = cudatestfunc(mydata, mysize)

  write (*, '(A, I10)') "  result: ", myresult
  write (*,*)

end program main
