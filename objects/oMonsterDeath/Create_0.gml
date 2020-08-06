//ualphaPower = shader_get_uniform(shader0, "alphaPower");
steps = 0

surface = noone

colors = []
colorsI = 0
colorsSteps = 0

maketodust = true
readyColors = []

sprite = 0
xscale = 1
yscale = 1
subimg = 0

secondsCreate = 20

if array_length_1d(readyColors)>0 {
	maketodust = true
	colors = readyColors
}