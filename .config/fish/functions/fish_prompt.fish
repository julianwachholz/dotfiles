function fish_prompt --description 'Write out the prompt'
	
	# Just calculate these once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	switch $USER

	case root

		if not set -q __fish_prompt_cwd
			if set -q fish_color_cwd_root
				set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
			else
				set -g __fish_prompt_cwd (set_color $fish_color_cwd)
			end
		end

		echo -n -s "$USER" ' ' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" '# '

	case '*'

		if not set -q __fish_prompt_cwd
			set -g __fish_prompt_cwd (set_color $fish_color_cwd)
		end

		echo -n -s "$USER" ' ' "$__fish_prompt_cwd" (prompt_pwd)
		if set -q VIRTUAL_ENV
			echo -n -s ' ' (set_color -b white black) "[" (basename $VIRTUAL_ENV) "]" (set_color normal)
		end
		echo -n -s (__fish_git_prompt " %s ") "$__fish_prompt_normal" '> '

	end
end
