
# Default: monthly view
calendar()

# Weekly view
calendar(view = "week")

# Or only day:
calendar(view = "day")


# Add schedules data
ex_data <- cal_demo_data()
calendar(ex_data)
