defmodule ElixirApiai.Mixfile do
  use Mix.Project

  def project do
    [
      app: :elixir_apiai,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpotion]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~> 3.1.0"},
      {:httpotion, "~> 3.0.3"}
    ]
  end
end
