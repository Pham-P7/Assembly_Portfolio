def cube(x,y,z,n):
    cubelist = [(a,b,c) for a in range(0,x + 1) for b in range(0,y + 1) for c in range(0,z +1) if a+b+c != n]
    print(cubelist)
cube(1,1,2,3)
