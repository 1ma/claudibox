# claudibox

Script per córrer Claude Code en un contenidor Debian 13 a Incus
amb certa configuració precarregada (CLAUDE.md i settings.json).

```shell
$ ./init.sh
$ incus exec claudibox -- sudo -iu claudi
$ cd workspace/project
$ claude
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
