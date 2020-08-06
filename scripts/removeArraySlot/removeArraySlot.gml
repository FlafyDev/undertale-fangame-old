/// @desc removeArraySlot(array, slot)
/// @function removeArraySlot
/// @param {array} array
/// @param {array} slots

var array = argument[0]
var newArray = []
var slots = argument[1]

var slotsRemoved = 0
for (var i = 0; i < array_length_1d(array); ++i) {
	var slotFound = false
	for (var ii = 0; ii < array_length_1d(slots); ++ii) {
		if i==slots[ii] {
			slotFound = true
			break;
		}
	}
	if slotFound {
		slotsRemoved++
		continue;
	}
	newArray[i-slotsRemoved] = array[i]
}

return newArray