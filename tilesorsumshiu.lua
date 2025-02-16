local function setPartColor(part)
    if part:IsA("BasePart") then
        part.Color = Color3.new(0, 1, 0) 
        part.Material = Enum.Material.SmoothPlastic 
        part.Transparency = 0.5 
    end
end

local function processSegment(segment)
    local folder = segment:FindFirstChild("Folder")
    if folder then
        for _, part in ipairs(folder:GetChildren()) do
            if part:IsA("BasePart") then
                local breakable = part:FindFirstChild("breakable")
                if not breakable then
                    setPartColor(part)
                end
            end
        end
    end
end

local segmentSystem = workspace:FindFirstChild("segmentSystem")
if segmentSystem then
    local segmentsFolder = segmentSystem:FindFirstChild("Segments")
    if segmentsFolder then
        for _, segment in ipairs(segmentsFolder:GetChildren()) do
            processSegment(segment)
        end
    end
end
