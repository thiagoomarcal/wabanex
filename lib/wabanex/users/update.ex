defmodule Wabanex.Users.Update do

  alias Wabanex.{Repo, User}

  def call(id, params) do
    Repo.get(User, id)
    |> User.changeset_update(params)
    |> Repo.update
  end
end
