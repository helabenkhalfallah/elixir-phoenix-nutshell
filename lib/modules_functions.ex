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
