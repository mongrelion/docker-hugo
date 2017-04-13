### [Hugo](https://gohugo.io) Docker container

This image is based on official [Alpine](https://hub.docker.com/_/alpine) lightweight Docker image.

### Building this image

In order to build this image to need to pass the version of Hugo that you want to install in the container.

```
$ docker --build-arg HUGO_VERSION=0.20.1 build -t mongrelion/hugo:0.20.1
```

### Running it
Make sure that when you run the container you mount your Hugo site to `/usr/share/hugo`. For the rest,
you can call any of the available Hugo commands.

Here is an example on running the Hugo server:

```
$ docker run --rm -it -p 1313:1313 -v $PWD:/usr/share/hugo mongrelion/hugo:0.20.1 server --bind 0.0.0.0
```

Notice that we're asking Hugo to bind to the `0.0.0.0` interface because by default it binds itself to
`127.0.0.1`, rejecting all the connections coming outside of the container.


To generate your site simply 
```
$ docker run --rm -it -v $PWD:/usr/share/hugo mongrelion/hugo:0.20.1
```

This should produce the contents of your website under the `public/` directory.
