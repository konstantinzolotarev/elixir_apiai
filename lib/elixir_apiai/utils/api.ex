defmodule ElixirApiai.Utils.Api do
  @moduledoc """
  Elixir wrapper for the [Api.ai API v1](https://api.ai/docs/reference/agent/)
  """

  use HTTPotion.Base

  @host "https://api.api.ai/v1/"

  defp get_lang, do: Application.get_env(:elixir_apiai, :language)
  defp get_version, do: Application.get_env(:elixir_apiai, :version)
  defp get_token, do: Application.get_env(:elixir_apiai, :access_token, System.get_env("SECRET_KEY"))

  defp process_url(url), do: @host <> url

  defp process_request_headers(headers) do
    headers ++ [
      {"Authorization", "Bearer #{get_token()}"},
      {"Content-Type", "application/json; charset=utf-8"}
    ]
  end

  defp append_query_string(url, options) do
    query = case options[:query] do
      nil -> %{v: get_version()}
      %{v: _} -> options[:query]
      map -> %{map | v: get_version()}
    end

    super(url, options ++ [query: query])
  end

  defp process_request_body(req) when is_binary(req), do: req
  defp process_request_body(req) do
    case req do
      %{lang: _} -> req
      _ -> Map.put(req, :lang, get_lang())
    end
    |> Poison.encode!()
  end

  defp process_response_body(""), do: ""
	defp process_response_body(body), do: Poison.decode!(body, keys: :atoms)

  def get(url), do: super(url) |> ok_error
  def post(url, body), do: super(url, body) |> ok_error
  def delete(url), do: super(url) |> ok_error

  defp ok_error(%{status_code: 200, body: body}), do: status({:ok, body})
  defp ok_error(%{status_code: 201, body: body}), do: status({:ok, body})
  defp ok_error(resp), do: {:error, resp}

  defp status({:ok, %{status: %{code: 200, errorType: "success"}}} = data), do: data
  defp status({:ok, data}), do: {:error, data}

end
