use64
arg_count = 0
macro count_args [args] {
    if arg_count > 9
        display "Too many!"
    end if
    arg_count = arg_count + 1
}
count_args a, b, c, d, e, f, g, h, i, j