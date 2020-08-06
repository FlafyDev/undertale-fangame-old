draw_set_font(ft_8bito)
draw_set_color(c_black)
draw_text_shake(x,y,"Shaky Text\nddd\nsdffdsfsd\n fdssdf \ndsffds", b, 0, 0, 0, 0, 0)
draw_text(100,100,"Hardness: " + string(b))

if keyboard_check_pressed(vk_right) b++
if keyboard_check_pressed(vk_left) game_restart()

ATEX_draw(x+200,y+200,"asd <runline?title='world'?spd=100>",-1,0)

show_debug_message(string(b))