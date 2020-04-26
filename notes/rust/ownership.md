# What is Ownership?

Rust’s central feature is ownership. Although the feature is straightforward to
explain, it has deep implications for the rest of the language.

All programs have to manage the way they use a computer’s memory while running.
Some languages have garbage collection that constantly looks for no longer used
memory as the program runs; in other languages, the programmer must explicitly
allocate and free the memory. Rust uses a third approach: memory is managed
through a system of ownership with a set of rules that the compiler checks at
compile time. None of the ownership features slow down your program while it’s
running.

## The Stack and the Heap

In many programming languagges, you don't have to think about the stack and the
heap very often. But in a systems programming language like Rust, whether a
value is on the stack or the heap has more of an effect on how the language
behaves and why you have to make certain decisions. The stack and the heap are
parts of memory that are availabe to you code to use at runtime, but they are
structured in different ways.

### Stack

The stack stores values in the order it gets them and removes the values in the
opposite order. This is known as *last in first out* (LIFO). Adding data is
known as *pushing data onto the stack* and removing data is known as *popping
data off the stack*. Pusing values onto the stack is not the same as allocating
memory, because the pointer is a known, fixed sized, you can store the pointer
on the stack, but when you want the actual data, you must follow the pointer.
All data stored on the stack **must** have a **known**, **fixed size**. Data
with an unknown size at compile time or a size that might change must be instead
stored on the heap.

### Heap

The heap is less organized: when you put data on the heap, you request a certain
amount of space. The OS finds an empty spot in the heap that is big enough,
marks it as being in use, and returns a pointer, which is the address of that
location. This process is called allocating on the heap and is somtimes
abbreviated as just allocating.

### Stack vs Heap

Pushing to the stack is pfaster than allocating on the heap because the OS never
has to search for a place to store new data; that location is always at the top
of the stack. Comparatively, allocating space on the heap requres more work,
because the OS must first find a big enough space to hold the data and then
perform bookkeeping to prepare for the next allocation.

Accessing the data in the heap is slower than accessing data on the stack
because you have to follow the pointer to get to the data. Contemporary
processors are faster if they jump around less in memory. A processor can do its
job better if works on data that's close to other data (as it is on the stack)
rather than farther away (as it can be on the heap). Allocating a large amount
of space on the heap can also take time.

When your code calls a function, the values passed into the function (including,
potentially, pointers to data on the heap) and the fucntion's local variables
get pushed onto the stack. When the function is over, those vlaues get popped
off the stack.

Keeping track of what parts of code are using what data on the heap, minimizing
the amount the duplicate data on the heap, and cleaning up unused data on the
heap so you don't run out of space are all problems that ownership addresses.
Once you understand ownership, you won't need to think about the stack and the
heap very often, but knowing that managing heap data is why ownership exists can
help explain why it works the way it does.

## Ownership Rules

First, let's take a look at the ownership rules, **commit these to memory**.

* Each value in Rust has a variable that's called its owner.
* There can only be one owner at a time.
* When the owner goes out of scope, the value will be dropped.

## Variable Scope

A scope is the range within a program for which an item is valid. Let's say we
have a variable that looks like this:

```rust
let s = "hello";
```

The variable s referes to a string literal, where the value of the string is
hardcoded into the text of our pgromgra. The variable is valid from the point at
which it's declared until the end of the current *scope*.

```rust
fn main {            // s is not defined yet so not valid
    let s = "hello"; // s is valid form this point forward
                     // do some stuff with the variable s
}                    // the scope is now over, and s is no longer valid
```

In other words, there are two import points in time here:

* when `s` comes into *scope*, it is valid.
* It remains valid until it goes *out of scope*.

At this point, the relationship between scopes and when variables are valid is
similar to that in other programming languages.

## Memory and Allocation

For programming languages to support mutable, growable data types that are
unknown at compile time:

* The memory must be requested from the OS at runtime.
* We need a way of returning this memory to the OS when we are done with it.

The first pattern is universal in all programming languages, you would need to
either manually allocate that memory like in C type languages or the interpreter
in scripting languages does it for you. However the second point is different.
In languages with a *garbage collector* (GC), the GC keeps track and cleans up
memory that isn't being used anymore, and we don't need to think about it.
Without a GC, it's the developer's responsibility to identify when memory is no
longer being used and call code to explicitly return it to the OS, just as we
did to request it.

Doing this correctly has historically been a difficult programming problem. If
we forget, we will waste memory, If we do it too early, we will have an invalid
variable. If we do it twice, that's a bug too. We need to pair exactly one
`allocate` with exactly one `free`.

Rust takes a different path: the memory is automatically returned once the
variable that owns it goes out of scope.

