module Build = struct
    open Core.Std
    open Async.Std
    open Cow
    open Caml

    type t = {
      id: int;
      project: string;
      complete: bool;
    } with json
end
