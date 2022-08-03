#1.palindrome 
my_string=input("Enter string:")
if(my_string==my_string[::-1]):
   print("The string is a palindrome")
else:
   print("The string isn't a palindrome")

#2.factorial program    
def factorial(n):
    if n==0:
        return 1
    else:
        return n*factorial(n-1)
n=int(input("Input a number to compute a factorial:"))
print(factorial(n))

#3.fibonacci 
def fibo(n):
    a = 0
    b = 2
    for i in range(0,n):
        temp = a
        a = b
        b = temp + b
    return a    
for c in range(0,5):
  print(fibo(c))   

#4.armstrong number
num=int(input("enter any number"))
sum=0
temp=num
while temp>0:
   digit=temp%10
   sum+=digit**3
   temp//=10
if num== sum:
    print("num is an armstrong number")
else:
    print("num is not an armastrong number")

#5.calculator 
def add(x,y):
    return x+y
def substract(x,y):
    return x-y
def divide(x,y):
    return x/y
def multiply(x,y):
    return x*y
print("select operations:")
print("1.add")
print("2.substract")
print("3.divide")
print("4.mutipy")

while True:
    choice=input("enter the choice (1/2/3/4):")
    if choice in('1','2','3','4'):
        num1=float(input("enter first number:"))
        num2=float(input("enter second number:"))
    if choice=="1":
        print(num1 ,"+",num2,"=",add(num1,num2))
    elif choice=="2":
        print(num1,"-",num2,"=",substract(num1,num2))
    elif choice=="3":
        print(num1,"/",num2,"=",divide(num1,num2))
    elif choice=="4":
        print(num1,"*",num2,"=",multiply(num1,num2))
    next_calculation=input("lets do next calculation?(yes/no):") 
    if next_calculation=="no":
        break
    else:
        print("invalid input") 

#6.pattern
#for increment 
n=int(input("enter the number of rows:"))
for i in range(0,n):
    for j in range(1,i+1):
        print("* ",end="")
    print("\n")

#7.leap year
year=int(input("enter leap year:"))
if(year%400==0):
    print("year,is a leap year:")
else:
    print("year,is not a leap year:")

#8.prime number    
num=11
if num>1:
    for i in range(2,int(num/2)+1):
        if(num%i)==0:
          print(num,"is not prime number:")
          break
    else:
        print(num,"is  a prime number")  
else:
    print(num,"is not prime number:")

#9.area find
a=5
b=6
c=7
a=float(input("enter first side:"))
b=float(input("enter second side:"))
c=float(input("enter third side:"))
s=(a+b+c)/2
area=(s*(s-a)*(s-b)*(s-c))**0.5
print("the area of triagle%0.2f,"%area)

#10.to reversed a list
system=["windows","linux","macOs"]
print("original list:",system)
system.reverse()
print("original system:",system)

#11.to find the sum of all elements
NumList = []

Number = int(input("Please enter the Total Number of List Elements : "))
for i in range(1, Number + 1):
    value = int(input("Please enter the Value of %d Element : " %i))
    NumList.append(value)

total = sum(NumList)
print("\n The Sum of All Element in this List is : ", total)

#12.min,max,avf list of elements
n=int(input("enter the number of elements:"))
l1=list()
for i in range(n):
    ele=int(input("enter the number:"))
    l1.append(ele)
s=sum(l1)
Min=min(l1)
Max=max(l1)
avg=s/len(l1)
print("sum of numbers:",s)
print("Minimum eement is:",Min)
print("Maximum element is:",Max)
print("average is:",avg)

#13.create a dictionary
from collections import defaultdict
def grouping_dictionary(l):
    d = defaultdict(list)
    for k, v in l:
        d[k].append(v)
    return d
colors = [('yellow', 1), ('blue', 2), ('yellow', 3), ('blue', 4), ('red', 1)]
print("Original list:")
print(colors)
print("\nGrouping a sequence of key-value pairs into a dictionary of lists:")
print(grouping_dictionary(colors))


#14.convert more than one list to nested dictionary
def nested_dictionary(l1, l2, l3):
     result = [{x: {y: z}} for (x, y, z) in zip(l1, l2, l3)]
     return result

student_id = ["S001", "S002", "S003", "S004"] 
student_name = ["Adina Park", "Leyton Marsh", "Duncan Boyle", "Saim Richards"] 
student_grade = [85, 98, 89, 92]
print("Original strings:")
print(student_id)
print(student_name)
print(student_grade)
print("\nNested dictionary:")
ch='a'
print(nested_dictionary(student_id, student_name, student_grade))

#15.set is a subset of another subset
print("Check if a set is a subset of another set, using comparison operators and issubset():\n")
setx = set(["apple", "mango"])
sety = set(["mango", "orange"])
setz = set(["mango"])
print("x: ",setx)
print("y: ",sety)
print("z: ",setz,"\n")
print("If x is subset of y")
print(setx <= sety)
print(setx.issubset(sety))
print("If y is subset of x")
print(sety <= setx)
print(sety.issubset(setx))
print("\nIf y is subset of z")
print(sety <= setz)
print(sety.issubset(setz))
print("If z is subset of y")
print(setz <= sety)
print(setz.issubset(sety))

#16.to create symmetric difference
setc1 = set(["green", "blue"])
setc2 = set(["blue", "yellow"])
print("Original sets:")
print(setc1)
print(setc2)
r1 = setc1.symmetric_difference(setc2)
print("\nSymmetric difference of setc1 - setc2:")
print(r1)
r2 = setc2.symmetric_difference(setc1)
print("\nSymmetric difference of setc2 - setc1:")
print(r2)
setn1 = set([1, 1, 2, 3, 4, 5])
setn2 = set([1, 5, 6, 7, 8, 9])
print("\nOriginal sets:")
print(setn1)
print(setn2)
r1 = setn1.symmetric_difference(setn2)
print("\nSymmetric difference of setn1 - setn2:")
print(r1)
r2 = setn2.symmetric_difference(setn1)
print("\nSymmetric difference of setn2 - setn1:")
print(r2)

#17.to remove empty tuple
L = [(), (), ('',), ('a', 'b'), ('a', 'b', 'c'), ('d')]
L = [t for t in L if t]
print(L)

#18.calculate avg value of given tuples
def average_tuple(nums):
    result = [sum(x) / len(x) for x in zip(*nums)]
    return result

nums = ((10, 10, 10, 12), (30, 45, 56, 45), (81, 80, 39, 32), (1, 2, 3, 4))
print ("Original Tuple: ")
print(nums)
print("\nAverage value of the numbers of the said tuple of tuples:\n",average_tuple(nums))

nums = ((1, 1, -5), (30, -15, 56), (81, -60, -39), (-10, 2, 3))
print ("\nOriginal Tuple: ")
print(nums)
print("\nAverage value of the numbers of the said tuple of tuples:\n",average_tuple(nums))

#19.validity of password
import re
p= input("Input your password")
x = True
while x:  
    if (len(p)<6 or len(p)>12):
        break
    elif not re.search("[a-z]",p):
        break
    elif not re.search("[0-9]",p):
        break
    elif not re.search("[A-Z]",p):
        break
    elif not re.search("[$#@]",p):
        break
    elif re.search("\s",p):
        break
    else:
        print("Valid Password")
        x=False
        break

if x:
    print("Not a Valid Password")



