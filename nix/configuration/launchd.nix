{
  ...
}:

{
  launchd.agents = {
    linearMouse = {
      command = "open -a LinearMouse.app";
      serviceConfig.RunAtLoad = true;
    };

    postgres = {
      command = "open -a Postgres.app";
      serviceConfig.RunAtLoad = true;
    };
  };
}
