class AiJury < Formula
  include Language::Python::Virtualenv

  desc "Cross-vendor multi-agent PR & code review jury"
  homepage "https://ai-jury.dev/"
  url "https://files.pythonhosted.org/packages/a1/cd/9b3412c333ae32d0a42b59779dc54d347836764f4bf9eaa5b4b332792e02/ai_jury-1.21.0.tar.gz"
  sha256 "9421cdae8488385211ffe9f83d80fe8c85914ff0bdc0096841df087bc79487cb"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "jury 1.21.0", shell_output("#{bin}/jury --version")
    # Bare `--mock` reviews the diff bundled with the package (#841): the whole
    # offline pipeline, with no network and no key.
    assert_match "bundled offline-demo diff", shell_output("#{bin}/jury --mock 2>&1")
    # A real run with no diff source still refuses, with the documented message.
    assert_match "error: provide one of", shell_output("#{bin}/jury 2>&1", 1)
  end
end
