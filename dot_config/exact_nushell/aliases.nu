
alias cls = clear

def ld [rest?: string = "."] { ls $rest | where type == dir | sort-by modified --reverse }
def la [rest?: string = "."] { ls -a $rest | sort-by type }

def lD [rest?: string = "."] { ls $rest --directory | sort-by modified --reverse }

def ld. [rest?: string = "."] { 
  ls -a $rest |
    where type == dir and ($it.name | str starts-with ".") |
    sort-by modified --reverse 
}

def ls. [rest?: string = "."] { 
  ls -a $rest |
    where type == file and ($it.name | str starts-with ".") |
    sort-by type
} 

