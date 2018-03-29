# phoenix-api-starter
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