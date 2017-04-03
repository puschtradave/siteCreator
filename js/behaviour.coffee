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
    App.Index.ovalCenterOnClick()
    App.Index.ovalCenterOnMouseMove()


  @ovalCenterOnClick: () ->
    $(".crOvalButton").on "click", (e) ->
      id = $(@).attr("id")
      finalTriangId = App.Index.getTriangleIdByAboveId(id, e)
#      $finalTriang = $("#" + finalTriangId)
#      console.log finalTriangId

  @ovalCenterOnMouseMove: () ->
    $(".crOvalButton").on "mousemove", (e) ->
      id = $(@).attr("id")
      finalTriangId = App.Index.getTriangleIdByAboveId(id, e)
      $finalTriang = $("#" + finalTriangId)
      console.log finalTriangId

  @getTriangleIdByAboveId: (id, e) ->
    switch id
      when "crCenterLeftTopTriang"
        $clicked = $("#crCenterLeftTopTriang")
        clickedHeight = $clicked.outerHeight()
        clickedWidth = $clicked.outerWidth()
        clickedXInElem = e.pageX - $clicked.offset().left
        clickedYInElem = ($clicked.offset().top + clickedHeight) - e.pageY
        fX = Math.round((-clickedHeight / clickedWidth) * clickedXInElem + clickedHeight)

        ret = () ->
          return "crCenterLeftTopTriang" if fX - clickedYInElem > 0
          return "crCenterTopLeftTriang" if fX - clickedYInElem < 0
          return false if fX - clickedYInElem == 0
        finalTriangId = ret()
      when "crCenterRightTopTriang"
        $clicked = $("#crCenterRightTopTriang")
        clickedHeight = $clicked.outerHeight()
        clickedWidth = $clicked.outerWidth()
        clickedXInElem = e.pageX - $clicked.offset().left
        clickedYInElem = ($clicked.offset().top + clickedHeight) - e.pageY
        fX = Math.round((clickedHeight / clickedWidth) * clickedXInElem)

        ret = () ->
          return "crCenterRightTopTriang" if fX - clickedYInElem > 0
          return "crCenterTopRightTriang" if fX - clickedYInElem < 0
          return false if fX - clickedYInElem == 0
        finalTriangId = ret()
      when "crCenterLeftBottomTriang"
        $clicked = $("#crCenterLeftBottomTriang")
        clickedHeight = $clicked.outerHeight()
        clickedWidth = $clicked.outerWidth()
        clickedXInElem = e.pageX - $clicked.offset().left
        clickedYInElem = $clicked.offset().top - e.pageY
        fX = Math.round((clickedHeight / clickedWidth) * clickedXInElem - clickedHeight)
        ret = () ->
          return "crCenterLeftBottomTriang" if Math.abs(fX) - Math.abs(clickedYInElem) > 0
          return "crCenterBottomLeftTriang" if Math.abs(fX) - Math.abs(clickedYInElem) < 0
          return false if Math.abs(fX) - Math.abs(clickedYInElem) == 0
        finalTriangId = ret()
      when "crCenterRightBottomTriang"
        $clicked = $("#crCenterRightBottomTriang")
        clickedHeight = $clicked.outerHeight()
        clickedWidth = $clicked.outerWidth()
        clickedXInElem = e.pageX - $clicked.offset().left
        clickedYInElem = $clicked.offset().top - e.pageY
        fX = Math.round((-clickedHeight / clickedWidth) * clickedXInElem)

        ret = () ->
          return "crCenterRightBottomTriang" if Math.abs(fX) - Math.abs(clickedYInElem) > 0
          return "crCenterBottomRightTriang" if Math.abs(fX) - Math.abs(clickedYInElem) < 0
          return false if Math.abs(fX) - Math.abs(clickedYInElem) == 0
        finalTriangId = ret()
      when "crCenterTopLeftTriang"
        finalTriangId = "crCenterTopLeftTriang"
      when "crCenterTopRightTriang"
        finalTriangId = "crCenterTopRightTriang"
      when "crCenterBottomLeftTriang"
        finalTriangId = "crCenterBottomLeftTriang"
      when "crCenterBottomRightTriang"
        finalTriangId = "crCenterBottomRightTriang"

    return finalTriangId

  @getNonTransparentBorder: ($elem) ->
    list = ["top", "right", "bottom", "left"]
    retDir = ""
    console.dir $elem
    for dir in list
#      ret = () ->
#        return "border-"+dir
      console.log dir
#      console.log "border-"+dir+"-color"
      console.log $elem.css("border-"+dir+"-color")
      parsed = parseInt(App.Index.rgb2hex($elem.css("border-" + dir + "-color"), false), 16)
#      console.log App.Index.rgb2hex($elem.css("border-"+dir+"-color"), false)
      console.log parsed
      if parsed != 0 or isNaN(parsed)
        retDir = dir
    return retDir


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
    withHexSign ? sign =
      "#": sign = ""
    if rgb and rgb.length == 4
      string = sign + (if rgb[1] is "255" then "FF" else ('0' + parseInt(rgb[1], 10).toString(16)).slice(-2)) +
        (if rgb[2] is "255" then "FF" else ('0' + parseInt(rgb[2], 10).toString(16)).slice(-2)) +
        (if rgb[3] is "255" then "FF" else ('0' + parseInt(rgb[3], 10).toString(16)).slice(-2))
      return string
    else
      return false



















