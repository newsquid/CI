open Core.Std
open Async.Std
open Cow
open Opium.Std

module Project = struct
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
  open Caml
  type t = {
    id: int;
    project: string;
    complete: bool;
  } with json
end

module Buildlog = struct
  open Caml
  type t = {
    id: int;
    buildid: int;
    log: string;
  } with json
end

(*
 * Project endpoints
 *)

let projects = get "/projects" begin fun req ->
  `String "All the projects" |> respond'
end

let project = get "/projects/:name" begin fun req ->
  `String ("Project with name:" ^ param req "name") |> respond'
end

let projectbuild = post "projects/:name/build" begin fun req ->
  `String ("Now building Project with name:" ^ param req "name") |> respond'
end

(*
 * Build endpoints
 *)
let builds = get "/builds" begin fun req ->
  `String "All the current running builds" |> respond'
end

let build = get "/builds/:id" begin fun req ->
  `String ("Build with id " ^ param req "id") |> respond'
end

let buildlog = get "/builds/:id/log" begin fun req ->
  `String ("Build log for build with id " ^ param req "id") |> respond'
end


(*
 * Other endpoints
 *)
let root = get "/" begin fun req ->
  `String "Welcome to the CI server" |> respond'
end

let _ =
  App.empty
  |> projects
  |> project
  |> projectbuild
  |> root
  |> App.command
  |> Command.run
