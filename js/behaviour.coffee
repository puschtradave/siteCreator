class App.Index

  #  bigWrapperImages = [
  #    "url('img/green-mountain_grass.jpg')",
  #    "url('img/green-mountain_grass_2.jpg')",
  #    "url('img/red-sunset_trees_snow.jpg')",
  #    "url('img/orange-houses_hills.jpg')"
  #  ]

  $(document).ready ->
    console.log "ready"


#      console.log App.Index.getNonTransparentBorder($finalTriang)


  $(window).on "load", ->
    App.Index.Listeners()

  $(window).on "resize", ->
    console.log "resize"

  #  @setDimensions: () ->

  @Listeners: () ->
    App.Index.lookBoxes()
#    App.Index.ovalCenterOnClick()
#    App.Index.ovalCenterOnMouseMove()
    App.Index.ovalCenterChangeColorClick()
    App.Index.ovalRightChangeColorClick()




#  @ovalCenterOnClick: () ->
#    $(".crOvalButton").on "click", (e) ->
#      id = $(@).attr("id")
#      finalTriangId = App.Index.getTriangleIdByAboveId(id, e)


  @ovalCenterChangeColorClick: () ->
    color = ""
    $(".crOvalButton").mousedown (e) ->
      id = $(@).attr("id")
      finalTriangId = App.Index.getTriangleIdByAboveIdOvalCenter(id, e)
      if finalTriangId
        $finalTriang = $("#" + finalTriangId)
        borderStr = "border-"+App.Index.getNonTransparentBorder($finalTriang)+"-color"
        color = App.Index.rgb2hex($finalTriang.css(borderStr))
        $finalTriang.css(borderStr, App.Index.colorLuminance(color, "-0.5"))
        $(".crOvalButton").mouseleave () ->
          $(".crOvalButton").removeAttr("style")
        $(".crOvalButton").mouseenter () ->
          $(".crOvalButton").removeAttr("style")
    .mouseup (e) ->
      id = $(@).attr("id")
      finalTriangId = App.Index.getTriangleIdByAboveIdOvalCenter(id, e)
      if finalTriangId
        $finalTriang = $("#" + finalTriangId)
        borderStr = "border-"+App.Index.getNonTransparentBorder($finalTriang)+"-color"
        color = App.Index.rgb2hex($finalTriang.css(borderStr))
        $finalTriang.removeAttr("style")
    .mouseleave () ->
      $(".crOvalButton").removeAttr("style")


  @getTriangleIdByAboveIdOvalCenter: (id, e) ->
    switch id
      when "crOvalCenterLeftTopTriang"
        $clicked = $("#crOvalCenterLeftTopTriang")
        clickedHeight = $clicked.outerHeight()
        clickedWidth = $clicked.outerWidth()
        clickedXInElem = e.pageX - $clicked.offset().left
        clickedYInElem = ($clicked.offset().top + clickedHeight) - e.pageY
        fX = Math.round((-clickedHeight / clickedWidth) * clickedXInElem + clickedHeight)

        ret = () ->
          return "crOvalCenterLeftTopTriang" if fX - clickedYInElem > 0
          return "crOvalCenterTopLeftTriang" if fX - clickedYInElem < 0
          return false if fX - clickedYInElem == 0
        finalTriangId = ret()
      when "crOvalCenterRightTopTriang"
        $clicked = $("#crOvalCenterRightTopTriang")
        clickedHeight = $clicked.outerHeight()
        clickedWidth = $clicked.outerWidth()
        clickedXInElem = e.pageX - $clicked.offset().left
        clickedYInElem = ($clicked.offset().top + clickedHeight) - e.pageY
        fX = Math.round((clickedHeight / clickedWidth) * clickedXInElem)

        ret = () ->
          return "crOvalCenterRightTopTriang" if fX - clickedYInElem > 0
          return "crOvalCenterTopRightTriang" if fX - clickedYInElem < 0
          return false if fX - clickedYInElem == 0
        finalTriangId = ret()
      when "crOvalCenterLeftBottomTriang"
        $clicked = $("#crOvalCenterLeftBottomTriang")
        clickedHeight = $clicked.outerHeight()
        clickedWidth = $clicked.outerWidth()
        clickedXInElem = e.pageX - $clicked.offset().left
        clickedYInElem = $clicked.offset().top - e.pageY
        fX = Math.round((clickedHeight / clickedWidth) * clickedXInElem - clickedHeight)
        ret = () ->
          return "crOvalCenterLeftBottomTriang" if Math.abs(fX) - Math.abs(clickedYInElem) > 0
          return "crOvalCenterBottomLeftTriang" if Math.abs(fX) - Math.abs(clickedYInElem) < 0
          return false if Math.abs(fX) - Math.abs(clickedYInElem) == 0
        finalTriangId = ret()
      when "crOvalCenterRightBottomTriang"
        $clicked = $("#crOvalCenterRightBottomTriang")
        clickedHeight = $clicked.outerHeight()
        clickedWidth = $clicked.outerWidth()
        clickedXInElem = e.pageX - $clicked.offset().left
        clickedYInElem = $clicked.offset().top - e.pageY
        fX = Math.round((-clickedHeight / clickedWidth) * clickedXInElem)

        ret = () ->
          return "crOvalCenterRightBottomTriang" if Math.abs(fX) - Math.abs(clickedYInElem) > 0
          return "crOvalCenterBottomRightTriang" if Math.abs(fX) - Math.abs(clickedYInElem) < 0
          return false if Math.abs(fX) - Math.abs(clickedYInElem) == 0
        finalTriangId = ret()
      when "crOvalCenterTopLeftTriang"
        finalTriangId = "crOvalCenterTopLeftTriang"
      when "crOvalCenterTopRightTriang"
        finalTriangId = "crOvalCenterTopRightTriang"
      when "crOvalCenterBottomLeftTriang"
        finalTriangId = "crOvalCenterBottomLeftTriang"
      when "crOvalCenterBottomRightTriang"
        finalTriangId = "crOvalCenterBottomRightTriang"

    return finalTriangId

  @getNonTransparentBorder: ($elem) ->
    list = ["top", "right", "bottom", "left"]
    retDir = ""
