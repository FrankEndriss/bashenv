# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Make bash append rather than overwrite the history on disk
shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

set -o vi

alias a=alias
a grep='grep --color'                     # show differences in colour
a egrep='egrep --color=auto'              # show differences in colour
a fgrep='fgrep --color=auto'              # show differences in colour

#to backup file do
#call like "bk <filename>"
function bk_func() {
	F=$1
	echo "backing up $F ..."
	if [ ! -f "$F" ] 
	then
		echo "usage: bk <regularFile>"
		exit 1
	fi
	
	for i in $(seq 8 -1 0)
	do
 		if [ -f "$F".$i.bak ]
 		then
	   		j=$((i+1))
   			mv "$F".$i.bak "$F".$((i+1)).bak
 		fi
	done

	cp "$F" "$F".0.bak
}
a bk='bk_func'

function f_func () {
    find . -name "*$1*"
}
a f=f_func

function g_func () {
    find . -type f -print0 | xargs -0 grep "$1"
}
a g=g_func

a r='fc -e -'
a c='mvn -DskipTests clean install'

#the following should go to a separate file...

#a t='mvn -fae clean install -DhlspOracleUser=NHOFFMANN_ADM -DhlspOraclePassword=NHOFFMANN_ADM -DhlspOracleUrl=jdbc:oracle:thin:@//dbsrv02ora11g.god.de:1521/hlspdev -DembeddedTomeePort=8182'
#a t='mvn -fae clean install -DhlspOracleUser=FENDRISS_ADM -DhlspOraclePassword=FENDRISS_ADM -DhlspOracleUrl=jdbc:oracle:thin:@//dbsrv02ora11g.god.de:1521/hlspdev -DembeddedTomeePort=8182'
#a t='mvn -fae clean install -DhlspOracleUser=FENDRISS_ADM -DhlspOraclePassword=FENDRISS_ADM -DhlspOracleUrl=jdbc:oracle:thin:@dbsrv06ora12c.testnet.god.de:1521:dbsrv06 -DembeddedTomeePort=8182'
#a t='mvn -fae clean install -Dde.volkswagen.hlsp.ums.testuser=EEXNachname -DhlspOracleUser=FENDRISS_ADM -DhlspOraclePassword=FENDRISS_ADM -DhlspOracleUrl=jdbc:oracle:thin:@dbsrv06ora12c.testnet.god.de:1521:dbsrv06 -DembeddedTomeePort=8182'
a t='mvn -fae clean install -DhlspOracleUser=FENDRISS_ADM -DhlspOraclePassword=FENDRISS_ADM -DhlspOracleUrl=jdbc:oracle:thin:@dbsrv06ora12c.testnet.god.de:1521:dbsrv06 -DembeddedTomeePort=8183'
a tt='mvn -pl Entwicklung/Implementierung/hlsp/hlsp-integration-test clean install -DhlspOracleUser=FENDRISS_ADM -DhlspOraclePassword=FENDRISS_ADM -DhlspOracleUrl=jdbc:oracle:thin:@dbsrv06ora12c.testnet.god.de:1521:dbsrv06 -DembeddedTomeePort=8184'
