{
	programs.tmux = {
		enable = true;
		baseIndex = 1;
		clock24 = true;
		excapeTime = 0;
		keyMode = "vi";
		prefix = "C-a";
		shell = /run/current-system/sw/bin/fish;
		shortcut = "a";
		terminal = "screen-256color";
	};
}
