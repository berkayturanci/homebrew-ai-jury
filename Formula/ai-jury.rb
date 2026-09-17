class AiJury < Formula
  include Language::Python::Virtualenv

  desc "Cross-vendor multi-agent PR & code review jury"
  homepage "https://ai-jury.dev/"
  url "https://files.pythonhosted.org/packages/5a/de/dcb0f9a03edca4160174b16924ac92832c14275b90508d344e704eac05c4/ai_jury-1.18.0.tar.gz"
  sha256 "1f19e96f462d599605b2aad0566be1284f874a5d88bfb6a799f388a5e721a973"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "jury 1.18.0", shell_output("#{bin}/jury --version")
    assert_match "error: provide one of", shell_output("#{bin}/jury --mock 2>&1", 1)
  end
end
