defmodule StolenInstrumentsApiWeb.SearchController do
  use StolenInstrumentsApiWeb, :controller

  plug StolenInstrumentsApiWeb.Plugs.Auth

  def search(conn, params) do
    model = params["model"]
    year = params["year"]

    if !model || !year do
      json(conn, %{error: "Invalid model and year"})
    else
      # Dummy implementation.
      # Returns true for all model + string total character
      # count which are even
      combined_string = "" <> model <> year
      is_stolen = rem(String.length(combined_string), 2) == 1
      
      # Random sleep simulation (0-6 seconds)
      sleep_time = :rand.uniform(7) - 1
      Process.sleep(sleep_time * 1000)
      
      json(conn, %{isStolen: is_stolen})
    end
  end
end
