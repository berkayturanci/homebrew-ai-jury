class AiJury < Formula
  include Language::Python::Virtualenv

  desc "Cross-vendor multi-agent PR & code review jury"
  homepage "https://ai-jury.dev/"
  url "https://files.pythonhosted.org/packages/fa/48/fd16c4c63a2ae39882f5d68b2f9ce92785803d058b3ebbada40f6a94eeea/ai_jury-1.24.0.tar.gz"
  sha256 "d6c5ff965a7610614cb4a2fb10563c1937cf21aaeecbe41c9e94da30119b3d1e"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "jury 1.24.0", shell_output("#{bin}/jury --version")
    # Bare `--mock` reviews the diff bundled with the package (#841): the whole
    # offline pipeline, with no network and no key.
    assert_match "bundled offline-demo diff", shell_output("#{bin}/jury --mock 2>&1")
    # A real run with no diff source still refuses, with the documented message.
    assert_match "error: provide one of", shell_output("#{bin}/jury 2>&1", 1)
  end
end
