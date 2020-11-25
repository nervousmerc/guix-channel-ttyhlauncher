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
  (let ((version "2.0.2")
        (revision "1")
        (commit "8da331926995919c9dfece00bd7c1e72b9228d52"))
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
                "0srdy99wljv9jr69kp0npnrwz2p9s6qhgvw3haqq5zyjl30yx6r5"))))
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
