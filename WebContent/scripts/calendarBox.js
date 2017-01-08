
$(document).ready(function () {
	bindCalendarBox();
});

function bindCalendarBox() {
    $(".calendarBox").datetimepicker({
        timepicker: false,
        format: 'Y/m/d'
    });
}
