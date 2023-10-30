defmodule EmbedbaseEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :embedbase_ex,
      version: "0.1.0",
      description: "embedbase interactor elixir sdk",
      # elixir: "~> 1.11.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["skyblue"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/tiankonglan/embedbase_interactor_ex"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:httpoison, "~> 2.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      # struct handler
      {:ex_struct_translator, "~> 0.1.1"},
      # utils
      {:poison, "~> 3.1"},
    ]
  end
end
