class AiJury < Formula
  include Language::Python::Virtualenv

  desc "Cross-vendor multi-agent PR & code review jury"
  homepage "https://ai-jury.dev/"
  url "https://files.pythonhosted.org/packages/40/86/d788dcb7fb8e67d39facfaf5a73402f9e6c3697ef58c4ec11deaf3d1c0f1/ai_jury-1.17.0.tar.gz"
  sha256 "edf42a473f1c85f56f243d558a0f6a4d16f93532d3d842f9de1af56c24b6d4ef"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "jury 1.17.0", shell_output("#{bin}/jury --version")
    assert_match "error: provide one of", shell_output("#{bin}/jury --mock 2>&1", 1)
  end
end
