# Zsh, iTerm2, and Kubectl

This repo holds my personal config for my shell. Over time, I've adopted zsh as my shell
(with a custom oh-my-zsh theme), iTerm2 badges, and some helpers to make my Kubectl
experience better.

## Install and use

If you wish to install/use this, you can either use the shell helpers in this repo, or
preferrably, install them from the original sources:

1. [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
1. [iTerm2 shell integration](https://www.iterm2.com/documentation-shell-integration.html)

## Kubectl and iTerm2 badges

Sometimes, it's really useful to know which Kubernetes config the shell is pointing at.
On a daily basis, I may be connecting and switching between multiple Kubernetes clusters,
and had to come up with a way to know to which cluster my `kubectl` command was going to.
So here are some helpful tools with that.

### Alias

The simplest one is to alias `kubectl`:

```
alias k='kubectl'
```

### Kubectl config files

Kubectl allows you to have multiple Kubernetes cluster connection config in a single file,
calling them a "context". I found this hard to use, as I couldn't have 2 different terminal
windows talking to 2 different clusters and share the single file. So I've gone with having
separate "kubeconfig" files for each cluster, each having a single "context". This means
NOT having a `~/.kube/config" file, and each time some installer/tool creates one, I make sure
to rename it.

To switch between them, I just set the `KUBECONFIG` env var to the shell:

```
export KUBECONFIG=~/.kube/my-test-cluster
```

Helper tools like `ktx` can help here.

### iTerm2 badges

Unfortunately, sometimes it's hard to remember which `KUBECONFIG` is set on a terminal. To 
help provide a signal, I chose to have my iTerm2 terminal have a "badge" with this info.

The `.shell/it2badges` script sets up a zsh `precmd()`, which is run before each prompt
and uses the `KUBECONFIG` value as a badge. The result is something like this:

![Kbadge](https://github.com/fabioy/shell/blob/master/Kube-badge.jpeg)

Each time a `KUBECONFIG` changes, the badge should reflect it. This provides a quick visual
check as to which Kubeconfig it's using.

### Kubernetes namespace

Another typing intensive item with `kubectl` is that any command to a specific namespace
requires you to type `-n <namespace>` or `--namespace <namespace>`. Since I often work within
a single namespace at a time, it'd be nice to save all that typing.

Here, `kubectl` can help you, but it's not as trivial. So, the `bin/kn` script helps you 
set this:

```
#/bin/sh

export CUR_CTX=$(kubectl config current-context)
kubectl config set-context ${CUR_CTX} --namespace=$1
```

So, if you're doing a lot of work in a `my-dev-space` namespace, you can now:

```shell
# Before
$ kubectl get pods -n my-dev-space
$ kubectl get pod pod-1234 -n my-dev-space -o yaml

# Set the namespace
$ kn my-dev-space

# After
$ kubectl get pods 
$ kubectl get pod pod-1234 -o yaml
```

### AWS-vault

If you do a lot of AWS work, another tool I'd recommend is [AWS Vault](https://github.com/99designs/aws-vault).
The iTerm2 badge script above will also show which AWS context it's currently set.
