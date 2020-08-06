/*part_system = part_system_create()

part_emitter = part_emitter_create(part_system)

part_type = part_type_create()
part_type_shape(part_type, pt_shape_disk)
part_type_size(part_type,0.1,0.1,0,-0.1)
part_type_life(part_type,10000,10000)

part_emitter_region(part_system, part_emitter, x-25,y-50,x+25,y+50, ps_shape_rectangle, ps_distr_linear)

part_emitter_stream(part_system, part_emitter, part_type, 1)*/

image_xscale = random_range(0.5,2.2)
image_yscale = random_range(0.5,2.2)

x+= irandom_range(-2,2)
y+= irandom_range(+13,0)