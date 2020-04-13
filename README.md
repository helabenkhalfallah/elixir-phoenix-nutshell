# Commands

Compile project :
```
mix compile
```

Format file :
```
mix format
```

Launch code analysis (credo, dialyzer) :
```
mix code_review
```

Generate docs & docs coverage :

```
mix generate_docs
```

Run unit tests & collect coverage :
```
MIX_ENV=test mix test_ci
```

# Modules & functions 

```elixir
defmodule ModulesFunctions do
  # This is module documentation @moduledoc
  # for a single line you can use ""
  # for multiple lines use """ """
  @moduledoc """
  Inside ModuleFunctions we handle module & functions features :
  - import
  - alias
  - declaring functions
  - single line function
  - private function
  - function starting with _
  - function default parameters values
  - anonymous functions

  Functions in elixir :
  - must always be a part of a module
  - name must be snake_case
  - there's no explicit return in Elixir
  - the return value of a function is the return value of its last expression

  Function documentation : @doc
  Function types specs :  @spec function_name(type1, type2) :: return_type
  @spec are analysed by dialyzer

  If function can be written on a single line :
      def sub_numbers(a, b), do: a - b
  without end.

  Function starting with _ are never imported by default

  |> : pipe operator, result of the first operation is piped to the next

  Private function : defp
  Private function can only been called inside the module


  Anonymous functions
  square = fn(x) -> x * x end
  square.(5) #=> 25

  They also accept many clauses and guards.
  Guards let you fine tune pattern matching,
  they are indicated by the `when` keyword:

    f = fn
      x, y when x > 0 -> x + y
      x, y -> x * y
    end

    f.(1, 3)  #=> 4
    f.(-1, 3) #=> -3
  """

  # defining a constant
  @pi 3.14159

  @doc "Sum two numbers (multiline function)"
  @spec sum_numbers(integer, integer) :: integer
  def sum_numbers(a, b) do
    a + b
  end

  @doc "Sub two numbers (single line function)"
  @spec sub_numbers(integer, integer) :: integer
  def sub_numbers(a, b), do: a - b

  @doc "Multiply two numbers (single line function)"
  @spec mul_numbers(integer, integer) :: integer
  def mul_numbers(a, b), do: a * b

  # div return a float always
  @spec div_numbers(integer, integer) :: float
  defp div_numbers(a, b), do: a / b

  @doc "Function starting with _ are never imported by default"
  @spec _complex_operation(integer, integer) :: float
  def _complex_operation(a, b) do
    sum_numbers(a, b)
    |> mul_numbers(2)
    |> sub_numbers(1)
    # the last operation is a div so complex_operation return type will be float
    |> div_numbers(2)
  end

  # if a isn't given it take 2
  # if b isn't given it take 3
  @doc "Function with default value"
  @spec rectangle_area(integer, integer) :: float
  def rectangle_area(a \\ 2, b \\ 3), do: a * b * @pi
end
```

# Operators, types & cond 

```elixir
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
          message -> "Got #{message}."
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
```

# List 

```elixir
defmodule ListOperations do
  @moduledoc """
  This module show some list operations examples :
  - enumerate elements
  - get element at position
  - replace at position
  - insert at position
  - map
  - filter
  - reduce
  - Keywords list
  - IO list

  More details :
  https://hexdocs.pm/elixir/List.html#content
  https://devhints.io/elixir
  """
end
```

# Map & MapSet

```elixir
defmodule MapOperations do
  @moduledoc """
  This module show some map operations examples :
    - init
    - value for key
    - fetch & fetch!
    - store an element
    - update an element
    - delete an element
    - MapSet

  More details :
  https://hexdocs.pm/elixir/Map.html#content
  https://hexdocs.pm/elixir/MapSet.html#content
  https://devhints.io/elixir
  """
end
```
