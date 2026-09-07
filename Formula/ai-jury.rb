class AiJury < Formula
  include Language::Python::Virtualenv

  desc "Cross-vendor multi-agent PR & code review jury"
  homepage "https://ai-jury.dev/"
  url "https://files.pythonhosted.org/packages/48/15/35383b57b2f66f5d6b4c0b672e3e61aadbcf2a4322f65ef94e3a19368f15/ai_jury-1.17.1.tar.gz"
  sha256 "de49448c97c8a374dce6f0e493afa2f7f0c37ee5cc366e7a949ef369200861d5"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "jury 1.17.1", shell_output("#{bin}/jury --version")
    assert_match "error: provide one of", shell_output("#{bin}/jury --mock 2>&1", 1)
  end
end
