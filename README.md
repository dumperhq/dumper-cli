# Dumper CLI

CLI tools to run on servers and check if the server configuration is ready for [Dumper](https://dumper.io).

## Installation

Install the CLI:

```sh
$ gem install dumper-cli
```

And then execute:

```sh
$ dumper doctor
```

and it will report if there's anything to be fixed.

```
Checking IP address... 192.168.1.2 => Private IP, warning - remote fetch from dumper.io to this server will fail. You will need to use the dumper gem with rails.
Checking my.cnf... No bind-address defined in my.cnf => good
Checking server clock accuracy... 2017-11-06 17:39:59 (server time) vs 2017-11-06 17:39:59 (ntp time), diff: 0.009 seconds => good
```
