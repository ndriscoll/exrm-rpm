defmodule ExrmRpm.Mixfile do
  use Mix.Project

  def project do
    [app: :mix_rpm,
     version: "0.4.0",
     elixir: "~> 1.9",
     elixirc_paths: elixirc_paths(Mix.env()),
     compilers: Mix.compilers(),
     start_permanent: Mix.env() == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp description do
    """
    Adds simple Red Hat Package Manager (RPM) generation as a Mix task.
    The generated RPM file includes the Elixir release and an init.d script to 
    manage the project's service.
    """
  end

  defp deps do
    []
  end

  defp package do
    [ files: ["lib", "priv", "mix.exs", "README.md", "LICENSE"],
      contributors: ["Stephen Pallen"],
      maintainers: ["Stephen Pallen"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/smpallen99/exrm-rpm"}
    ]
  end
end
