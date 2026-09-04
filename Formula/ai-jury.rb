class AiJury < Formula
  include Language::Python::Virtualenv

  desc "Cross-vendor multi-agent PR & code review jury"
  homepage "https://ai-jury.dev/"
  url "https://files.pythonhosted.org/packages/9a/3f/e6dd10a02172e9c1c7bc751fd8105fc21a703bdf95213c2f32fca86f5852/ai_jury-1.16.0.tar.gz"
  sha256 "aa2c25d9dd0f74fb04150c881156510ed90257f5b04e588619c08f9a012408fc"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "jury 1.16.0", shell_output("#{bin}/jury --version")
    assert_match "error: provide one of", shell_output("#{bin}/jury --mock 2>&1", 1)
  end
end
