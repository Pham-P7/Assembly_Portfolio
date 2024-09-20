arg_count = 0
macro count_args [arg] {
    arg_count = arg_count + 1
}
count_args a, b, c, d, e, f, g
db arg_count