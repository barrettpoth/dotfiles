local builtin = require("statuscol.builtin")
require("statuscol").setup(
    {
        segments = {
            { text = { builtin.foldfunc, " " } }, -- this removes fold nums
            { text = { "%s" }, },
            { text = { builtin.lnumfunc, " " } }
        }
    }
)
