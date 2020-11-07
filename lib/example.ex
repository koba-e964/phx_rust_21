defmodule NifExample do
  use Rustler, otp_app: :phx_rust_21, crate: :example

  def add(_a, _b), do: exit(:nif_not_loaded)
end
