$(function(){

    $('#im_section-name-5').parent().attr('href', '#');

    //Right menu
    var $clickCount = 0;
    $('#im_section-name-5').prev().click(function(){

        var $icon;
        if($clickCount%2 === 0) {

            changeWidth('.im-content', '80%');

            changeWidth('.right-menu', '20%');

            $icon = 'fal fa-times';

        }else{

            changeWidth('.right-menu', '0%');

            changeWidth('.im-content', '100%');

            $icon = 'fal fa-bars';

        }

        $(this).attr('class', $icon);

        $clickCount++;

    });

    $('.menu li').not(':last-child').hover(function(){

        $('.menu li div').remove();

        appendMenuIcon($(this));

    }, function () {

        appendMenuIcon('.menu li.active');

    });

    appendMenuIcon('.menu li.active');

});