class App.Global

  @ajaxCall: (ptype, pdata, doAfterSuccess, addParam) ->
    ptype = "GET" if typeof ptype == "undefined" or !ptype
    pdata = {} if typeof pdata == "undefined" or !pdata
    doAfterSuccess = (->) if typeof doAfterSuccess == "undefined" or !doAfterSuccess
    addParam = false if typeof addParam == "undefined" or !addParam

    ajaxData = {
      url: "Controller.php"
      type: ptype,
      data: pdata,
      success: (data) ->
        doAfterSuccess (data)
    }

    if addParam
      for k in addParam
        if typeof addParam[k] != "function"
          ajaxData[k] = addParam[k]

    return $.ajax(ajaxData);

  @relational: () ->
    $(".relational").each (index, element) ->
      $elem = $(element)
      divisor = $elem.data "divisor"
      cssParent = $elem.data "cssparent"
      cssSelf = $elem.data "cssself"
      cssGeneral = $elem.data "css"

      if !cssParent? and !cssSelf?
        cssParent = cssSelf = cssGeneral

      parentAttr = $("#"+$elem.data("parent")).css(cssParent)
      parentAttr = parseInt(parentAttr, 10)

      $elem.css(App.Global.return(cssSelf), ""+parentAttr*divisor+"px")

  @return: (param) ->
    return param

  @toggleBigImageWrapper: (bigImageWrapperList, bigImageWrapperTime) ->
    imgListLength = bigImageWrapperList.length
    randomIndex = [0..imgListLength]
    randomIndex.sort(->
      return Math.random() - 0.5
    )
    counter = 0

    window.setInterval (->
      $("#bigImageWrapper").css
        backgroundImage: bigImageWrapperList[randomIndex[counter]];

      if counter is imgListLength
        counter = 0
        randomIndex.sort(->
          return Math.random() - 0.5
        )
      else
        counter += 1
    ), bigImageWrapperTime


  @animateSlideToLeft: ($view, childClass, $slider, $indexSmallList) ->
    currSlide = 0
    viewWidth = $view.outerWidth()
    $slides = $("."+childClass)
    numberOfSlides = $slides.length
    currLeft = parseInt($slider.css("marginLeft"), 10)

    currSlide = Math.abs(currLeft/viewWidth)

    if $indexSmallList?
      $indexSmallList.removeClass("active")
      dot = currSlide
      if currSlide is numberOfSlides-1
        dot = -1
      $indexSmallList.eq(dot+1).addClass("active")



    $(".lastClone").remove()

    if currSlide is numberOfSlides-1
      $lastClone = $slides.last().clone(true, true)
      $lastClone.appendTo($view).removeClass("slide").addClass("absolute lastClone")
      $slider.css(
        marginLeft: viewWidth + "px"
      )
      currLeft = viewWidth
      console.log "last clone anim : " + -viewWidth + "px"
      $lastClone.animate(
        left: -viewWidth + "px",
        1000,
        "easeOutQuint",
        complete: ->
          $lastClone.remove()
          $(".lastClone").remove()
      )
    $slider.animate(
      marginLeft: currLeft - viewWidth + "px",
      1000,
      "easeOutQuint"

    )

  @slideTo: ($view, $slider, $slideTo, interval) ->
    viewWidth = $view.outerWidth()
    clearInterval(interval)
    animatingSmallRound = true

    $slider.animate(
      marginLeft: $slideTo * (-viewWidth) + "px",
      1000,
      "easeOutQuint", ->
      animatingSmallRound = false
    )


  @resizeListenerSlider: ($slider, $indexSmallList) ->
    $(window).on "resize", ->
      console.log "resize"
      $slider.css(
        marginLeft: "0px"
      )
      $indexSmallList.removeClass("active")
      $indexSmallList.eq(0).addClass("active")

  @createTableFromJson: (json) ->
#    for (i = 0; i < data.length; i++) {
#      row = $("<tr />")
#      $("#personDataTable").append(row); //this will append tr element to table... keep its reference for a while since we will add cels into it
#      row.append($("<td>" + rowData.id + "</td>"));
#      row.append($("<td>" + rowData.firstName + "</td>"));
#      row.append($("<td>" + rowData.lastName + "</td>"));
#    }
  
