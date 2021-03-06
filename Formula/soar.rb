class Soar < Formula
  desc "SQL Optimizer And Rewriter"
  homepage "https://github.com/XiaoMi/soar"
  url "https://github.com/XiaoMi/soar/releases/download/v0.8.1/soar.darwin-amd64"
  sha256 "1938433fcba35e40757489bfc135b7668ad614e99cc6c1cdc05f76fe2d6f9e45"

  def install
    bin.install "soar.darwin-amd64"
    mv bin/"soar.darwin-amd64", bin/"soar"
  end

  test do
    assert_equal "\n", pipe_output("#{bin}/soar -query 'select 1'", '-report-type lint')
    system "#{bin}/soar", "-version"
  end
end
