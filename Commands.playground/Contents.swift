import Cocoa

func getAvailableData(from fileHandle: FileHandle) -> String {
  let newData = fileHandle.availableData
  
  if let string = String(data: newData,
                         encoding: .utf8) {
    return string
  }
  
  return ""
}


let process = Process()   // in objc it's called `NSTask`

process.executableURL = URL(fileURLWithPath: "/sbin/ping")

// arguments go here
process.arguments = ["-c", "5", "apple.com"]


// standards output goes here

let outPipe = Pipe()

let outFile = outPipe.fileHandleForReading

process.standardOutput = outPipe

do {
  try process.run()
  
  
  while process.isRunning {
    let newString = getAvailableData(from: outFile)
    print(newString.trimmingCharacters(in: .whitespacesAndNewlines))
  }
  
  let newString = getAvailableData(from: outFile)
  print(newString.trimmingCharacters(in: .whitespacesAndNewlines))
  
} catch {
  print(error)
}
