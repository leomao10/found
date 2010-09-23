/*
Jquery and Rails powered default application.js
Easy Ajax replacement for remote_functions and ajax_form based on class name
All actions will reply to the .js format
Unostrusive, will only works if Javascript enabled, if not, respond to an HTML as a normal link
respond_to do |format|
format.html
format.js {render :layout => false}
end
*/

jQuery.ajaxSetup({
    'beforeSend': function(xhr) {
        xhr.setRequestHeader("Accept", "text/javascript")
    }
})

function _ajax_request(url, data, callback, type, method) {
    if (jQuery.isFunction(data)) {
        callback = data;
        data = {};
    }
    return jQuery.ajax({
        type: method,
        url: url,
        data: data,
        success: callback,
        dataType: type
    });
}

jQuery.extend({
    put: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'PUT');
    },
    delete_: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'DELETE');
    }
});

/*
Submit a form with Ajax
Use the class ajaxForm in your form declaration
<% form_for @comment,:html => {:class => "ajaxForm"} do |f| -%>
*/
jQuery.fn.submitWithAjax = function() {
    this.unbind('submit', false);
    $(this).live('submit', function() {
        $.post(this.action, $(this).serialize(), null, "script");
        return false;
    });
    return this;
};

/*
Retreive a page with get
Use the class get in your link declaration
<%= link_to 'My link', my_path(),:class => "get" %>
*/
jQuery.fn.getWithAjax = function() {
    this.unbind('click', false);
    this.click(function() {
        $.get($(this).attr("href"), $(this).serialize(), null, "script");
        return false;
    })
    return this;
};

/*
Post data via html
Use the class post in your link declaration
<%= link_to 'My link', my_new_path(),:class => "post" %>
*/
jQuery.fn.postWithAjax = function() {
    this.unbind('click', false);
    this.click(function() {
        $.post($(this).attr("href"), $(this).serialize(), null, "script");
        return false;
    })
    return this;
};

/*
Update/Put data via html
Use the class put in your link declaration
<%= link_to 'My link', my_update_path(data),:class => "put",:method => :put %>
*/
jQuery.fn.putWithAjax = function() {
    this.unbind('click', false);
    this.click(function() {
        $.put($(this).attr("href"), $(this).serialize(), null, "script");
        return false;
    })
    return this;
};

/*
Delete data
Use the class delete in your link declaration
<%= link_to 'My link', my_destroy_path(data),:class => "delete",:method => :delete %>
*/
jQuery.fn.deleteWithAjax = function() {
    this.removeAttr('onclick');
    this.unbind('click', false);
    this.click(function() {
        $.delete_($(this).attr("href"), $(this).serialize(), null, "script");
        return false;
    })
    return this;
};

/*
Ajaxify all the links on the page.
This function is called when the page is loaded. You'll probaly need to call it again when you write render new datas that need to be ajaxyfied.'
*/
function ajaxLinks(){
    $('a.get').getWithAjax();
    $('a.post').postWithAjax();
    $('a.put').putWithAjax();
    $('a.delete').deleteWithAjax();
}

function ajaxForms(){
    $('.ajaxForm').submitWithAjax();
}

$(document).ready(function() {
    // All non-GET requests will add the authenticity token
    $(document).ajaxSend(function(event, request, settings) {
        if (typeof(window.AUTH_TOKEN) == "undefined") return;
        // IE6 fix for http://dev.jquery.com/ticket/3155
        if (settings.type == 'GET' || settings.type == 'get') return;

        settings.data = settings.data || "";
        settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(window.AUTH_TOKEN);
    });

    ajaxLinks();
    ajaxForms();
});
 
//side jquery content start from here
$(document).ready(function(){
    datapick_config();
});

jQuery(function($){
    // *** search box ***
    $('label.slider_required').each(function(){
        var _this = this, opts = {};
        opts.min = parseInt($(_this).attr('min'));
        opts.max = parseInt($(_this).attr('max'));
        opts.range = true;
        opts.slide = function(event, ui) {
            $('span.value', _this).text(ui.values[0] + ' - ' + ui.values[1]);
            $('input.min',_this).val(ui.values[0]);
            $('input.max',_this).val(ui.values[1]);
        }
        if ($(_this).attr('step')) opts.step = parseInt($(_this).attr('step'));
        var min_val = $('input.min', _this).val() ? $('input.min', _this).val() : opts.min;
        var max_val = $('input.max', _this).val() ? $('input.max', _this).val() : opts.max;
        opts.values = [min_val, max_val];
        $('span.bar', _this).slider(opts);
        $('span.value', _this).text(min_val + ' - ' + max_val);
    });

    $('a.more').each(function(e){
        var _this = this, $more = $('div.more_options');
        var show = function(){
            $(_this).text($(_this).attr('hide'));
            $('div.more_options').slideDown();
        };
        var hide = function(){
            $(_this).text($(_this).attr('show'));
            $more.slideUp();
        };
        if ($(_this).attr('show') == $(_this).text())
            $(_this).toggle(show, hide);
        else
            $(_this).toggle(hide, show);
        return false;
    });
});

jQuery(function($){
    $('#new_key').watermark('Enter Suburn or Post Code Here');
});

jQuery(function($){
    $("input#new_key").autocomplete({
        source: function(request, response) {
            $.ajax({
                url: "/suburbs/search/",
                data: {
                    keyword: $("input#new_key").val(),
                    limit: 3
                },
                success: function(data) {
                    response($.map(data, function(item) {
                        return {
                            label: "<b>" + item.suburb.name + "</b>, <span style='font-size:smaller'>" + item.suburb.state + " " + item.suburb.postcode + "</span>",
                            value: "" + item.suburb.name + ", " + item.suburb.state + " " + item.suburb.postcode + ";"
                        }
                    }))

                },
                dataType: "json"
            })
        }
    });
});

postcode_checking=function(target){
  link = $(this.el)
 var suburb = $('#post_suburb').val();
  if(link.val()!= ""){
    $("#spinner").show();
    $.ajax({
      type: "GET",
      url: "/addresses/postcode_check",
      data: 'postcode='+target+'&suburb='+suburb,
      dataType:"script"
    });
  }else{
      
}
};

$(document).ready(function(){
  $(".postcode_check").typeWatch( {
    callback: postcode_checking
  } );
});










