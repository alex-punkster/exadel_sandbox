   74  sudo apt-get install git
   75  git
  118  git clone git@github.com:alex-punkster/exadel_sandbox.git
  120  git init
  126  git status
  127  git add .
  128  git commit -m 'initial commit'
  129  git push origin master
  130  git pull
  131  git checkout -b dev
  132  git push origin dev
  133  git status
  135  git status
  136  git 
  137  git commit -m 'add test to dev'
  138  git push origin dev
  139  git pull
  140  git status
  141  git checkout -b alex-punkster-new_feature
  143  git add .
  144  git status
  145  touch .gitignore
  146  nano .gitignore
  147  git add .
  148  git commit -m 'new_feature'
  149  git push origin alex-punkster-new_feature 
  150  nano .gitignore
  151  git status
  152  git add .
  153  git commit -m 'add gitignore'
  154  git push origin alex-punkster-new_feature 
  155  git status
  157  git commit -m 'add changes to readme'
  158  git add .
  159  git commit -m 'add changes to readme'
  160  git log
  161  git revert cefb1bec358a795f5bc218a271b8b7a0ae088c1b
  162  git log
  163  git checkout master
  164  git pull 
  165  git log >> log.txt
  167  git status
  168  git log
  170  git checkout alex-punkster-new_feature 
  171  git log
  172  git push origin alex-punkster-new_feature
  173  git checkout master
  174  git log 
  175  git log >> log.txt
  176  git add .
  177  git commit -m 'log to master'
  178  git push origin master
  179  git branch -d alex-punkster-new_feature 
  180  git branch -D alex-punkster-new_feature 
  181  git push origin --delete alex-punkster-new_feature
  182  git checkout dev
  183  git pull
  184  git pull origin dev
  185  touch git_commands.md
  186  nano git_commands.md 
  187  history > git_commands.md
  188  nano git_commands.md 
  189  rm git_commands.md 
  190  history | grep git > git_commands.md
