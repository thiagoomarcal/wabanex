defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.Users.Create, as: UserCreate

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{name: "Aldeci", email: "aldeci.leandro@gmail.com", password: "123456"}

      {:ok, %User{id: user_id}} = UserCreate.call(params)

      query = """
        {
          getUser(id: "#{user_id}") {
            name
            email
          }
        }
      """

      expected_response = %{
        "data" => %{"getUser" => %{"email" => "aldeci.leandro@gmail.com", "name" => "Aldeci"}}
      }

      reponse =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      assert reponse == expected_response
    end
  end

  describe "users mutations" do
    test "when all params are valid, creates the user", %{conn: conn} do
      mutation = """
        mutation {
          createUser(input:{name: "Aldeci", email: "aldeci.leandro@gmail.com", password: "123456"}) {
            id
            name
          }
        }
      """

      # expected_response = %{"data" => %{"createUser" => %{"id" => _id, "name" => "Aldeci"}}}

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{"data" => %{"createUser" => %{"id" => _id, "name" => "Aldeci"}}} = response
    end
  end
end
