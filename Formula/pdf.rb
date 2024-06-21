class Pdf < Formula
  desc "A command line tool for working with PDF files"
  homepage "https://github.com/adamwulf/homebrew-pdf"
  head "https://github.com/adamwulf/homebrew-pdf.git", branch: "main"

  depends_on :xcode => ["15.0", :build]

  def install
    system "swift", "build", "-c", "release"
    bin.install ".build/release/pdf"
  end

  test do
    system "#{bin}/pdf", "--version"
  end
end
