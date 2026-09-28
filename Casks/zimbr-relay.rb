cask "zimbr-relay" do
  version "0.1.1"
  sha256 "7037955ee41b32ce1d1f467b86b934263a58acd651e05e5cab1cd090c5021926"

  url "https://github.com/hspak/zimbr/releases/download/#{version}/zimbr-relay-#{version}-aarch64-macos.zip"
  name "Zimbr Relay"
  desc "Self-hosted iMessage relay for the Zimbr Wayland client"
  homepage "https://github.com/hspak/zimbr"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  # Keep the installed path consistent with Zimbr's per-user installer.
  app "Zimbr Relay.app", target: "#{Dir.home}/Applications/Zimbr Relay.app"
  binary "#{Dir.home}/Applications/Zimbr Relay.app/Contents/MacOS/relay", target: "zimbr-relay"
  binary "#{Dir.home}/Applications/Zimbr Relay.app/Contents/Resources/zimbr-relay-service"

  uninstall launchctl: "com.hsp.zimbr.relay",
            delete:    "#{Dir.home}/Library/LaunchAgents/com.hsp.zimbr.relay.plist"

  caveats <<~EOS
    Provision TLS and grant macOS permissions before starting the relay:
      https://github.com/hspak/zimbr/blob/main/docs/macos-relay.md#homebrew

    After installation or an upgrade, run:
      zimbr-relay-service start

    Uninstalling preserves ~/Library/Application Support/Zimbr.
  EOS
end
