use64 ;program to print out a numbers byte value in left to right order
format PE64 NX GUI 6.0
macro showbits_rtl arg {
      val = arg
      while val > 0
        display (val and 1) + '0'
        val = val shr 1
      end while
}
showbits_rtl 13