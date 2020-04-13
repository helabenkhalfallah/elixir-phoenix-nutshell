# elixir_phoenix_nutshell

## Modules & functions 

```
defmodule ModuleFunctions do
  # This is module documentation @moduledoc
  # for a single line you can use ""
  # for multiple lines use """ """
  @moduledoc """
  Inside ModuleFunctions we handle module & functions features :
  - import
  - alias
  - declaring functions
  - single line function
  - anonymous functions

  Functions in elixir :
  - must always be a part of a module
  - name must be snake_case
  - there's no explicit return in Elixir
  - the return value of a function is the return value of its last expression

  Function documentation : @doc
  Function types specs :  @spec function_name(type1, type2) :: return_type
  If function can be written on a single line :
      def sub_numbers(a, b), do: a - b
  without end.

  Function starting with _ are never imported by default

  |> : pipe operator, result of the first operation is piped to the next

  Private function : defp
  Private function can only been called inside the module
  """

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
    |> div_numbers(2) # the last operation is a div so complex_operation return type will be float
  end

end
```
