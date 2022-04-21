# AutoAttack

A script that lets you hold down ``spacebar`` to simulate repeated mouse clicks.

I wrote this for playing Diablo II, which is very clicky, to save me from developing carpal tunnel syndrome.  It requires that you type the ``/nopickup`` command to avoid picking up all the items on the ground.

## For PC

- Install [AutoHotKey](http://autohotkey.com/).
- Download the [AutoAttack](https://raw.githubusercontent.com/whipowill/ahk-autoattack/master/AutoAttack.ahk) script.
- Right click and select "Run As Administrator".
- Hit ``PageUp`` to toggle the script on/off.
- Hold ``spacebar`` to move and attack.

## For Mac/Linux

This assumes you are running the game inside Wine and you know how to use Terminal.

- Use Winetricks to install [AutoHotKey](http://autohotkey.com/):

```bash
$ WINEPREFIX=~/path/to/your/wine winetricks ahk
```

- Download the [AutoAttack](https://raw.githubusercontent.com/whipowill/ahk-autoattack/master/AutoAttack.ahk) script.
- Create an alias to run the script inside your Wine container:

```bash
$ vim .bashrc
> alias ahk="cd ~/Games/Windows/ && WINEPREFIX=~/Games/Windows/d2qol wine AutoAttack.ahk"
```

- Reload your Terminal and run the script:

```bash
$ ahk
```

- Hit ``PageUp`` to toggle the script on/off.
- Hold ``spacebar`` to move and attack.