#    console.dir $elem
    for dir in list
#      ret = () ->
#        return "border-"+dir
#      console.log dir
#      console.log "border-"+dir+"-color"
#      console.log $elem.css("border-"+dir+"-color")
      parsed = parseInt(App.Index.rgb2hex($elem.css("border-" + dir + "-color"), false), 16)
#      console.log App.Index.rgb2hex($elem.css("border-"+dir+"-color"), false)
#      console.log parsed
      if parsed != 0 or isNaN(parsed)
        retDir = dir
    return retDir

# OVAL RIGHT
  @ovalRightChangeColorClick: () ->
    color = ""
    $("#crOvalRightContainer .crOvalButton").mousedown (e) ->
      id = $(@).attr("id")
#      console.log id
      finalTriangId = App.Index.getTriangleIdByAboveIdOvalRight(id, e)
      console.log finalTriangId
      if finalTriangId
        $finalTriang = $("#" + finalTriangId)
        borderStr = "border-"+App.Index.getNonTransparentBorder($finalTriang)+"-color"
        color = App.Index.rgb2hex($finalTriang.css(borderStr))
        $finalTriang.css(borderStr, App.Index.colorLuminance(color, "-0.5"))
        $(".crOvalButton").mouseleave () ->
          $(".crOvalButton").removeAttr("style")
        $(".crOvalButton").mouseenter () ->
          $(".crOvalButton").removeAttr("style")
    .mouseup (e) ->
      id = $(@).attr("id")
      finalTriangId = App.Index.getTriangleIdByAboveIdOvalRight(id, e)
