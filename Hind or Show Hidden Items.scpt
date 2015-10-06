-- Hind or Show Hidden Items.app
-- Download APP https://drive.google.com/file/d/0B0E2FRIvjDDoQVpIWFYyXy00UWs/view?usp=sharing

set isCancel to false

repeat until isCancel
	
	display dialog "Let hidden Finder items visible or hidden... (Be careful, you will lost all Finder windows)" buttons {"cancel and quit", "visible", "hidden"} default button "hidden" cancel button "cancel and quit" with icon 2 with title "Hind or Show Hidden Items.app"
	set ans to button returned of result
	
	if ans is "hidden" then
		set str to "defaults write com.apple.finder AppleShowAllFiles NO"
	else if ans is "visible" then
		set str to "defaults write com.apple.finder AppleShowAllFiles YES"
	end if
	
	if ans is not "cancel and quit" then
		do shell script str
		-- relanch finder
		try
			tell application "Finder" to quit
		end try
		delay 2
		tell application "Finder" to activate
		-- display notification str with title "Hind or Show Hidden Items.app complete"
		display alert "Hind or Show Hidden Items.app sets hidden items " & ans as informational
	else
		set isCancel to true
	end if
	
end repeat
