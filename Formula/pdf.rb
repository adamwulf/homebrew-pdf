class Pdf < Formula
  desc "A command line tool for working with PDF files"
  homepage "https://github.com/adamwulf/homebrew-pdf"
  head "https://github.com/adamwulf/homebrew-pdf.git", tag: "0.0.2"
  version "0.0.2"

  depends_on "xcode": [:build]

  def install
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    system "#{bin}pdf", "-help"
  end
end
