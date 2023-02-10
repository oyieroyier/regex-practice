# RUBY REGULAR EXPRESSIONS

##### Introduction:

These are my personal notes on learning Ruby Regular Expressions.

<hr>

## Regular Expressions in General

Regex helps us find specific patterns inside string literals with the intent of extracting data from for further processing.

For example:

Think of an email address use case. With a regex, you can define what a valid email address looks like. It has an `@` symbol, must end with a `.com`, must have a certain number of characters etc.

By doing that, you will be able to distinguish a valid email address from an invalid email address.

## Ruby Regular Expressions

Ruby Regular Expressions are written between two forward slashes to differentiate them from other language syntax.

```ruby
/your regex goes in here/
```

### Deep-Dive into Metacharacters

Metacharacters are predefined shorthand in regex to match specific characters.

##### Glossary:
As far as Regex is concerned:

**Characters** means all _letters_ (lowercase and uppercase), _numbers_ and _underscores_.
**Digits** means numbers between 0 and 9.
***Whitespace** means _regular space_, _whitespace_ and _newline_


#### `.`

The dot is a wildcard character that can be used to match any character whatsoever except a new line.

```ruby

pass = "abc1234xy.z"

pass.scan(/./)
#  => "abc1234xy.z"
```

### Character Classes `[ ]`

Character Classes (Square Brackets) let us define a list of characters to match. We use them to filter and return all instances in the string of the specific passed inside it.

If you want the instances of the letters `abc` from the password `asdaojcvfscbadac`, wouldn't use this regex because it will be looking for a string that has the `abc` characters in succession:

```ruby
pass = "asdaojcvfscbadac"

pass.scan(/abc/)
# => []
```

Instead we will pass the charactes `abc` inside square brackets:

```ruby
pass = "asdaojcvfscbadac"

pass.scan(/[abc]/)
# => ["a", "a", "c", "c", "b", "a", "a", "c"]
```

### Negated Character Classes `[^ ]`

Previous examples matched characters whose instances we wanted.

Inserting a caret `^` sign before a pattern will match everything except those characters we pass inside the square brackets.

```ruby
pass = "asdaojcvfscbadac"

pp pass.scan(/[^abc]/)
# => ["s", "d", "o", "j", "v", "f", "s", "d"]
```


### Character Ranges

When you want to match (a) character(s) in a list of sequential characters. Inside square brackets use a dash `-` between two characters that exist sequentially to filter.

This regex will only match characters between the the letters a and i

```ruby
name = "Washigton"

name.scan(/[a-i]/)
# => ["a", "h", "i", "g"]
```

If you use a caret (`^`) before the range of characters, it will exclude those characters.
Using the same example as above:

```ruby
name = "Washigton"

name.scan(/[^a-i]/)
# => ["W", "s", "t", "o", "n"]
```

There are several shorthand methods for characters ranges:

	i. \w - matches all characters.
	ii. \d - matches all digits.
	iii. \s - matches all whitespace characters.
#### `\w`

The `\w` metacharacter is equal to the entire range of characters A-Z, a-z, 0-9 and underscores.

```ruby
we_want_only_characters = "dknj2324#@$#()rqdk^%#@(sjaif923401ad"

we_want_only_characters.scan(/\w+/)
# => ["dknj2324", "rqdk", "sjaif923401ad"] 

# returns only characters, and not special symbols.
```

Remember characters are case-sensitive. If you search for the range [A-Z], regex will not match the lowercase characters.

```ruby
chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

chars.scan(/[A-Z]/)
# => ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
# Only returns the uppercase letters because regex characters are case-sensitive.
```

#### `\d`

Can be used in place of any digit between 0 and 9.
The terminating backslash `\` distinguishes it from the regular `d` character.

```ruby

pass = %w[abc1234xyz adadcad dada343 fdfgd]

pass.scan(/\d/)
#  => [["1", "2", "3", "4"], [], ["3", "4", "3"], []]

# Empty square brackets indicate there is no number in that password.
```

### Repetition of ranges.
The previous examples show us how to match a range of characters, but what if we want match a number of repetition of characters?
Say we have the text 

