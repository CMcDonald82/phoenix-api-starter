defmodule PhoenixApiStarterWeb.Router do
  use PhoenixApiStarterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixApiStarterWeb do
    pipe_through :api
  end
end
