{
  services = {
    openvpn.servers = {
      thmVPN = {
        config = '' config /home/db/openvpn/dillon.barrera.ovpn '';
        autoStart = false;
        updateResolvConf = true;
      };
    };
  };
}
