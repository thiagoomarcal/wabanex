defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "Logic user representation"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :height, non_null(:float)
    field :weight, non_null(:float)
    field :fat_percentage, non_null(:integer)
    field :muscle_mass_percentage, non_null(:integer)
    field :trainings, list_of(:training)
  end

  input_object :create_user_input do
    field :name, non_null(:string), description: "Users name"
    field :email, non_null(:string), description: "Users email"
    field :password, non_null(:string), description: "Users password"
    field :height, non_null(:float), description: "Users height"
    field :weight, non_null(:float), description: "Users weight"
    field :fat_percentage, non_null(:integer), description: "Users fat percentage"
    field :muscle_mass_percentage, non_null(:integer), description: "Users muscle mass percentage"
  end

  input_object :udpate_user_params do
    field :email, non_null(:string), description: "Users email"
    field :password, non_null(:string), description: "Users password"
    field :height, non_null(:float), description: "Users height"
    field :weight, non_null(:float), description: "Users weight"
    field :fat_percentage, non_null(:integer), description: "Users fat percentage"
    field :muscle_mass_percentage, non_null(:integer), description: "Users muscle mass percentage"
  end
end
