$(function(){

    $('#im_section-name-5').parent().attr('href', '#');

    //Right menu
    var $clickCount = 0;
    $('#im_section-name-5').prev().click(function(){

        var $icon;
        if($clickCount%2 === 0) {

            changeWidth('.im-content', '75%');

            changeWidth('.right-menu', '25%');

            $icon = 'fal fa-times';

        }else{

            changeWidth('.right-menu', '0%');

            changeWidth('.im-content', '100%');

            $icon = 'fal fa-bars';

        }

        $(this).attr('class', $icon);

        $clickCount++;

    });

    $('.navbar-toggler').click(function(){

        var $this = $(this);

        if(!$this.next().is(':visible')) {

            $this.parents('.menu').addClass('fixed-menu');

            $this.children().hide();

            $this.children().next().show();

        }else{

            setTimeout(function(){

                $this.children().show();

                $this.children().addClass('animated rotateIn');

                $this.children().next().hide();

                $this.parents('.menu').removeClass('fixed-menu');

            }, 400);

        }

    });

    $('.menu li').not(':last-child').hover(function(){

        $('.menu li div').remove();

        appendMenuIcon($(this));

    }, function () {

        $('.menu li div').remove();

        appendMenuIcon($('.menu li.active'));

    });

    appendMenuIcon($('.menu li.active'));

});