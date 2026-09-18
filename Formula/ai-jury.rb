class AiJury < Formula
  include Language::Python::Virtualenv

  desc "Cross-vendor multi-agent PR & code review jury"
  homepage "https://ai-jury.dev/"
  url "https://files.pythonhosted.org/packages/42/1d/a0cae0c4ed2c1ae093b6ba86dcd3c7b519046dc4d9f8865ca530d33b8c90/ai_jury-1.18.1.tar.gz"
  sha256 "51dd72d5d2971ac06b5d1e77b7da03cb7f5ca16e24de41a59a9ba497c6b96e09"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "jury 1.18.1", shell_output("#{bin}/jury --version")
    assert_match "error: provide one of", shell_output("#{bin}/jury --mock 2>&1", 1)
  end
end
