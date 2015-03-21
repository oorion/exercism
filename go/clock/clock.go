package clock

import (
	"strconv"
)

const TestVersion = 2

type Clock struct {
	hour, minute int
}

func (c *Clock) String() string {
	addedHours := 0
	if c.minute < 0 {
		numMinusHours := c.minute/60 - 1
		addedHours += numMinusHours
	} else {
		addedHours = c.minute / 60
	}
	hour := strconv.Itoa((c.hour + 48 + addedHours) % 24)
	minute := strconv.Itoa((c.minute + 180) % 60)
	output := ""
	if len(hour) == 1 {
		output = "0" + hour
	} else {
		output = hour
	}
	if len(minute) == 1 {
		output += ":0" + minute
	} else {
		output += ":" + minute
	}
	return output
}

func (c Clock) Add(m int) Clock {
	return c
}

func Time(h int, m int) *Clock {
	return &Clock{h, m}
}
