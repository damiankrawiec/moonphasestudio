function changeWidth($object, $width) {

    $($object).animate({
        width: $width
    }, 500);

}
function appendMenuIcon($this) {

    $this.append('<div class="active-arrow d-none d-lg-block"><i class="fas fa-sort-up animated slideInUp"></i></div>');

}
function activeChange($this) {

    $('.menu li div').remove();

    appendMenuIcon($this);

}