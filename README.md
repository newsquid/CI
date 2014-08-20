#CI

Light weight REST base CI server written in OCaml

#Dependencies

Get the dependencies by running:

> make deps

#Build

> make build

Will create a ci.native executable file.

#Run

> make run

Will compile the ci.native executable file and run it.

#Config

#API

##Project

|Method | URL                            |Input                      |Output                       | Description                  |  
|-------|--------------------------------|---------------------------|-----------------------------|------------------------------|
|GET    | /projects                      | params: search, page      | \[project,project..\]       | Gets all projects no scripts |
|GET    | /project/:name                 |                           | project                     | Get project with name        | 
|POST   | /project/:name/build           | optional params: key      | build                       | Build the project            |

##Build
|Method | URL                            |Input                      |Output                       | Description                  |  
|-------|--------------------------------|---------------------------|-----------------------------|------------------------------|
|GET    | /builds                        | params: page              | \[build,build..\]           | Get current running builds   |
|GET    | /build/:id                     |                           | build                       | Get info on the build        |
|GET    | /build/:id/log                 |                           | buildlog                    | Get the build log            |

##Types

##project:
```json
{
    "name"          : "A unique name",
    "description"   : "A description of the project",
    "git"           : "github.com/user/repo",
    "gitbranch"     : "master",
    "buildscript"   : "build script",
    "buildkey"      : "key to build project"
}
```

##build
```json
{
    "id"        : 1,
    "project"   : "project for the build",
    "complete"  : true
}
```

##build log
First and last entry is used to get partial build logs on the next request.
```json
{
    "id"            : 1,
    "buildid"       : 1,
    "log"           : "log output"
}
```

##Authentication
Using HTTP basic authentication

* Authorization: Basic base64(username:password)
* See more at [Wikipedia](http://en.wikipedia.org/wiki/Basic_access_authentication#Client_side)

For building without access to the system (remote or via other system) a key can
be provided in the URL:

/project/:id/build?key={key}
