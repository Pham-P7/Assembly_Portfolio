use64
format PE64 NX GUI 6.0
macro add5 target {
  add target, 5 
}
int3
add5 rax
int3