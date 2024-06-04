jQuery(document).ready(function(e) {
    function t(t, n) {
        e(".lwa-loading").remove();
        n = e(n);
        if (t.result === true) {
            n.attr("class", "lwa-status lwa-status-confirm").html(t.message)
        } else if (t.result === false) {
            n.attr("class", "lwa-status lwa-status-invalid").html(t.error);
            n.find("a").click(function(t) {
                t.preventDefault();
                e(this).parents(".lwa").find("form.lwa-remember").show("slow")
            })
        } else {
            //Morus Tech - Error in check S2member login (Force reload page to submit certificate)
            //n.attr("class", "lwa-status lwa-status-invalid").html("An error has occured. Please try again.")
            n.attr("class", "lwa-status lwa-status-confirm").html("登錄成功，請稍等...")
            window.location.reload()
        }
    }
    if (e("#LoginWithAjax").length > 0) {
        e("#LoginWithAjax").addClass("lwa");
        e("#LoginWithAjax_Status").addClass("lwa-status");
        e("#LoginWithAjax_Register").addClass("lwa-register");
        e("#LoginWithAjax_Remember").addClass("lwa-remember");
        e("#LoginWithAjax_Links_Remember").addClass("lwa-links-remember");
        e("#LoginWithAjax_Links_Remember_Cancel").addClass("lwa-links-remember-cancel");
        e("#LoginWithAjax_Form").addClass("lwa-form")
    }
    e("form.lwa-form, form.lwa-remember, div.lwa-register form").submit(function(n) {
        n.preventDefault();
        var r = e(this);
        var i = r.find(".lwa-status");
        if (i.length == 0) {
            i = e('<span class="lwa-status"></span>');
            r.prepend(i)
        }
        var s = r.find(".lwa-ajax");
        if (s.length == 0) {
            s = e('<input class="lwa-ajax" name="lwa" type="hidden" value="1" />');
            r.prepend(s)
        }
        e('<div class="lwa-loading"></div>').prependTo(r);
        e.ajax({
            type: "POST",
            url: r.attr("action"),
            data: r.serialize(),
            success: function(n) {
                t(n, i);
                e(document).trigger("lwa_" + n.action, [n, r])
            },
            error: function() {
                t({}, i)
            },
            dataType: "jsonp"
        })
    });
    e(document).on("lwa_login", function(t, n, r) {
        if (n.result === true) {
            if (n.widget != null) {
                e.get(n.widget, function(t) {
                    var n = e(t);
                    r.parent(".lwa").replaceWith(n);
                    var i = n.find(".").show();
                    var s = n.parent().find(".lwa-title");
                    s.replaceWith(i)
                })
            } else {
                if (n.redirect == null) {
                    window.location.reload()
                } else {
                    window.location = n.redirect
                }
            }
        }
    });
    e(".lwa-modal").each(function(t, n) {
        var r = e(n);
        r.parents(".lwa").data("modal", r);
        e("body").append(e('<div class="lwa"></div>').append(r))
    });
    e(document).on("click", ".lwa-links-modal", function(t) {
        t.preventDefault();
        target = e(this).parents(".lwa").data("modal");
        target.reveal({
            modalbgclass: "lwa-modal-bg",
            dismissmodalclass: "lwa-modal-close"
        })
    });
    e(".lwa-links-register-inline").click(function(t) {
        t.preventDefault();
        e(this).parents(".lwa").find(".lwa-register").show("slow")
    });
    e(".lwa-links-register-inline-cancel").click(function(t) {
        t.preventDefault();
        e(this).parents(".lwa-register").hide("slow")
    });
    e(document).on("click", ".lwa-links-remember", function(t) {
        t.preventDefault();
        e(this).parents(".lwa").find(".lwa-remember").show("slow")
    });
    e(document).on("click", ".lwa-links-remember-cancel", function(t) {
        t.preventDefault();
        e(this).parents(".lwa-remember").hide("slow")
    })
});
(function(e) {
    e("a[data-reveal-id]").on("click", function(t) {
        t.preventDefault();
        var n = e(this).attr("data-reveal-id");
        e("#" + n).reveal(e(this).data())
    });
    e.fn.reveal = function(t) {
        var n = {
            animation: "fadeAndPop",
            animationspeed: 300,
            closeonbackgroundclick: true,
            dismissmodalclass: "close-reveal-modal",
            modalbgclass: "reveal-modal-bg"
        };
        var t = e.extend({}, n, t);
        return this.each(function() {
            function a() {
                s = false
            }
            function f() {
                s = true
            }
            var n = e(this),
                r = parseInt(n.css("top")),
                i = n.height() + r,
                s = false,
                o = e("." + t.modalbgclass);
            if (o.length == 0) {
                o = e('<div class="' + t.modalbgclass + '" />').insertAfter(n)
            }
            if (n.find("." + t.dismissmodalclass).length == 0) {
                n.append('<a class="' + t.dismissmodalclass + '">&#215;</a>')
            }
            n.bind("reveal:open", function() {
                o.unbind("click.modalEvent");
                e("." + t.dismissmodalclass).unbind("click.modalEvent");
                if (!s) {
                    f();
                    if (t.animation == "fadeAndPop") {
                        n.css({
                            top: e(document).scrollTop() - i,
                            opacity: 0,
                            visibility: "visible",
                            display: "block"
                        });
                        o.fadeIn(t.animationspeed / 2);
                        n.delay(t.animationspeed / 2).animate({
                            top: e(document).scrollTop() + r + "px",
                            opacity: 1
                        }, t.animationspeed, a())
                    }
                    if (t.animation == "fade") {
                        n.css({
                            opacity: 0,
                            visibility: "visible",
                            top: e(document).scrollTop() + r,
                            display: "block"
                        });
                        o.fadeIn(t.animationspeed / 2);
                        n.delay(t.animationspeed / 2).animate({
                            opacity: 1
                        }, t.animationspeed, a())
                    }
                    if (t.animation == "none") {
                        n.css({
                            visibility: "visible",
                            top: e(document).scrollTop() + r,
                            display: "block"
                        });
                        o.css({
                            display: "block"
                        });
                        a()
                    }
                }
                n.unbind("reveal:open")
            });
            n.bind("reveal:close", function() {
                if (!s) {
                    f();
                    if (t.animation == "fadeAndPop") {
                        o.delay(t.animationspeed).fadeOut(t.animationspeed);
                        n.animate({
                            top: e(document).scrollTop() - i + "px",
                            opacity: 0
                        }, t.animationspeed / 2, function() {
                            n.css({
                                top: r,
                                opacity: 1,
                                visibility: "hidden"
                            });
                            a()
                        })
                    }
                    if (t.animation == "fade") {
                        o.delay(t.animationspeed).fadeOut(t.animationspeed);
                        n.animate({
                            opacity: 0
                        }, t.animationspeed, function() {
                            n.css({
                                opacity: 1,
                                visibility: "hidden",
                                top: r
                            });
                            a()
                        })
                    }
                    if (t.animation == "none") {
                        n.css({
                            visibility: "hidden",
                            top: r
                        });
                        o.css({
                            display: "none"
                        })
                    }
                }
                n.unbind("reveal:close")
            });
            n.trigger("reveal:open");
            var u = e("." + t.dismissmodalclass).bind("click.modalEvent", function() {
                n.trigger("reveal:close")
            });
            if (t.closeonbackgroundclick) {
                o.css({
                    cursor: "pointer"
                });
                o.bind("click.modalEvent", function() {
                    n.trigger("reveal:close")
                })
            }
            e("body").keyup(function(e) {
                if (e.which === 27) {
                    n.trigger("reveal:close")
                }
            })
        })
    }
})(jQuery)