defmodule OperatorsTypesCond do
  @moduledoc """
  1. Values types :

  - Integers :
    * decimal : 1234
    * hexa : 0xcafe
    * octal : Oo765
    * binary : 0b1010
  There is no fixed limit on the size of integers.
  There internal representation grows to fit their magnitude.

  - Float :
  IEEE754
  Double precision
  16 digits -> 10^308


  2. Atoms :
  Atom start with `:` :
  Examples :  :fred       :is_binary?    :true
  Atom name = it value
  Atom are best used for named constant (memory + performance)
  variable = :some_atom

  3. Ranges :
  Ranges are represented as `start..end` (both inclusive)
    1..10 #=> 1..10
    lower..upper = 1..10
    [lower, upper] # => [1, 10]


  4. Tuples :
  Ordered collection of values
  Once created it cannot be modified

  5. Strings and char lists
  "hello" # string
  'hello' # char list

  Strings are all encoded in UTF-8:
  "héllò" #=> "héllò"

  Concatenation :
  "hello " <> "world"  #=> "hello world"

  6. Operators
  1 + 1  #=> 2
  10 - 5 #=> 5
  5 * 2  #=> 10
  10 / 2 #=> 5.0

  In elixir the operator `/` always returns a float.

  To do integer division use `div`
  div(10, 2) #=> 5

  To get the division remainder use `rem`
  rem(10, 3) #=> 1

  There are also boolean operators: `or`, `and` and `not`.
  These operators expect a boolean as their first argument.

  true and true #=> true
  false or true #=> true

  1 and true
  => ** (BadBooleanError) expected a boolean on left-side of "and", got: 1

  1 || true  #=> 1
  false && 1 #=> false
  nil && 20  #=> nil
  !true #=> false

  For comparisons we have: `==`, `!=`, `===`, `!==`, `<=`, `>=`, `<` and `>`
  1 == 1 #=> true
  1 != 1 #=> false
  1 < 2  #=> true

  `===` and `!==` are more strict when comparing integers and floats:
  1 == 1.0  #=> true
  1 === 1.0 #=> false

  7. Control Flow

  `if` expression
    if false do
    "This will never be seen"
    else
    "This will"
    end

  There's also `unless`
    unless true do
    "This will never be seen"
    else
    "This will"
    end

  `case` allows us to compare a value against many patterns:
    case {:one, :two} do
      {:four, :five} ->
        "This won't match"
      {:one, x} ->
        "This will match and bind `x` to `:two` in this clause"
      _ ->
        "This will match any value"
    end

  `cond` lets us check for many conditions at the same time.
   Use `cond` instead of nesting many `if` expressions.

    cond do
      1 + 1 == 3 ->
        "I will never be seen"
      2 * 5 == 12 ->
        "Me neither"
      1 + 2 == 3 ->
        "But I will"
    end

  It is common to set the last condition equal to `true`, which will always match.
    cond do
      1 + 1 == 3 ->
        "I will never be seen"
      2 * 5 == 12 ->
        "Me neither"
      true ->
        "But I will (this is essentially an else)"
    end


  `try/catch` is used to catch values that are thrown, it also supports an
   `after` clause that is invoked whether or not a value is caught (finally).
      try do
          throw(:hello)
      catch
          message -> "Got \#{message}."
      after
          IO.puts("I'm the after clause.")
      end
  """

  import IO

  # declaring a tuple
  person = {"bob", 25}

  # get an element from tuple
  # zero based index
  age = elem(person, 1)
  # Age : 25
  puts('Age : #{age}')

  # it doesn't modify the original peron but create new one and keeping the old intact
  # transformation rather mutation
  # data in Elixir are immutable
  person2 = put_elem(person, 1, 26)
  age2 = elem(person2, 1)
  # Age2 : 26
  puts('Age2 : #{age2}')
end
