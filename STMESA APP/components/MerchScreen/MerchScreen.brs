' Entry point of MerchScreen
function Init()

    m.top.setFocus(true)
    ' Observe "visible" so we can know when MerchScreen changes visibility
    m.top.ObserveField("visible", "OnVisibleChange")
    ' Observe "itemFocused" so we can know when another item gets in focus
    m.top.ObserveField("itemFocused", "OnItemFocusedChanged")
    ' Save references to the MerchScreen child components in the m variable
    ' so we can access them easily from other functions
    m.top.observeField("selectedPosterIndex", "onSelectedPosterIndexChanged")
    m.top.observeField("buttonSelected", "onButtonSelected")
    font = CreateObject("roSGNode", "Font")
    font.uri = "pkg:/images/Calibri Bold.ttf"
    font.size = 38
    m.poster1 = m.top.FindNode("poster1")
    m.poster2 = m.top.FindNode("poster2")
    m.label1 = m.top.FindNode("label1")
    m.label2 = m.top.FindNode("label2")
    m.buttons =   m.top.FindNode("buttons")
    m.poster3 = m.top.FindNode("poster3")
    m.poster4 = m.top.FindNode("poster4")
    m.label3 = m.top.FindNode("label3")
    m.label4 = m.top.FindNode("label4")
    m.QRposter = m.top.FindNode("QRposter")
    m.qrLabel = m.top.FindNode("qrLabel")
        m.poster1.visible = true
    m.qrLabel.font = font
    m.poster2.visible = true
    m.poster3.visible = true
    m.poster4.visible = true
     m.label1.visible = true
        m.label2.visible = true
        m.label3.visible = true
        m.label4.visible = true
        m.label1.font = font
        m.label3.font = font
        m.label2.font = font
        m.label4.font = font
        m.buttons.font = font
    ' Set the initial focus to the first poster
    m.buttons.setFocus(true)

    ' Subscribe to the remote control events
    m.top.observeField("keypress", "onKeyEvent")
end function

sub OnItemFocusedChanged(event as Object)
    focusedItem = event.GetData() ' Get position of focused item
    content = m.top.content.GetChild(focusedItem) ' Get metadata of focused item
    SetDetailsContent(content) ' Populate MerchScreen with item metadata

    
    colIndex = m.global.columnIndex
end sub

sub onButtonSelected()
    ' Handle button selection if needed
    selectedPosterIndex = m.top.selectedPosterIndex
    if m.top.visible = true
        m.poster1.width = 300
        m.poster1.height = 300
        m.poster1.visible = false
        m.poster2.visible = false
        m.poster3.visible = false
        m.poster4.visible = false
        m.label1.visible = false
        m.label2.visible = false
        m.label3.visible = false
        m.label4.visible = false
        m.QRPoster.visible = true
        m.qrLabel.visible = true
        m.QRposter.uri = "pkg:/images/qrbuy.png"
        
        
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
   
    if press
        if key = "left"
            ' Move left to the previous poster
            if m.top.selectedPosterIndex > 0
                m.top.selectedPosterIndex = m.top.selectedPosterIndex - 1
            end if
            return true
        else if key = "right"
            ' Move right to the next poster
            if m.top.selectedPosterIndex < 1
                m.top.selectedPosterIndex = m.top.selectedPosterIndex + 1
            end if
            return true
        else if key = "select"
            ' Handle poster selection
            selectedPosterIndex = m.top.selectedPosterIndex

            if selectedPosterIndex = 0
                ' Update the label below the first poster
                
            else if selectedPosterIndex = 1
                ' Update the label below the second poster
               
            end if
            return true
        end if
    end if

    return false
end function

sub OnJumpToItem()
    content = m.top.content
    if content <> invalid and m.top.jumpToItem >= 0 and content.GetChildCount() > m.top.jumpToItem
        m.top.itemFocused = m.top.jumpToItem
    end if
end sub

sub SetDetailsContent(content)
    if m.top.jumpToItem = 0
        ' Populate screen components with metadata
            m.label1.text = "Green Sweater"
            m.label3.text = "Brown Sweater"
            m.label2.text = "Grey Sweater"
            m.label4.text = "Blue Sweater"
            m.poster1.uri = "https://sthsroku.net/Cookiq/data/storeData/m1.png"
            m.poster2.uri = "https://sthsroku.net/Cookiq/data/storeData/m2.png"
            m.poster3.uri = "https://sthsroku.net/Cookiq/data/storeData/m3.png"
            m.poster4.uri = "https://sthsroku.net/Cookiq/data/storeData/m4.png"
            
    else if m.top.jumpToItem = 1
    ' Populate screen components with metadata
        m.label1.text = "Beige T-Shirt"
        m.label3.text = "Brown T-Shirt"
        m.label2.text = "Blue T-Shirt"
        m.label4.text = "Purple T-Shirt"
        m.poster1.uri = "https://sthsroku.net/Cookiq/data/storeData/mesa1.png"
        m.poster2.uri = "https://sthsroku.net/Cookiq/data/storeData/mesa2.png"
        m.poster3.uri = "https://sthsroku.net/Cookiq/data/storeData/mesa3.png"
        m.poster4.uri = "https://sthsroku.net/Cookiq/data/storeData/mesa4.png"
    else if m.top.jumpToItem = 2
        m.label1.text = "Beige Hoodie"
        m.label3.text = "White Hoodie"
        m.label2.text = "Black Hoodie"
        m.label4.text = "Brown Hoodie"
        m.poster1.uri = "https://sthsroku.net/Cookiq/data/storeData/MESA_4.png"
        m.poster2.uri = "https://sthsroku.net/Cookiq/data/storeData/MESA_5.png"
        m.poster3.uri = "https://sthsroku.net/Cookiq/data/storeData/MESA_6.png"
        m.poster4.uri = "https://sthsroku.net/Cookiq/data/storeData/MESA_7.png"
    end if

    if content.mediaType = "series"
        ' buttons for series DetailsScreen
        SetButtons(["Play", "See all episodes"])
    else
        ' buttons for content DetailsScreen
        SetButtons(["Purchase"])
    end if
end sub


sub onVisibleChange()' invoked when DetailsScreen visibility is changed
    ' set focus for buttons list when DetailsScreen becomes visible
    if m.top.visible = true
        m.buttons.SetFocus(true)
    end if
end sub

sub SetButtons(buttons)
    result = []
    ' prepare array with button's titles
    for each button in buttons
        result.push({title : button})
    end for
    m.buttons.content = ContentListToSimpleNode(result) ' populate buttons list
end sub