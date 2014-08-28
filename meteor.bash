# The MIT License (MIT)

# Copyright (c) 2014 stef.kariotidis@gmail.com

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
# INFO:
# this bash completion file invoked from the command line as meteor,
# autocompletes meteor commands and is used in the following form:
# meteor [TAB]
# meteor command [TAB]
#
# INSTALLATION:
# See README.md
#
# VERSION:
# For Meteor 0.9.0.1
_meteor()
{
    local cur prev opts base
    COMPREPLY=() # completion reply array
    cur="${COMP_WORDS[COMP_CWORD]}" # current word
    prev="${COMP_WORDS[COMP_CWORD-1]}" # previous word

    # basic meteor commands
    commands="help run create update add remove list bundle mongo reset deploy
            logs authorized claim login logout whoami test-packages list-sites
            search show publish publish-for-arch publish-release"
    # help contents
    help_lookup="run create update add remove list bundle mongo reset deploy
            logs authorized claim login logout whoami test-packages list-sites
            search show publish publish-for-arch publish-release"

    case "${prev}" in
        help )
            args=$(for word in $help_lookup;do echo "$word";done)
            COMPREPLY=( $(compgen -W "${args}" -- "${cur}") )
            return 0
            ;;
        run )
            COMPREPLY=( $(compgen -W "--port --production --raw-logs --settings
                --release --program" -- "${cur}") )
            return 0
            ;;
        create )
            COMPREPLY=( $(compgen -W "--example --list" -- "${cur}") )
            return 0
            ;;
        deploy )
            COMPREPLY=( $(compgen -W "--delete --debug --settings
                --star" -- "${cur}") )
            return 0
            ;;
        logs )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
        update )
            COMPREPLY=( $(compgen -W "--release" -- "${cur}") )
            return 0
            ;;
        add )
            pgs=$(meteor search "${cur}")
            COMPREPLY=( $(compgen -W "${pgs}" -- "${cur}") )
            return 0
            ;;
        remove )
            pgs=$(meteor list)
            COMPREPLY=( $(compgen -W "${pgs}" -- "${cur}") )
            return 0
            ;;
        list )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
        mongo )
            COMPREPLY=( $(compgen -W "--url" -- "${cur}") )
            return 0
            ;;
        reset )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
        bundle )
            COMPREPLY=( $(compgen -W "--debug --directory" -- "${cur}") )
            return 0
            ;;
        search )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
        show )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
        publish-for-arch )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
        publish-release )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
        publish )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
    esac

    COMPREPLY=($(compgen -W "${commands}" -- "${cur}"))
    return 0
}

complete -F _meteor meteor
