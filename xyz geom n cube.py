def cube(x,y,z,n):
    cubelist = [(x+1) * (y+1) * (z+1)][3]
    for i in range(0,len(cubelist)):
        cubelist[i] = [(a,b,c) for a in range(0,x + 1) for b in range(0,y + 1) for c in range(0,z +1) if a+b+c != n]
    print(cubelist)
cube(1,1,2,3)
