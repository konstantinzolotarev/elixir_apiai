defmodule ElixirApiai.Mixfile do
  use Mix.Project

  @version File.read!("VERSION") |> String.trim

  def project do
    [
      app: :elixir_apiai,
      version: @version,
      elixir: "~> 1.4",
      docs: [ extras: ["README.md"] ],
      description: "Elixir Api.ai SDK client",
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :httpotion]
    ]
  end

  defp deps do
    [
      {:poison, "~> 3.1.0"},
      {:httpotion, "~> 3.0.3"}
    ]
  end

  defp package do
    [ files: [ "lib", "mix.exs", "README.md", "VERSION", "LICENSE" ],
      maintainers: [ "Konstantin Zolotarev" ],
      licenses: [ "MIT" ],
      links: %{ "GitHub" => "https://github.com/konstantinzolotarev/elixir_apiai" } ]
  end
end
