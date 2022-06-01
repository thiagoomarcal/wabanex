defmodule WabanexWeb.Resolvers.Training do
  def create(%{input: params}, _context), do: Wabanex.Trainings.Create.call(params)

  def update(%{id: training_id, user: params}, _context),
    do: Wabanex.Trainings.Update.call(training_id, params)

  def delete(%{id: training_id}, _context), do: Wabanex.Trainings.Delete.call(training_id)
end
