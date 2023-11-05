
' entry point of GridScreen
' Note that we need to import this file in GridScreen.xml using relative path.
sub Init()
    m.rowList = m.top.FindNode("rowList")
    ' label with item description
    m.quiz = m.top.FindNode("quiz")
    m.quiz.SetFocus(true)
    m.goBack = m.top.FindNode("goBack")
    m.quizLabel = m.top.FindNode("quizLabel")
    m.QuizTime = m.top.FindNode("QuizTime")
    m.descriptionLabel = m.top.FindNode("descriptionLabel")
    m.opt1 = m.top.FindNode("opt1")
    m.opt2 = m.top.FindNode("opt2")
    m.opt3 = m.top.FindNode("opt3")
    m.opt4 = m.top.FindNode("opt4")
    largefont = CreateObject("roSGNode", "Font")
    largefont.uri = "pkg:/images/Calibri_Bold.ttf"
    largefont.size = 38
    smallfont = CreateObject("roSGNode", "Font")
    smallfont.size = 24
    smallfont.uri = "pkg:/images/Calibri_Bold.ttf"
    mediumfont = CreateObject("roSGNode", "Font")
    mediumfont.size = 30
    mediumfont.uri = "pkg:/images/Calibri_Bold.ttf"
    m.top.ObserveField("visible", "onVisibleChange")
    m.top.ObserveField("isButton", "onKeyEvent")
    ' label with item title
    m.quiz.ObserveField("buttonSelected", "quizSelect")
    m.goBack.ObserveField("buttonSelected","backSelect")
    m.titleLabel = m.top.FindNode("titleLabel")
    ' observe rowItemFocused so we can know when another item of rowList will be focused
    m.rowList.ObserveField("rowItemFocused", "OnItemFocused")
    m.score = 0
    m.questionNum = 1
    m.maxQuestionNum = 5
    m.goBack.textFont= smallfont
    m.quiz.textFont= smallfont
    m.quiz.focusedTextFont = smallfont
    m.goBack.focusedTextFont = smallfont
    m.quizLabel.font = largefont
    m.QuizTime.font = mediumfont
    m.QuizTime.focusedFont = mediumfont
end sub

sub quizSelect()
    if m.rowList.visible = true
        m.rowList.visible = false
        m.titleLabel.visible = false
        m.descriptionLabel.visible = false
        m.rowList.focusable = false
        m.rowList.SetFocus(false)
        m.quiz.text = "Select"

        m.goBack.visible = true
        m.quizLabel.visible = true
        m.QuizTime.visible = true
        m.QuizTime.focusable = true
    else if (m.rowList.visible = false)
        if (m.questionNum = 1)
            if (m.QuizTime.checkedItem > -1)
                if (m.QuizTime.checkedItem = 0)
                    m.goBack.text = "Correct"
                    m.score = m.score + 1
                else
                    m.goBack.text = "Wrong"
                end if
            m.QuizTime.SetFocus(true)
            m.questionNum = m.questionNum + 1
            changeQuestion()
            end if
        else if (m.questionNum = 2)
            if (m.QuizTime.checkedItem > -1)
                if (m.QuizTime.checkedItem = 1)
                    m.goBack.text = "Correct"
                    m.score = m.score + 1
                else
                    m.goBack.text = "Wrong"
                end if
            m.QuizTime.SetFocus(true)
            m.questionNum = m.questionNum + 1
            changeQuestion()
            end if
        else if (m.questionNum = 3)
            if (m.QuizTime.checkedItem > -1)
                if (m.QuizTime.checkedItem = 3)
                    m.goBack.text = "Correct"
                    m.score = m.score + 1
                else
                    m.goBack.text = "Wrong"
                end if
            end if
            m.QuizTime.SetFocus(true)
            m.questionNum = m.questionNum + 1
            changeQuestion()
        else if (m.questionNum = 4)
            if (m.QuizTime.checkedItem > -1)
                if (m.QuizTime.checkedItem = 0)
                    m.goBack.text = "Correct"
                    m.score = m.score + 1
                else
                    m.goBack.text = "Wrong"
                end if
            end if
            m.QuizTime.SetFocus(true)
            m.questionNum = m.questionNum + 1
            changeQuestion()
        else if (m.questionNum = 5)
            if (m.QuizTime.checkedItem > -1)
                if (m.QuizTime.checkedItem = 0)
                    m.goBack.text = "Correct"
                    m.score = m.score + 1
                else
                    m.goBack.text = "Wrong"
                end if
            end if
            m.QuizTime.SetFocus(true)
            m.questionNum = m.questionNum + 1
            m.quiz.text = "End Quiz"
            changeQuestion()
        else if (m.questionNum > m.maxQuestionNum)
            m.questionNum = 1
            changeQuestion()
            backSelect()
        end if
    end if

