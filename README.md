# Bash completions for the Meteor Web Framework

Meteor is an ultra-simple environment for building modern web
applications. See [http://meteor.com](http://meteor.com)

This bash file provides bash completions for the meteor command line tool.

## Usage:

```bash
$meteor [TAB]
```
**OR**

```bash
$meteor command [TAB]
```
## Installation:

Put it somewhere accessible for your user, for this example we assume 
the directory `/home/myuser/meteor.bash`, in your `.bash_profile` or
`.bashrc` paste the following:

```bash
if [ -f /home/myuser/meteor.bash ]; then
    . /home/myuser/meteor.bash
fi
```

Additionaly on Ubuntu systems you can put this file at `/etc/bash_completion.d/` in this case you **do not** need to put the previous `if [...]` clause in your `.bash_profile` or `.bashrc`

## Available meteor commands:

* help
* run
* create
* update
* add
* remove
* list
* bundle
* mongo
* reset
* deploy
* logs
* authorized
* claim
* login
* logout
* whoami
* test-packages
* list-sites
