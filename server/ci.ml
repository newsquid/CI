open Core.Std
open Async.Std
open Cow
open Opium.Std

module Project = struct
  (* this hack is needed because cow is relying on functions shadowed
     by core *)
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

module Build = struct
  (* this hack is needed because cow is relying on functions shadowed
     by core *)
  open Caml
  type t = {
    id: int;
    project: string;
    complete: bool;
  } with json
end

module Buildlog = struct
  (* this hack is needed because cow is relying on functions shadowed
     by core *)
  open Caml
  type t = {
    id: int;
    buildid: int;
    log: string;
  } with json
end

let print_param = get "/hello/:name" begin fun req ->
  `String ("Hello " ^ param req "name") |> respond'
end

let _ =
  App.empty
  |> print_param
  |> App.command
  |> Command.run
