#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=E:\Boulot\BENEVOLE\UFROG\supp combatlog\Form2.kxf
$Form1 = GUICreate("TSUL Configuration", 589, 166, 303, 187)
$valid = GUICtrlCreateButton("Enregistrer", 432, 120, 67, 33)
$cancel = GUICtrlCreateButton("Annuler", 512, 120, 67, 33)
$tsIn = GUICtrlCreateInput("C:\Program Files\TS3\ts3client_win64.exe", 120, 8, 465, 21)
$wowIn = GUICtrlCreateInput("D:\World of Warcraft\Logs\WoWCombatLog.txt", 120, 40, 465, 21)
$Label1 = GUICtrlCreateLabel("Chemin d'accès TS : ", 8, 8, 105, 25)
$Label2 = GUICtrlCreateLabel("Chemin d'accès Log :", 8, 40, 106, 25)
$Pic1 = GUICtrlCreatePic("background.jpg", -16, -8, 604, 172, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS))
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


While 1
$nMsg = GUIGetMsg()
   Switch $nMsg
	  Case $GUI_EVENT_CLOSE
		 Exit
	  Case $cancel
		 Exit
	  Case $valid
		 $tsPath = '"' & GUICtrlRead($tsIn) & '"'
		 $wowPath = '"' & GUICtrlRead($wowIn) & '"'
		 IniWrite ( "tsulconfig.ini", "Applications", "tsPath", $tsPath)
		 IniWrite ( "tsulconfig.ini", "Applications", "wowPath", $wowPath)
		 Exit
   EndSwitch
WEnd

