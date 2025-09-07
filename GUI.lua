local GUI = {}

function GUI.newGroup()
    local myGroup = {}
    myGroup.elements = {}

    function myGroup:addElement(pElement)
        table.insert(self.elements, pElement)
    end

    function myGroup:setVisible(pVisible)
        for n, v in pairs(myGroup.elements) do
            v:setVisible(pVisible)
        end
    end

    function myGroup:draw()
        love.graphics.push()
        for n, v in pairs(myGroup.elements) do
            v:draw()
        end
        love.graphics.pop()
    end

    function myGroup:update(dt)
        for n, v in pairs(myGroup.elements) do
            v:update(dt)
        end
    end

    return myGroup
end

local function newElement(pX, pY)
    local myElement = {}
    myElement.x = pX
    myElement.y = pY

    function myElement:update(dt)
        print("newElement / update / Not implemented")
    end

    function myElement:draw()
        print("newElement / draw / Not implemented")
    end
    function myElement:setVisible(pVisible)
        self.visible = pVisible
    end
    return myElement
end

function GUI.newPanel(pX, pY, pW, pH)
    local myPanel = newElement(pX, pY)
    myPanel.w = pW
    myPanel.h = pH
    myPanel.image = nil
    myPanel.isHover = false
    myPanel.listEvents = {}

    function myPanel:setEvent(pEventType, pFunction)
        self.listEvents[pEventType] = pFunction
    end

    function myPanel:setImages(pImage)
        self.image = pImage
        self.w = pImage:getWidth()
        self.h = pImage:getHeight()
    end

    function myPanel:drawPanel()
        --love.graphics.setColor(love.math.colorFromBytes(1, 1, 1))
        if self.image == nil then
            love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
        else
            love.graphics.draw(self.image, self.x, self.y)
        end
        --love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
    end

    function myPanel:draw()
        if self.visible == false then
            return
        end
        self:drawPanel()
    end

    function myPanel:updatePanel(dt)
        local mx, my = love.mouse.getPosition()
        if mx > self.x and mx < self.x + self.w and my > self.y and my < self.y + self.h then
            if self.isHover == false then
                self.isHover = true
            end
        else
            if self.isHover == true then
                self.isHover = false
            end
        end
    end
    function myPanel:update(dt)
        self:updatePanel()
    end
    return myPanel
end

function GUI.newText(pX, pY, pW, pH, pText, pFont, pHAlign, pVAlign, pRColor, pVColor, pBColor)
    local myText = GUI.newPanel(pX, pY, pW, pH)
    myText.text = pText
    myText.font = pFont
    myText.textw = pFont:getWidth(pText)
    myText.texth = pFont:getHeight(pText)
    myText.HAlign = pHAlign
    myText.VAlign = pVAlign
    myText.Rcolor = pRColor
    myText.Vcolor = pVColor
    myText.Bcolor = pBColor

    function myText:drawText()
        if self.Rcolor == nil then
            self.Rcolor = 1
        end
        if self.Vcolor == nil then
            self.Vcolor = 1
        end
        if self.Bcolor == nil then
            self.Bcolor = 1
        end

        love.graphics.setColor(love.math.colorFromBytes(self.Rcolor, self.Vcolor, self.Bcolor))
        love.graphics.setFont(self.font)
        local x = self.x
        local y = self.y
        if self.HAlign == "center" then
            x = x + ((self.w - self.textw) / 2)
        end
        if self.VAlign == "center" then
            y = y + ((self.h - self.texth) / 2)
        end

        love.graphics.printf(self.text, x, y, pW)
    end

    function myText:draw()
        if self.visible == false then
            return
        end
        self:drawText()
    end
    return myText
end

