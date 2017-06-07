
jQuery(document).ready(function() {
    if ($(".navbar").width() > 1007) {
        $('.nav .dropdown').hover(function() {
            $(this).addClass('open');
        }, function() {
            $(this).removeClass('open');
        });
    };
    $('.nav-category .dropdown-submenu ').hover(function() {
        $(this).addClass('open');
    }, function() {
        $(this).removeClass('open');
    });
});
jQuery(document).ready(function() {
    $('.searchBox a').on("click", function() {
        $(".searchBox .dropdown-menu").toggleClass('display-block');
        $(".searchBox a i").toggleClass('fa-close').toggleClass("fa-search");
    });
});
jQuery(document).ready(function() {
    $('.select-drop').selectbox();
});
jQuery(document).ready(function() {
    $('.side-nav li a').click(function() {
        $(this).find('i').toggleClass('fa fa-minus fa fa-plus');
    });
});

jQuery(document).ready(function() {
    $(".quick-view .btn-block").click(function() {
        $(".quick-view").modal("hide");
    });
});

var allIcons = $("#faqAccordion .panel-heading i.fa");
$('#faqAccordion .panel-heading').click(function() {
    allIcons.removeClass('fa-chevron-down').addClass('fa-chevron-up');
    $(this).find('i.fa').removeClass('fa-chevron-up').addClass('fa-chevron-down');
});
var allIconsOne = $("#accordionOne .panel-heading i.fa");
$('#accordionOne .panel-heading').click(function() {
    allIconsOne.removeClass('fa-chevron-down').addClass('fa-chevron-up');
    $(this).find('i.fa').removeClass('fa-chevron-up').addClass('fa-chevron-down');
});
var allIconsTwo = $("#accordionTwo .panel-heading i.fa");
$('#accordionTwo .panel-heading').click(function() {
    allIconsTwo.removeClass('fa-chevron-down').addClass('fa-chevron-up');
    $(this).find('i.fa').removeClass('fa-chevron-up').addClass('fa-chevron-down');
});
var allIconsThree = $("#togglesOne .panel-heading i.fa");
$('#togglesOne .panel-heading').click(function() {
    allIconsThree.removeClass('fa-chevron-down').addClass('fa-chevron-up');
    $(this).find('i.fa').removeClass('fa-chevron-up').addClass('fa-chevron-down');
});
var allIconsFour = $("#togglesTwo .panel-heading i.fa");
$('#togglesTwo .panel-heading').click(function() {
    allIconsFour.removeClass('fa-chevron-down').addClass('fa-chevron-up');
    $(this).find('i.fa').removeClass('fa-chevron-up').addClass('fa-chevron-down');
});