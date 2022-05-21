defmodule Wabanex.Users.Delete do
  alias Wabanex.{Repo, User}
  alias Ecto.UUID

  def call(id) do
    id
    |> UUID.cast()
    |> handle_response()
  end

  defp handle_response(:error) do
    {:error, "Invalid UUID"}
  end

  defp handle_response({:ok, uuid}) do
    user = Repo.get(User, uuid)
    Repo.delete(user)
  end
end
