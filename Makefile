#https://makefiletutorial.com/

.PHONY: info
info:
	echo "\nList of Makefile commands:\n" && echo "  readme" && echo "  run"  && echo "  screenshots-root" && echo "  screenshots"  && echo "  github"   && echo "  simulator" 
info-info:
	echo "\noutput the list of commands for this Makefile\n"

.PHONY: readme
readme:
	echo "commit Readme file"
	git commit -am 'readme'
	echo "publish it on github on Master branch"
	git push -u origin master
info-readme:
	echo "\nCommit the Readme file and push this repository on Github\n"

.PHONY: run
run:
	flutter run 
info-run:
	echo "\nRun this mobile app\n"

screenshots-root:
	echo "--Move images file from the screenshots folder to\n the application root--"
	mv screenshots/* .
info-screenshots-root:
	echo "\n--Move images file from the screenshots folder to\n the application root--\n"
mv-scr: screenshots-root

.PHONY: screenshots
screenshots:
	echo "--Move images file from the application root to\n the screenshots folder --"
	mv *.png screenshots/
info-screenshots:
	echo "\nMove images file from the application root to\n the screenshots folder\n"

.PHONY: github
github:
	echo "--Open this github repository url--"
	open https://github.com/guinslym/sp_ask_dashboard_mobile_app_layout
info-github:
	echo "\nOpen this github repository url \n"

.PHONY: simulator
simulator:
	killall Simulator 2>&- && sleep 5 || true
	xcrun simctl erase all
info-simulator:
	echo "\nShutdown IOS simulator \nAnd delete all flutter apps on the IOS\n"

.PHONY: push
push:
	git push -u origin master
info-push:
	echo "\nGit Pushed to master branch repository\n"