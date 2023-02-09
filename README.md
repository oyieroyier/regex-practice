# RUBY REGULAR EXPRESSIONS

##### Introduction:
These are my personal notes on learning Ruby Regular Expressions.

<hr>

## Regular Expressions in General

Regex helps us find specific patterns inside string literals. 

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
**Characters** means all _letters_, _numbers_ and _underscores_.
**Digits** means numbers between 0 and 9.

#### `\d`
Can be used in place of any digit between 0 and 9.
The terminating backslash `\` distinguishes it from the regular `d` character.

```ruby

pass = %w[abc1234xyz adadcad dada343 fdfgd]

pass.scan(/\d/)
#  => [["1", "2", "3", "4"], [], ["3", "4", "3"], []]

# Empty square brackets indicate there is no number in that password.
```

#### `.`
The dot is a wildcard character that can be used to match any character whatsoever.

```ruby

pass = "abc1234xy.z"

pass.scan(/./)
#  => "abc1234xy.z"
```

### `[ ]`

Square brackets are used to filter and return all instances in the string of the specific passed inside it.

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

#### `[^ ]`

The previous example filtered in characters whose instances we wanted.

Inserting a `^` sign before a pattern will result in those characters not being returned.

```ruby
pass = "asdaojcvfscbadac"

pp pass.scan(/[^abc]/)
# => ["s", "d", "o", "j", "v", "f", "s", "d"]
```

### Character ranges
When you want to match (a) character(s) in a list of sequential characters. Inside square brackets use a dash `-` between two characters that exist sequentially to filter.

This regex will only match characters between the the letters a and i

```ruby
name = "Washigton"

name.scan(/[a-i]/)
# => ["a", "h", "i", "g"]
```

If you use a hat (`^`) before the range of characters, it will exclude those characters.
Using the same ecxample as above:

```ruby
name = "Washigton"

name.scan(/[^a-i]/)
# => ["W", "s", "t", "o", "n"]
```