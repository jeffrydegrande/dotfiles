These are my config files.

I'm using bare a bare repository as described [here](https://www.atlassian.com/git/tutorials/dotfiles)

or ... in short:

### Prerequisites

- Install Git

### Setting up the Bare Git repository

First, we setup a bare Git repository in the home directory at $HOME/.dotfiles,
this repository will track our files.

```bash
git init --bare $HOME/.config
```

We create an alias `config`, to interact with this repository.

```bash
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Set a flag - local to the repository - to hide files which are not explicitly tracked.

```bash
config config --local status.showUntrackedFiles no
```

Add this alias to .bashrc or .zshrc to avoid re-entering it.

### Usage

Using this repository is same as using Git, replace `git` with your newly created `config` alias. For example:

```bash
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

### Bootstrapping on a new machine

To set up this Dotfiles tracking on a new machine, you need to clone the repository. **Ensure your source repository ignores the folder where you'll clone it into**, to avoid recursion problems.

```bash
echo ".dotfiles" >> .gitignore
```

Next, clone the repository.

```bash
git clone --bare <git-repo-url> $HOME/.dotfiles
```

Define the alias in the current shell scope.

```bash
alias config='/usr/bin/git --git-dir=$HOME/.dotfile/ --work-tree=$HOME'
```

Checkout the content from the bare repository to your $HOME.

```bash
config checkout
```

If you already have configuration files with identical names, this step might
fail. Backup and remove those files. Retry the checkout if you get an error.

Set the flag showUntrackedFiles to no on this specific (local) repository.

```bash
config config --local status.showUntrackedFiles no
```

You're done, now you can use the `config` command to manage your dotfiles.
