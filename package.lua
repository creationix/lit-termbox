return {
  name = "creationix/termbox",
  version = "1.0.5",
  homepage = "https://github.com/creationix/lit-termbox",
  dependencies = {
    "creationix/ffi-loader@1.0.0",
  },
  files = {
    "*.lua",
    "*.h",
    "!termbox",
    "!test-app",
    "$OS-$ARCH/*",
  }
}
