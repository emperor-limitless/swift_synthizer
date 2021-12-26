# swift_synthizer
A swift binding to the [synthizer](https://github.com/synthizer/synthizer) audio library.
## Building and platform support.
This should build on windows, Mac and linux, Possiblly iOS, But if those requirements are met.
The library should be built and on the current directory where this package is being depended on, E.G. If you have a program called beeper in the directory where Package.swift and Sources and other files are stored, The dynamic library of synthizer should be in the same directory, For windows 64bit, This already exists on the package repo, Just clone and go to libs/windows/synthizer.lib, Other platforms doesn't exist there because on linux it's probably dependent on the distroe, And I'm not sure how to build on mac yet.

## Examples
Examples exist on the examples directory.
## What can we do now
 - Initialize, With config or without.
 - Load libsndfile.
 - Create context.
 - Create generators, Streaming generator and buffer generator, For now.
 - Creating sources, AngularPanned, ScalarPanned, Direct, And 3d.
 - Create buffers.
 - Create streams, No custom yet.
More is coming soon, And if you discovered any buggs, Please submit an issue.