function GUI.newButton(pX, pY, pW, pH, pText, pFont, pRColor, pVColor, pBColor)
    local myButton = GUI.newPanel(pX, pY, pW, pH)
    myButton.text = pText
    myButton.font = pFont
    myButton.label = GUI.newText(pX, pY, pW, pH, pText, pFont, "center", "center", pRColor, pVColor, pBColor)

    myButton.isPressed = false
    myButton.oldButtonState = false
    myButton.imgDefault = nil
    myButton.imgHover = nil
    myButton.imgPressed = nil

    function myButton:setImages(pImageDefault, pImageHover, pImagePressed)
        self.imgDefault = pImageDefault
        self.imgHover = pImageHover
        self.imgPressed = pImagePressed
        self.w = pImageDefault:getWidth()
        self.h = pImageDefault:getHeight()
    end

    function myButton:draw()
        if self.visible then
            if self.isPressed then
                if self.imgPressed == nil then
                    self:drawPanel()
                    love.graphics.setColor(255, 255, 255, 50)
                    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
                else
                    love.graphics.draw(self.imgPressed, self.x, self.y)
                end
            elseif self.isHover then
                if self.imgHover == nil then
                    self:drawPanel()
                    love.graphics.setColor(255, 255, 255)
                    love.graphics.rectangle("line", self.x + 2, self.y + 2, self.w - 4, self.h - 4)
                else
                    love.graphics.draw(self.imgHover, self.x, self.y)
                end
            else
                if self.imgDefault == nil then
                    self:drawPanel()
                else
                    love.graphics.draw(self.imgDefault, self.x, self.y)
                end
            end
        else
            return
        end
        self.label:draw()
    end

    function myButton:update(dt)
        self:updatePanel(dt)
        if self.isHover and love.mouse.isDown(1) and self.isPressed == false and self.oldButtonState == false then
            self.isPressed = true
            if self.listEvents["pressed"] ~= nil then
                self.listEvents["pressed"]("begin")
                clic:play()
            end
        else
            if self.isPressed == true and love.mouse.isDown(1) == false then
                self.isPressed = false
            -- if self.listEvents["pressed"] ~= nil then
            --     self.listEvents["pressed"]("end")
            -- end
            end
        end
        self.oldButtonState = love.mouse.isDown(1)
    end

    return myButton
end

function GUI.newCheckbox(pX, pY, pW, pH)
    local myCheckbox = GUI.newPanel(pX, pY, pW, pH)
    myCheckbox.Text = pText
    myCheckbox.imgDefault = nil
    myCheckbox.imgPressed = nil
    myCheckbox.isPressed = false
    myCheckbox.oldButtonState = false
    function myCheckbox:setImages(pImageDefault, pImagePressed)
        self.imgDefault = pImageDefault
        self.imgPressed = pImagePressed
        self.w = pImageDefault:getWidth()
        self.h = pImageDefault:getHeight()
    end
    function myCheckbox:setState(pbState)
        self.isPressed = pbState
    end
    function myCheckbox:update(dt)
        self:updatePanel(dt)
        if self.isHover and love.mouse.isDown(1) and self.isPressed == false and self.oldButtonState == false then
            self.isPressed = true
            if self.listEvents["pressed"] ~= nil then
                self.listEvents["pressed"]("on")
            end
        elseif self.isHover and love.mouse.isDown(1) and self.isPressed == true and self.oldButtonState == false then
            self.isPressed = false
            if self.listEvents["pressed"] ~= nil then
                self.listEvents["pressed"]("off")
            end
        end
        self.oldButtonState = love.mouse.isDown(1)
    end
    function myCheckbox:draw()
        love.graphics.setColor(255, 255, 255)
        if self.visible then
            if self.isPressed then
                if self.imgPressed == nil then
                    self:drawPanel()
                    love.graphics.setColor(255, 255, 255, 50)
                    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
                else
                    love.graphics.draw(self.imgPressed, self.x, self.y)
                end
            else
                if self.imgDefault == nil then
                    self:drawPanel()
                else
                    love.graphics.draw(self.imgDefault, self.x, self.y)
                end
            end
        end
    end
    return myCheckbox
end

return GUI
