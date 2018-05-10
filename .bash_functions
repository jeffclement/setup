function grepcode()
{
  find . -type f -name '*.cpp' -print0 | xargs -0 grep -rn $@ \;
  find . -type f -name '*.h' -print0 | xargs -0 grep -rn $@ \;
  find . -type f -name '*.c' -print0 | xargs -0 grep -rn $@ \;
}

function grepcpp()
{
  find . -type f -name '*.cpp' -print0 | xargs -0 grep -rn $@ \;
}

function greph()
{
  find . -type f -name '*.h' -print0 | xargs -0 grep -rn $@ \;
}

function grepc()
{
  find . -type f -name '*.c' -print0 | xargs -0 grep -rn $@ \;
}

alias findtodo="find . -name \"*.cpp\" -or -name \"*.h\" | xargs grep -ni -E \"TO(DO|FIX|ADD|DEL)\""
alias findtodos=findtodo
alias greptodos=findtodo
alias greptodo=findtodo

alias grepMultipleInheritance="find . -name \"*.h\" | xargs grep -ni -E \".*class.+:.*,.*\""
alias grepMult=grepMultipleInheritance

function grepTab
{
  grep -rnP '\t' * | more
}

alias grepTabs=grepTab

function numberOfTabs
{
  grep -rnP '\t' * | wc -l
}

alias nbrTabs=numberOfTabs

function tabReplacer()
{
  for iter in *
  do
    sed 's/\t/    /g' "${iter}" > filename.notabs && mv filename.notabs "${iter}"
  done
}

function tabReplacerRecursive()
{
  find ./ -type f -exec sed -i 's/\t/    /g' {} \;
}

alias tabReplacerRec=tabReplacerRecursive
alias removetabs=tabReplacerRecursive

function tabReplacerCode()
{
  find ./ -type f -name '*.cpp' -exec sed -i 's/\t/    /g' {} \;
  find ./ -type f -name '*.h' -exec sed -i 's/\t/    /g' {} \;
  find ./ -type f -name '*.c' -exec sed -i 's/\t/    /g' {} \;
}

function tabReplacerCpp()
{
  find ./ -type f -name '*.cpp' -exec sed -i 's/\t/    /g' {} \;
}

function tabReplacerC()
{
  find ./ -type f -name '*.c' -exec sed -i 's/\t/    /g' {} \;
}

function tabReplacerH()
{
  find ./ -type f -name '*.h' -exec sed -i 's/\t/    /g' {} \;
}

alias removeTabsInCode=tabReplacerCode
alias removeTabsCpp=tabReplacerCpp
alias removeTabsC=tabReplacerC
alias removeTabsH=tabReplacerH

#find . -regextype posix-basic -regex '.*\(cpp\|h\|c\)' | more

#function grepblah()
#{
#first save where you are
#echo "\n"
#for file in $DIR
#{
# echo $file;
# echo "\n";
#}
#pushd $COMMON_LIB
#pwd
#popd
#pwd
#save directories as variables
#cd /cygdrive/c/
#find . -type f -name '*.c' -print0 | xargs -0 grep -rn $@ h | more;
#grep -rn $@ /cygdrive/c/*.h | more;

#return back to where started
#}
# find . -type f -name '*.c' -print0 | xargs -0 grep -rn Limits

###yofunction grepblah(){"grep -rn $@ {CommonLib/dir,Lib/dir} | more;"}
