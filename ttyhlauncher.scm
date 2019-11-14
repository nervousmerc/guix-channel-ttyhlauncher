(define-module (ttyhlauncher)
  #:use-module (guix)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages base)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix licenses))

(define-public ttyhlauncher
  (let ((version "2.0.1")
        (revision "1")
        (commit "5a9f25946d57ebf09befd579100f9c60061f6f17"))
    (package
     (name "ttyhlauncher")
     (version (git-version version revision commit))
     (source (origin
              (method git-fetch)
              (uri
               (git-reference
                (url "git://github.com/dngulin/ttyhlauncher.git")
                (commit commit)))
              (sha256
               (base32
                "03qi67hkvb5abgd1dw77mn3fn9rvhdyiqfabj74hzaxymn1sr09z"))))
     (build-system cmake-build-system)
     (arguments
      '(#:tests? #f))
     (native-inputs `(("gcc" ,gcc)
                      ("qttools" ,qttools)
                      ("pkg-config" ,pkg-config)))
     (inputs `(("qtbase" ,qtbase)
               ("libzip" ,libzip)))
     (synopsis "Лончер для Ттюх! Майнкрафт!")
     (description "Ттюх! Майнкрафт! — это несколько небольших Minecraft-серверов с
собственным сервером аутентификации и обновлений.")
     (home-page "https://ttyh.ru")
     (license gpl3))))
