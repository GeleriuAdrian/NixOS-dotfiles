{ config, ... }:

{
  services.wlsunset = {
    enable = true;
    latitude = "46.8"; # Cluj-Napoca
    longitude = "23.6";
    temperature = {
      day = 6500; # neutral white
      night = 3500; # warm amber
    };
  };
}
