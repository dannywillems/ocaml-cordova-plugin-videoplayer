# ocaml-cordova-plugin-videoplayer

Binding to
[cordova-plugin-videoplayer](https://github.com/moust/cordova-plugin-videoplayer)

[Example
application](https://github.com/dannywillems/ocaml-cordova-plugin-camera-example).

## What does cordova-plugin-videoplayer do ?

```
This plugin use the Cordova CLI's plugin command. To install it to your
application, simply execute the following (and replace variables).
```

Source: [cordova-plugin-videoplayer](https://github.com/moust/cordova-plugin-videoplayer)

## How to use ?

TODO

## ! BE CAREFUL !

The plugin creates a new object called *VideoPlayer*, but the object is
available when the *deviceready* event is handled.

We don't provide a *video_player* variable in this plugin (as said in the official
documentation on js_of_ocaml). If we did, *video_player* will be set to **undefined**
because the *video_player* object doesn't exist when we create the variable.

Instead, we provide a function *video_player* of type *unit -> video_player Js.t* which creates the
binding to the *VideoPlayer* object. You must call it when the deviceready
event is handled, eg

```OCaml
let on_device_ready =
  let vp = Videoplayer.video_player () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
