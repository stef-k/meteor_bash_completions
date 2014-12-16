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
# ATTENTION
# Some completions are for options that must be placed at the end of the command
# for example the build command:
# Usage: meteor build <output path> [--debug] [--directory] [--settings settings.json]
#
# INSTALLATION:
# See README.md
#
# VERSION:
# For Meteor 1.0
_meteor()
{
    local cur prev opts base
    COMPREPLY=() # completion reply array
    cur="${COMP_WORDS[COMP_CWORD]}" # current word
    prev="${COMP_WORDS[COMP_CWORD-1]}" # previous word
    cline="${COMP_LINE}"

    # basic meteor commands
    commands="help run create update add remove list add-platform remove-platform
            list-platforms configure-android build mongo reset deploy logs
            authorized claim login logout whoami test-packages list-sites
            publish-release publish publish-for-arch search show
            admin debug install-sdk"
    # help contents
    help_lookup="run create update add remove list add-platform remove-platform
            list-platforms configure-android build mongo reset deploy logs
            authorized claim login logout whoami test-packages list-sites
            publish-release publish publish-for-arch search show
            admin debug install-sdk"

    case "${prev}" in
        help )
            args=$(for word in $help_lookup;do echo "$word";done)
            COMPREPLY=( $(compgen -W "${args}" -- "${cur}") )
            return 0
            ;;
        run )
            COMPREPLY=( $(compgen -W "android  android-device ios ios-device
                --port --production --mobile-server --raw-logs
                --settings --release --program --test --debug-port" -- "${cur}") )
            return 0
            ;;
        debug )
            COMPREPLY=( $(compgen -W "--debug-port" -- "${cur}") )
            return 0
            ;;
        create )
            COMPREPLY=( $(compgen -W "--example --list --package" -- "${cur}") )
            return 0
            ;;
        update )
            COMPREPLY=( $(compgen -W "--release
                --packages-only --patch" -- "${cur}") )
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
        add-platform )
            COMPREPLY=( $(compgen -W "server browser android ios" -- "${cur}") )
            return 0
            ;;
        remove-platform )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
        list-platforms )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
        configure-android )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
        build )
            COMPREPLY=( $(compgen -W "--debug --directory
                --mobile-settings --server" -- "${cur}") )
            return 0
            ;;
        mongo )
            COMPREPLY=( $(compgen -W "--url -U" -- "${cur}") )
            return 0
            ;;
        reset )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
        deploy )
            COMPREPLY=( $(compgen -W "--delete -D --debug --settings
                --star" -- "${cur}") )
            return 0
            ;;
        logs )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
        authorized )
            COMPREPLY=( $(compgen -W "--list --add --remove" -- "${cur}") )
            return 0
            ;;
        claim )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
        login )
            COMPREPLY=( $(compgen -W "--email" -- "${cur}") )
            return 0
            ;;
        logout )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
        whoami )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
        test-packages )
            local args="--port -p --deploy --production
                --settings --ios --android --ios-device --android-device
                --verbose"
            if [[ ${cur} != -* ]]; then
                COMPREPLY=($(compgen -W "{cur}")) compopt -o plusdirs
            else
                COMPREPLY=($(compgen -W "${args}" -- "${cur}") )
            fi
            return 0
            ;;
        list-sites )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
        publish-release )
            COMPREPLY=( $(compgen -W "--create-track" -- "${cur}") )
            return 0
            ;;
        publish )
            COMPREPLY=( $(compgen -W "--create" -- "${cur}") )
            return 0
            ;;
        publish-for-arch )
            COMPREPLY=( $(compgen -W "" -- "${cur}") )
            return 0
            ;;
        search )
            COMPREPLY=( $(compgen -W "--maintainer --show-old" -- "${cur}") )
            return 0
            ;;
        show )
            COMPREPLY=( $(compgen -W "--maintainer --show-old" -- "${cur}") )
            return 0
            ;;
        admin )
            COMPREPLY=( $(compgen -W "set-unmigrated maintainers
                recommend-release change-homepage list-organizations
                members get-machine" -- "${cur}") )
            return 0
            ;;
        set-unmigrated )
            COMPREPLY=( $(compgen -W "--success" -- "${cur}") )
            return 0
            ;;
        install-sdk )
             COMPREPLY=( $(compgen -W "android ios" -- "${cur}") )
             return 0
             ;;
    esac

    COMPREPLY=( $(compgen -W "${commands}" -- "${cur}") )
    return 0
}

complete -F _meteor meteor
