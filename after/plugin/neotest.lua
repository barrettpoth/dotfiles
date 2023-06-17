local neotest = require('neotest')

neotest.setup({
    adapters = {
        require('neotest-minitest'),
        require('neotest-rspec'),
    }
})

local nmap = function(keys, func, desc)
    if desc then
        desc = 'Neotest: ' .. desc
    end

    vim.keymap.set('n', keys, func, { desc = desc })
end

nmap('<C-t>', neotest.run.run, 'Run the nearest test')
nmap('<S-t>', neotest.summary.toggle, 'Toggle the summary window')
nmap('[t', function() neotest.jump.prev({ status = "failed" }) end, 'Jump to the next failed test')
nmap(']t', function() neotest.jump.next({ status = "failed" }) end, 'Jump to the previous failed test')
