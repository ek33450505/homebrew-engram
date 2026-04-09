class Engram < Formula
  desc "Project Engram — persistent AI identity framework for Claude Code"
  homepage "https://github.com/ek33450505/project-engram"
  url "https://github.com/ek33450505/project-engram/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "700cb20ac4e4e6a4754575ac0b2b704d399ea3e49a4afbaa74568fba5d66d729"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    libexec.install Dir["*"]
    venv = libexec/"venv"
    system "python3.12", "-m", "venv", venv
    system "#{venv}/bin/pip", "install", "--no-cache-dir", libexec.to_s
    bin.install_symlink "#{venv}/bin/engram"
  end

  def caveats
    <<~EOS
      Engram is installed. To initialize the identity database:

        engram init

      To set up CAST session hooks:

        bash #{libexec}/scripts/cast-install.sh

      Docs: https://github.com/ek33450505/project-engram
    EOS
  end

  test do
    assert_match "0.6.1", shell_output("#{bin}/engram --version")
  end
end
