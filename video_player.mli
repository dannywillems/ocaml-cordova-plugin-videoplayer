(* -------------------------------------------------------------------------- *)
class options : Ojs.t ->
  object
    inherit Ojs.obj
    method volume        : float
    method scaling_mode  : int
  end

(* -------------------------------------------------------------------------- *)
type scaling_mode_type          =
  | Scale_to_fit [@js 1]
  | Scale_to_fit_with_cropping [@js 2]
  [@@js.enum]

[@@@js.stop]
val scale_to_fit                : scaling_mode_type
val scale_to_fit_with_cropping  : scaling_mode_type
[@@@js.start]

[@@@js.implem
let scale_to_fit                = Scale_to_fit
let scale_to_fit_with_cropping  = Scale_to_fit_with_cropping
]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val create_options :
  ?volume:(float [@js.default 0.5])                             ->
  ?scaling_mode:(scaling_mode_type [@js.default Scale_to_fit])  ->
  unit                                                          ->
  options
[@@js.builder]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class video_player : Ojs.t ->
  object
    inherit Ojs.obj
    (* ---------------------------------------------------------------------- *)
    (* Play a video in fullscreen mode *)
    (* play [file path] *)
    method play           : string            -> (* file_path *)
                            unit
    (* play [file path] [options] *)
    method play_opt       : string            -> (* file_path *)
                            options           -> (* options *)
                            unit
    [@@js.call "play"]
    (* play [file path] [options] [completed_callback] *)
    method play_completed : string            -> (* file_path *)
                            options           -> (* options *)
                            (unit -> unit)    -> (* completed_callback *)
                            unit
    [@@js.call "play"]
    (* play [file path] [options] [completed_callback] [error_callback] *)
    method play_err       : string            -> (* file_path *)
                            options           -> (* options *)
                            (unit -> unit)    -> (* completed_callback *)
                            (string -> unit)  -> (* error_callback *)
                            unit
    [@@js.call "play"]
    (* ---------------------------------------------------------------------- *)

    (* ---------------------------------------------------------------------- *)
    (* Close a played video *)
    (* close *)
    method close          : unit
    (* ---------------------------------------------------------------------- *)
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val t : unit -> video_player
[@@js.get "VideoPlayer"]
(* -------------------------------------------------------------------------- *)
