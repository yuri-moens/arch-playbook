# Arch Ansible Playbook

This playbook installs and configures an Arch workstation.

## Usage

1. Install Ansible and git with `pacman -S ansible git`
2. Clone this repo with `git clone https://github.com/yuri-moens/arch-playbook`
3. Install the required roles with `make requirements`
4. Configure variables in `vars/`
5. Create a vault with `make vault` (you may need to remove an existing one). The following variables should be set
    * `user_password`
6. Create your user with `make user`
7. Move the repo to the user's home directory, switch to the user and continue from there
8. Run ansible with `make`

You can optionally do a dry run first with `make check`.

You can store your vault password in `~/.ansible/.vault_pass` and it will automatically be used by the make commands.

## Development

The advise of code linters is advised to improve code quality. You can run these with `make lint` or separately with `make yaml-lint`, `make ansible-lint` and `make syntax-check`.
