defmodule StolenInstrumentsApiWeb.Plugs.Auth do
  import Plug.Conn
  import Phoenix.Controller

  def init(opts), do: opts

  def call(conn, _opts) do
    auth_token = System.get_env("AUTH_TOKEN")
    
    if !auth_token do
      raise "Missing AUTH_TOKEN env"
    end

    access_token = get_req_header(conn, "x-access-token") |> List.first()

    cond do
      !access_token ->
        conn
        |> put_status(:forbidden)
        |> json(%{error: "Missing access token"})
        |> halt()

      access_token != auth_token ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Invalid access token"})
        |> halt()

      true ->
        conn
    end
  end
end
