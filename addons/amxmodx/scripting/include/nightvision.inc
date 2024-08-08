#if defined _nightvision
  #endinput
#endif
#define _nightvision

/**
 * Sets whether a player has night vision.
 *
 * @param id               Player index.
 * @param isEnabled        True to give, false for removing it.
 * @param isTurnedOn       True to turn on (requires isEnabled = true), false to turn off.
 * @param shouldEmitSound  True to 
 *
 * @return                 True if successful, false otherwise.
 */
native bool:SetUserNightvision(id, bool:isEnabled, bool:isTurnedOn = false, bool:shouldEmitSound = false);

/**
 * Refreshes nightvision ScreenFade effect. Use it in case you need to restore nightvision after another ScreenFade.
 * 
 * @param id               Player index.
 * 
 * @noreturn
 */
native RefreshUserNightvision(id);

/**
 * Returns whether nightvision is enabled.
 * 
 * @param id               Player index.
 * 
 * @return                 If nightvision is enabled.
 */
native bool:IsNightvisionEnabled(id);

forward NightvisionTurnedOn_Pre(id, &red, &green, &blue, lightLevel[], lightLevelLen);
forward NightvisionTurnedOn_Post(id);
forward NightvisionTurnedOff_Pre(id, lightLevel[], lightLevelLen);
forward NightvisionTurnedOff_Post(id);