# RGBResCode

a dumb project to change the rgb lights in my computer to red when a process exit with a code different than 0 in zsh

it uses openrgb, openrgb-python, and zsh hooks to make everything work

> that thing was made in about 2h of pain, so don't expect it to work on its own

it breaks half the time btw

## how to use

first start the deamon-ish python script

```bash
./launch.sh
```

> you can always kill it with:
> ```bash
> ./kill.sh
> ```
> although you may also need to rekill the openrgb server if it doesn't work

then to test it you can try setting the colors manually:

```bash
echo "set_all r,g,b" > finput
```

> of course replace r, g and b with the values you want (from 0 to 255)

if it works, grats ! you're one of the lucky few for whom it does, anyway add a hook to precmd in your zshrc (like so, just put that at the end)

```bash
v=0 # store that because we want something that runs after each command,
# not before. (here we just wait one command and start doing everything)
function on_pre_cmd() {
	res=$?
	if [ $v = 0 ]; then # skip first as it is called before the first command is ran
		v=1
	else
		absolute/path/to/the/repo/rescode.sh $res
	fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd on_pre_cmd
```

source the modified zshrc

```bash
source ~/.zshrc
```

and you should be done !

> you can change the color, or how it deals with different codes in `rescode.sh`
