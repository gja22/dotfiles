-- https://github.com/numToStr/Comment.nvim
return {
    'numToStr/Comment.nvim',
    opts = {
        opleader = {
            line = "gc",
            block = "gb",
        },

        mappings = {
            -- operator pending mapping
            -- Includes:
            --   `gcc`               line-comment the current line
            --   `gcb`               block-comment the current line
            --   `gc[count]{motion}` line-comment the region in {motion}
            --   `gb[count]{motion}` block-comment the region in {motion}
            basic = true,

            -- extra mapping
            -- Includes `gco`, `gcO`, `gcA`
            extra = true,

            -- extended mapping - read the doc on these
            -- Includes `g>`, `g<`, `g>[count]{motion}`, g<[count]{motion}`
            extended = false,

            -- Pre-hook, called before commenting the line
            -- can be used to determine the commentstring value
            pre_hook = nil,

            -- Post-hook, called after commenting is done
            -- can be used to alter formatting, newlines, etc.
            post_hook = nil,

            -- Can be used to ignore certain lines when doing linewise motions
            -- can be string (lua regex)
            -- of function (that returns lua regex)
            ignore = nil,
        },
    }
}
