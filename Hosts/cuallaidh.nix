# NixOps configuration for cuallaidh

{
  cuallaidh =
    { config, pkgs, lib, ... }:

    {
      deployment.targetHost = "172.105.197.118";

      networking.hostName = "cuallaidh";      # Define your hostname.
    };
}
