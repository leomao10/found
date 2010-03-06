/*Date picker */
datapick_config = function(){
    $('.startdatepick').datepicker({
    });
    $('.enddatepick').datepicker({
    });
    $('.datepick').datepicker({
        showOn: 'button',
        buttonImage: '/images/calendar.png',
        buttonImageOnly: true,
        dateFormat: 'dd-mm-yy',
        altFormat: 'mm-dd-yy',
        changeMonth: true,
        changeYear: true,
        yearRange: '-200:+20',
        onClose: function(){
            $(this).keyup();
        }
    });
    $('.beforestartdatepick').datepicker({
        showOn: 'button',
        buttonImage: '/images/calendar.png',
        buttonImageOnly: true,
        dateFormat: 'dd-mm-yy',
        altFormat: 'mm-dd-yy',
        changeMonth: true,
        changeYear: true,
        yearRange: '-200:+20',
        beforeShow: function(){
            var arr_dateText = $("#"+$(this).attr("end_date")).val().split("-");
            day = arr_dateText[0];
            month = arr_dateText[1];
            year = arr_dateText[2];
            if(year!=undefined){
                $(this).datepicker('option', 'maxDate', new Date(year, month-1, day));
            }
        }
    });

    $('.ui-datepicker-trigger').live('mouseover', function(){
        var endDate = $(this).parent().find('.enddatepick');
        if(endDate.attr('start_date')!=undefined){
            var arr_dateText = $('#'+endDate.attr('start_date')).val().split("-");
            year = arr_dateText[2];
            if(year==undefined){
                endDate.val('');
                endDate.datepicker('disable');
            }
        }else{
            var roleEndDate = $(this).parent().find('.role_enddatepick');
            if(roleEndDate.attr('start_date')!=undefined){
                var role_arr_dateText = $('#'+roleEndDate.attr('start_date')).val().split("-");
                year = role_arr_dateText[2];
                if(year==undefined){
                    roleEndDate.val('');
                    roleEndDate.datepicker('disable');
                }
            }
        }
    });
};