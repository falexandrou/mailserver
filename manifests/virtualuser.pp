define virtualuser($dbname, $source, $destination) {
  postgresql_psql { "public.forwardings-${source}":
    db      => $dbname,
    command => "INSERT INTO public.forwardings (source,destination) VALUES ('${source}','${destination}');",
    unless  => "SELECT source FROM public.forwardings WHERE source LIKE '${source}'",
    require => Postgresql_psql["${dbname}-init-database"]
  }
}
