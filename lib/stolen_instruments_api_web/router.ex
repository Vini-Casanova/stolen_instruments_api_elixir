defmodule StolenInstrumentsApiWeb.Router do
  use StolenInstrumentsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", StolenInstrumentsApiWeb do
    pipe_through :api
    
    get "/search", SearchController, :search
  end
end
