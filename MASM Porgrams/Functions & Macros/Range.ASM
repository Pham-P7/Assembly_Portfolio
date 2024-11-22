use64
macro byterange rng {
        ; note that FASM requires us to escape curly braces within the macro body
  match a .. b, rng \{
    i = a
    while i <= b
        db i
        i = i + 1
    end while
  \}
}
byterange 0 .. 7