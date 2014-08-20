module Projects = struct
    open Core.Std
    open Async.Std
    open Cow
    open Caml

    type t = {
      name: string;
      description: string;
      git: string;
      gitbranch: string;
      buildscript: string;
      buildkey: string;
    } with json

end
