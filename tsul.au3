#include <Date.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=E:\Boulot\BENEVOLE\UFROG\supp combatlog\Form1.kxf
$Form1 = GUICreate("Voulez vous supprimer les logs?", 421, 166, 307, 211)
$suppr = GUICtrlCreateButton("Supprimer", 264, 120, 67, 33)
$cancel = GUICtrlCreateButton("Annuler", 344, 120, 67, 33)
$config = GUICtrlCreateButton("Config.", 344, 8, 67, 25, $WS_GROUP)
$Pic1 = GUICtrlCreatePic("E:\Boulot\BENEVOLE\UFROG\supp combatlog\ufrog.JPG", -16, -8, 436, 172, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS))
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
$nMsg = GUIGetMsg()
$tsPath = IniRead ( "tsulconfig.ini", "Applications", "tsPath", "C:\Program Files\TS3\ts3client_win64.exe")
$wowPath = IniRead ( "tsulconfig.ini", "Applications", "wowPath", "D:\World of Warcraft\Logs\WoWCombatLog.txt")
   Switch $nMsg
	  Case $GUI_EVENT_CLOSE
		 Exit
	  Case $config
		 Run("tsulconfig.exe")
		 Exit

	  Case $suppr
		 ;récupérer la date du jour
		 $dateRepere = _DateAdd("D",0,_NowCalc())
		 ; Pour l'affichage à la Francaise.
		 $dateRepere = _DateTimeFormat($dateRepere, 2)
		 ;MsgBox(0,"Hier : ",$dateRepere)

		 ;comparer date du jour et date du fichier
		 If FileExists($wowPath) Then
			$filePath = $wowPath
			$fileDateBrute = FileGetTime($filePath)
			$fileDate = $fileDateBrute[2] & "/" & $fileDateBrute[1] & "/" & $fileDateBrute[0]
		 Else
			MsgBox(0,"Erreur","Le fichier est introuvable. "&@CRLF&@CRLF&"Le fichier est déjà effacé ou l'application n'est pas configurée correctement.")
			Run($tsPath)
			Exit
		 EndIf
		 ;supprimer si date du fichier < date du jour
		 If $fileDate < $dateRepere Then
			;MsgBox(0,"Suppression","Jour : " & $dateRepere & " > " & "Fichier : " &$fileDate)
			FileDelete($wowPath)
		 Else
			MsgBox(0,"Erreur","Le fichier date du " & $fileDate)
		 EndIf
		 ;Lancer TS
		 Run($tsPath)
		 Exit
	  Case $cancel
		 Run($tsPath)
		 Exit
	  EndSwitch
WEnd
