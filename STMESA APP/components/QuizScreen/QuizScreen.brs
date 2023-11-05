sub init()
    example = m.top.findNode("exampleRadioButtonList")
    exampleLable = m.tio.findNode("quizLabel")
    example.checkedItem = 2

    examplerect = example.boundingRect()
    centerx = (1280 - examplerect.width) / 2
    centery = (720 - examplerect.height) / 2
    example.translation = [ centerx, centery ]

    example.setFocus(true)
  end sub