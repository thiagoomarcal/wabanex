defmodule Wabanex.Trainings.Delete do
  alias Wabanex.{Repo, Training, Exercise}
  alias Ecto.UUID
  import Ecto.Query

  def call(id) do
    id
    |> UUID.cast()
    |> handle_response()
  end

  defp handle_response(:error) do
    {:error, "Invalid UUID"}
  end

  defp handle_response({:ok, uuid}) do
    traning = Repo.get(Training, uuid) |> Repo.preload(:exercises)
    Repo.delete(traning)
  end
end
