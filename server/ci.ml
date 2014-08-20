open Project
open Build
open Buildlog
open Core.Std
open Async.Std
open Cow
open Opium.Std


(*
 * Project endpoints
 *)
let projects = get "/projects" begin fun req ->
    `String "All the project" |> respond'
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
