class varnish::repo (
  $version = "3.0"
){
  if ($::osfamily == 'RedHat'){

    $os_ver = $::operatingsystemrelease ? {
      /6.[0-9]/  => '6',
      /5.[0-9]+/ => '5',
      default    => $::operatingsystemrelease,
    }

    $arch = $::architecture ? {
      'i386'   => 'x86',
      'x86_64' => 'amd64',
    }

    yumrepo { 'VarnishCache' :
      descr    => 'VarnishCache',
      baseurl  => "http://repo.varnish-cache.org/redhat/varnish-${version}/el${os_ver}/${$::architecture}",
      gpgcheck => 0,
    }
  }
}
