function devrun
   set -l __devrun_source_dir (dirname (readlink -m (status --current-filename)))
   set -lx cmd $__devrun_source_dir"/exe/devrun"
  
   eval $cmd $argv

   return $status
end
