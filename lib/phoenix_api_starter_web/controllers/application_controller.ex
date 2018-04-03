defmodule PhoenixApiStarterWeb.ApplicationController do
  use PhoenixApiStarterWeb, :controller

  def not_found(conn, _params) do
    conn
    |> put_status(:not_found)
    |> render(PhoenixApiStarterWeb.ErrorView, :"404")
  end
end