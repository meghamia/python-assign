

#1.calcute the length of a string
a="good evening"
print(len(a))

#2.to count the number of characters
def char_frequency(str1):  
    dict = {}  
    for n in str1:  
        keys = dict.keys()  
        if n in keys:  
            dict[n] += 1  
        else:  
            dict[n] = 1  
    return dict  
print(char_frequency('google.com'))  


#3.string made up of first 2 characters and last two characters
string="w3resource"
print(string[0:2]+string[-2: ])
string="w3"
print(string[0:2]+string[-2: ])

#5.to get a single string from given strings
def chars_mix_up(a, b):  
  new_a = b[:2] + a[2:]  
  new_b = a[:2] + b[2:]  
  
  return new_a + ' ' + new_b  
print(chars_mix_up('abc', 'xyz')) 


#19.get last part of string before it is specified
string ="bji-lnln-povhgu/knl"
print(string.rsplit("/",1)[0])

#22.remove newline
a="Python code\n"
b="Python code"
print(a.rstrip())
print(b)

#23.check whether a string starts with specified characters 
a="It rains today"
print(a.startswith("I"))

#4.to get string from other string
def char (str1) :
    char = str1[0]
    str1 = str1.replace (char, '$')
    str1 = char + str1 [1 : ]
    return str1

print (char ('restart'))

#6.to add "ing" in the end
def add_string(str1):  
  length = len(str1)  
  
  if length > 2:  
    if str1[-3:] == 'ing':  
      str1 += 'ly'  
    else:  
      str1 += 'ing'  
  
  return str1  
print(add_string('ab'))  
print(add_string('abc'))  
print(add_string('string'))  

#20 function to reverses a string if it&#39;s length is a multiple of 4
def reverse_string(str1):
    if len(str1) % 4 == 0:
       return ''.join(reversed(str1))
    return str1

print(reverse_string('abcd'))
print(reverse_string('python'))

#21.function to convert a given string to all uppercase 
def to_uppercase(str1):
    num_upper = 0
    for letter in str1[:4]: 
        if letter.upper() == letter:
            num_upper += 1
    if num_upper >= 2:
        return str1.upper()
    return str1

print(to_uppercase('Python'))
print(to_uppercase('PyThon'))
