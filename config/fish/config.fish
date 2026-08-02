if status is-interactive

end

#function fish_greeting
#
#end

function nvim
    kitten @ set-background-opacity 1
	/usr/bin/nvim $argv
    kitten @ set-background-opacity 0.5
end


function vim
    kitten @ set-background-opacity 1
	/usr/bin/nvim $argv
    kitten @ set-background-opacity 0.5
end

function vi
    kitten @ set-background-opacity 1
    /usr/bin/nvim $argv
    kitten @ set-background-opacity 0.5
end
