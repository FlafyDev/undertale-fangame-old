
btnSelect = 0 //out of 3
btnSprites = [sBtnFight,sBtnAct,sBtnItem,sBtnMercy] //[sBtnItem,sBtnAct,sBtnMercy,sBtnFight]
btnPos_x = room_width/2
btnPos_y = 500
btnPSize = [0,0,0,0]

arena_surface=noone
arena_x = room_width/2
arena_y = 346
arena_width_default = 780
arena_height_default = 170
arena_width = arena_width_default
arena_height = arena_height_default
arena_thickness = 5 //outline
arena_width_to = arena_width //will activate only before and after fights
arena_height_to = arena_height
arena_change_spd = 10

player_info_x = 190
player_info_y = 446
player_info2_x = player_info_x+305

Stage = 0 //0 = main    1 = fight     2 = act   10 = Msg   11 = monster attack
preStage = Stage

backup = __()

enableHeart = false
hitboxHeart = false
moveableHeart = false
sprHeart = sHeart
sprHeartFlee = sHeart_Flee
heartColor = c_red
Heart_x = arena_x
Heart_y = arena_y
Heart_spd = 2
HeartHp = 20
HeartInvisibility = 0
HeartInvisTime = 120 // -1 every frame

HeartName = global.pName

bboxLeftHeart = 8
bboxRightHeart = 7
bboxUpHeart = 8
bboxDownHeart = 7

TextPos_x = [55,500,55,500] 
TextPos_y = [16,16,90,90]
FightPos_x = 55 
FightPos_y = [16,48,80,112]
FightSpd = 6
FightPos = 0
FightHit = 0
FightHpBar_Width = 125
FightHpDownTime = 60 //1 seconds
FightEffectSpd = 0.1
FightEffectSprite = sAttackEffect
Fought = false //0 = haven't fought this time, 1 = pressed fight but missed this time, 2 = fought this time
delay=0

blackScreenAlpha = 0
exitBattleTo = -1 // -1 for do nothing
playerNewPos_x = undefined
playerNewPos_y = undefined
playerNewDir = undefined

HitShake = 0

monstersSelect = 0
monstersDot = "* "

useText = 0 //what gametext to use
countText = 0
countTextStop = 0

//actText
actSelect = 0

//Messages
MsgSelect = 0 //-1 for no msg after choosing an act/item/mercy

MonstersMsgs = ["Frogy....\n Frog..."]
MonstersMsgsPos = [[216,130]]
MonstersMsgsSelect = [1]
MonstersMsgsArrow = [0]  //0 = right --- 1 = up --- 2 = left --- 3 = down
MonstersMsgsMoveableHeart = false
MonstersMsgsFont = ft_FixedsysTiny
MonstersBubble_width =  -1 //-1 for automatic
MonstersBubble_height = -1 //-1 means nothing in the helght
MonstersMsgsSkip = false //b skip the text typewriter animation
MonstersMsgsDisableAfterBattle = false;

winMsg = "* YOU WON! \n* You earned {xp} XP and {gold} gold."
winAction = false // becomes true when you press A after the {winMsg} ends. you can use it for getting out of the battle
winPage = 0
gainedXP = 0
gainedGOLD = 0

stick_sprite = sBattleAttackStick
stick_spdimg = 0.1

flee=true
fleeing = false //don't change, yea?
fleeMessages = ["* Escaped..."]
fleeMessageSelect = 0
fleeAction = false // after you flee and wait{fleeDelay} frames it becomes true. you can use it for getting out of the battle
fleeDelay = 40
spareTexts = ["* spare","* flee"]
spareSelect = 0
spared = false

MonstersMsgsPage = 0

endFight = false

undertale_pack = undertale_pack_create(0.5, true)
undertale_pack_noTxtCount = undertale_pack_create(0.5,true)
undertale_pack_noTxtCount[0] = 99999

// OUTDATED reme variables use to copy a text variable and they display instade the original one, so you should change them only when you need to change the text mid displaying him.
//remeMsgs = ""
//remeMonstersMsgs = ""

Fight = 0
FightTimer = 100

for (var i=0; i<12; i++)
	timer[i]=0

firsttimedraw = 0

backSprite = sBgBattle

event_user(0)