key_a_once = keyboard_check_pressed(keyA)
key_b_once = keyboard_check_pressed(keyB)
key_left_once = keyboard_check_pressed(vk_left)
key_right_once = keyboard_check_pressed(vk_right)
key_up_once = keyboard_check_pressed(vk_up)
key_down_once = keyboard_check_pressed(vk_down)

text = [
	"* Shalom           \n  What's up?",
	"* How's going?"
]

images = [
]

text_x_image = 250 //if the textbox's frame have image on the side, by how many px it will move the text for a place for the image
imageX = 50
imageindex=0
imageXscale = 1 
imageYscale = 1

SpriteAlpha = 1
Sprite = 0
SpriteSpeed = 0
sprspdcounter = 0
SpriteSize_x = 1
SpriteSize_y = 1
SpriteImg = -1
plusX = 0 
plusY = 0

answer = [] //returns [question num in "questions" array, 0 or 1(the option selected)] when question completed
questions = [] //[ [option 1, option 2, textNum, enable], ["], ... ] !!array inside of array!!
questionSelect = 0
heartColor = c_red

collision = false

depthSystemOn = true

player_direction=0

moveable=1

sprites_x=[]
sprites_y=[]

// you put them on textbox_y 
textbox_up = 182/2
textbox_down =540-182/2

textbox_width = 849
textbox_height = 150
textbox_x = 960/2
textbox_y = textbox_up
textbox_outline = 6
textbox_enable = 0
textbox_frame = 0
textbox_counter = 0
textbox_textstop = 0
textbox_ended = 0
textbox_skipText = true
textbox_forcestart = 0

undertale_pack = undertale_pack_create(0.5, true)
undertale_pack2 = undertale_pack_create(0.5, true)
undertale_pack3 = undertale_pack_create(0.5, true)



textbox_firsttime = 0

Speed = 3

key_left = 0
key_right = 0
key_up = 0
key_down = 0

event_user(0)

/* example for event user 0

sprite_index = sSans_Hitbox
mask_index = sSans_Hitbox
Sprite = sSans_Down
SpriteSize_x = 2
SpriteSize_y = 2
SpriteSpeed = 10

sprspdcounter = 0

moveable = 1

sprites_x = [sSans_Right,sSans_Left]
sprites_y = [sSans_Down,sSans_Up]

*/