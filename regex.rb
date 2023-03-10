# \d
pass = %w[abc1234xyz adadcad dada343 fdfgd]

p pass.map {|i| i.scan(/\d/)}


# .
pass = "abc1234xy.z"

p pass.scan(/./)


# []
pass = "asdaojcvfscbadac"

pp pass.scan(/[abc]/)

# [^]
pass = "asdaojcvfscbadac"

pp pass.scan(/[^abc]/)

# Character ranges
# [a-z]

name = "Washigton"

p name.scan(/[a-i]/)

name = "Washigton"

p name.scan(/[^a-i]/)

chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

p chars.scan(/[A-Z]/)