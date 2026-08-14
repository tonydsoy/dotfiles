if status is-interactive

end

#function fish_greeting
#
#end

function nvim
    #kitten @ set-background-opacity 1
    ps cax | grep kitty > /dev/null
    if test $status = 0
        kitten @ set-background-opacity 1
    end
	/usr/bin/nvim $argv
    ps cax | grep kitty > /dev/null
    if test $status = 0
        kitten @ set-background-opacity 0.5
    end
    # kitten @ set-background-opacity 0.5
end


function vim
    nvim $argv
end

function vi
    nvim $argv
end
