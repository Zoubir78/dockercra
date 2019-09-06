see: https://mherman.org/blog/dockerizing-a-react-app/

# INSTALL

```sh
$ docker build -t dockercra .
$ docker run --rm -it -p 5000:80 dockercra
```

then go to your build static app [localhost:5000](http://localhost:5000)

# Dev

```sh
$ docker build --target dev -t dockercra .
$ docker run --rm -it -v "$PWD":/app -v /app/node_modules -p 3000:3000 dockercra
```

them go to your dev server app [localhost:3000](http://localhost:3000)
