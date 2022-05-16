defmodule Wabanex.Repo.Migrations.AlterTableUser do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :height, :float
      add :weight, :float
      add :fat_percentage, :integer
      add :muscle_mass_percentage, :integer
    end
  end
end
