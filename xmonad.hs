import XMonad
import qualified Data.Map as M
import XMonad.Actions.GridSelect
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main=do    
    xmproc <- spawnPipe "/usr/bin/xmobar $HOME/.xmobarrc"
    xmonad $ defaultConfig
      { manageHook  = manageDocks <+> manageHook defaultConfig
      , layoutHook  = avoidStruts $ layoutHook defaultConfig
      , terminal    = "urxvt"
      , borderWidth = 1
      , logHook = dynamicLogWithPP $xmobarPP
                      { ppOutput = hPutStrLn xmproc
                      , ppTitle = xmobarColor "red" "" . shorten 90
                      }
      , modMask     = mod1Mask
 	 }  `additionalKeys`
     [ ((mod1Mask .|. shiftMask, xK_g), spawn "google-chrome")
     , ((mod1Mask .|. shiftMask, xK_f), spawn "firefox")
     , ((mod1Mask .|. shiftMask, xK_l), spawn "gnome-screensaver-command --activate")
     , ((mod1Mask .|. shiftMask, xK_s), goToSelected defaultGSConfig)
     , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
     , ((0, xK_Print), spawn "scrot")
     ]
--newKeys x  = M.union (keys defaultConfig x) (M.fromList (myKeys x))


--myKeys conf@(XConfig {XMonad.modMask = modm}) = 
--	[   ((modm .|. shiftMask, xK_g ), spawn "google-chrome")
--      , ((modm .|. shiftMask, xK_f), spawn "firefox")
--	  , ((modm .|. shiftMask, xK_l ), spawn "gnome-screensaver-command --activate")
--	  , ((modm .|. shiftMask, xK_s), goToSelected defaultGSConfig)
--    ]
