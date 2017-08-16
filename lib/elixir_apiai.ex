defmodule ElixirApiai do
  @moduledoc """
  Documentation for ElixirApiai.
  """

  def start, do: :application.ensure_all_started(:httpoison)
end
