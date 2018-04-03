# phoenix-api-starter

[![Build Status](https://travis-ci.org/CMcDonald82/phoenix-api-starter.svg?branch=master)](https://travis-ci.org/CMcDonald82/phoenix-api-starter)

This project is a starting point for building an API backend with Phoenix. It is only the backend piece - you are free to use any frontend(s) you want, allowing maximum flexibility.

This project includes:
* Erlang/Elixir (latest)
* Phoenix (latest - 1.3)
* PostgreSQL 10

This project can be used for:
* Local Development: Run locally inside a Docker container, which includes a Postgres database container
* Production Builds: The Docker container has the same OS (Ubuntu 16.04) as the target server to deploy to so the build can use Distillery/Edeliver to build a release and deploy it to the server
* Tests: Tests (for the Phoenix app) will be run inside a Docker container, providing an even more isolated test environment

## Setup

1. Clone the repo into a new project directory and cd into it:
```
git clone https://github.com/CMcDonald82/phoenix-api-starter.git <new_project_dir> && cd <new_project_dir>
```

2. Add a public key to the project's top-level directory (this key will be used to SSH into the Docker container for building releases)
```
cp <path-to-ssh-pubkey-on-local-machine> ./ssh_key.pub
```

NOTE: The containers in steps 3.a and 3.b MUST be built before going further since some of the following steps depend on them

3. a.) Build the base Docker container (must be named phoenix-base since the docker-compose files depend on it). This container will be used for local development/debugging and running tests (locally and via Travis)
```
docker build --target base -t phoenix-api-base:latest .
```

3. b.) Build the build Docker container (must be named phoenix-build since the docker-compose files depend on it). This container will be used to build releases in
```
docker build -t phoenix-api-build:latest .
```

4. Get mix deps 
```
docker-compose run phoenix mix deps.get
```

5. Run the mix setup task to rename the app, create a new README, and initialize a fresh git repo for the new project
NOTE: Before running this task, you can optionally edit the config in config/setup.exs. You can specify the new name and otp_name of the project in either of 2 ways: pass the names in via the command line (as in the command below), or set the values of 'name' and 'otp_name' in the setup config file (config/setup.exs). You can also set git_reinit: true in the config/setup.exs file to have the setup task initialize a fresh new git repo for your new project.
```
docker-compose run phoenix mix setup <NewName> <new_otp_name>
```
```
EXAMPLE: If we want to rename our new project to My App this command would be:
docker-compose run phoenix mix setup MyApp my_app

Alternatively, we could set name: "MyApp" and otp_name: "my_app" in config/setup.exs and run the setup task without args:
docker-compose run phoenix mix setup
```

