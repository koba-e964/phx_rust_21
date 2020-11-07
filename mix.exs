defmodule PhxRust21.MixProject do
  use Mix.Project

  def project do
    [
      app: :phx_rust_21,
      version: "0.1.0",
      elixir: "~> 1.11",
      # 1. 追加
      compilers: [:rustler] ++ Mix.compilers(),
      # 2. 追加
      rustler_crates: rustler_crates(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:rustler, "~> 0.21.0"}
    ]
  end

  # 3. この関数(rustler_crates)を追加
  defp rustler_crates() do
    # 呼び出し側Elixirモジュール NifExampleのマクロで使用するAtom
    [
      example: [
        path: "native/example",
        mode: if(Mix.env() == :prod, do: :release, else: :debug)
      ]
    ]
  end
end