#      console.log finalTriangId
      if finalTriangId
        $finalTriang = $("#" + finalTriangId)
        borderStr = "border-"+App.Index.getNonTransparentBorder($finalTriang)+"-color"
        color = App.Index.rgb2hex($finalTriang.css(borderStr))
        $finalTriang.removeAttr("style")
    .mouseleave () ->
      $(".crOvalButton").removeAttr("style")

# OVAL RIGHT
  @getTriangleIdByAboveIdOvalRight: (id, e) ->
    switch id
      when "crOvalRightTopLeftTriang"
        $clicked = $("#crOvalRightTopLeftTriang")
        clickedHeight = $clicked.outerHeight()
        clickedWidth = $clicked.outerWidth()
        clickedXInElem = e.pageX - $clicked.offset().left
        clickedYInElem = e.pageY - $clicked.offset().top
        fX = Math.round((-clickedHeight / clickedWidth) * clickedXInElem)

        ret = () ->
          return "crOvalRightTopLeftTriang" if Math.abs(fX) - Math.abs(clickedYInElem) > 0
          return "crOvalRightLeftTopTriang" if Math.abs(fX) - Math.abs(clickedYInElem) < 0
          return false if Math.abs(fX) - Math.abs(clickedYInElem) == 0
        finalTriangId = ret()
      when "crOvalRightRightTopTriang"
        $clicked = $("#crOvalRightRightTopTriang")
        clickedHeight = $clicked.outerHeight()
        clickedWidth = $clicked.outerWidth()
        clickedXInElem = e.pageX - $clicked.offset().left
        clickedYInElem = ($clicked.offset().top + clickedHeight) - e.pageY
        fX = Math.round((clickedHeight / clickedWidth) * clickedXInElem)

        ret = () ->
          return "crOvalRightRightTopTriang" if fX - clickedYInElem > 0
          return "crOvalRightTopRightTriang" if fX - clickedYInElem < 0
          return false if fX - clickedYInElem == 0
        finalTriangId = ret()
      when "crOvalRightBottomRightTriang"
        $clicked = $("#crOvalRightBottomRightTriang")
        clickedHeight = $clicked.outerHeight()
        clickedWidth = $clicked.outerWidth()
        clickedXInElem = e.pageX - $clicked.offset().left
        clickedYInElem = e.pageY - $clicked.offset().top
        fX = Math.round((-clickedHeight / clickedWidth) * clickedXInElem)
        ret = () ->
          return "crOvalRightRightBottomTriang" if Math.abs(fX) - Math.abs(clickedYInElem) > 0
          return "crOvalRightBottomRightTriang" if Math.abs(fX) - Math.abs(clickedYInElem) < 0
          return false if Math.abs(fX) - Math.abs(clickedYInElem) == 0
        finalTriangId = ret()
      when "crOvalRightLeftBottomTriang"
        $clicked = $("#crOvalRightLeftBottomTriang")
        clickedHeight = $clicked.outerHeight()
        clickedWidth = $clicked.outerWidth()
        clickedXInElem = e.pageX - $clicked.offset().left
        clickedYInElem = e.pageY - $clicked.offset().top
        fX = Math.round((clickedHeight / clickedWidth) * clickedXInElem - clickedHeight)

        ret = () ->
          return "crOvalRightLeftBottomTriang" if Math.abs(fX) - Math.abs(clickedYInElem) > 0
          return "crOvalRightBottomLeftTriang" if Math.abs(fX) - Math.abs(clickedYInElem) < 0
          return false if Math.abs(fX) - Math.abs(clickedYInElem) == 0
        finalTriangId = ret()
      when "crOvalRightBottomRightTriang"
        finalTriangId = "crOvalRightBottomRightTriang"
      when "crOvalRightBottomLeftTriang"
        finalTriangId = "crOvalRightBottomLeftTriang"
      when "crOvalRightLeftBottomTriang"
        finalTriangId = "crOvalRightLeftBottomTriang"
      when "crOvalRightLeftTopTriang"
        finalTriangId = "crOvalRightLeftTopTriang"

    return finalTriangId


  @lookBoxes: () ->
