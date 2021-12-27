/*
A basic media player

Note, On windows at least, When running this via swift run, The readLine has a problem where you have to press enter once to be able to enter something for the program to read, And you have to repeat this for every command.
To fix this, Use swift build instead and run manually within you're file explorer.
*/
import Foundation
import synthizer
print("\nEnter path.")
if let path = readLine() {
do {
try synthizer.initialize(log_level: synthizer.LogLevel.DEBUG, logging_backend: synthizer.LoggingBackend.STDERR)
let ctx = try synthizer.Context()
let buf = try synthizer.Buffer.fromFile(path: path)
let gen = try synthizer.BufferGenerator(context: ctx)
try gen.buffer.set(buf)
try gen.looping.set(true)
let src = try synthizer.Source3D(context: ctx)
try src.addGenerator(gen)
try src.gain.set(0.5)
while true {
print("Enter command.")
if let txt = readLine() {
let cmd = txt.split(separator: " ")
if cmd.count == 0 {
continue
}
if cmd[0] == "pause" {
try? src.pause()
} else if cmd[0] == "play" {
try? src.play()
} else if cmd[0] == "gain" {
if cmd.count != 2 {
print("Usage: gain <Value>")
continue
}
if let val = Double(cmd[1]) {
try src.gain.set(val)
} else {
print("Error, Invalid input, Must be a valid integer.")
continue
}
} else if cmd[0] == "seek" {
if cmd.count != 2 {
print("Usage: seek <Seconds>")
continue
}
if let val = Double(cmd[1]) {
try gen.playbackPosition.set(val)
} else {
print("Error, Invalid input, Must be a valid floating point number.")
continue
}
} else if cmd[0] == "pos" {
if cmd.count != 4 {
print("Usage: pos <x> <y> <z>")
continue
}
let (x, y, z) = (Double(cmd[1]) ?? 0.0, Double(cmd[2]) ?? 0.0, Double(cmd[3]) ?? 0.0)
try src.position.set((x, y, z))
} else if cmd[0] == "quit" {
break
}
} else {
print("Unknown command!")
}
}
try ctx.destroy()
try gen.destroy()
try src.destroy()
try buf.destroy()
try synthizer.shutdown()
}
catch {
print(error)
}
}