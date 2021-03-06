require 'formula'

class Imagick < Formula
  url 'http://pecl.php.net/get/imagick-3.0.1.tgz'
  homepage 'http://pecl.php.net/package/imagick'
  md5 'e2167713316639705202cf9b6cb1fdb1'

  depends_on 'imagemagick'

  def install
    Dir.chdir "imagick-#{version}" do
      system "phpize"
      system "./configure", "--prefix=#{prefix}"
      system "make"
      prefix.install 'modules/imagick.so'
    end
  end

  def caveats; <<-EOS.undent
    To finish installing Imagick:
      Edit php.ini file
      extension="#{prefix}/imagick.so"
      Restart your webserver
    EOS
  end
end
