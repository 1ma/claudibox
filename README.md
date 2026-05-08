# claudibox

Script per córrer Claude Code en un contenidor Debian 13 a Incus
amb certa configuració precarregada (CLAUDE.md i settings.json).

## Instal·lació

```shell
$ ./init.sh
$ incus exec claudibox -- sudo -iu claudi
$ cd workspace/project
$ claude
```

Es pot crear un alias a `~/.bashrc` per no haver de recordar la comanda exec:

```shell
alias claudi='incus exec claudibox -- sudo -iu claudi'
```

Docker i Incus poden tenir conflictes de xarxa si corren al mateix host.
He configurat el meu servei de Docker així:

```shell
$ cat /etc/docker/daemon.json 
{
  "ip-forward-no-drop": true
}
```

Font: https://linuxcontainers.org/incus/docs/main/howto/network_bridge_firewalld/#network-incus-docker

## Assumpcions

* El host és una màquina Linux i té [Incus](https://linuxcontainers.org/incus/docs/main/installing/#installing) instal·lat.
* Els projectes de git del host estan tots a `$HOME/workspace`
* L'usuari del host té UID 1000

## Gestió del contenidor

```shell
$ incus list
+-----------+---------+--------------------+------------------------------------------------+-----------+-----------+                                                                                                                   
|   NAME    |  STATE  |        IPV4        |                      IPV6                      |   TYPE    | SNAPSHOTS |                                                                                                                   
+-----------+---------+--------------------+------------------------------------------------+-----------+-----------+
| claudibox | RUNNING | 10.84.27.98 (eth0) | fd42:d5e3:5ea4:a41a:1266:6aff:fe68:300c (eth0) | CONTAINER | 0         |
+-----------+---------+--------------------+------------------------------------------------+-----------+-----------+
$ incus stop claudibox 
$ incus list
+-----------+---------+------+------+-----------+-----------+
|   NAME    |  STATE  | IPV4 | IPV6 |   TYPE    | SNAPSHOTS |
+-----------+---------+------+------+-----------+-----------+
| claudibox | STOPPED |      |      | CONTAINER | 0         |
+-----------+---------+------+------+-----------+-----------+
$ incus delete claudibox
```
