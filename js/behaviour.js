// Generated by CoffeeScript 1.12.4
(function() {
  App.Index = (function() {
    function Index() {}

    $(document).ready(function() {
      return console.log("ready");
    });

    $(window).on("load", function() {
      return App.Index.Listeners();
    });

    $(window).on("resize", function() {
      return console.log("resize");
    });

    Index.Listeners = function() {
      App.Index.lookBoxes();
      App.Index.ovalCenterChangeColorClick();
      return App.Index.ovalRightChangeColorClick();
    };

    Index.ovalCenterChangeColorClick = function() {
      var color;
      color = "";
      return $(".crOvalButton").mousedown(function(e) {
        var $finalTriang, borderStr, finalTriangId, id;
        id = $(this).attr("id");
        finalTriangId = App.Index.getTriangleIdByAboveIdOvalCenter(id, e);
        if (finalTriangId) {
          $finalTriang = $("#" + finalTriangId);
          borderStr = "border-" + App.Index.getNonTransparentBorder($finalTriang) + "-color";
          color = App.Index.rgb2hex($finalTriang.css(borderStr));
          $finalTriang.css(borderStr, App.Index.colorLuminance(color, "-0.5"));
          $(".crOvalButton").mouseleave(function() {
            return $(".crOvalButton").removeAttr("style");
          });
          return $(".crOvalButton").mouseenter(function() {
            return $(".crOvalButton").removeAttr("style");
          });
        }
      }).mouseup(function(e) {
        var $finalTriang, borderStr, finalTriangId, id;
        id = $(this).attr("id");
        finalTriangId = App.Index.getTriangleIdByAboveIdOvalCenter(id, e);
        if (finalTriangId) {
          $finalTriang = $("#" + finalTriangId);
          borderStr = "border-" + App.Index.getNonTransparentBorder($finalTriang) + "-color";
          color = App.Index.rgb2hex($finalTriang.css(borderStr));
          return $finalTriang.removeAttr("style");
        }
      }).mouseleave(function() {
        return $(".crOvalButton").removeAttr("style");
      });
    };

    Index.getTriangleIdByAboveIdOvalCenter = function(id, e) {
      var $clicked, clickedHeight, clickedWidth, clickedXInElem, clickedYInElem, fX, finalTriangId, ret;
      switch (id) {
        case "crOvalCenterLeftTopTriang":
          $clicked = $("#crOvalCenterLeftTopTriang");
          clickedHeight = $clicked.outerHeight();
          clickedWidth = $clicked.outerWidth();
          clickedXInElem = e.pageX - $clicked.offset().left;
          clickedYInElem = ($clicked.offset().top + clickedHeight) - e.pageY;
          fX = Math.round((-clickedHeight / clickedWidth) * clickedXInElem + clickedHeight);
          ret = function() {
            if (fX - clickedYInElem > 0) {
              return "crOvalCenterLeftTopTriang";
            }
            if (fX - clickedYInElem < 0) {
              return "crOvalCenterTopLeftTriang";
            }
            if (fX - clickedYInElem === 0) {
              return false;
            }
          };
          finalTriangId = ret();
          break;
        case "crOvalCenterRightTopTriang":
          $clicked = $("#crOvalCenterRightTopTriang");
          clickedHeight = $clicked.outerHeight();
          clickedWidth = $clicked.outerWidth();
          clickedXInElem = e.pageX - $clicked.offset().left;
          clickedYInElem = ($clicked.offset().top + clickedHeight) - e.pageY;
          fX = Math.round((clickedHeight / clickedWidth) * clickedXInElem);
          ret = function() {
            if (fX - clickedYInElem > 0) {
              return "crOvalCenterRightTopTriang";
            }
            if (fX - clickedYInElem < 0) {
              return "crOvalCenterTopRightTriang";
            }
            if (fX - clickedYInElem === 0) {
              return false;
            }
          };
          finalTriangId = ret();
          break;
        case "crOvalCenterLeftBottomTriang":
          $clicked = $("#crOvalCenterLeftBottomTriang");
          clickedHeight = $clicked.outerHeight();
          clickedWidth = $clicked.outerWidth();
          clickedXInElem = e.pageX - $clicked.offset().left;
          clickedYInElem = $clicked.offset().top - e.pageY;
          fX = Math.round((clickedHeight / clickedWidth) * clickedXInElem - clickedHeight);
          ret = function() {
            if (Math.abs(fX) - Math.abs(clickedYInElem) > 0) {
              return "crOvalCenterLeftBottomTriang";
            }
            if (Math.abs(fX) - Math.abs(clickedYInElem) < 0) {
              return "crOvalCenterBottomLeftTriang";
            }
            if (Math.abs(fX) - Math.abs(clickedYInElem) === 0) {
              return false;
            }
          };
          finalTriangId = ret();
          break;
        case "crOvalCenterRightBottomTriang":
          $clicked = $("#crOvalCenterRightBottomTriang");
          clickedHeight = $clicked.outerHeight();
          clickedWidth = $clicked.outerWidth();
          clickedXInElem = e.pageX - $clicked.offset().left;
          clickedYInElem = $clicked.offset().top - e.pageY;
          fX = Math.round((-clickedHeight / clickedWidth) * clickedXInElem);
          ret = function() {
            if (Math.abs(fX) - Math.abs(clickedYInElem) > 0) {
              return "crOvalCenterRightBottomTriang";
            }
            if (Math.abs(fX) - Math.abs(clickedYInElem) < 0) {
              return "crOvalCenterBottomRightTriang";
            }
            if (Math.abs(fX) - Math.abs(clickedYInElem) === 0) {
              return false;
            }
          };
          finalTriangId = ret();
          break;
        case "crOvalCenterTopLeftTriang":
          finalTriangId = "crOvalCenterTopLeftTriang";
          break;
        case "crOvalCenterTopRightTriang":
          finalTriangId = "crOvalCenterTopRightTriang";
          break;
        case "crOvalCenterBottomLeftTriang":
          finalTriangId = "crOvalCenterBottomLeftTriang";
          break;
        case "crOvalCenterBottomRightTriang":
          finalTriangId = "crOvalCenterBottomRightTriang";
      }
      return finalTriangId;
    };

    Index.getNonTransparentBorder = function($elem) {
      var dir, j, len, list, parsed, retDir;
      list = ["top", "right", "bottom", "left"];
      retDir = "";
      for (j = 0, len = list.length; j < len; j++) {
        dir = list[j];
        parsed = parseInt(App.Index.rgb2hex($elem.css("border-" + dir + "-color"), false), 16);
        if (parsed !== 0 || isNaN(parsed)) {
          retDir = dir;
        }
      }
      return retDir;
    };

    Index.ovalRightChangeColorClick = function() {
      var color;
      color = "";
      return $("#crOvalRightContainer .crOvalButton").mousedown(function(e) {
        var $finalTriang, borderStr, finalTriangId, id;
        id = $(this).attr("id");
        finalTriangId = App.Index.getTriangleIdByAboveIdOvalRight(id, e);
        console.log(finalTriangId);
        if (finalTriangId) {
          $finalTriang = $("#" + finalTriangId);
          borderStr = "border-" + App.Index.getNonTransparentBorder($finalTriang) + "-color";
          color = App.Index.rgb2hex($finalTriang.css(borderStr));
          $finalTriang.css(borderStr, App.Index.colorLuminance(color, "-0.5"));
          $(".crOvalButton").mouseleave(function() {
            return $(".crOvalButton").removeAttr("style");
          });
          return $(".crOvalButton").mouseenter(function() {
            return $(".crOvalButton").removeAttr("style");
          });
        }
      }).mouseup(function(e) {
        var $finalTriang, borderStr, finalTriangId, id;
        id = $(this).attr("id");
        finalTriangId = App.Index.getTriangleIdByAboveIdOvalRight(id, e);
        if (finalTriangId) {
          $finalTriang = $("#" + finalTriangId);
          borderStr = "border-" + App.Index.getNonTransparentBorder($finalTriang) + "-color";
          color = App.Index.rgb2hex($finalTriang.css(borderStr));
          return $finalTriang.removeAttr("style");
        }
      }).mouseleave(function() {
        return $(".crOvalButton").removeAttr("style");
      });
    };

    Index.getTriangleIdByAboveIdOvalRight = function(id, e) {
      var $clicked, clickedHeight, clickedWidth, clickedXInElem, clickedYInElem, fX, finalTriangId, ret;
      switch (id) {
        case "crOvalRightTopLeftTriang":
          $clicked = $("#crOvalRightTopLeftTriang");
          clickedHeight = $clicked.outerHeight();
          clickedWidth = $clicked.outerWidth();
          clickedXInElem = e.pageX - $clicked.offset().left;
          clickedYInElem = e.pageY - $clicked.offset().top;
          fX = Math.round((-clickedHeight / clickedWidth) * clickedXInElem);
          ret = function() {
            if (Math.abs(fX) - Math.abs(clickedYInElem) > 0) {
              return "crOvalRightTopLeftTriang";
            }
            if (Math.abs(fX) - Math.abs(clickedYInElem) < 0) {
              return "crOvalRightLeftTopTriang";
            }
            if (Math.abs(fX) - Math.abs(clickedYInElem) === 0) {
              return false;
            }
          };
          finalTriangId = ret();
          break;
        case "crOvalRightRightTopTriang":
          $clicked = $("#crOvalRightRightTopTriang");
          clickedHeight = $clicked.outerHeight();
          clickedWidth = $clicked.outerWidth();
          clickedXInElem = e.pageX - $clicked.offset().left;
          clickedYInElem = ($clicked.offset().top + clickedHeight) - e.pageY;
          fX = Math.round((clickedHeight / clickedWidth) * clickedXInElem);
          ret = function() {
            if (fX - clickedYInElem > 0) {
              return "crOvalRightRightTopTriang";
            }
            if (fX - clickedYInElem < 0) {
              return "crOvalRightTopRightTriang";
            }
            if (fX - clickedYInElem === 0) {
              return false;
            }
          };
          finalTriangId = ret();
          break;
        case "crOvalRightBottomRightTriang":
          $clicked = $("#crOvalRightBottomRightTriang");
          clickedHeight = $clicked.outerHeight();
          clickedWidth = $clicked.outerWidth();
          clickedXInElem = e.pageX - $clicked.offset().left;
          clickedYInElem = e.pageY - $clicked.offset().top;
          fX = Math.round((-clickedHeight / clickedWidth) * clickedXInElem);
          ret = function() {
            if (Math.abs(fX) - Math.abs(clickedYInElem) > 0) {
              return "crOvalRightRightBottomTriang";
            }
            if (Math.abs(fX) - Math.abs(clickedYInElem) < 0) {
              return "crOvalRightBottomRightTriang";
            }
            if (Math.abs(fX) - Math.abs(clickedYInElem) === 0) {
              return false;
            }
          };
          finalTriangId = ret();
          break;
        case "crOvalRightLeftBottomTriang":
          $clicked = $("#crOvalRightLeftBottomTriang");
          clickedHeight = $clicked.outerHeight();
          clickedWidth = $clicked.outerWidth();
          clickedXInElem = e.pageX - $clicked.offset().left;
          clickedYInElem = e.pageY - $clicked.offset().top;
          fX = Math.round((clickedHeight / clickedWidth) * clickedXInElem - clickedHeight);
          ret = function() {
            if (Math.abs(fX) - Math.abs(clickedYInElem) > 0) {
              return "crOvalRightLeftBottomTriang";
            }
            if (Math.abs(fX) - Math.abs(clickedYInElem) < 0) {
              return "crOvalRightBottomLeftTriang";
            }
            if (Math.abs(fX) - Math.abs(clickedYInElem) === 0) {
              return false;
            }
          };
          finalTriangId = ret();
          break;
        case "crOvalRightBottomRightTriang":
          finalTriangId = "crOvalRightBottomRightTriang";
          break;
        case "crOvalRightBottomLeftTriang":
          finalTriangId = "crOvalRightBottomLeftTriang";
          break;
        case "crOvalRightLeftBottomTriang":
          finalTriangId = "crOvalRightLeftBottomTriang";
          break;
        case "crOvalRightLeftTopTriang":
          finalTriangId = "crOvalRightLeftTopTriang";
      }
      return finalTriangId;
    };

    Index.lookBoxes = function() {};

    Index.dragBoxes = function() {
      var $boxScroller, $lastChild, bottom, bottomStart, down, lastChHeight, startY, windowHeight;
      startY = 0;
      down = false;
      bottom = 0;
      $boxScroller = $("#crBoxScroller");
      $lastChild = $boxScroller.children().last();
      windowHeight = $(window).height();
      lastChHeight = $lastChild.height();
      bottomStart = windowHeight - (lastChHeight + $lastChild.offset().top);
      return $boxScroller.mousedown(function(e) {
        e.preventDefault();
        down = true;
        return startY = e.clientY;
      }).mousemove(function(e) {
        var mouseMoveDirection, setBottomTo;
        e.preventDefault();
        if (down) {
          mouseMoveDirection = startY - e.clientY;
          bottom = windowHeight - (lastChHeight + $lastChild.offset().top);
          setBottomTo = bottom + mouseMoveDirection;
          if (setBottomTo <= 0 && setBottomTo >= bottomStart) {
            return console.log(setBottomTo + "px");
          }
        }
      }).mouseup(function(e) {
        e.preventDefault();
        return down = false;
      });
    };

    Index["return"] = function(param) {
      return param;
    };

    Index.rgb2hex = function(rgb, withHexSign) {
      var sign, string;
      rgb = rgb.match(/^rgba?[\s+]?\([\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?/i);
      sign = "";
      if (withHexSign == null) {
        sign = "#";
      } else {
        sign = "";
      }
      if (rgb && rgb.length === 4) {
        string = sign + (rgb[1] === "255" ? "FF" : ('0' + parseInt(rgb[1], 10).toString(16)).slice(-2)) + (rgb[2] === "255" ? "FF" : ('0' + parseInt(rgb[2], 10).toString(16)).slice(-2)) + (rgb[3] === "255" ? "FF" : ('0' + parseInt(rgb[3], 10).toString(16)).slice(-2));
        return string;
      } else {
        return false;
      }
    };

    Index.colorLuminance = function(hex, lum) {
      var c, i, rgb;
      hex = String(hex).replace(/[^0-9a-f]/gi, '');
      if (hex.length < 6) {
        hex = hex[0] + hex[0] + hex[1] + hex[1] + hex[2] + hex[2];
      }
      lum = lum || 0;
      rgb = '#';
      c = void 0;
      i = void 0;
      i = 0;
      while (i < 3) {
        c = parseInt(hex.substr(i * 2, 2), 16);
        c = Math.round(Math.min(Math.max(0, c + c * lum), 255)).toString(16);
        rgb += ('00' + c).substr(c.length);
        i++;
      }
      return rgb;
    };

    return Index;

  })();

}).call(this);
