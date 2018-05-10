#update path
export PATH="/cygdrive/c/home/Jeff/.node_modules_global/:$PATH"

export PATH="/cygdrive/c/Program Files/Java/jdk1.8.0_05/bin:$PATH"

alias src="source ~/.bashrc"

alias ll="ls -l"

alias gerp=grep

alias emacs=emacs
alias emcas=emacs
alias emac=emacs
alias eamcs=emacs

alias xeamcs=xemacs
alias xemcas=xemacs

JEFF_HOME_DIR=/cygdrive/d/Jeff
alias jeffhome="cd $JEFF_HOME_DIR"

SW_DIR="${JEFF_HOME_DIR}/SoftwareDevelopment"
alias code="cd $SW_DIR"

MACHINE_LEARNING_DIR="${JEFF_HOME_DIR}/SoftwareDevelopment/Machine\ Learning/Code"
alias machinelearningcode="cd $MACHINE_LEARNING_DIR"
alias maccode=machinelearningcode

GRAPHICS_DIR="${JEFF_HOME_DIR}/SoftwareDevelopment/Graphics/Code"
alias graphicscode="cd $GRAPHICS_DIR"
alias gcode=graphicscode

TEST_CODE_DIR="${JEFF_HOME_DIR}/SoftwareDevelopment/TestCode"
alias testcode="cd $TEST_CODE_DIR"
alias tc=testcode

AARF_FILE_CONVERTER_CODE_DIR="${JEFF_HOME_DIR}/SoftwareDevelopment/TestCode/AARF_FileConverter"
alias aarf_fileconvertercode="cd $AARF_FILE_CONVERTER_CODE_DIR"
alias afcon=aarf_fileconvertercode

alias hgtags="pushd '`hg root`/..';ctags -R *;popd"
alias hgtest="pushd '`hg root`/..';pwd;popd"

alias m="make |& head -n 50"

