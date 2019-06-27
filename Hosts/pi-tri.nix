# NixOps configuration for pi-tri

{
  pi-tri =
    { config, pkgs, lib, ... }:

    {
      deployment.targetHost = "10.69.0.203";

      networking.hostName = "pi-tri";      # Define your hostname.
    };
}
