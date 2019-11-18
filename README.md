# guix-channel-ttyhlauncher

Guix channel containing package definition for  [Ттюх! Майнкрафт!](https://ttyh.ru/) launcher

## Getting started
+ Install [Guix](http://guix.gnu.org/)
+ Add this to your `~/.config/guix/channels.scm`:

``` scheme
(cons (channel
       (name 'ttyh)
       (url "https://github.com/nervousmerc/guix-channel-ttyhlauncher.git"))
      %default-channels)
```
+ Run `guix pull`
+ Run `guix package -i ttyhlauncher`
+ Run `ttyhlauncher`
+ Enjoy!
