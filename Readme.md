Jetpack
=======

Introduction
------------

This is a project to help creating modular Heroku buildpacks.

The key concept is to have "plugins" (located in `lib/required`), which allows you to install various stuff. This all is
controlled though a jetpack.sh file at the root of your project.

Clearly, the current set of plugins is just here to help me running Python/Django services.


Prepacks
--------

One of the plugins is the `prepack`. The idea behind a prepack is simply a set of compiled binaries present in order for
commands to be able to run. The need for this kind of prepacks, varrying greatly from standard heroku buildpacks, has
emerged from the need to run OpenCV in Python.

Once you know how to compile your shit and a few conventions, it is very easy to create your own prepack.

### Structure

A prepack has 2 folders.

`.jetpack` holds all the compiled stuff and whatever you want to put in it. It will go into the compiled slug. The idea
is to organize the structure of it in several vendors, like `.jetpack/python`, `.jetpack/opencv`, etc. This is mainly
ad-hoc compiled things.

`.profile.d` into which you put all your profile.d scripts.

### Compiling

Basically, you need to `heroku run bash` on an empty dummy build app. Then, compile everything with the right prefix,
and when all is done, fetch the `.jetpack` folder and put it in a tarball.

By example, this is how to compile a Python prepack:

```
~/src/Python-2.7.6 $ ./configure --prefix=/app/.jetpack/python
~/src/Python-2.7.6 $ make
~/src/Python-2.7.6 $ make install
```

### Available prepacks

Currently, I have only made 1 prepack, that holds [Python + OpenCV](https://s3.amazonaws.com/activkonnect/jetpack/python-with-opencv_1.2.0.tar.gz).

Maybe another one is to come in order to be able to install NodeJS tools (`lessc` or `bower` not to name them).


License
-------

This project is under the terms of the WTFPL. See the attached COPYING file.
