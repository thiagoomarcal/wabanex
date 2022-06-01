defmodule Wabanex.Trainings.Update do
  alias Wabanex.{Repo, Training}

  def call(id, params) do
    Repo.get(Training, id)
    |> Training.changeset_update(params)
    |> Repo.update()
  end
end
