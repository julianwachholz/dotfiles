# execute a postactivate script for each activated virtualenv

function __vfhooks_did_activate --on-event virtualenv_did_activate
	. $VIRTUALFISH_HOME/did_activate.fish
	. $VIRTUAL_ENV/did_activate.fish
end

function __vfhooks_did_deactivate --on-event virtualenv_did_deactivate
	. $VIRTUALFISH_HOME/did_deactivate.fish
	. $VIRTUAL_ENV/did_deactivate.fish
end
