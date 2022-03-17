tell application "System Preferences"
	reveal anchor "Hearing" of pane id "com.apple.preference.universalaccess"
end tell

tell application "System Events"
	tell application process "System Preferences"
		set frontmost to true
		# https://stackoverflow.com/questions/52585304/automator-error-system-events-got-an-error-can-t-get-checkbox/52601110#52601110
		tell group 1 of window "Accessibility"
			##Ð> pre 10.9 set monoStereoCheckbox to checkbox 2 of group 1
			set monoStereoCheckbox to checkbox "Play stereo audio as mono"
			if (get value of monoStereoCheckbox) as boolean is true then
				tell monoStereoCheckbox to click
			end if
		end tell
	end tell
end tell

if application "System Preferences" is running then
	tell application "System Preferences" to quit
end if
