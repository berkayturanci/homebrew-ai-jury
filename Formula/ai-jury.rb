class AiJury < Formula
  include Language::Python::Virtualenv

  desc "Cross-vendor multi-agent PR & code review jury"
  homepage "https://ai-jury.dev/"
  url "https://files.pythonhosted.org/packages/bd/8d/26161c77e952fb32a1b0461a6b60288f63452bbcc73854794f21c5460d26/ai_jury-1.19.1.tar.gz"
  sha256 "867364ac411dae3884af5e8d11dc6bfe2d8b2fa67076d731b24a2b3de406597a"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "jury 1.19.1", shell_output("#{bin}/jury --version")
    # Bare `--mock` reviews the diff bundled with the package (#841): the whole
    # offline pipeline, with no network and no key.
    assert_match "bundled offline-demo diff", shell_output("#{bin}/jury --mock 2>&1")
    # A real run with no diff source still refuses, with the documented message.
    assert_match "error: provide one of", shell_output("#{bin}/jury 2>&1", 1)
  end
end
