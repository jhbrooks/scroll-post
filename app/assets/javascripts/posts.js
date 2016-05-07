$(function() {
  var isScrolledNearBottom = function() {
    return $(window).scrollTop() > $(document).height() - $(window).height() - 60;
  };

  var isTooBigForScroll = function() {
    return $(window).height() >= $(document).height();
  };

  if ($(".infinite_scroll").size()) {
    $(".infinite_scroll").css("display", "none");

    var more_posts_url = $(".pagination .next_page a").attr("href");
    if (more_posts_url && isTooBigForScroll()) {
      $.getScript(more_posts_url);
    }

    $(window).bindWithDelay("resize", function() {
      var more_posts_url = $(".pagination .next_page a").attr("href");
      if (more_posts_url && isTooBigForScroll()) {
        $.getScript(more_posts_url);
      }
    }, 1000);

    $(window).bindWithDelay("scroll", function() {
      var more_posts_url = $(".pagination .next_page a").attr("href");
      if (more_posts_url && isScrolledNearBottom()) {
        $.getScript(more_posts_url);
      }
    }, 1000);
  }
});
