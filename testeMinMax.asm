main:
    loadn r0, #'B'
    loadn r1, #'A'

    min r0, r1

    loadn r1, #0
    outchar r0, r1

    loadn r0, #'K'
    loadn r1, #'Z'

    max r0, r1

    loadn r1, #2
    outchar r0, r1

    halt
