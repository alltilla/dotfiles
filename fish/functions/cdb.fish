function cdb --wraps='cd (git rev-parse --show-toplevel)/build' --description 'alias cdb cd (git rev-parse --show-toplevel)/build'
  cd (git rev-parse --show-toplevel)/build $argv
        
end
