class AiJury < Formula
  include Language::Python::Virtualenv

  desc "Cross-vendor multi-agent PR & code review jury"
  homepage "https://ai-jury.dev/"
  url "https://files.pythonhosted.org/packages/b2/70/86fcdb065a4d42855239d7dce7294f702a26dffd76559b4c55b44db5148c/ai_jury-1.22.0.tar.gz"
  sha256 "6f6b9abc12b1a7fe22d76f04439aabdd9ec781ce64f3abf3ee82723a313331cf"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "jury 1.22.0", shell_output("#{bin}/jury --version")
    # Bare `--mock` reviews the diff bundled with the package (#841): the whole
    # offline pipeline, with no network and no key.
    assert_match "bundled offline-demo diff", shell_output("#{bin}/jury --mock 2>&1")
    # A real run with no diff source still refuses, with the documented message.
    assert_match "error: provide one of", shell_output("#{bin}/jury 2>&1", 1)
  end
end
