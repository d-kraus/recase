defmodule Recase.Mixfile do
  use Mix.Project

  @version "0.0.1-pre"
  @url "https://github.com/sobolevn/recase"

  def project do
    [app: :recase,
     version: @version,
     elixir: "~> 1.2",
     deps: deps(),

     # Hex:
     docs: docs(),
     description: description(),
     package: package(),
     source_url: @url,
     homepage_url: @url,

     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,

      # Test coverage:
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: [
       "coveralls": :test,
       "coveralls.detail": :test,
       "coveralls.post": :test,
       "coveralls.html": :test,
     ],

     # Dialyzer:
     dialyzer: [plt_add_deps: :apps_direct, plt_add_apps: [:ecto]]]
  end

  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  defp deps do
    [# Testing:
     {:excoveralls, "~> 0.5", only: :test},
     {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
     {:dialyxir, "~> 0.5", only: [:dev], runtime: false},

     # Documentation:
     {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}]
  end

  defp description do
    "Convert strings to any case you need."
  end

  defp docs do
    [extras: ["README.md"], main: "readme"]
  end

  defp package do
    [maintainers: ["Nikita Sobolev"],
     licenses: ["MIT"],
     links: %{"GitHub" => @url},
     files: ~w(mix.exs README.md lib)]
  end
end
