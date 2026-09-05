return {
    dir = "/home/logico/dev/jsr/pseudo-coder",
    config = function()
        require("pseudo-coder").setup(
            {
                backend = 'ollama',
                backend_config = {
                    ollama = {
                        model = "qwen2.5-coder:14b-instruct-q2_K",
                        url = "http://localhost:11434",
                    },
                },
                ui = {
                    floating_window = true,
                    update_interval = 80,
                }
            }
        )
    end,
}
