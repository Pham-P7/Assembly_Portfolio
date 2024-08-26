def cube(x,y,z,n):
    a = 0
    b = 0
    c = 0
    cubelist = [x*y*z][3]
    for i in range(x*y*z):
        cubelist[i] = []
    
    print(cubelist)
cube(1,1,2,3)
