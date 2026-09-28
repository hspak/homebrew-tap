cask "zimbr-relay" do
  version "0.2.0"
  sha256 "1a960228bbf42e82ce1eb0306a076e3d51e158facce32bc0d059c700cc12e127"

  url "https://github.com/hspak/zimbr/releases/download/#{version}/zimbr-relay-#{version}-aarch64-macos.zip"
  name "Zimbr Relay"
  desc "Self-hosted iMessage relay for the Zimbr Wayland client"
  homepage "https://github.com/hspak/zimbr"

  depends_on arch: :arm64
  depends_on macos: :golden_gate
  depends_on formula: ["mkcert", "python@3.14", "cryptography"]

  # Keep the installed path consistent with Zimbr's per-user installer.
  app "Zimbr Relay.app", target: "#{Dir.home}/Applications/Zimbr Relay.app"
  binary "#{Dir.home}/Applications/Zimbr Relay.app/Contents/MacOS/relay", target: "zimbr-relay"
  binary "#{Dir.home}/Applications/Zimbr Relay.app/Contents/Resources/zimbr-relay-service"
  binary "#{Dir.home}/Applications/Zimbr Relay.app/Contents/Resources/zimbr-relay-setup"
  binary "#{Dir.home}/Applications/Zimbr Relay.app/Contents/Resources/zimbr-relay-admin"

  uninstall launchctl: "com.hsp.zimbr.relay",
            delete:    "#{Dir.home}/Library/LaunchAgents/com.hsp.zimbr.relay.plist"

  caveats <<~EOS
    Set up and start the relay (use a hostname reachable from Linux):
      zimbr-relay-setup relay.example

    Grant macOS permissions as described here:
      https://github.com/hspak/zimbr/blob/main/docs/macos-relay.md#homebrew

    After an upgrade, migrate credentials and start the service:
      zimbr-relay-setup

    Uninstalling preserves ~/Library/Application Support/Zimbr.
  EOS
end
