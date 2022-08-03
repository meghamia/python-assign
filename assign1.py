#1st
"""str="Manpreet kaur"
print(len(str))"""

#2nd
"""str="google.com"
d=dict()
for c in str:
    if c in d:
        d[c]=d[c]+1
    else:
        d[c]=1
print(d)"""

#3rd
"""def string(str):
  if len(str) < 2:
    return('Empty string')

  return str[0:2] + str[-2:]

print(string('w3resource'))
print(string('w3'))
print(string('w'))"""

#4th

"""def change_char(str1):
  char = str1[0]
  str1 = str1.replace(char, '$')
  str1 = char + str1[1:]

  return str1

print(change_char('sesrtart'))"""

#5th
"""def chars_mix_up(a, b):
  new_a = b[:2] + a[2:]
  new_b = a[:2] + b[2:]

  return new_a + ' ' + new_b
print(chars_mix_up('abc', 'xyz'))"""

#6th
"""def add_string(str1):
  length = len(str1)

  if length > 2:
    if str1[-3:] == 'ing':
      str1 += 'ly'
    else:
      str1 += 'ing'

  return str1
print(add_string('abc'))
print(add_string('string'))"""

#7th
"""def not_poor(str1):
  snot = str1.find('not')
  spoor = str1.find('poor')
  

  if spoor > snot and snot>0 and spoor>0:
    str1 = str1.replace(str1[snot:(spoor+4)], 'good')
    return str1
  else:
    return str1
print(not_poor('The lyrics is not that poor!'))
print(not_poor('The lyrics is poor!'))"""

#8th
"""def find_longest_word(words_list):
    word_len = []
    for n in words_list:
        word_len.append((len(n), n))
    word_len.sort()
    return word_len[-1][0], word_len[-1][1]
result = find_longest_word(["Jass", "Exercises", "Back"])
print("\nLongest word: ",result[1])
print("Length of the longest word: ",result[0])"""

#9th
"""def remove_char(str, n):
      first_part = str[:n] 
      last_part = str[n+1:]
      return first_part + last_part
print(remove_char('Python', 0))
print(remove_char('Python', 3))
print(remove_char('Python', 5))"""

#10th
"""def change_sring(str1):
      return str1[-1:] + str1[1:-1] + str1[:1]
	  
print(change_sring('jass'))
print(change_sring('12345'))"""

#11th
"""def odd_values_string(str):
  result = "" 
  for i in range(len(str)):
    if i % 2 == 0:
      result = result + str[i]
  return result

print(odd_values_string('jasss'))
print(odd_values_string('python'))"""

#12th
"""def word_count(str):
    counts = dict()
    words = str.split()

    for word in words:
        if word in counts:
            counts[word] += 1
        else:
            counts[word] = 1

    return counts

print( word_count('today is a beautiful day'))"""

#13th
"""user_input = input("What's your Name ? ")
print("My name is ", user_input.upper())
print("My name is ", user_input.lower())"""

#14th
"""items = 'red,white,black,red,green,black'
words = [word for word in items.split(",")]
print(",".join(sorted(list(set(words)))))"""

#15th
"""def add_tags(tag, word):
	return "<%s>%s</%s>" % (tag, word, tag)
print(add_tags('i', 'Python'))
print(add_tags('b', 'Python Tutorial'))"""

#16th
"""def insert_sting_middle(str, word):
	return str[:2] + word + str[2:]

print(insert_sting_middle('[[]]', 'Python'))
print(insert_sting_middle('{{}}', 'PHP'))"""

#17th
"""def insert_end(str):
	sub_str = str[-2:]
	return sub_str * 4

print(insert_end('Python'))
print(insert_end('Exercises'))"""

#18th
"""def first_three(str):
	return str[:3] if len(str) > 3 else str

print(first_three('ipy'))
print(first_three('python'))"""

#19th
"""str1 = 'https://www.w3resource.com/python-exercises/string'
print(str1.rsplit('/', 1)[0])
print(str1.rsplit('-', 1)[0])"""

#20th
"""def reverse_string(str1):
    if len(str1) % 4 == 0:
       return ''.join(reversed(str1))
    return str1

print(reverse_string('abcd'))
print(reverse_string('python'))"""

#21th
"""def to_uppercase(str1):
    num_upper = 0
    for letter in str1[:4]: 
        if letter.upper() == letter:
            num_upper += 1
    if num_upper >= 2:
        return str1.upper()
    return str1

print(to_uppercase('Python'))
print(to_uppercase('PyThon'))"""

#22th
"""str1='Python Exercises\n'
print(str1)
print(str1.rstrip())"""

#23th
"""string = "google.com"
print(string.startswith("goo"))"""