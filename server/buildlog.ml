module Buildlog = struct
    open Core.Std
    open Async.Std
    open Cow
    open Caml

    type t = {
      id: int;
      buildid: int;
      log: string;
    } with json
end
