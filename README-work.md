# Work setup

This README is intended to suppliment the main README, to **inspire** coworkers on how to get up and running, _fast_.

## Getting accounts set up

You should have been introduced to 1Password. It is __highly__ recommended to use a [generator that use diceware](https://www.rempe.us/diceware/#eff) and at least use 7 words.

We utilize SSO most places. This is either tied up to your github account or your google account. It is perfectly fine if you want to use your own github account, just make sure that you configure your commits on work-things to use your work email. This can be done effectively, by using directories to load different git configs. See my `.gitconfig` for an example.

## Installing things

Run `work.sh`. It contains a bunch of packages that I personally use, but please review the file before running it blindly.

## Environment

Things in our setup depends on a few `ENV` variables.

| Name               | Value                        | Docs  |
|--------------------|------------------------------|-------|
| AWS_PROFILE        | default                      | here  |
| AWS_DEFAULT_REGION | eu-west-1                    | here  |
| KOPS_STATE_STORE   | s3://kops.blackwoodseven.com | here  |

I prefer using `zsh` and store these in my `.zshrc` file.

## Security related things

### Keys

It is recommended to use a ed25519 key for GitHub. That can be generated with `ssh-keygen -t ed25519`.

As we also will be using GPG for some things, please generate a set of keys and upload your public key to a public keyserver. Also, please add your keys on the [GitHub settings page](https://github.com/settings/keys). GitHub has a [step-by-step guide](https://help.github.com/en/articles/generating-a-new-gpg-key). Remember to [tell git about your key](https://help.github.com/en/articles/telling-git-about-your-signing-key).

I highly recommend to enable auto-signing of commits, by running `git config --global commit.gpgSign true`.

## Connecting to accounts

You should install [1Password X](https://chrome.google.com/webstore/detail/1password-x-%E2%80%93-password-ma/aeblfdkhhhdcdjpifhhbdiojplfjncoa?hl=en), as it makes life in Chrome _much_ easier.

Run `aws-google-auth` in your terminal. It asks for your email and other things. `IDP` is `C019ti8in` and `SP` is `759970038732`.

## Connecting to kubernetes clusters

Make sure that you have `kubectl` and `kops` installed. My `work.sh` file takes care of this.

When authenticated with `aws-google-auth`, verify that you have correct permissions by running `kops get cluster`. If you see a list of clusters, you can export these to your local kubectl configuration by running:

```
$ kops export kubecfg k8s.stage.blackwoodseven.com
$ kops export kubecfg k8s.prod.blackwoodseven.com
```

Following these, try `kubectl get pods`.

To make things easier and to make less mistakes, do consider installing and using [kube-ps1](https://github.com/jonmosco/kube-ps1).