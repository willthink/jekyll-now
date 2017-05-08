---
layout: post
title:  "Macro Function In C"
date:   2017-04-30 14:30:01
comments: true 
categories: C
---
When I started to read code in my first job, I got confused by the `#define` followed by a function like multiple lines of code. It's
not easy to read and understand. So I didn't bother to try to write something like that even once. But today, I want to learn and write about it  

## What is Macro Function?
`#define` is everywhere in C family. The definition of macro by GNU is 

`A macro is a fragment of code which has been given a name. Whenever the name is used, it is replaced by the contents of the macro`

[link](https://gcc.gnu.org/onlinedocs/cpp/Macros.html)

Usually it's convenient and a good practice to use it to replace your pre-defined number or string. 

But when macros also can accept parameters and return values, we call it a macro functions 

For example,

```c
#define ABS(my_val) ((my_val) < 0) ? -(my_val) : (my_val)

```
This is equivalent to

```c
int abs(int my_val) 
{
  return (my_val)? -my_val : my_val;
}
```

## Why do we need it?
Speed! There's overhead when calling a function. I like [this article's explanation](https://mortoray.com/2010/10/12/the-cost-a-function-call/).
Image some function you want to keep calling a function thousands of times, then the overhead can be huge.

But as a developer, I don't want to copy same code snippet every time I want to use it. So the here's the situation macro function can help. 

The C preprocessor will replace the macro in the source code before handling to compiler, so your macro function will not be a function call when it's used. So that the overhead of function call is avoided

## Basic function
If you recall the ABS function example, we'll know the macro function syntax is similar with regular function 
But there are some difference.
### parentheses is needed when write parameters
The reason is very simple. Macro parameters are completely macro-expanded before they are substituted into a macro body. 
A good example is [this question on StackOverflow](http://stackoverflow.com/questions/10820340/the-need-for-parentheses-in-macros-in-c)

```C
#define SQURE_NO(x) (x*x)
#define SQURE_HAS(x) ((x)*(x))
int main() {
  int a , b = 3;
  a = SQURE_NO(b+5);
  printf("a: %d\n",a); // a: 23
  a = SQURE_HAS(b+5);
  printf("a: %d\n",a); // a: 64
  return 0;
}
```  

We can see `a = SQURE_NO(b+5)` will be replaced as 
`a = (b+5*b+5)` because the x is b+5
but `a = SQURE_HAS(b+5)` will be 
`a = ((b+5)*(b+5))`
So with or without parentheses will cause different result.  



