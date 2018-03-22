#!/usr/bin/env bash

# Copyright 2017 Heptio Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

KUBECONFIG_DIR=${KUBECONFIG_DIR:-"${HOME}/.kube/"}

_getconf()
{
	find ${KUBECONFIG_DIR} -maxdepth 1 -type f -exec basename {} \;
}

_ktx() {
       local cur=${COMP_WORDS[COMP_CWORD]}
       COMPREPLY=( $(compgen -W "$(_getconf)" -- $cur) )
}
complete -F _ktx ktx
