# nvim

This is my personal configuration for [neovim](https://neovim.io/). 

## Why did I build this?

I built this in an effort to construct my [_personal development environment_](https://www.youtube.com/watch?v=IK_-C0GXfjo). Essentially, it is a completely personalized space that is completely tailored to me rather than using a more bloated environment such as VS Code or JetBrains IDEs.

## Uses

I utilize [`NvChad`](https://nvchad.com/) as a base configuration. 

## Getting Started

Install _neovim_. I prefer to use `brew`:

```bash
brew install nvim
```

Install _lua Language Server_ for _neovim_.

```bash
brew intall lua-language-server
```

Clone this repository to `~/.config/nvim`:

```bash
git clone https://github.com/nicholasadamou/nvim ~/.config/nvim
```

Then, open `neovim` and wait for the plugins to install.

## Customization

As is standard with NvChad, my custom configuration is located [`lua/custom`](lua/custom/). 