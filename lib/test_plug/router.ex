defmodule TestPlug.Router do
  use Plug.Router

  # Log request information
  plug(Plug.Logger)

  # Match requests and forwards them to the dispatcher Plug
  plug(:match)

  # Set the content-type and decoder
  plug(
    Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  get "/api/version" do
    version = Application.spec(:test_plug, :vsn) |> to_string()

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(%{version: version}))
  end
end
