{
  ...
}:

{
  launchd.agents = {
    aerospace = {
      command = "open -a Aerospace.app";
      serviceConfig.RunAtLoad = true;
    };

    docker = {
      command = "open -a Docker.app";
      serviceConfig.RunAtLoad = true;
    };

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
