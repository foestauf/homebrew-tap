cask "devlog" do
  version "0.1.0"

  on_arm do
    sha256 "ac5f5fdaf169741b01b10fd2a7b3a4661a45f4394d5f5f88e64a0984a4fd9226"
    url "https://github.com/foestauf/devlog/releases/download/v#{version}/devlog_#{version}_darwin_arm64.tar.gz"
  end

  on_intel do
    sha256 "1cec2362643352b22428be308a2d582dee38597052616170b2664b458f66a87b"
    url "https://github.com/foestauf/devlog/releases/download/v#{version}/devlog_#{version}_darwin_amd64.tar.gz"
  end

  name "DevLog"
  desc "Local development log broker"
  homepage "https://github.com/foestauf/devlog"

  binary "devlog"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/devlog"]
  end
end
