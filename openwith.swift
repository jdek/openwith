// openwith: 0.0.1
// RELEASED INTO THE PUBLIC DOMAIN, NO WARRANTY

import Foundation
import AppKit
import UniformTypeIdentifiers

var stderr = FileHandle.standardError
extension FileHandle : TextOutputStream {
    public func write(_ string: String) {
        guard let data = string.data(using: .utf8) else { return }
        self.write(data)
    }
}

if CommandLine.argc < 3 {
    print("usage: openwith <bundle> [extension ...]", to: &stderr)
    exit(EXIT_FAILURE)
}

var bundle = CommandLine.arguments[1];
var fileExts = CommandLine.arguments.suffix(from: 2);

for fileExt in fileExts {
    for type in UTType.types(tag: fileExt, tagClass: .filenameExtension, conformingTo: nil) {
        print("\(fileExt) (\(type.identifier)) -> \(bundle)", to: &stderr)
        if LSSetDefaultRoleHandlerForContentType(type.identifier as CFString, .all, bundle as CFString) != 0 {
            exit(EXIT_FAILURE)
        }
    }
}
exit(EXIT_SUCCESS)
