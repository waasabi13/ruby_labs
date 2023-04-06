create table students (
                          id          INTEGER PRIMARY KEY AUTOINCREMENT,
                          last_name   varchar(32) not null,
                          first_name  varchar(32) not null,
                          paternal_name varchar(32) not null,
                          phone       varchar(32) null,
                          telegram    varchar(32) null,
                          email       varchar(32) null,
                          git         varchar(32) null
);
