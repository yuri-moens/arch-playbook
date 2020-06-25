# set VAULT_OPT depending on whether .vault_pass exists
ifeq (,$(wildcard ~/.ansible/.vault_pass))
	VAULT_OPT = --ask-vault-pass
else
	VAULT_OPT = --vault-password-file ~/.ansible/.vault_pass
endif

# set EDITOR depending on whether vi exists
ifeq (,$(wildcard /usr/bin/vi))
	EDITOR = vim
else
	EDITOR = vi
endif

run:
	ansible-playbook main.yml $(VAULT_OPT)

check:
	ansible-playbook main.yml ${VAULT_OPT} --check

user:
	ansible-playbook main.yml ${VAULT_OPT} --tags user

requirements:
	ansible-galaxy install -r requirements.yml

vault:
ifneq (,$(wildcard vars/vault.yml))
	EDITOR=${EDITOR} ansible-vault edit vars/vault.yml ${VAULT_OPT}
else
	EDITOR=${EDITOR} ansible-vault create vars/vault.yml
endif

lint: yaml-lint ansible-lint syntax-check

yaml-lint:
	-yamllint .

ansible-lint:
	-ansible-lint main.yml

syntax-check:
	-ansible-playbook main.yml ${VAULT_OPT} --syntax-check