end sub

sub changeQuestion()
    if (m.questionNum =1)
        m.quizLabel.text = "When was MESA day 2023?"
        m.opt1.title = "A) March 4, 2023"
        m.opt2.title = "B) February 28, 2023"
        m.opt3.title = "C) March 31, 2023"
        m.opt4.title = "D) April 2, 2023"
        m.quizTime.checkedItem = -1
    else if (m.questionNum = 2)
        m.quizLabel.text = "Which one of these MESA competition was done prior to MESA Day 2023?"
        m.opt1.title = "A) MESA Machine"
        m.opt2.title = "B) Coding Solutions"
        m.opt3.title = "C) Moon Base"
        m.opt4.title = "D) Crime Scene Science"
        m.quizTime.checkedItem = -1

    else if (m.questionNum = 3)
        m.quizLabel.text = "What does MESA stand for?"
        m.opt1.title = "A) Math, Engineering, Science, Art"
        m.opt2.title = "B) Mathematicians, Engineers, Scientists, Achievers"
        m.opt3.title = "C) Math, Economics, Science, Art"
        m.opt4.title = "D) Math, Engineering, Science, Achievement"
        m.quizTime.checkedItem = -1

    else if (m.questionNum = 4)
        m.quizLabel.text = "What year was MESA found in?"
        m.opt1.title = "A) 1970"
        m.opt2.title = "B) 1975"
        m.opt3.title = "C) 1984"
        m.opt4.title = "D) 1969"
        m.quizTime.checkedItem = -1

    else if (m.questionNum = 5)
        m.quizLabel.text = "What was the first school that MESA was established at?"
        m.opt1.title = "A) Oakland Techinal High School"
        m.opt2.title = "B) Santa Teresa High School"
        m.opt3.title = "C) Evergreen High School"
        m.opt4.title = "D) Oakgrove High School"
        m.quizTime.checkedItem = -1

    end if
end sub

sub backSelect()
    m.rowList.visible = true
    m.titleLabel.visible = true
    m.descriptionLabel.visible = true
    m.rowList.focusable = true
    m.rowList.SetFocus(true)
    m.quiz.text = "Trivia"
    m.goBack.text = "Back"

    m.goBack.visible = false
    m.quizLabel.visible = false
    m.QuizTime.visible = false
    m.QuizTime.focusable = false    
end sub

sub OnVisibleChange() ' invoked when GridScreen change visibility
    if m.top.visible = true
        m.rowList.SetFocus(true) ' set focus to rowList if GridScreen visible
    end if
end sub
sub OnItemFocused() ' invoked when another item is focused
    focusedIndex = m.rowList.rowItemFocused ' get position of focused item
    row = m.rowList.content.GetChild(focusedIndex[0]) ' get all items of row
    item = row.GetChild(focusedIndex[1]) ' get focused item
    ' update description label with description of focused item
    m.descriptionLabel.text = item.description
    ' update title label with title of focused item
    m.titleLabel.text = item.title
    ' adding length of playback to the title if item length field was populated
    if item.length <> invalid and item.length <> 0
        m.titleLabel.text += " | " + GetTime(item.length)
    end if
end sub

sub onKeyEvent(key as String, press as Boolean) as Boolean
    if press then
        if (key = "up")
            if m.rowList.rowItemFocused[0] = 0
                m.rowList.SetFocus(false)
                m.quiz.SetFocus(true)
            end if
            return true
        else if (key = "down")
            if (m.quiz.hasFocus() and m.rowList.visible = true)
                m.quiz.setFocus(false)
                m.rowList.SetFocus(true)
            else if m.QuizTime.hasFocus()
                m.QuizTime.SetFocus(false)
                m.nextQ.SetFocus(true)
            else if (m.quiz.hasFocus() and m.rowList.visible = false)
                m.quiz.setFocus(false)
                m.QuizTime.SetFocus(true)
            end if
            return true
        else if (key = "left")
            if (m.quiz.hasFocus() and m.goBack.visible = true)
                m.quiz.SetFocus(false)
                m.goBack.SetFocus(true)
            else if m.goBack.hasFocus()
                m.goBack.SetFocus(false)
                m.QuizTime.SetFocus(true)
            end if
            return true
            
        else if (key = "right")
            if m.goBack.hasFocus()
                m.quiz.SetFocus(true)
                m.goBack.SetFocus(false)
            else if m.QuizTime.hasFocus()
                m.QuizTime.SetFocus(false)
                m.goBack.SetFocus(true)
            end if
            return true
        end if
    end if
    return false
end sub