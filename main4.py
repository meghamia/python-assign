"""#method 1
def a_fun():
 	global name
name = 'A'
def b_fun():
 	global name
 	name = 'B'
b_fun()
a_fun()
print (name)

#method 2
a = 10
def f():
 	print ('Inside f() : ', a)
def g(): 
 	a = 20
 	print ('Inside g() : ',a)
def h(): 
 	global a
 	a = 30
 	print ('Inside h() : ',a)
print ('global : ',a)
f()
print ('global : ',a)
g()
print ('global : ',a)
h()
print ('global : ',a)

#method 3
a_var = 10
b_var = 15
e_var = 25
d_var = 100
def a_func(a_var):
 	print("in a_func a_var =", a_var)
 	b_var = 100 + a_var
 	d_var = 2 * a_var
 	print("in a_func b_var =", b_var)
 	print("in a_func d_var =", d_var)
 	print("in a_func e_var =", e_var)
 return b_var + 10
c_var = a_func(b_var)
print("a_var =", a_var)
print("b_var =", b_var)
print("c_var =", c_var)
print("d_var =", d_var)

#method 4
a,b,x,y = 1,15,3,4
def fun(x, y):
 	global a
 	a = 42
 	x,y = y,x
 	b = 33
 	b = 17
 	c = 100
 	print (a,b,x,y)
fun(17,4)
print (a,b,x,y)

#method 5
def f():
 x = 42
def g():
 		global x
 		x = 43
print("Before calling g: ",x)
g()
print("After calling g: ",x)
 
f()
print("x in main: " ,x)

#methd 6
def outer():
 s="Ludhiana" 
def inner1():
 s="punjab"
def inner2():
  nonlocal s
  s="Chandigarh"
def inner3():
  global s
  s="Haryana"
  print(s) 
  inner1() 
  print(s) 
  inner2()
  print(s) 
  inner3()
  print(s) 
outer()
print(s)

#method 7
eid,ename,esal=1,'aaa',10000.56
def emp(eid,ename,esal):
 	globals()['eid']=eid
 	globals()['ename']=ename
 	globals()['esal']=esal
print(eid,ename,esal)
def disp():
 	print(eid,ename,esal)
 
emp(111,'ratan',10000.45)
disp()
print(eid,ename,esal)

# method 8
a,b=100,200
class MyClass():
a,b=10,20
def add(self,a,b):
print(a+b)
print(globals()['a']+globals()['b'])
print(self.a+self.b)
def mul(self,a,b):
print(a*b)
print(globals()['a']+globals()['b'])
print(self.a*self.b)
c = MyClass()
c.add(3,3)
c.mul(4,4)

# method 9
class Emp:
 	def __init__(self,eid,ename,esal):
 		self.eid=eid
 self.ename=ename
 		self.esal=esal
 	def __str__(self):
 		return "emp id=%d Emp name=%s Emp sal=%g"%(self.eid,self.ename,self.esal)
e1 = Emp(111,"kamal",100000.45)
print(e1)
e2 = Emp(111,"anu",200000.46)
print(e2)"""



#method 10
class Test :
    @staticmethod
    def static_method_1():
        print('static method 1')

    @staticmethod
    def static_method_2() :
        Test.static_method_1()

    @classmethod
    def class_method_1(cls) :
        cls.static_method_2()

# call class method
Test.class_method_1()


