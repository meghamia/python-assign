#1.palindrome 
"""my_string=input("Enter string:")
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
for c in range(0,5)
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
print("the area of triagle%0.2f,"%area)""" 

#10.to reversed a list
system=["windows","linux","macOs"]
print("original list:",system)
system.reverse()
print("original system:",system)