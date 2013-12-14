my_virtualenv -- Create throw-away MySQL servers for regression tests
=====================================================================

Ever quickly needed a fresh MySQL server to run some tests?
Always envied PostgreSQL for the cool [`pg_virtualenv`][pve]?
Now you can have a piece of the cake too!

Installation
------------

`git clone https://github.com/evgeni/my_virtualenv.git`

There is no fancy shell script you can `curl ... | sh` (well, actually... nononono, forget it!).

Configuration
-------------

Well, there is none, really.

Usage
-----

Either just call `my_virtualenv` and get a fresh shell with a `mysqld` running in the background:

    $ my_virtualenv
    $ mysql
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 4
    Server version: 5.5.33-1 (Debian)

    Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    mysql> 

Or wrap your tests with it:

    $ my_virtualenv make test
    echo "CREATE DATABASE test;" | mysql
    run-your-cool-mysql-depending-tests

After the command/shell terminates, the running `mysqld` gets killed and all the data is removed.

Environment
-----------

When running `my_virtualenv`, your environment gets poluted with the following (useful) vars:

 * `MYSQL_USER` - the user you can connect as
 * `MYSQL_PWD` - the password of your user
 * `MYSQL_HOME` - the place to find `my.cnf`
 * `MYSQL_HOST` - the host `mysqld` is running on (always `localhost`)
 * `MYSQL_TCP_PORT` - the TCP port of `mysqld`
 * `MYSQL_UNIX_PORT` - the path to the `mysqld` socket


[pve]: https://alioth.debian.org/scm/loggerhead/pkg-postgresql/postgresql-common/trunk/view/head:/pg_virtualenv
