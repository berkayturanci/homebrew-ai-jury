class AiJury < Formula
  include Language::Python::Virtualenv

  desc "Cross-vendor multi-agent PR & code review jury"
  homepage "https://ai-jury.dev/"
  url "https://files.pythonhosted.org/packages/67/e2/5f50762f080511a02c5d0e1d829c0d762c2e496493186b8e9ee58d6bfa79/ai_jury-1.23.0.tar.gz"
  sha256 "1e0818f5cf7d0a7566afb8b2c704855ee79353caa409ffd520de5f6084f5662f"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "jury 1.23.0", shell_output("#{bin}/jury --version")
    # Bare `--mock` reviews the diff bundled with the package (#841): the whole
    # offline pipeline, with no network and no key.
    assert_match "bundled offline-demo diff", shell_output("#{bin}/jury --mock 2>&1")
    # A real run with no diff source still refuses, with the documented message.
    assert_match "error: provide one of", shell_output("#{bin}/jury 2>&1", 1)
  end
end
