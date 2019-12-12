# faust_recursionerror

Checkout:

```
git clone https://github.com/trodery/faust_recursionerror.git
```

Build ubuntu Dockerfile:

```
cd faust_recursionerror
docker-compose build ubuntu
```

Start stack:

```
docker-compose up -d
```

Run bash in interactive mode in ubuntu container:

```
docker-compose exec ubuntu bash
```

Run `hello_world` example app with the latest `faust` from `pypi`:

```
. venv/bin/activate
faust -A hello_world worker -l info
```

Checkout last working `faust` commit from `master` and install:

```
./checkout_good_commit.sh
```

Checkout broken `faust` commit from `master` and install:

```
./checkout_bad_commit.sh
```


