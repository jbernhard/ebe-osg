c $Id: ri6000ranf.f,v 1.2 1996/12/02 16:13:54 weber Exp $
C*****************   R A N F   *******************************
c sab 05.03.1992
      real*8 FUNCTION RANF(ix)
      integer ix
cdebug
      integer iran1,iran2
      common /rcnt/iran1,iran2
      if(iran1.eq.10000000) then
         iran1=0
         iran2=iran2+1
      else
         iran1=iran1+1
      endif
cdebug
      ranf=dble(rand())
      RETURN
      end
c
c
      subroutine SSEED(ranseed)
      integer timerr(9),ranseed,oldseed,ts(9)
      data ts/59,59,23,31,12,100,7,365,1/
      save

      itt=0


      if(ranseed.gt.0) then
         call srand(abs(ranseed))
c         WRITE(6,*)'FIXED SEED = ',ranseed
         return
      endif
      call risctime(timerr)
      do 123 j=1,9
         itt=itt*ts(10-j)+timerr(j) 
 123  continue
      itt=itt+timerr(6)*timerr(5)*timerr(1)**2
      ranseed=abs(2*itt+1)
      if(abs(oldseed).eq.ranseed) then
         ranseed=-1*abs(ranseed)
         return
      else
         oldseed=ranseed
      endif
c      write(6,*)'AUTO-SEED = ',ranseed
      call srand(ranseed)
      RETURN
      END
