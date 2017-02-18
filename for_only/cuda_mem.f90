!=======================================================================================================================
!Interface to cuda C subroutines
!=======================================================================================================================
module cuda_rt

  use iso_c_binding

  interface
     !
     integer (c_int) function cudaMemGetInfo(fre, tot) bind(C, name="cudaMemGetInfo")
       use iso_c_binding
       implicit none
       type(c_ptr),value :: fre
       type(c_ptr),value :: tot
     end function cudaMemGetInfo
     !
  end interface

end module cuda_rt



!=======================================================================================================================
program main
!=======================================================================================================================

  use iso_c_binding
  use cuda_rt

  type(c_ptr) :: cpfre, cptot
  integer*8, target   :: freemem, totmem
  integer*4   :: stat
  freemem = 0
  totmem  = 0
  cpfre = c_loc(freemem)
  cptot = c_loc(totmem)
  stat = cudaMemGetInfo(cpfre, cptot)
  if (stat .ne. 0 ) then
      write (*,*)
      write (*, '(A, I2)') " CUDA error: ", stat
      write (*,*)
      stop
  end if

  write (*, '(A, I10)') "  free: ", freemem
  write (*, '(A, I10)') " total: ", totmem
  write (*,*)

end program main