#    $boxScroller = $("#crBoxScroller")
#    $lastChild = $boxScroller.children().last()
#    windowHeight = $(window).height()
#    lastChHeight = $lastChild.height()
#
#    bottomStart = windowHeight - (lastChHeight + $lastChild.offset().top)
##    $("#boxUp").on "click", ->
##      currBottom = $lastChild.offset().top
##      if currBottom <= 0 and currBottom >= bottomStart
##        $boxScroller.animate(
##          bottom: parseInt($boxScroller.css("bottom"), 10) + 2 + lastChHeight + "px"
##        )
#    $("#boxDown").on "click", ->
#      console.log "click"
#      currBottom = parseInt($boxScroller.css("bottom"), 10)
#
#      setTo = currBottom + 0.2 * $boxScroller.height()
#      console.log
#
#      possibleLastChOffset = windowHeight - (lastChHeight + $lastChild.offset().top) + setTo
#
#      if setTo >= 0 and possibleLastChOffset <= 0
#        $boxScroller.animate(
#          bottom: setTo + "px"
#        )
#      else if possibleLastChOffset > 0
#        $boxScroller.animate(
#          bottom: currBottom + possibleLastChOffset + "px"
#        )




  @dragBoxes: () ->
    startY = 0
    down = false
    bottom = 0

    $boxScroller = $("#crBoxScroller")
    $lastChild = $boxScroller.children().last()
    windowHeight = $(window).height()
    lastChHeight = $lastChild.height()

    bottomStart = windowHeight - (lastChHeight + $lastChild.offset().top)

    #    if $boxScroller.css("bottom") > $lastChild.offset()

    $boxScroller.mousedown (e) ->
      e.preventDefault()
      down = true
      startY = e.clientY
    .mousemove (e) ->
      e.preventDefault()
      if down
        mouseMoveDirection = (startY - e.clientY)

        bottom = windowHeight - (lastChHeight + $lastChild.offset().top)
        setBottomTo = bottom + mouseMoveDirection
        if setBottomTo <= 0 and setBottomTo >= bottomStart
          console.log setBottomTo + "px"
#          $boxScroller.css(
#            bottom: setBottomTo + "px"
#          )
    .mouseup (e) ->
      e.preventDefault()
      down = false


  @return: (param) ->
    return param

  @rgb2hex: (rgb, withHexSign) ->
    rgb = rgb.match(/^rgba?[\s+]?\([\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?/i)
    sign = ""
    if !withHexSign? then sign = "#" else sign = ""
    if rgb and rgb.length == 4
      string = sign + (if rgb[1] is "255" then "FF" else ('0' + parseInt(rgb[1], 10).toString(16)).slice(-2)) +
        (if rgb[2] is "255" then "FF" else ('0' + parseInt(rgb[2], 10).toString(16)).slice(-2)) +
        (if rgb[3] is "255" then "FF" else ('0' + parseInt(rgb[3], 10).toString(16)).slice(-2))
      return string
    else
      return false


  @colorLuminance = (hex, lum) ->
  # validate hex string
    hex = String(hex).replace(/[^0-9a-f]/gi, '')
    if hex.length < 6
      hex = hex[0] + hex[0] + hex[1] + hex[1] + hex[2] + hex[2]
    lum = lum or 0
    # convert to decimal and change luminosity
    rgb = '#'
    c = undefined
    i = undefined
    i = 0
    while i < 3
      c = parseInt(hex.substr(i * 2, 2), 16)
      c = Math.round(Math.min(Math.max(0, c + c * lum), 255)).toString(16)
      rgb += ('00' + c).substr(c.length)
      i++
    return rgb
















