(* -------------------------------------------------------------------------- *)
type scaling_mode_type          =
  | Scale_to_fit [@js 1]
  | Scale_to_fit_with_cropping [@js 2]
  [@@js.enum]

type options = private Ojs.t

val create_options :
  ?volume:(float [@js.default 0.5])                             ->
  ?scaling_mode:(scaling_mode_type [@js.default Scale_to_fit])  ->
  unit                                                          ->
  options
[@@js.builder]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* play [file path] [options] [completed_callback] [error_callback] *)
val play :
  string                                                            ->
  ?options:(options [@js.default create_options ()])                ->
  ?completed_callback:((unit -> unit) [@js.default (fun () -> ())]) ->
  ?error_callback:((string -> unit) [@js.default (fun e -> ())])    ->
  unit                                                              ->
  unit
[@@js.global "VideoPlayer.play"]
(* ---------------------------------------------------------------------- *)

(* ---------------------------------------------------------------------- *)
(* Close a played video *)
(* close *)
val close          : unit -> unit
[@@js.global "VideoPlayer.close"]
(* ---------------------------------------------------------------------- *)
