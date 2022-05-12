defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exist, returns the data" do
      expected_response =
        {:ok,
         %{
           "Dani" => 23.437499999999996,
           "Diego" => 23.04002019946976,
           "Gabul" => 22.857142857142858,
           "Rafael" => 24.897060231734173,
           "Rodrigo" => 26.234567901234566
         }}

      %{"filename" => "students.csv"}
      |> IMC.calculate()

      assert expected_response
    end

    test "when the wrong filename is given, returns an error" do
      expected_response = {:error, "Error while opening the file"}

      params = %{"filename" => "dummy.csv"}
      response = IMC.calculate(params)
      assert response == expected_response
    end
  end
end
