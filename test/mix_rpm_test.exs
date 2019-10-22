defmodule MixRpmTest do
  use ExUnit.Case
  alias Config
  alias Mix.Task.Release.Rpm.Build

  setup do
    File.rm_rf Path.join([File.cwd!, "_build", "rpm"])
    config = %{name: "test", version: "0.0.1"}
    {:ok, config: Map.merge(config, %{rpm: true, build_arch: "x86_64"})}
  end

  def create_rpm_build(config) do
    build_arch = Build.get_config_item config, :build_arch, "x86_64"
    rpm_file = Build.rpm_file_name(config.name, config.version, build_arch)
    IO.puts rpm_file
  end

  test "creates the spec work directories", meta do
    Build.run(meta[:config])
  end

  test "creates RPMS arch path", meta do
    %{meta[:config] | build_arch: "i386"}
    |> Build.run
    assert File.exists?(Path.join([File.cwd!, "_build", "test", "rpm", "RPMS", "i386"]))
  end 
end
