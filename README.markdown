# Functional Programming Course

[*answers*](https://github.com/tonymorris/fp-course)

[Progression](#progression)

### Tips after having started

1. Use `-info` or `-i` to answer *WTF questions*.

2. Use `-type` or `-t`.

3. GHCi has context-sensitive TAB-completion.

   If there is more than one identifier that can complete, hit TAB twice
   quickly. This will present you with your options to complete.

4. Follow the types.

5. Do not use tab characters

### Running the tests

Tests are run using a built-in test runner that has no requirements
beyond those of the course (a supported version of GHCi). By default,
the full test suite is loaded, and each module's tests are
exported. You can run the tests in GHCi like this:

    >> test test_List

#### Specific modules

For convenience, each test module also exports individual tests. To run tests
from a single module, load it, and then run `test <tests>`. For example, in
`GHCi`:

    >> :l src/Test/ListTest.hs
    >> test headOrTest
    >> test productTest

#### `:reload` and run tests

There is also a custom `:test` command defined in `.ghci` that will
invoke `:reload` and then `test` in a single action:

    >> :test test_List
    >> :test headOrTest

### Progression

We recommend you perform some exercises before others. The first step
is to inspect the introduction modules.

* [x] `Course.ExactlyOne`
* [x] `Course.Validation`

They contain examples of data structures and Haskell syntax. They do not contain
exercises and exist to provide a cursory examination of Haskell syntax. The next
step is to complete the exercises in `Course.Optional`.

After this, we recommend the following progression of modules:

* [x] `Course.List`
* [x] `Course.Functor`
* [x] `Course.Applicative`
* [x] `Course.Monad`
* [x] `Course.FileIO`
* [x] `Course.State`
* [x] `Course.StateT`
* [x] `Course.Extend`
* [x] `Course.Comonad`
* [x] `Course.Contravariant`
* [x] `Course.Compose`
* [x] `Course.Traversable`
* [x] `Course.ListZipper`
* [x] `Course.Parser` *(see also `Course.Person` for the parsing rules)*
* [x] `Course.MoreParser`
* [x] `Course.JsonParser`
* [x] `Course.Interactive`
* [x] `Course.Anagrams`
* [x] `Course.FastAnagrams`
* [ ] `Course.Cheque`

After these are completed, complete the exercises in the `projects` directory.

### Introducing Haskell

This section is a guide for the instructor to introduce Haskell syntax. Each of
these points should be covered before attempting the exercises.

* values, assignment
* type signatures `::` reads as *has the type*
  * The `->` in a type signature is *right-associative*
* functions are values
* functions take arguments
  * functions take *only one argument* but we approximate with spoken
    language
  * functions can be declared inline using *lambda expressions*
  * the `\` symbol in a lambda expression denotes a Greek lambda
* operators, beginning with non-alpha character, are in infix position by
  default
  * use in prefix position by surrounding with *(parentheses)*
* regular identifiers, beginning with alpha character, are in prefix position by
  default
  * use in infix position by surrounding with ``backticks``
* polymorphism
  * type variables *always* start with a lower-case character
* data types, declared using the `data` keyword
  * following the `data` keyword is the *data type name*
  * following the data type name are zero of more type variables
  * then `=` sign
  * data types have zero or more constructors
    * data type constructors start with an upper-case character, or colon `(:)`
  * following each constructor is a list of zero or more *constructor arguments*
  * between each constructor is a pipe symbol `(|)`
  * the `deriving` keyword gives us default implementations for some functions
    on that data type
  * when constructors appear on the left side of `=` we are *pattern-matching*
  * when constructors appear on the right side of `=` we are *constructing*
* type-classes

### Learning the tools

When this course is run in-person, some tools, particularly within Haskell, are
covered first.

* GHCi
  * `:type`
  * `:info`
* values
* type signatures
  * `x :: T` is read as *x is of the type T*
* functions are values
* functions take arguments
* functions take one argument
* lambda expressions
* operators (infix/prefix)
  * identifiers starting with `isAlpha` are prefix by default, infix surrounded in backticks (\`)
  * other identifiers are infix by default, prefix surrounded in parentheses
* data types
  * `data` keyword
  * recursive data types
* pattern matching
* `deriving` keyword
* type-classes
* type parameters
  * always lower-case 'a'..'z'
  * aka generics, templates C++, parametric polymorphism

### Parser grammar assistance

The exercises in `Parser.hs` can be assisted by stating problems in a specific way, with a conversion to code.

| English   | Parser library                    |
|-----------|-----------------------------------|
| and then  | `bindParser` `>>=`                |
| always    | `valueParser` `pure`              |
| or        | `\|\|\|`                             |
| 0 or many | `list`                            |
| 1 or many | `list1`                           |
| is        | `is`                              |
| exactly n | `thisMany n`                      |
| fail      | `failed`                          |
| call it x | `\x ->`                           |

### Monad comprehension

##### do-notation

* insert the word `do`
* turn `>>=` into `<-`
* delete `->`
* delete `\`
* swap each side of `<-`

##### LINQ

* write `from` on each line
* turn `>>=` into in
* delete `->`
* delete `\`
* swap each side of `in`
* turn value into `select`

### References

* [The Haskell `error` function](http://hackage.haskell.org/packages/archive/base/latest/doc/html/Prelude.html#v:error)

* [Glasgow Haskell Compiler](http://haskell.org/ghc)
