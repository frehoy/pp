# pp

Python project skeleton. All you need is [asdf](https://asdf-vm.com/) and

```sh
asdf plugin add python
asdf install python
```

Add packages you need to `requirements.txt`, run `make env` to create a virtual env with those package.
Activate the env with `source .venv/bin/activate`. Run `deactivate` to escape from the env.

The makefile also install a `pp` command you can call when the venv is activated so you can use your libs from anywhere.

Happy hacking
