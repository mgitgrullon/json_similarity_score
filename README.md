# JSON Object Similarity Score

Write a program using Ruby (Rails if possible) that will compare two json objects and give a score between 0 and 1 as to how similar they are, a score of 1 meaning the objects are identical. There are sample JSON files in the data directory for testing.


# Implementation specifics
[Jaro–Winkler distance wiki](https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance)

[Jaro–Winkler gem](https://github.com/tonytonyjan/jaro_winkler)

```
# controller
`app\controllers\compare_controller.rb`

# lib module
`lib\json_utilities\compare.rb`

# test file
`test\compare_test.rb`

# views
`app\views\compare`

```

# Tests

`rake test`
