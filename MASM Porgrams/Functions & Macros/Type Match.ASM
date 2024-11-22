use64
macro accumulate target*, [term*] {
if ~ (target eqtype rax)
    display("accumulate: target must be a register (was ", `target, ")")
    err
end if
common
    xor target, target
forward
    add target, term
}
accumulate rcx, 1, 2, 4
