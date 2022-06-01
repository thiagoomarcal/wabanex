defmodule Wabanex.Exercises.Delete do
  alias Wabanex.{Repo, Exercise}
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
    exercise = Repo.get(Exercise, uuid)
    Repo.delete(exercise)
  end
end
