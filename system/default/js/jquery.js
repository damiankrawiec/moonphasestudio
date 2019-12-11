$(function(){

    $('#im_section-name-5').parent().attr('href', '#');

    //Right menu
    var $clickCount = 0;
    $('#im_section-name-5').prev().click(function(){

        var $icon;
        if($clickCount%2 === 0) {

            changeWidth('.im-content', '75%');

            changeWidth('.right-menu-box', '25%');

            $icon = 'fal fa-times';

        }else{

            changeWidth('.right-menu-box', '0%');

            changeWidth('.im-content', '100%');

            $icon = 'fal fa-bars';

        }

        $(this).attr('class', $icon);

        if($clickCount%2 === 0) {

            setTimeout(function () {

                $('.right-menu-box .right-menu-title, .right-menu-box .inner-link').show();

                $('.right-menu-box .portfolio').fadeIn();
            }, 500);

        }else{

            $('.right-menu-box .portfolio').hide();

            $('.right-menu-box .right-menu-title, .right-menu-box .inner-link').hide();

        }

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

    if($('.menu li.active').length > 0) {

        appendMenuIcon($('.menu li.active'));

    }else{

        var $liPortfolio = $('.menu li a[href="portfolio"]').parent();

        $liPortfolio.addClass('active');

        appendMenuIcon($liPortfolio);

    }

    if($('.right-menu-box').length > 0) {

        $('.right-menu-box .object').removeClass('col-lg-6 col-xl-4');

    }

});