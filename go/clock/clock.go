package clock

const TestVersion = 2

type Clock struct {
	hour, minute int
}

func (c Clock) String() string {
	return ""
}

func (c Clock) Add(m int) int {
	return 1
}

func Time(h int, m int) *Clock {
	return &Clock{h, m}
}
