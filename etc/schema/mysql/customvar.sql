SET sql_mode = 'STRICT_ALL_TABLES,NO_ENGINE_SUBSTITUTION';
SET innodb_strict_mode = 1;

CREATE TABLE customvar (
  id binary(20) NOT NULL COMMENT 'sha1(environment.name + name + value)',
  environment_id binary(20) NOT NULL COMMENT 'sha1(environment.name)',
  name_checksum binary(20) NOT NULL COMMENT 'sha1(name)',

  name varchar(255) NOT NULL COLLATE utf8_bin,
  value text NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDb ROW_FORMAT=COMPRESSED DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE customvar_flat (
  id binary(20) NOT NULL COMMENT 'sha1(environment.name + flatname + flatvalue)',
  environment_id binary(20) NOT NULL COMMENT 'sha1(environment.name)',
  customvar_id binary(20) NOT NULL COMMENT 'sha1(customvar.id)',
  flatname_checksum binary(20) NOT NULL COMMENT 'sha1(flatname after conversion)',

  flatname varchar(512) NOT NULL COLLATE utf8_bin COMMENT 'Path converted with `.` and `[ ]`',
  flatvalue text NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDb ROW_FORMAT=COMPRESSED DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_bin;