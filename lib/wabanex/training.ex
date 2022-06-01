defmodule Wabanex.Training do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.{Exercise, User}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:end_date, :start_date, :user_id]

  schema "trainings" do
    field :end_date, :date
    field :start_date, :date

    belongs_to :user, User
    has_many :exercises, Exercise, on_delete: :delete_all

    timestamps()
  end

  def changeset(params) do
    # Wabanex.User
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> unique_constraint([:email])
    |> cast_assoc(:exercises)
  end

  def changeset_update(struct, params \\ %{}) do
    struct
    |> cast(params, [:end_date, :start_date])
    |> validate_required([:end_date, :start_date])
  end
end
