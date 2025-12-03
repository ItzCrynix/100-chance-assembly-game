; Ideia do jogo: puzzle de labirinto
; objetivo: chegar na escadaria do mapa
; impeditivos: Fog of war, numero limitado de movimentos
; ajudas: alavancas que abrem passagens novas
; personagem: mudar de sprite quando anda  
; score: começa no máximo e desce com o numero de movimentos
; equipamentos: itens que ajudam com fog of war, apertar algo, etc. 
; extra: NPC e dialogo

jmp main

; -- Variables --

map : var #1200

currentMap : var #1
  static currentMap, #1

maxMoves : var #1
  static maxMoves, #100

currentMoves: var #1
  static currentMoves, #100

; ---------------

; Strings 

winStr : string "You win!"
winPos : var #1
  static winPos, #576

repeatStr : string "Press 0 to go again."
repeatPos : var #1
  static repeatPos, #611

; ---------------

; Maps
telaBase : var #1200
  ;Linha 0
  static telaBase + #0, #4
  static telaBase + #1, #1
  static telaBase + #2, #1
  static telaBase + #3, #1
  static telaBase + #4, #1
  static telaBase + #5, #1
  static telaBase + #6, #1
  static telaBase + #7, #1
  static telaBase + #8, #1
  static telaBase + #9, #1
  static telaBase + #10, #1
  static telaBase + #11, #1
  static telaBase + #12, #1
  static telaBase + #13, #1
  static telaBase + #14, #1
  static telaBase + #15, #1
  static telaBase + #16, #1
  static telaBase + #17, #1
  static telaBase + #18, #1
  static telaBase + #19, #1
  static telaBase + #20, #1
  static telaBase + #21, #1
  static telaBase + #22, #1
  static telaBase + #23, #1
  static telaBase + #24, #1
  static telaBase + #25, #1
  static telaBase + #26, #1
  static telaBase + #27, #1
  static telaBase + #28, #1
  static telaBase + #29, #1
  static telaBase + #30, #1
  static telaBase + #31, #1
  static telaBase + #32, #1
  static telaBase + #33, #1
  static telaBase + #34, #1
  static telaBase + #35, #1
  static telaBase + #36, #1
  static telaBase + #37, #1
  static telaBase + #38, #1
  static telaBase + #39, #5

  ;Linha 1
  static telaBase + #40, #2
  static telaBase + #41, #0
  static telaBase + #42, #0
  static telaBase + #43, #0
  static telaBase + #44, #0
  static telaBase + #45, #0
  static telaBase + #46, #0
  static telaBase + #47, #0
  static telaBase + #48, #0
  static telaBase + #49, #0
  static telaBase + #50, #0
  static telaBase + #51, #0
  static telaBase + #52, #0
  static telaBase + #53, #0
  static telaBase + #54, #0
  static telaBase + #55, #0
  static telaBase + #56, #0
  static telaBase + #57, #0
  static telaBase + #58, #0
  static telaBase + #59, #0
  static telaBase + #60, #0
  static telaBase + #61, #0
  static telaBase + #62, #0
  static telaBase + #63, #0
  static telaBase + #64, #0
  static telaBase + #65, #0
  static telaBase + #66, #0
  static telaBase + #67, #0
  static telaBase + #68, #0
  static telaBase + #69, #0
  static telaBase + #70, #0
  static telaBase + #71, #0
  static telaBase + #72, #0
  static telaBase + #73, #0
  static telaBase + #74, #0
  static telaBase + #75, #0
  static telaBase + #76, #0
  static telaBase + #77, #0
  static telaBase + #78, #0
  static telaBase + #79, #2

  ;Linha 2
  static telaBase + #80, #2
  static telaBase + #81, #0
  static telaBase + #82, #0
  static telaBase + #83, #0
  static telaBase + #84, #0
  static telaBase + #85, #0
  static telaBase + #86, #0
  static telaBase + #87, #0
  static telaBase + #88, #0
  static telaBase + #89, #0
  static telaBase + #90, #0
  static telaBase + #91, #0
  static telaBase + #92, #0
  static telaBase + #93, #0
  static telaBase + #94, #0
  static telaBase + #95, #0
  static telaBase + #96, #0
  static telaBase + #97, #0
  static telaBase + #98, #0
  static telaBase + #99, #0
  static telaBase + #100, #0
  static telaBase + #101, #0
  static telaBase + #102, #0
  static telaBase + #103, #0
  static telaBase + #104, #0
  static telaBase + #105, #0
  static telaBase + #106, #0
  static telaBase + #107, #0
  static telaBase + #108, #0
  static telaBase + #109, #0
  static telaBase + #110, #0
  static telaBase + #111, #0
  static telaBase + #112, #0
  static telaBase + #113, #0
  static telaBase + #114, #0
  static telaBase + #115, #0
  static telaBase + #116, #0
  static telaBase + #117, #0
  static telaBase + #118, #0
  static telaBase + #119, #2

  ;Linha 3
  static telaBase + #120, #2
  static telaBase + #121, #0
  static telaBase + #122, #0
  static telaBase + #123, #0
  static telaBase + #124, #0
  static telaBase + #125, #0
  static telaBase + #126, #0
  static telaBase + #127, #0
  static telaBase + #128, #0
  static telaBase + #129, #0
  static telaBase + #130, #0
  static telaBase + #131, #0
  static telaBase + #132, #0
  static telaBase + #133, #0
  static telaBase + #134, #0
  static telaBase + #135, #0
  static telaBase + #136, #0
  static telaBase + #137, #0
  static telaBase + #138, #0
  static telaBase + #139, #0
  static telaBase + #140, #0
  static telaBase + #141, #0
  static telaBase + #142, #0
  static telaBase + #143, #0
  static telaBase + #144, #0
  static telaBase + #145, #0
  static telaBase + #146, #0
  static telaBase + #147, #0
  static telaBase + #148, #0
  static telaBase + #149, #0
  static telaBase + #150, #0
  static telaBase + #151, #0
  static telaBase + #152, #0
  static telaBase + #153, #0
  static telaBase + #154, #0
  static telaBase + #155, #0
  static telaBase + #156, #0
  static telaBase + #157, #0
  static telaBase + #158, #0
  static telaBase + #159, #2

  ;Linha 4
  static telaBase + #160, #2
  static telaBase + #161, #0
  static telaBase + #162, #0
  static telaBase + #163, #0
  static telaBase + #164, #0
  static telaBase + #165, #0
  static telaBase + #166, #0
  static telaBase + #167, #0
  static telaBase + #168, #0
  static telaBase + #169, #0
  static telaBase + #170, #0
  static telaBase + #171, #0
  static telaBase + #172, #0
  static telaBase + #173, #0
  static telaBase + #174, #0
  static telaBase + #175, #0
  static telaBase + #176, #0
  static telaBase + #177, #0
  static telaBase + #178, #0
  static telaBase + #179, #0
  static telaBase + #180, #0
  static telaBase + #181, #0
  static telaBase + #182, #0
  static telaBase + #183, #0
  static telaBase + #184, #0
  static telaBase + #185, #0
  static telaBase + #186, #0
  static telaBase + #187, #0
  static telaBase + #188, #0
  static telaBase + #189, #0
  static telaBase + #190, #0
  static telaBase + #191, #0
  static telaBase + #192, #0
  static telaBase + #193, #0
  static telaBase + #194, #0
  static telaBase + #195, #0
  static telaBase + #196, #0
  static telaBase + #197, #0
  static telaBase + #198, #0
  static telaBase + #199, #2

  ;Linha 5
  static telaBase + #200, #2
  static telaBase + #201, #0
  static telaBase + #202, #0
  static telaBase + #203, #0
  static telaBase + #204, #0
  static telaBase + #205, #0
  static telaBase + #206, #0
  static telaBase + #207, #0
  static telaBase + #208, #0
  static telaBase + #209, #0
  static telaBase + #210, #0
  static telaBase + #211, #0
  static telaBase + #212, #0
  static telaBase + #213, #0
  static telaBase + #214, #0
  static telaBase + #215, #0
  static telaBase + #216, #0
  static telaBase + #217, #0
  static telaBase + #218, #0
  static telaBase + #219, #0
  static telaBase + #220, #0
  static telaBase + #221, #0
  static telaBase + #222, #0
  static telaBase + #223, #0
  static telaBase + #224, #0
  static telaBase + #225, #0
  static telaBase + #226, #0
  static telaBase + #227, #0
  static telaBase + #228, #0
  static telaBase + #229, #0
  static telaBase + #230, #0
  static telaBase + #231, #0
  static telaBase + #232, #0
  static telaBase + #233, #0
  static telaBase + #234, #0
  static telaBase + #235, #0
  static telaBase + #236, #0
  static telaBase + #237, #0
  static telaBase + #238, #0
  static telaBase + #239, #2

  ;Linha 6
  static telaBase + #240, #2
  static telaBase + #241, #0
  static telaBase + #242, #0
  static telaBase + #243, #0
  static telaBase + #244, #0
  static telaBase + #245, #0
  static telaBase + #246, #0
  static telaBase + #247, #0
  static telaBase + #248, #0
  static telaBase + #249, #0
  static telaBase + #250, #0
  static telaBase + #251, #0
  static telaBase + #252, #0
  static telaBase + #253, #0
  static telaBase + #254, #0
  static telaBase + #255, #0
  static telaBase + #256, #0
  static telaBase + #257, #0
  static telaBase + #258, #0
  static telaBase + #259, #0
  static telaBase + #260, #0
  static telaBase + #261, #0
  static telaBase + #262, #0
  static telaBase + #263, #0
  static telaBase + #264, #0
  static telaBase + #265, #0
  static telaBase + #266, #0
  static telaBase + #267, #0
  static telaBase + #268, #0
  static telaBase + #269, #0
  static telaBase + #270, #0
  static telaBase + #271, #0
  static telaBase + #272, #0
  static telaBase + #273, #0
  static telaBase + #274, #0
  static telaBase + #275, #0
  static telaBase + #276, #0
  static telaBase + #277, #0
  static telaBase + #278, #0
  static telaBase + #279, #2

  ;Linha 7
  static telaBase + #280, #2
  static telaBase + #281, #0
  static telaBase + #282, #0
  static telaBase + #283, #0
  static telaBase + #284, #0
  static telaBase + #285, #0
  static telaBase + #286, #0
  static telaBase + #287, #0
  static telaBase + #288, #0
  static telaBase + #289, #0
  static telaBase + #290, #0
  static telaBase + #291, #0
  static telaBase + #292, #0
  static telaBase + #293, #0
  static telaBase + #294, #0
  static telaBase + #295, #0
  static telaBase + #296, #0
  static telaBase + #297, #0
  static telaBase + #298, #0
  static telaBase + #299, #0
  static telaBase + #300, #0
  static telaBase + #301, #0
  static telaBase + #302, #0
  static telaBase + #303, #0
  static telaBase + #304, #0
  static telaBase + #305, #0
  static telaBase + #306, #0
  static telaBase + #307, #0
  static telaBase + #308, #0
  static telaBase + #309, #0
  static telaBase + #310, #0
  static telaBase + #311, #0
  static telaBase + #312, #0
  static telaBase + #313, #0
  static telaBase + #314, #0
  static telaBase + #315, #0
  static telaBase + #316, #0
  static telaBase + #317, #0
  static telaBase + #318, #0
  static telaBase + #319, #2

  ;Linha 8
  static telaBase + #320, #2
  static telaBase + #321, #0
  static telaBase + #322, #0
  static telaBase + #323, #0
  static telaBase + #324, #0
  static telaBase + #325, #0
  static telaBase + #326, #0
  static telaBase + #327, #0
  static telaBase + #328, #0
  static telaBase + #329, #0
  static telaBase + #330, #0
  static telaBase + #331, #0
  static telaBase + #332, #0
  static telaBase + #333, #0
  static telaBase + #334, #0
  static telaBase + #335, #0
  static telaBase + #336, #0
  static telaBase + #337, #0
  static telaBase + #338, #0
  static telaBase + #339, #0
  static telaBase + #340, #0
  static telaBase + #341, #0
  static telaBase + #342, #0
  static telaBase + #343, #0
  static telaBase + #344, #0
  static telaBase + #345, #0
  static telaBase + #346, #0
  static telaBase + #347, #0
  static telaBase + #348, #0
  static telaBase + #349, #0
  static telaBase + #350, #0
  static telaBase + #351, #0
  static telaBase + #352, #0
  static telaBase + #353, #0
  static telaBase + #354, #0
  static telaBase + #355, #0
  static telaBase + #356, #0
  static telaBase + #357, #0
  static telaBase + #358, #0
  static telaBase + #359, #2

  ;Linha 9
  static telaBase + #360, #2
  static telaBase + #361, #0
  static telaBase + #362, #0
  static telaBase + #363, #0
  static telaBase + #364, #0
  static telaBase + #365, #0
  static telaBase + #366, #0
  static telaBase + #367, #0
  static telaBase + #368, #0
  static telaBase + #369, #0
  static telaBase + #370, #0
  static telaBase + #371, #0
  static telaBase + #372, #0
  static telaBase + #373, #0
  static telaBase + #374, #0
  static telaBase + #375, #0
  static telaBase + #376, #0
  static telaBase + #377, #0
  static telaBase + #378, #0
  static telaBase + #379, #0
  static telaBase + #380, #0
  static telaBase + #381, #0
  static telaBase + #382, #0
  static telaBase + #383, #0
  static telaBase + #384, #0
  static telaBase + #385, #0
  static telaBase + #386, #0
  static telaBase + #387, #0
  static telaBase + #388, #0
  static telaBase + #389, #0
  static telaBase + #390, #0
  static telaBase + #391, #0
  static telaBase + #392, #0
  static telaBase + #393, #0
  static telaBase + #394, #0
  static telaBase + #395, #0
  static telaBase + #396, #0
  static telaBase + #397, #0
  static telaBase + #398, #0
  static telaBase + #399, #2

  ;Linha 10
  static telaBase + #400, #2
  static telaBase + #401, #0
  static telaBase + #402, #0
  static telaBase + #403, #0
  static telaBase + #404, #0
  static telaBase + #405, #0
  static telaBase + #406, #0
  static telaBase + #407, #0
  static telaBase + #408, #0
  static telaBase + #409, #0
  static telaBase + #410, #0
  static telaBase + #411, #0
  static telaBase + #412, #0
  static telaBase + #413, #0
  static telaBase + #414, #0
  static telaBase + #415, #0
  static telaBase + #416, #0
  static telaBase + #417, #0
  static telaBase + #418, #0
  static telaBase + #419, #0
  static telaBase + #420, #0
  static telaBase + #421, #0
  static telaBase + #422, #0
  static telaBase + #423, #0
  static telaBase + #424, #0
  static telaBase + #425, #0
  static telaBase + #426, #0
  static telaBase + #427, #0
  static telaBase + #428, #0
  static telaBase + #429, #0
  static telaBase + #430, #0
  static telaBase + #431, #0
  static telaBase + #432, #0
  static telaBase + #433, #0
  static telaBase + #434, #0
  static telaBase + #435, #0
  static telaBase + #436, #0
  static telaBase + #437, #0
  static telaBase + #438, #0
  static telaBase + #439, #2

  ;Linha 11
  static telaBase + #440, #2
  static telaBase + #441, #0
  static telaBase + #442, #0
  static telaBase + #443, #0
  static telaBase + #444, #0
  static telaBase + #445, #0
  static telaBase + #446, #0
  static telaBase + #447, #0
  static telaBase + #448, #0
  static telaBase + #449, #0
  static telaBase + #450, #0
  static telaBase + #451, #0
  static telaBase + #452, #0
  static telaBase + #453, #0
  static telaBase + #454, #0
  static telaBase + #455, #0
  static telaBase + #456, #0
  static telaBase + #457, #0
  static telaBase + #458, #0
  static telaBase + #459, #0
  static telaBase + #460, #0
  static telaBase + #461, #0
  static telaBase + #462, #0
  static telaBase + #463, #0
  static telaBase + #464, #0
  static telaBase + #465, #0
  static telaBase + #466, #0
  static telaBase + #467, #0
  static telaBase + #468, #0
  static telaBase + #469, #0
  static telaBase + #470, #0
  static telaBase + #471, #0
  static telaBase + #472, #0
  static telaBase + #473, #0
  static telaBase + #474, #0
  static telaBase + #475, #0
  static telaBase + #476, #0
  static telaBase + #477, #0
  static telaBase + #478, #0
  static telaBase + #479, #2

  ;Linha 12
  static telaBase + #480, #2
  static telaBase + #481, #0
  static telaBase + #482, #0
  static telaBase + #483, #0
  static telaBase + #484, #0
  static telaBase + #485, #0
  static telaBase + #486, #0
  static telaBase + #487, #0
  static telaBase + #488, #0
  static telaBase + #489, #0
  static telaBase + #490, #0
  static telaBase + #491, #0
  static telaBase + #492, #0
  static telaBase + #493, #0
  static telaBase + #494, #0
  static telaBase + #495, #0
  static telaBase + #496, #0
  static telaBase + #497, #0
  static telaBase + #498, #0
  static telaBase + #499, #0
  static telaBase + #500, #0
  static telaBase + #501, #0
  static telaBase + #502, #0
  static telaBase + #503, #0
  static telaBase + #504, #0
  static telaBase + #505, #0
  static telaBase + #506, #0
  static telaBase + #507, #0
  static telaBase + #508, #0
  static telaBase + #509, #0
  static telaBase + #510, #0
  static telaBase + #511, #0
  static telaBase + #512, #0
  static telaBase + #513, #0
  static telaBase + #514, #0
  static telaBase + #515, #0
  static telaBase + #516, #0
  static telaBase + #517, #0
  static telaBase + #518, #0
  static telaBase + #519, #2

  ;Linha 13
  static telaBase + #520, #2
  static telaBase + #521, #0
  static telaBase + #522, #0
  static telaBase + #523, #0
  static telaBase + #524, #0
  static telaBase + #525, #0
  static telaBase + #526, #0
  static telaBase + #527, #0
  static telaBase + #528, #0
  static telaBase + #529, #0
  static telaBase + #530, #0
  static telaBase + #531, #0
  static telaBase + #532, #0
  static telaBase + #533, #0
  static telaBase + #534, #0
  static telaBase + #535, #0
  static telaBase + #536, #0
  static telaBase + #537, #0
  static telaBase + #538, #0
  static telaBase + #539, #0
  static telaBase + #540, #0
  static telaBase + #541, #0
  static telaBase + #542, #0
  static telaBase + #543, #0
  static telaBase + #544, #0
  static telaBase + #545, #0
  static telaBase + #546, #0
  static telaBase + #547, #0
  static telaBase + #548, #0
  static telaBase + #549, #0
  static telaBase + #550, #0
  static telaBase + #551, #0
  static telaBase + #552, #0
  static telaBase + #553, #0
  static telaBase + #554, #0
  static telaBase + #555, #0
  static telaBase + #556, #0
  static telaBase + #557, #0
  static telaBase + #558, #0
  static telaBase + #559, #2

  ;Linha 14
  static telaBase + #560, #2
  static telaBase + #561, #0
  static telaBase + #562, #0
  static telaBase + #563, #0
  static telaBase + #564, #0
  static telaBase + #565, #0
  static telaBase + #566, #0
  static telaBase + #567, #0
  static telaBase + #568, #0
  static telaBase + #569, #0
  static telaBase + #570, #0
  static telaBase + #571, #0
  static telaBase + #572, #0
  static telaBase + #573, #0
  static telaBase + #574, #0
  static telaBase + #575, #0
  static telaBase + #576, #0
  static telaBase + #577, #0
  static telaBase + #578, #0
  static telaBase + #579, #0
  static telaBase + #580, #0
  static telaBase + #581, #0
  static telaBase + #582, #0
  static telaBase + #583, #0
  static telaBase + #584, #0
  static telaBase + #585, #0
  static telaBase + #586, #0
  static telaBase + #587, #0
  static telaBase + #588, #0
  static telaBase + #589, #0
  static telaBase + #590, #0
  static telaBase + #591, #0
  static telaBase + #592, #0
  static telaBase + #593, #0
  static telaBase + #594, #0
  static telaBase + #595, #0
  static telaBase + #596, #0
  static telaBase + #597, #0
  static telaBase + #598, #0
  static telaBase + #599, #2

  ;Linha 15
  static telaBase + #600, #2
  static telaBase + #601, #0
  static telaBase + #602, #0
  static telaBase + #603, #0
  static telaBase + #604, #0
  static telaBase + #605, #0
  static telaBase + #606, #0
  static telaBase + #607, #0
  static telaBase + #608, #0
  static telaBase + #609, #0
  static telaBase + #610, #0
  static telaBase + #611, #0
  static telaBase + #612, #0
  static telaBase + #613, #0
  static telaBase + #614, #0
  static telaBase + #615, #0
  static telaBase + #616, #0
  static telaBase + #617, #0
  static telaBase + #618, #0
  static telaBase + #619, #0
  static telaBase + #620, #0
  static telaBase + #621, #0
  static telaBase + #622, #0
  static telaBase + #623, #0
  static telaBase + #624, #0
  static telaBase + #625, #0
  static telaBase + #626, #0
  static telaBase + #627, #0
  static telaBase + #628, #0
  static telaBase + #629, #0
  static telaBase + #630, #0
  static telaBase + #631, #0
  static telaBase + #632, #0
  static telaBase + #633, #0
  static telaBase + #634, #0
  static telaBase + #635, #0
  static telaBase + #636, #0
  static telaBase + #637, #0
  static telaBase + #638, #0
  static telaBase + #639, #2

  ;Linha 16
  static telaBase + #640, #2
  static telaBase + #641, #0
  static telaBase + #642, #0
  static telaBase + #643, #0
  static telaBase + #644, #0
  static telaBase + #645, #0
  static telaBase + #646, #0
  static telaBase + #647, #0
  static telaBase + #648, #0
  static telaBase + #649, #0
  static telaBase + #650, #0
  static telaBase + #651, #0
  static telaBase + #652, #0
  static telaBase + #653, #0
  static telaBase + #654, #0
  static telaBase + #655, #0
  static telaBase + #656, #0
  static telaBase + #657, #0
  static telaBase + #658, #0
  static telaBase + #659, #0
  static telaBase + #660, #0
  static telaBase + #661, #0
  static telaBase + #662, #0
  static telaBase + #663, #0
  static telaBase + #664, #0
  static telaBase + #665, #0
  static telaBase + #666, #0
  static telaBase + #667, #0
  static telaBase + #668, #0
  static telaBase + #669, #0
  static telaBase + #670, #0
  static telaBase + #671, #0
  static telaBase + #672, #0
  static telaBase + #673, #0
  static telaBase + #674, #0
  static telaBase + #675, #0
  static telaBase + #676, #0
  static telaBase + #677, #0
  static telaBase + #678, #0
  static telaBase + #679, #2

  ;Linha 17
  static telaBase + #680, #2
  static telaBase + #681, #0
  static telaBase + #682, #0
  static telaBase + #683, #0
  static telaBase + #684, #0
  static telaBase + #685, #0
  static telaBase + #686, #0
  static telaBase + #687, #0
  static telaBase + #688, #0
  static telaBase + #689, #0
  static telaBase + #690, #0
  static telaBase + #691, #0
  static telaBase + #692, #0
  static telaBase + #693, #0
  static telaBase + #694, #0
  static telaBase + #695, #0
  static telaBase + #696, #0
  static telaBase + #697, #0
  static telaBase + #698, #0
  static telaBase + #699, #0
  static telaBase + #700, #0
  static telaBase + #701, #0
  static telaBase + #702, #0
  static telaBase + #703, #0
  static telaBase + #704, #0
  static telaBase + #705, #0
  static telaBase + #706, #0
  static telaBase + #707, #0
  static telaBase + #708, #0
  static telaBase + #709, #0
  static telaBase + #710, #0
  static telaBase + #711, #0
  static telaBase + #712, #0
  static telaBase + #713, #0
  static telaBase + #714, #0
  static telaBase + #715, #0
  static telaBase + #716, #0
  static telaBase + #717, #0
  static telaBase + #718, #0
  static telaBase + #719, #2

  ;Linha 18
  static telaBase + #720, #2
  static telaBase + #721, #0
  static telaBase + #722, #0
  static telaBase + #723, #0
  static telaBase + #724, #0
  static telaBase + #725, #0
  static telaBase + #726, #0
  static telaBase + #727, #0
  static telaBase + #728, #0
  static telaBase + #729, #0
  static telaBase + #730, #0
  static telaBase + #731, #0
  static telaBase + #732, #0
  static telaBase + #733, #0
  static telaBase + #734, #0
  static telaBase + #735, #0
  static telaBase + #736, #0
  static telaBase + #737, #0
  static telaBase + #738, #0
  static telaBase + #739, #0
  static telaBase + #740, #0
  static telaBase + #741, #0
  static telaBase + #742, #0
  static telaBase + #743, #0
  static telaBase + #744, #0
  static telaBase + #745, #0
  static telaBase + #746, #0
  static telaBase + #747, #0
  static telaBase + #748, #0
  static telaBase + #749, #0
  static telaBase + #750, #0
  static telaBase + #751, #0
  static telaBase + #752, #0
  static telaBase + #753, #0
  static telaBase + #754, #0
  static telaBase + #755, #0
  static telaBase + #756, #0
  static telaBase + #757, #0
  static telaBase + #758, #0
  static telaBase + #759, #2

  ;Linha 19
  static telaBase + #760, #2
  static telaBase + #761, #0
  static telaBase + #762, #0
  static telaBase + #763, #0
  static telaBase + #764, #0
  static telaBase + #765, #0
  static telaBase + #766, #0
  static telaBase + #767, #0
  static telaBase + #768, #0
  static telaBase + #769, #0
  static telaBase + #770, #0
  static telaBase + #771, #0
  static telaBase + #772, #0
  static telaBase + #773, #0
  static telaBase + #774, #0
  static telaBase + #775, #0
  static telaBase + #776, #0
  static telaBase + #777, #0
  static telaBase + #778, #0
  static telaBase + #779, #0
  static telaBase + #780, #0
  static telaBase + #781, #0
  static telaBase + #782, #0
  static telaBase + #783, #0
  static telaBase + #784, #0
  static telaBase + #785, #0
  static telaBase + #786, #0
  static telaBase + #787, #0
  static telaBase + #788, #0
  static telaBase + #789, #0
  static telaBase + #790, #0
  static telaBase + #791, #0
  static telaBase + #792, #0
  static telaBase + #793, #0
  static telaBase + #794, #0
  static telaBase + #795, #0
  static telaBase + #796, #0
  static telaBase + #797, #0
  static telaBase + #798, #0
  static telaBase + #799, #2

  ;Linha 20
  static telaBase + #800, #2
  static telaBase + #801, #0
  static telaBase + #802, #0
  static telaBase + #803, #0
  static telaBase + #804, #0
  static telaBase + #805, #0
  static telaBase + #806, #0
  static telaBase + #807, #0
  static telaBase + #808, #0
  static telaBase + #809, #0
  static telaBase + #810, #0
  static telaBase + #811, #0
  static telaBase + #812, #0
  static telaBase + #813, #0
  static telaBase + #814, #0
  static telaBase + #815, #0
  static telaBase + #816, #0
  static telaBase + #817, #0
  static telaBase + #818, #0
  static telaBase + #819, #0
  static telaBase + #820, #0
  static telaBase + #821, #0
  static telaBase + #822, #0
  static telaBase + #823, #0
  static telaBase + #824, #0
  static telaBase + #825, #0
  static telaBase + #826, #0
  static telaBase + #827, #0
  static telaBase + #828, #0
  static telaBase + #829, #0
  static telaBase + #830, #0
  static telaBase + #831, #0
  static telaBase + #832, #0
  static telaBase + #833, #0
  static telaBase + #834, #0
  static telaBase + #835, #0
  static telaBase + #836, #0
  static telaBase + #837, #0
  static telaBase + #838, #0
  static telaBase + #839, #2

  ;Linha 21
  static telaBase + #840, #2
  static telaBase + #841, #0
  static telaBase + #842, #0
  static telaBase + #843, #0
  static telaBase + #844, #0
  static telaBase + #845, #0
  static telaBase + #846, #0
  static telaBase + #847, #0
  static telaBase + #848, #0
  static telaBase + #849, #0
  static telaBase + #850, #0
  static telaBase + #851, #0
  static telaBase + #852, #0
  static telaBase + #853, #0
  static telaBase + #854, #0
  static telaBase + #855, #0
  static telaBase + #856, #0
  static telaBase + #857, #0
  static telaBase + #858, #0
  static telaBase + #859, #0
  static telaBase + #860, #0
  static telaBase + #861, #0
  static telaBase + #862, #0
  static telaBase + #863, #0
  static telaBase + #864, #0
  static telaBase + #865, #0
  static telaBase + #866, #0
  static telaBase + #867, #0
  static telaBase + #868, #0
  static telaBase + #869, #0
  static telaBase + #870, #0
  static telaBase + #871, #0
  static telaBase + #872, #0
  static telaBase + #873, #0
  static telaBase + #874, #0
  static telaBase + #875, #0
  static telaBase + #876, #0
  static telaBase + #877, #0
  static telaBase + #878, #0
  static telaBase + #879, #2

  ;Linha 22
  static telaBase + #880, #2
  static telaBase + #881, #0
  static telaBase + #882, #0
  static telaBase + #883, #0
  static telaBase + #884, #0
  static telaBase + #885, #0
  static telaBase + #886, #0
  static telaBase + #887, #0
  static telaBase + #888, #0
  static telaBase + #889, #0
  static telaBase + #890, #0
  static telaBase + #891, #0
  static telaBase + #892, #0
  static telaBase + #893, #0
  static telaBase + #894, #0
  static telaBase + #895, #0
  static telaBase + #896, #0
  static telaBase + #897, #0
  static telaBase + #898, #0
  static telaBase + #899, #0
  static telaBase + #900, #0
  static telaBase + #901, #0
  static telaBase + #902, #0
  static telaBase + #903, #0
  static telaBase + #904, #0
  static telaBase + #905, #0
  static telaBase + #906, #0
  static telaBase + #907, #0
  static telaBase + #908, #0
  static telaBase + #909, #0
  static telaBase + #910, #0
  static telaBase + #911, #0
  static telaBase + #912, #0
  static telaBase + #913, #0
  static telaBase + #914, #0
  static telaBase + #915, #0
  static telaBase + #916, #0
  static telaBase + #917, #0
  static telaBase + #918, #0
  static telaBase + #919, #2

  ;Linha 23
  static telaBase + #920, #2
  static telaBase + #921, #0
  static telaBase + #922, #0
  static telaBase + #923, #0
  static telaBase + #924, #0
  static telaBase + #925, #0
  static telaBase + #926, #0
  static telaBase + #927, #0
  static telaBase + #928, #0
  static telaBase + #929, #0
  static telaBase + #930, #0
  static telaBase + #931, #0
  static telaBase + #932, #0
  static telaBase + #933, #0
  static telaBase + #934, #0
  static telaBase + #935, #0
  static telaBase + #936, #0
  static telaBase + #937, #0
  static telaBase + #938, #0
  static telaBase + #939, #0
  static telaBase + #940, #0
  static telaBase + #941, #0
  static telaBase + #942, #0
  static telaBase + #943, #0
  static telaBase + #944, #0
  static telaBase + #945, #0
  static telaBase + #946, #0
  static telaBase + #947, #0
  static telaBase + #948, #0
  static telaBase + #949, #0
  static telaBase + #950, #0
  static telaBase + #951, #0
  static telaBase + #952, #0
  static telaBase + #953, #0
  static telaBase + #954, #0
  static telaBase + #955, #0
  static telaBase + #956, #0
  static telaBase + #957, #0
  static telaBase + #958, #0
  static telaBase + #959, #2

  ;Linha 24
  static telaBase + #960, #2
  static telaBase + #961, #0
  static telaBase + #962, #0
  static telaBase + #963, #0
  static telaBase + #964, #0
  static telaBase + #965, #0
  static telaBase + #966, #0
  static telaBase + #967, #0
  static telaBase + #968, #0
  static telaBase + #969, #0
  static telaBase + #970, #0
  static telaBase + #971, #0
  static telaBase + #972, #0
  static telaBase + #973, #0
  static telaBase + #974, #0
  static telaBase + #975, #0
  static telaBase + #976, #0
  static telaBase + #977, #0
  static telaBase + #978, #0
  static telaBase + #979, #0
  static telaBase + #980, #0
  static telaBase + #981, #0
  static telaBase + #982, #0
  static telaBase + #983, #0
  static telaBase + #984, #0
  static telaBase + #985, #0
  static telaBase + #986, #0
  static telaBase + #987, #0
  static telaBase + #988, #0
  static telaBase + #989, #0
  static telaBase + #990, #0
  static telaBase + #991, #0
  static telaBase + #992, #0
  static telaBase + #993, #0
  static telaBase + #994, #0
  static telaBase + #995, #0
  static telaBase + #996, #0
  static telaBase + #997, #0
  static telaBase + #998, #0
  static telaBase + #999, #2

  ;Linha 25
  static telaBase + #1000, #2
  static telaBase + #1001, #0
  static telaBase + #1002, #0
  static telaBase + #1003, #0
  static telaBase + #1004, #0
  static telaBase + #1005, #0
  static telaBase + #1006, #0
  static telaBase + #1007, #0
  static telaBase + #1008, #0
  static telaBase + #1009, #0
  static telaBase + #1010, #0
  static telaBase + #1011, #0
  static telaBase + #1012, #0
  static telaBase + #1013, #0
  static telaBase + #1014, #0
  static telaBase + #1015, #0
  static telaBase + #1016, #0
  static telaBase + #1017, #0
  static telaBase + #1018, #0
  static telaBase + #1019, #0
  static telaBase + #1020, #0
  static telaBase + #1021, #0
  static telaBase + #1022, #0
  static telaBase + #1023, #0
  static telaBase + #1024, #0
  static telaBase + #1025, #0
  static telaBase + #1026, #0
  static telaBase + #1027, #0
  static telaBase + #1028, #0
  static telaBase + #1029, #0
  static telaBase + #1030, #0
  static telaBase + #1031, #0
  static telaBase + #1032, #0
  static telaBase + #1033, #0
  static telaBase + #1034, #0
  static telaBase + #1035, #0
  static telaBase + #1036, #0
  static telaBase + #1037, #0
  static telaBase + #1038, #0
  static telaBase + #1039, #2

  ;Linha 1
  static telaBase + #1040, #9
  static telaBase + #1041, #1
  static telaBase + #1042, #1
  static telaBase + #1043, #1
  static telaBase + #1044, #1
  static telaBase + #1045, #1
  static telaBase + #1046, #1
  static telaBase + #1047, #1
  static telaBase + #1048, #1
  static telaBase + #1049, #1
  static telaBase + #1050, #1
  static telaBase + #1051, #1
  static telaBase + #1052, #8
  static telaBase + #1053, #1
  static telaBase + #1054, #1
  static telaBase + #1055, #1
  static telaBase + #1056, #1
  static telaBase + #1057, #1
  static telaBase + #1058, #1
  static telaBase + #1059, #1
  static telaBase + #1060, #1
  static telaBase + #1061, #1
  static telaBase + #1062, #8
  static telaBase + #1063, #1
  static telaBase + #1064, #1
  static telaBase + #1065, #1
  static telaBase + #1066, #1
  static telaBase + #1067, #1
  static telaBase + #1068, #1
  static telaBase + #1069, #1
  static telaBase + #1070, #1
  static telaBase + #1071, #1
  static telaBase + #1072, #1
  static telaBase + #1073, #1
  static telaBase + #1074, #1
  static telaBase + #1075, #1
  static telaBase + #1076, #1
  static telaBase + #1077, #1
  static telaBase + #1078, #1
  static telaBase + #1079, #11

  ;Linha 27
  static telaBase + #1080, #2
  static telaBase + #1081, #0
  static telaBase + #1082, #0
  static telaBase + #1083, #0
  static telaBase + #1084, #0
  static telaBase + #1085, #0
  static telaBase + #1086, #0
  static telaBase + #1087, #0
  static telaBase + #1088, #0
  static telaBase + #1089, #0
  static telaBase + #1090, #0
  static telaBase + #1091, #0
  static telaBase + #1092, #2
  static telaBase + #1093, #0
  static telaBase + #1094, #0
  static telaBase + #1095, #0
  static telaBase + #1096, #0
  static telaBase + #1097, #0
  static telaBase + #1098, #0
  static telaBase + #1099, #0
  static telaBase + #1100, #0
  static telaBase + #1101, #0
  static telaBase + #1102, #2
  static telaBase + #1103, #0
  static telaBase + #1104, #0
  static telaBase + #1105, #0
  static telaBase + #1106, #0
  static telaBase + #1107, #0
  static telaBase + #1108, #0
  static telaBase + #1109, #0
  static telaBase + #1110, #0
  static telaBase + #1111, #0
  static telaBase + #1112, #0
  static telaBase + #1113, #0
  static telaBase + #1114, #0
  static telaBase + #1115, #0
  static telaBase + #1116, #0
  static telaBase + #1117, #0
  static telaBase + #1118, #0
  static telaBase + #1119, #2

  ;Linha 28
  static telaBase + #1120, #2
  static telaBase + #1121, #0
  static telaBase + #1122, #77
  static telaBase + #1123, #79
  static telaBase + #1124, #86
  static telaBase + #1125, #69
  static telaBase + #1126, #83
  static telaBase + #1127, #58
  static telaBase + #1128, #0
  static telaBase + #1129, #0
  static telaBase + #1130, #0
  static telaBase + #1131, #0
  static telaBase + #1132, #2
  static telaBase + #1133, #0
  static telaBase + #1134, #76
  static telaBase + #1135, #69
  static telaBase + #1136, #86
  static telaBase + #1137, #69
  static telaBase + #1138, #76
  static telaBase + #1139, #58
  static telaBase + #1140, #0
  static telaBase + #1141, #0
  static telaBase + #1142, #2
  static telaBase + #1143, #0
  static telaBase + #1144, #83
  static telaBase + #1145, #67
  static telaBase + #1146, #79
  static telaBase + #1147, #82
  static telaBase + #1148, #69
  static telaBase + #1149, #58
  static telaBase + #1150, #0
  static telaBase + #1151, #0
  static telaBase + #1152, #0
  static telaBase + #1153, #0
  static telaBase + #1154, #0
  static telaBase + #1155, #0
  static telaBase + #1156, #0
  static telaBase + #1157, #0
  static telaBase + #1158, #0
  static telaBase + #1159, #2

  ;Linha 29
  static telaBase + #1160, #2
  static telaBase + #1161, #0
  static telaBase + #1162, #0
  static telaBase + #1163, #0
  static telaBase + #1164, #0
  static telaBase + #1165, #0
  static telaBase + #1166, #0
  static telaBase + #1167, #0
  static telaBase + #1168, #0
  static telaBase + #1169, #0
  static telaBase + #1170, #0
  static telaBase + #1171, #0
  static telaBase + #1172, #2
  static telaBase + #1173, #0
  static telaBase + #1174, #0
  static telaBase + #1175, #0
  static telaBase + #1176, #0
  static telaBase + #1177, #0
  static telaBase + #1178, #0
  static telaBase + #1179, #0
  static telaBase + #1180, #0
  static telaBase + #1181, #0
  static telaBase + #1182, #2
  static telaBase + #1183, #0
  static telaBase + #1184, #0
  static telaBase + #1185, #99
  static telaBase + #1186, #97
  static telaBase + #1187, #115
  static telaBase + #1188, #104
  static telaBase + #1189, #58
  static telaBase + #1190, #0
  static telaBase + #1191, #0
  static telaBase + #1192, #0
  static telaBase + #1193, #0
  static telaBase + #1194, #0
  static telaBase + #1195, #0
  static telaBase + #1196, #0
  static telaBase + #1197, #0
  static telaBase + #1198, #0
  static telaBase + #1199, #2

lab1StartingPos : var #1
  static lab1StartingPos, #82



lab1 : var #1200
  ;Linha 0
  static lab1 + #0, #2572
  static lab1 + #1, #2561
  static lab1 + #2, #2561
  static lab1 + #3, #2561
  static lab1 + #4, #2568
  static lab1 + #5, #2561
  static lab1 + #6, #2561
  static lab1 + #7, #2561
  static lab1 + #8, #2561
  static lab1 + #9, #2561
  static lab1 + #10, #2561
  static lab1 + #11, #2561
  static lab1 + #12, #2561
  static lab1 + #13, #2561
  static lab1 + #14, #2561
  static lab1 + #15, #2561
  static lab1 + #16, #2561
  static lab1 + #17, #2561
  static lab1 + #18, #2561
  static lab1 + #19, #2561
  static lab1 + #20, #2561
  static lab1 + #21, #2568
  static lab1 + #22, #2561
  static lab1 + #23, #2561
  static lab1 + #24, #2561
  static lab1 + #25, #2561
  static lab1 + #26, #2561
  static lab1 + #27, #2561
  static lab1 + #28, #2561
  static lab1 + #29, #2561
  static lab1 + #30, #2561
  static lab1 + #31, #2568
  static lab1 + #32, #2561
  static lab1 + #33, #2561
  static lab1 + #34, #2561
  static lab1 + #35, #2561
  static lab1 + #36, #2561
  static lab1 + #37, #2561
  static lab1 + #38, #2561
  static lab1 + #39, #2565

  ;Linha 1
  static lab1 + #40, #2562
  static lab1 + #41, #2330
  static lab1 + #42, #3967
  static lab1 + #43, #3967
  static lab1 + #44, #2562
  static lab1 + #45, #0
  static lab1 + #46, #0
  static lab1 + #47, #0
  static lab1 + #48, #0
  static lab1 + #49, #0
  static lab1 + #50, #0
  static lab1 + #51, #0
  static lab1 + #52, #0
  static lab1 + #53, #0
  static lab1 + #54, #0
  static lab1 + #55, #0
  static lab1 + #56, #0
  static lab1 + #57, #0
  static lab1 + #58, #0
  static lab1 + #59, #0
  static lab1 + #60, #2852
  static lab1 + #61, #2562
  static lab1 + #62, #0
  static lab1 + #63, #0
  static lab1 + #64, #0
  static lab1 + #65, #0
  static lab1 + #66, #0
  static lab1 + #67, #0
  static lab1 + #68, #0
  static lab1 + #69, #0
  static lab1 + #70, #0
  static lab1 + #71, #2562
  static lab1 + #72, #0
  static lab1 + #73, #0
  static lab1 + #74, #0
  static lab1 + #75, #0
  static lab1 + #76, #0
  static lab1 + #77, #0
  static lab1 + #78, #0
  static lab1 + #79, #2562

  ;Linha 2
  static lab1 + #80, #2562
  static lab1 + #81, #0
  static lab1 + #82, #30
  static lab1 + #83, #3967
  static lab1 + #84, #2569
  static lab1 + #85, #2561
  static lab1 + #86, #0
  static lab1 + #87, #2561
  static lab1 + #88, #2561
  static lab1 + #89, #2561
  static lab1 + #90, #2561
  static lab1 + #91, #2568
  static lab1 + #92, #2561
  static lab1 + #93, #2561
  static lab1 + #94, #2561
  static lab1 + #95, #2561
  static lab1 + #96, #2561
  static lab1 + #97, #2561
  static lab1 + #98, #2561
  static lab1 + #99, #2568
  static lab1 + #100, #2561
  static lab1 + #101, #2566
  static lab1 + #102, #0
  static lab1 + #103, #2572
  static lab1 + #104, #2561
  static lab1 + #105, #2561
  static lab1 + #106, #2561
  static lab1 + #107, #2561
  static lab1 + #108, #0
  static lab1 + #109, #2562
  static lab1 + #110, #0
  static lab1 + #111, #2567
  static lab1 + #112, #2561
  static lab1 + #113, #2561
  static lab1 + #114, #2561
  static lab1 + #115, #2565
  static lab1 + #116, #0
  static lab1 + #117, #2562
  static lab1 + #118, #0
  static lab1 + #119, #2562

  ;Linha 3
  static lab1 + #120, #2562
  static lab1 + #121, #0
  static lab1 + #122, #3967
  static lab1 + #123, #3967
  static lab1 + #124, #2562
  static lab1 + #125, #0
  static lab1 + #126, #0
  static lab1 + #127, #0
  static lab1 + #128, #0
  static lab1 + #129, #0
  static lab1 + #130, #0
  static lab1 + #131, #2562
  static lab1 + #132, #0
  static lab1 + #133, #0
  static lab1 + #134, #0
  static lab1 + #135, #0
  static lab1 + #136, #0
  static lab1 + #137, #0
  static lab1 + #138, #0
  static lab1 + #139, #2562
  static lab1 + #140, #0
  static lab1 + #141, #0
  static lab1 + #142, #0
  static lab1 + #143, #2562
  static lab1 + #144, #0
  static lab1 + #145, #0
  static lab1 + #146, #0
  static lab1 + #147, #0
  static lab1 + #148, #0
  static lab1 + #149, #2562
  static lab1 + #150, #0
  static lab1 + #151, #0
  static lab1 + #152, #0
  static lab1 + #153, #0
  static lab1 + #154, #0
  static lab1 + #155, #2562
  static lab1 + #156, #0
  static lab1 + #157, #2562
  static lab1 + #158, #0
  static lab1 + #159, #2562

  ;Linha 4
  static lab1 + #160, #2569
  static lab1 + #161, #2561
  static lab1 + #162, #2328
  static lab1 + #163, #2561
  static lab1 + #164, #2566
  static lab1 + #165, #0
  static lab1 + #166, #2561
  static lab1 + #167, #2568
  static lab1 + #168, #2561
  static lab1 + #169, #2561
  static lab1 + #170, #0
  static lab1 + #171, #2562
  static lab1 + #172, #0
  static lab1 + #173, #2572
  static lab1 + #174, #2561
  static lab1 + #175, #2561
  static lab1 + #176, #2561
  static lab1 + #177, #2565
  static lab1 + #178, #0
  static lab1 + #179, #2562
  static lab1 + #180, #0
  static lab1 + #181, #2561
  static lab1 + #182, #2561
  static lab1 + #183, #2571
  static lab1 + #184, #0
  static lab1 + #185, #2572
  static lab1 + #186, #2561
  static lab1 + #187, #2568
  static lab1 + #188, #2561
  static lab1 + #189, #2570
  static lab1 + #190, #2561
  static lab1 + #191, #2561
  static lab1 + #192, #2561
  static lab1 + #193, #2561
  static lab1 + #194, #0
  static lab1 + #195, #2562
  static lab1 + #196, #0
  static lab1 + #197, #2562
  static lab1 + #198, #0
  static lab1 + #199, #2562

  ;Linha 5
  static lab1 + #200, #2562
  static lab1 + #201, #0
  static lab1 + #202, #0
  static lab1 + #203, #0
  static lab1 + #204, #0
  static lab1 + #205, #0
  static lab1 + #206, #0
  static lab1 + #207, #2562
  static lab1 + #208, #0
  static lab1 + #209, #0
  static lab1 + #210, #0
  static lab1 + #211, #2562
  static lab1 + #212, #0
  static lab1 + #213, #2562
  static lab1 + #214, #2844
  static lab1 + #215, #0
  static lab1 + #216, #0
  static lab1 + #217, #2562
  static lab1 + #218, #0
  static lab1 + #219, #2562
  static lab1 + #220, #0
  static lab1 + #221, #0
  static lab1 + #222, #0
  static lab1 + #223, #2562
  static lab1 + #224, #0
  static lab1 + #225, #2562
  static lab1 + #226, #2852
  static lab1 + #227, #2562
  static lab1 + #228, #0
  static lab1 + #229, #0
  static lab1 + #230, #0
  static lab1 + #231, #0
  static lab1 + #232, #0
  static lab1 + #233, #0
  static lab1 + #234, #0
  static lab1 + #235, #2562
  static lab1 + #236, #0
  static lab1 + #237, #2562
  static lab1 + #238, #0
  static lab1 + #239, #2562

  ;Linha 6
  static lab1 + #240, #2562
  static lab1 + #241, #0
  static lab1 + #242, #2572
  static lab1 + #243, #2561
  static lab1 + #244, #2561
  static lab1 + #245, #2561
  static lab1 + #246, #0
  static lab1 + #247, #2562
  static lab1 + #248, #0
  static lab1 + #249, #2561
  static lab1 + #250, #2561
  static lab1 + #251, #2566
  static lab1 + #252, #0
  static lab1 + #253, #2569
  static lab1 + #254, #2561
  static lab1 + #255, #2561
  static lab1 + #256, #0
  static lab1 + #257, #2562
  static lab1 + #258, #0
  static lab1 + #259, #2562
  static lab1 + #260, #0
  static lab1 + #261, #2572
  static lab1 + #262, #2561
  static lab1 + #263, #2566
  static lab1 + #264, #0
  static lab1 + #265, #2562
  static lab1 + #266, #0
  static lab1 + #267, #2562
  static lab1 + #268, #0
  static lab1 + #269, #2561
  static lab1 + #270, #2561
  static lab1 + #271, #2561
  static lab1 + #272, #2561
  static lab1 + #273, #2561
  static lab1 + #274, #2561
  static lab1 + #275, #2571
  static lab1 + #276, #0
  static lab1 + #277, #2562
  static lab1 + #278, #0
  static lab1 + #279, #2562

  ;Linha 7
  static lab1 + #280, #2562
  static lab1 + #281, #0
  static lab1 + #282, #2562
  static lab1 + #283, #0
  static lab1 + #284, #0
  static lab1 + #285, #0
  static lab1 + #286, #0
  static lab1 + #287, #2562
  static lab1 + #288, #0
  static lab1 + #289, #0
  static lab1 + #290, #0
  static lab1 + #291, #0
  static lab1 + #292, #0
  static lab1 + #293, #2562
  static lab1 + #294, #0
  static lab1 + #295, #0
  static lab1 + #296, #0
  static lab1 + #297, #2562
  static lab1 + #298, #0
  static lab1 + #299, #0
  static lab1 + #300, #0
  static lab1 + #301, #2562
  static lab1 + #302, #0
  static lab1 + #303, #0
  static lab1 + #304, #0
  static lab1 + #305, #2562
  static lab1 + #306, #0
  static lab1 + #307, #2562
  static lab1 + #308, #0
  static lab1 + #309, #0
  static lab1 + #310, #0
  static lab1 + #311, #0
  static lab1 + #312, #0
  static lab1 + #313, #0
  static lab1 + #314, #0
  static lab1 + #315, #2562
  static lab1 + #316, #0
  static lab1 + #317, #2562
  static lab1 + #318, #0
  static lab1 + #319, #2562

  ;Linha 8
  static lab1 + #320, #2562
  static lab1 + #321, #0
  static lab1 + #322, #2562
  static lab1 + #323, #0
  static lab1 + #324, #2572
  static lab1 + #325, #2565
  static lab1 + #326, #0
  static lab1 + #327, #2567
  static lab1 + #328, #2561
  static lab1 + #329, #2561
  static lab1 + #330, #2561
  static lab1 + #331, #2561
  static lab1 + #332, #2561
  static lab1 + #333, #2566
  static lab1 + #334, #0
  static lab1 + #335, #2562
  static lab1 + #336, #0
  static lab1 + #337, #1033
  static lab1 + #338, #1025
  static lab1 + #339, #1816
  static lab1 + #340, #1025
  static lab1 + #341, #1035
  static lab1 + #342, #0
  static lab1 + #343, #2572
  static lab1 + #344, #2561
  static lab1 + #345, #2566
  static lab1 + #346, #0
  static lab1 + #347, #2567
  static lab1 + #348, #2561
  static lab1 + #349, #2561
  static lab1 + #350, #2561
  static lab1 + #351, #2561
  static lab1 + #352, #2561
  static lab1 + #353, #2565
  static lab1 + #354, #0
  static lab1 + #355, #2567
  static lab1 + #356, #2561
  static lab1 + #357, #2571
  static lab1 + #358, #0
  static lab1 + #359, #2562

  ;Linha 9
  static lab1 + #360, #2569
  static lab1 + #361, #2840
  static lab1 + #362, #2570
  static lab1 + #363, #2561
  static lab1 + #364, #2570
  static lab1 + #365, #2571
  static lab1 + #366, #0
  static lab1 + #367, #0
  static lab1 + #368, #0
  static lab1 + #369, #0
  static lab1 + #370, #0
  static lab1 + #371, #0
  static lab1 + #372, #0
  static lab1 + #373, #0
  static lab1 + #374, #0
  static lab1 + #375, #2562
  static lab1 + #376, #0
  static lab1 + #377, #1026
  static lab1 + #378, #0
  static lab1 + #379, #0
  static lab1 + #380, #0
  static lab1 + #381, #1026
  static lab1 + #382, #0
  static lab1 + #383, #2562
  static lab1 + #384, #0
  static lab1 + #385, #0
  static lab1 + #386, #0
  static lab1 + #387, #0
  static lab1 + #388, #0
  static lab1 + #389, #0
  static lab1 + #390, #0
  static lab1 + #391, #0
  static lab1 + #392, #0
  static lab1 + #393, #2562
  static lab1 + #394, #0
  static lab1 + #395, #0
  static lab1 + #396, #0
  static lab1 + #397, #2562
  static lab1 + #398, #0
  static lab1 + #399, #2562

  ;Linha 10
  static lab1 + #400, #2562
  static lab1 + #401, #0
  static lab1 + #402, #0
  static lab1 + #403, #0
  static lab1 + #404, #0
  static lab1 + #405, #2569
  static lab1 + #406, #2561
  static lab1 + #407, #2561
  static lab1 + #408, #2561
  static lab1 + #409, #2561
  static lab1 + #410, #2561
  static lab1 + #411, #2568
  static lab1 + #412, #2561
  static lab1 + #413, #2561
  static lab1 + #414, #2561
  static lab1 + #415, #2566
  static lab1 + #416, #0
  static lab1 + #417, #23
  static lab1 + #418, #0
  static lab1 + #419, #3354
  static lab1 + #420, #0
  static lab1 + #421, #1026
  static lab1 + #422, #0
  static lab1 + #423, #2567
  static lab1 + #424, #2561
  static lab1 + #425, #2565
  static lab1 + #426, #0
  static lab1 + #427, #2562
  static lab1 + #428, #0
  static lab1 + #429, #2561
  static lab1 + #430, #2561
  static lab1 + #431, #2561
  static lab1 + #432, #2561
  static lab1 + #433, #2563
  static lab1 + #434, #2561
  static lab1 + #435, #2561
  static lab1 + #436, #0
  static lab1 + #437, #2562
  static lab1 + #438, #0
  static lab1 + #439, #2562

  ;Linha 11
  static lab1 + #440, #2562
  static lab1 + #441, #0
  static lab1 + #442, #2572
  static lab1 + #443, #2565
  static lab1 + #444, #0
  static lab1 + #445, #2562
  static lab1 + #446, #0
  static lab1 + #447, #0
  static lab1 + #448, #0
  static lab1 + #449, #0
  static lab1 + #450, #0
  static lab1 + #451, #2562
  static lab1 + #452, #0
  static lab1 + #453, #0
  static lab1 + #454, #0
  static lab1 + #455, #0
  static lab1 + #456, #0
  static lab1 + #457, #1026
  static lab1 + #458, #0
  static lab1 + #459, #0
  static lab1 + #460, #0
  static lab1 + #461, #1026
  static lab1 + #462, #0
  static lab1 + #463, #0
  static lab1 + #464, #0
  static lab1 + #465, #2562
  static lab1 + #466, #0
  static lab1 + #467, #2562
  static lab1 + #468, #0
  static lab1 + #469, #0
  static lab1 + #470, #0
  static lab1 + #471, #0
  static lab1 + #472, #0
  static lab1 + #473, #2562
  static lab1 + #474, #0
  static lab1 + #475, #0
  static lab1 + #476, #0
  static lab1 + #477, #2562
  static lab1 + #478, #0
  static lab1 + #479, #2562

  ;Linha 12
  static lab1 + #480, #2562
  static lab1 + #481, #0
  static lab1 + #482, #2567
  static lab1 + #483, #2571
  static lab1 + #484, #0
  static lab1 + #485, #2562
  static lab1 + #486, #0
  static lab1 + #487, #2572
  static lab1 + #488, #2561
  static lab1 + #489, #2561
  static lab1 + #490, #0
  static lab1 + #491, #2562
  static lab1 + #492, #0
  static lab1 + #493, #2572
  static lab1 + #494, #2561
  static lab1 + #495, #2561
  static lab1 + #496, #2561
  static lab1 + #497, #1034
  static lab1 + #498, #1025
  static lab1 + #499, #1816
  static lab1 + #500, #1025
  static lab1 + #501, #1027
  static lab1 + #502, #2561
  static lab1 + #503, #2561
  static lab1 + #504, #0
  static lab1 + #505, #2562
  static lab1 + #506, #0
  static lab1 + #507, #2567
  static lab1 + #508, #2561
  static lab1 + #509, #2561
  static lab1 + #510, #2561
  static lab1 + #511, #2565
  static lab1 + #512, #0
  static lab1 + #513, #2562
  static lab1 + #514, #0
  static lab1 + #515, #2561
  static lab1 + #516, #2561
  static lab1 + #517, #2566
  static lab1 + #518, #0
  static lab1 + #519, #2562

  ;Linha 13
  static lab1 + #520, #2562
  static lab1 + #521, #0
  static lab1 + #522, #0
  static lab1 + #523, #2562
  static lab1 + #524, #0
  static lab1 + #525, #2562
  static lab1 + #526, #0
  static lab1 + #527, #2562
  static lab1 + #528, #0
  static lab1 + #529, #0
  static lab1 + #530, #0
  static lab1 + #531, #2562
  static lab1 + #532, #0
  static lab1 + #533, #2562
  static lab1 + #534, #2852
  static lab1 + #535, #0
  static lab1 + #536, #0
  static lab1 + #537, #0
  static lab1 + #538, #0
  static lab1 + #539, #0
  static lab1 + #540, #0
  static lab1 + #541, #2562
  static lab1 + #542, #0
  static lab1 + #543, #0
  static lab1 + #544, #0
  static lab1 + #545, #2562
  static lab1 + #546, #0
  static lab1 + #547, #0
  static lab1 + #548, #0
  static lab1 + #549, #0
  static lab1 + #550, #0
  static lab1 + #551, #2562
  static lab1 + #552, #0
  static lab1 + #553, #0
  static lab1 + #554, #0
  static lab1 + #555, #0
  static lab1 + #556, #0
  static lab1 + #557, #0
  static lab1 + #558, #0
  static lab1 + #559, #2562

  ;Linha 14
  static lab1 + #560, #2569
  static lab1 + #561, #2561
  static lab1 + #562, #0
  static lab1 + #563, #2562
  static lab1 + #564, #0
  static lab1 + #565, #2562
  static lab1 + #566, #0
  static lab1 + #567, #2562
  static lab1 + #568, #0
  static lab1 + #569, #2561
  static lab1 + #570, #2561
  static lab1 + #571, #2571
  static lab1 + #572, #0
  static lab1 + #573, #2567
  static lab1 + #574, #2561
  static lab1 + #575, #2561
  static lab1 + #576, #2561
  static lab1 + #577, #2565
  static lab1 + #578, #0
  static lab1 + #579, #2562
  static lab1 + #580, #0
  static lab1 + #581, #2562
  static lab1 + #582, #0
  static lab1 + #583, #2561
  static lab1 + #584, #2561
  static lab1 + #585, #2570
  static lab1 + #586, #2561
  static lab1 + #587, #2561
  static lab1 + #588, #2561
  static lab1 + #589, #2568
  static lab1 + #590, #2561
  static lab1 + #591, #2570
  static lab1 + #592, #2561
  static lab1 + #593, #2561
  static lab1 + #594, #3352
  static lab1 + #595, #2568
  static lab1 + #596, #2561
  static lab1 + #597, #2561
  static lab1 + #598, #0
  static lab1 + #599, #2562

  ;Linha 15
  static lab1 + #600, #2562
  static lab1 + #601, #0
  static lab1 + #602, #0
  static lab1 + #603, #2562
  static lab1 + #604, #0
  static lab1 + #605, #0
  static lab1 + #606, #0
  static lab1 + #607, #2562
  static lab1 + #608, #0
  static lab1 + #609, #0
  static lab1 + #610, #2852
  static lab1 + #611, #2562
  static lab1 + #612, #0
  static lab1 + #613, #0
  static lab1 + #614, #0
  static lab1 + #615, #0
  static lab1 + #616, #0
  static lab1 + #617, #2562
  static lab1 + #618, #0
  static lab1 + #619, #2562
  static lab1 + #620, #0
  static lab1 + #621, #2562
  static lab1 + #622, #0
  static lab1 + #623, #0
  static lab1 + #624, #0
  static lab1 + #625, #0
  static lab1 + #626, #0
  static lab1 + #627, #0
  static lab1 + #628, #0
  static lab1 + #629, #2562
  static lab1 + #630, #0
  static lab1 + #631, #0
  static lab1 + #632, #0
  static lab1 + #633, #0
  static lab1 + #634, #0
  static lab1 + #635, #2562
  static lab1 + #636, #1820
  static lab1 + #637, #0
  static lab1 + #638, #0
  static lab1 + #639, #2562

  ;Linha 16
  static lab1 + #640, #2562
  static lab1 + #641, #0
  static lab1 + #642, #2572
  static lab1 + #643, #2566
  static lab1 + #644, #0
  static lab1 + #645, #2572
  static lab1 + #646, #2561
  static lab1 + #647, #2570
  static lab1 + #648, #2561
  static lab1 + #649, #2561
  static lab1 + #650, #2561
  static lab1 + #651, #2570
  static lab1 + #652, #2561
  static lab1 + #653, #2561
  static lab1 + #654, #2561
  static lab1 + #655, #2565
  static lab1 + #656, #0
  static lab1 + #657, #2567
  static lab1 + #658, #2561
  static lab1 + #659, #2566
  static lab1 + #660, #0
  static lab1 + #661, #2569
  static lab1 + #662, #2561
  static lab1 + #663, #2568
  static lab1 + #664, #2561
  static lab1 + #665, #2561
  static lab1 + #666, #2561
  static lab1 + #667, #2565
  static lab1 + #668, #0
  static lab1 + #669, #2562
  static lab1 + #670, #0
  static lab1 + #671, #2561
  static lab1 + #672, #2561
  static lab1 + #673, #2565
  static lab1 + #674, #0
  static lab1 + #675, #2567
  static lab1 + #676, #2561
  static lab1 + #677, #2561
  static lab1 + #678, #2561
  static lab1 + #679, #2571

  ;Linha 17
  static lab1 + #680, #2562
  static lab1 + #681, #0
  static lab1 + #682, #2562
  static lab1 + #683, #0
  static lab1 + #684, #0
  static lab1 + #685, #2562
  static lab1 + #686, #0
  static lab1 + #687, #0
  static lab1 + #688, #0
  static lab1 + #689, #0
  static lab1 + #690, #0
  static lab1 + #691, #0
  static lab1 + #692, #0
  static lab1 + #693, #0
  static lab1 + #694, #0
  static lab1 + #695, #2562
  static lab1 + #696, #0
  static lab1 + #697, #0
  static lab1 + #698, #0
  static lab1 + #699, #0
  static lab1 + #700, #0
  static lab1 + #701, #2562
  static lab1 + #702, #0
  static lab1 + #703, #2562
  static lab1 + #704, #0
  static lab1 + #705, #0
  static lab1 + #706, #0
  static lab1 + #707, #2562
  static lab1 + #708, #0
  static lab1 + #709, #2562
  static lab1 + #710, #0
  static lab1 + #711, #0
  static lab1 + #712, #0
  static lab1 + #713, #2562
  static lab1 + #714, #0
  static lab1 + #715, #0
  static lab1 + #716, #0
  static lab1 + #717, #0
  static lab1 + #718, #0
  static lab1 + #719, #2562

  ;Linha 18
  static lab1 + #720, #2562
  static lab1 + #721, #0
  static lab1 + #722, #2569
  static lab1 + #723, #2561
  static lab1 + #724, #2561
  static lab1 + #725, #2566
  static lab1 + #726, #0
  static lab1 + #727, #2572
  static lab1 + #728, #2561
  static lab1 + #729, #2565
  static lab1 + #730, #0
  static lab1 + #731, #2561
  static lab1 + #732, #2561
  static lab1 + #733, #2565
  static lab1 + #734, #0
  static lab1 + #735, #2567
  static lab1 + #736, #2561
  static lab1 + #737, #2568
  static lab1 + #738, #2561
  static lab1 + #739, #2561
  static lab1 + #740, #0
  static lab1 + #741, #2562
  static lab1 + #742, #0
  static lab1 + #743, #2562
  static lab1 + #744, #0
  static lab1 + #745, #2562
  static lab1 + #746, #0
  static lab1 + #747, #2562
  static lab1 + #748, #0
  static lab1 + #749, #2567
  static lab1 + #750, #2561
  static lab1 + #751, #2565
  static lab1 + #752, #0
  static lab1 + #753, #2567
  static lab1 + #754, #2561
  static lab1 + #755, #2561
  static lab1 + #756, #2561
  static lab1 + #757, #2565
  static lab1 + #758, #0
  static lab1 + #759, #2562

  ;Linha 19
  static lab1 + #760, #2562
  static lab1 + #761, #0
  static lab1 + #762, #2562
  static lab1 + #763, #0
  static lab1 + #764, #0
  static lab1 + #765, #0
  static lab1 + #766, #0
  static lab1 + #767, #2562
  static lab1 + #768, #0
  static lab1 + #769, #2562
  static lab1 + #770, #0
  static lab1 + #771, #0
  static lab1 + #772, #0
  static lab1 + #773, #2562
  static lab1 + #774, #0
  static lab1 + #775, #0
  static lab1 + #776, #2852
  static lab1 + #777, #2562
  static lab1 + #778, #0
  static lab1 + #779, #0
  static lab1 + #780, #0
  static lab1 + #781, #0
  static lab1 + #782, #0
  static lab1 + #783, #3351
  static lab1 + #784, #0
  static lab1 + #785, #2562
  static lab1 + #786, #0
  static lab1 + #787, #2562
  static lab1 + #788, #0
  static lab1 + #789, #0
  static lab1 + #790, #0
  static lab1 + #791, #2562
  static lab1 + #792, #0
  static lab1 + #793, #0
  static lab1 + #794, #0
  static lab1 + #795, #0
  static lab1 + #796, #0
  static lab1 + #797, #2562
  static lab1 + #798, #0
  static lab1 + #799, #2562

  ;Linha 20
  static lab1 + #800, #2562
  static lab1 + #801, #0
  static lab1 + #802, #2562
  static lab1 + #803, #0
  static lab1 + #804, #2561
  static lab1 + #805, #2561
  static lab1 + #806, #2561
  static lab1 + #807, #2566
  static lab1 + #808, #0
  static lab1 + #809, #2567
  static lab1 + #810, #2561
  static lab1 + #811, #2565
  static lab1 + #812, #0
  static lab1 + #813, #2567
  static lab1 + #814, #2561
  static lab1 + #815, #2561
  static lab1 + #816, #2561
  static lab1 + #817, #2571
  static lab1 + #818, #0
  static lab1 + #819, #2572
  static lab1 + #820, #2561
  static lab1 + #821, #2568
  static lab1 + #822, #2561
  static lab1 + #823, #2566
  static lab1 + #824, #0
  static lab1 + #825, #2562
  static lab1 + #826, #0
  static lab1 + #827, #2567
  static lab1 + #828, #2561
  static lab1 + #829, #2561
  static lab1 + #830, #0
  static lab1 + #831, #2567
  static lab1 + #832, #2561
  static lab1 + #833, #2568
  static lab1 + #834, #2561
  static lab1 + #835, #2561
  static lab1 + #836, #0
  static lab1 + #837, #2562
  static lab1 + #838, #0
  static lab1 + #839, #2562

  ;Linha 21
  static lab1 + #840, #2562
  static lab1 + #841, #0
  static lab1 + #842, #0
  static lab1 + #843, #0
  static lab1 + #844, #0
  static lab1 + #845, #0
  static lab1 + #846, #0
  static lab1 + #847, #0
  static lab1 + #848, #0
  static lab1 + #849, #0
  static lab1 + #850, #0
  static lab1 + #851, #2562
  static lab1 + #852, #0
  static lab1 + #853, #0
  static lab1 + #854, #0
  static lab1 + #855, #0
  static lab1 + #856, #0
  static lab1 + #857, #2562
  static lab1 + #858, #0
  static lab1 + #859, #2562
  static lab1 + #860, #0
  static lab1 + #861, #2562
  static lab1 + #862, #0
  static lab1 + #863, #0
  static lab1 + #864, #0
  static lab1 + #865, #2562
  static lab1 + #866, #0
  static lab1 + #867, #0
  static lab1 + #868, #0
  static lab1 + #869, #0
  static lab1 + #870, #0
  static lab1 + #871, #0
  static lab1 + #872, #0
  static lab1 + #873, #2562
  static lab1 + #874, #0
  static lab1 + #875, #0
  static lab1 + #876, #0
  static lab1 + #877, #0
  static lab1 + #878, #0
  static lab1 + #879, #2562

  ;Linha 22
  static lab1 + #880, #2569
  static lab1 + #881, #2817
  static lab1 + #882, #2817
  static lab1 + #883, #2817
  static lab1 + #884, #3967
  static lab1 + #885, #2817
  static lab1 + #886, #2817
  static lab1 + #887, #2824
  static lab1 + #888, #2561
  static lab1 + #889, #2561
  static lab1 + #890, #0
  static lab1 + #891, #2569
  static lab1 + #892, #2561
  static lab1 + #893, #2561
  static lab1 + #894, #2561
  static lab1 + #895, #2565
  static lab1 + #896, #0
  static lab1 + #897, #2562
  static lab1 + #898, #0
  static lab1 + #899, #2562
  static lab1 + #900, #0
  static lab1 + #901, #2562
  static lab1 + #902, #0
  static lab1 + #903, #2561
  static lab1 + #904, #2561
  static lab1 + #905, #2563
  static lab1 + #906, #2561
  static lab1 + #907, #2561
  static lab1 + #908, #2561
  static lab1 + #909, #2561
  static lab1 + #910, #2561
  static lab1 + #911, #2565
  static lab1 + #912, #0
  static lab1 + #913, #2562
  static lab1 + #914, #0
  static lab1 + #915, #2572
  static lab1 + #916, #2561
  static lab1 + #917, #3352
  static lab1 + #918, #2561
  static lab1 + #919, #2571

  ;Linha 23
  static lab1 + #920, #2562
  static lab1 + #921, #0
  static lab1 + #922, #0
  static lab1 + #923, #0
  static lab1 + #924, #0
  static lab1 + #925, #0
  static lab1 + #926, #0
  static lab1 + #927, #2818
  static lab1 + #928, #0
  static lab1 + #929, #0
  static lab1 + #930, #0
  static lab1 + #931, #2562
  static lab1 + #932, #0
  static lab1 + #933, #0
  static lab1 + #934, #0
  static lab1 + #935, #2562
  static lab1 + #936, #0
  static lab1 + #937, #0
  static lab1 + #938, #0
  static lab1 + #939, #2562
  static lab1 + #940, #0
  static lab1 + #941, #2562
  static lab1 + #942, #0
  static lab1 + #943, #0
  static lab1 + #944, #0
  static lab1 + #945, #2562
  static lab1 + #946, #0
  static lab1 + #947, #0
  static lab1 + #948, #0
  static lab1 + #949, #0
  static lab1 + #950, #0
  static lab1 + #951, #2562
  static lab1 + #952, #2852
  static lab1 + #953, #2562
  static lab1 + #954, #0
  static lab1 + #955, #2562
  static lab1 + #956, #0
  static lab1 + #957, #0
  static lab1 + #958, #0
  static lab1 + #959, #2562

  ;Linha 24
  static lab1 + #960, #2562
  static lab1 + #961, #0
  static lab1 + #962, #2837
  static lab1 + #963, #2836
  static lab1 + #964, #2838
  static lab1 + #965, #0
  static lab1 + #966, #0
  static lab1 + #967, #2818
  static lab1 + #968, #0
  static lab1 + #969, #2561
  static lab1 + #970, #2561
  static lab1 + #971, #2570
  static lab1 + #972, #2561
  static lab1 + #973, #2561
  static lab1 + #974, #0
  static lab1 + #975, #2567
  static lab1 + #976, #2561
  static lab1 + #977, #2561
  static lab1 + #978, #2561
  static lab1 + #979, #2566
  static lab1 + #980, #0
  static lab1 + #981, #2567
  static lab1 + #982, #2561
  static lab1 + #983, #2565
  static lab1 + #984, #0
  static lab1 + #985, #2562
  static lab1 + #986, #0
  static lab1 + #987, #2561
  static lab1 + #988, #2561
  static lab1 + #989, #2565
  static lab1 + #990, #0
  static lab1 + #991, #2567
  static lab1 + #992, #2561
  static lab1 + #993, #2566
  static lab1 + #994, #0
  static lab1 + #995, #3351
  static lab1 + #996, #0
  static lab1 + #997, #2073
  static lab1 + #998, #0
  static lab1 + #999, #2562

  ;Linha 25
  static lab1 + #1000, #2562
  static lab1 + #1001, #0
  static lab1 + #1002, #2940
  static lab1 + #1003, #2852
  static lab1 + #1004, #2940
  static lab1 + #1005, #0
  static lab1 + #1006, #0
  static lab1 + #1007, #2818
  static lab1 + #1008, #0
  static lab1 + #1009, #0
  static lab1 + #1010, #0
  static lab1 + #1011, #0
  static lab1 + #1012, #0
  static lab1 + #1013, #0
  static lab1 + #1014, #0
  static lab1 + #1015, #0
  static lab1 + #1016, #0
  static lab1 + #1017, #0
  static lab1 + #1018, #0
  static lab1 + #1019, #0
  static lab1 + #1020, #0
  static lab1 + #1021, #0
  static lab1 + #1022, #0
  static lab1 + #1023, #2562
  static lab1 + #1024, #0
  static lab1 + #1025, #0
  static lab1 + #1026, #0
  static lab1 + #1027, #0
  static lab1 + #1028, #0
  static lab1 + #1029, #2562
  static lab1 + #1030, #0
  static lab1 + #1031, #0
  static lab1 + #1032, #0
  static lab1 + #1033, #0
  static lab1 + #1034, #0
  static lab1 + #1035, #2562
  static lab1 + #1036, #0
  static lab1 + #1037, #0
  static lab1 + #1038, #0
  static lab1 + #1039, #2562

  ;Linha 26
  static lab1 + #1040, #2569
  static lab1 + #1041, #2561
  static lab1 + #1042, #2561
  static lab1 + #1043, #2561
  static lab1 + #1044, #2561
  static lab1 + #1045, #2561
  static lab1 + #1046, #2561
  static lab1 + #1047, #2570
  static lab1 + #1048, #2561
  static lab1 + #1049, #2561
  static lab1 + #1050, #2561
  static lab1 + #1051, #2561
  static lab1 + #1052, #2568
  static lab1 + #1053, #2561
  static lab1 + #1054, #2561
  static lab1 + #1055, #2561
  static lab1 + #1056, #2561
  static lab1 + #1057, #2561
  static lab1 + #1058, #2561
  static lab1 + #1059, #2561
  static lab1 + #1060, #2561
  static lab1 + #1061, #2561
  static lab1 + #1062, #2568
  static lab1 + #1063, #2570
  static lab1 + #1064, #2561
  static lab1 + #1065, #2561
  static lab1 + #1066, #2561
  static lab1 + #1067, #2561
  static lab1 + #1068, #2561
  static lab1 + #1069, #2570
  static lab1 + #1070, #2561
  static lab1 + #1071, #2561
  static lab1 + #1072, #2561
  static lab1 + #1073, #2561
  static lab1 + #1074, #2561
  static lab1 + #1075, #2570
  static lab1 + #1076, #2561
  static lab1 + #1077, #2561
  static lab1 + #1078, #2561
  static lab1 + #1079, #2571

  ;Linha 27
  static lab1 + #1080, #0
  static lab1 + #1081, #0
  static lab1 + #1082, #0
  static lab1 + #1083, #0
  static lab1 + #1084, #0
  static lab1 + #1085, #0
  static lab1 + #1086, #0
  static lab1 + #1087, #0
  static lab1 + #1088, #0
  static lab1 + #1089, #0
  static lab1 + #1090, #0
  static lab1 + #1091, #0
  static lab1 + #1092, #0
  static lab1 + #1093, #0
  static lab1 + #1094, #0
  static lab1 + #1095, #0
  static lab1 + #1096, #0
  static lab1 + #1097, #0
  static lab1 + #1098, #0
  static lab1 + #1099, #0
  static lab1 + #1100, #0
  static lab1 + #1101, #0
  static lab1 + #1102, #0
  static lab1 + #1103, #0
  static lab1 + #1104, #0
  static lab1 + #1105, #0
  static lab1 + #1106, #0
  static lab1 + #1107, #0
  static lab1 + #1108, #0
  static lab1 + #1109, #0
  static lab1 + #1110, #0
  static lab1 + #1111, #0
  static lab1 + #1112, #0
  static lab1 + #1113, #0
  static lab1 + #1114, #0
  static lab1 + #1115, #0
  static lab1 + #1116, #0
  static lab1 + #1117, #0
  static lab1 + #1118, #0
  static lab1 + #1119, #0

  ;Linha 28
  static lab1 + #1120, #0
  static lab1 + #1121, #0
  static lab1 + #1122, #0
  static lab1 + #1123, #0
  static lab1 + #1124, #0
  static lab1 + #1125, #0
  static lab1 + #1126, #0
  static lab1 + #1127, #0
  static lab1 + #1128, #0
  static lab1 + #1129, #0
  static lab1 + #1130, #0
  static lab1 + #1131, #0
  static lab1 + #1132, #0
  static lab1 + #1133, #0
  static lab1 + #1134, #0
  static lab1 + #1135, #0
  static lab1 + #1136, #0
  static lab1 + #1137, #0
  static lab1 + #1138, #0
  static lab1 + #1139, #0
  static lab1 + #1140, #0
  static lab1 + #1141, #0
  static lab1 + #1142, #0
  static lab1 + #1143, #0
  static lab1 + #1144, #0
  static lab1 + #1145, #0
  static lab1 + #1146, #0
  static lab1 + #1147, #0
  static lab1 + #1148, #0
  static lab1 + #1149, #0
  static lab1 + #1150, #0
  static lab1 + #1151, #0
  static lab1 + #1152, #0
  static lab1 + #1153, #0
  static lab1 + #1154, #0
  static lab1 + #1155, #0
  static lab1 + #1156, #0
  static lab1 + #1157, #0
  static lab1 + #1158, #0
  static lab1 + #1159, #0

  ;Linha 29
  static lab1 + #1160, #0
  static lab1 + #1161, #0
  static lab1 + #1162, #0
  static lab1 + #1163, #0
  static lab1 + #1164, #0
  static lab1 + #1165, #0
  static lab1 + #1166, #0
  static lab1 + #1167, #0
  static lab1 + #1168, #0
  static lab1 + #1169, #0
  static lab1 + #1170, #0
  static lab1 + #1171, #0
  static lab1 + #1172, #0
  static lab1 + #1173, #0
  static lab1 + #1174, #0
  static lab1 + #1175, #0
  static lab1 + #1176, #0
  static lab1 + #1177, #0
  static lab1 + #1178, #0
  static lab1 + #1179, #0
  static lab1 + #1180, #0
  static lab1 + #1181, #0
  static lab1 + #1182, #0
  static lab1 + #1183, #0
  static lab1 + #1184, #0
  static lab1 + #1185, #0
  static lab1 + #1186, #0
  static lab1 + #1187, #0
  static lab1 + #1188, #0
  static lab1 + #1189, #0
  static lab1 + #1190, #0
  static lab1 + #1191, #0
  static lab1 + #1192, #0
  static lab1 + #1193, #0
  static lab1 + #1194, #0
  static lab1 + #1195, #0
  static lab1 + #1196, #0
  static lab1 + #1197, #0
  static lab1 + #1198, #0
  static lab1 + #1199, #0

lab2StartingPos : var #1
  static lab2StartingPos, #30

lab2 : var #1200
  ;Linha 0
  static lab2 + #0, #2060
  static lab2 + #1, #2049
  static lab2 + #2, #2049
  static lab2 + #3, #2049
  static lab2 + #4, #2056
  static lab2 + #5, #2049
  static lab2 + #6, #2049
  static lab2 + #7, #2049
  static lab2 + #8, #2049
  static lab2 + #9, #2049
  static lab2 + #10, #2049
  static lab2 + #11, #2056
  static lab2 + #12, #2049
  static lab2 + #13, #2049
  static lab2 + #14, #2049
  static lab2 + #15, #2049
  static lab2 + #16, #2049
  static lab2 + #17, #2056
  static lab2 + #18, #2049
  static lab2 + #19, #2049
  static lab2 + #20, #2049
  static lab2 + #21, #2049
  static lab2 + #22, #2049
  static lab2 + #23, #2056
  static lab2 + #24, #2049
  static lab2 + #25, #2049
  static lab2 + #26, #2049
  static lab2 + #27, #2049
  static lab2 + #28, #2049
  static lab2 + #29, #2049
  static lab2 + #30, #2049
  static lab2 + #31, #2049
  static lab2 + #32, #2049
  static lab2 + #33, #2056
  static lab2 + #34, #2049
  static lab2 + #35, #2049
  static lab2 + #36, #2049
  static lab2 + #37, #2049
  static lab2 + #38, #2049
  static lab2 + #39, #2053

  ;Linha 1
  static lab2 + #40, #2050
  static lab2 + #41, #0
  static lab2 + #42, #0
  static lab2 + #43, #0
  static lab2 + #44, #2050
  static lab2 + #45, #0
  static lab2 + #46, #0
  static lab2 + #47, #0
  static lab2 + #48, #0
  static lab2 + #49, #0
  static lab2 + #50, #0
  static lab2 + #51, #2050
  static lab2 + #52, #0
  static lab2 + #53, #0
  static lab2 + #54, #0
  static lab2 + #55, #0
  static lab2 + #56, #0
  static lab2 + #57, #2050
  static lab2 + #58, #0
  static lab2 + #59, #0
  static lab2 + #60, #0
  static lab2 + #61, #0
  static lab2 + #62, #0
  static lab2 + #63, #2050
  static lab2 + #64, #0
  static lab2 + #65, #0
  static lab2 + #66, #0
  static lab2 + #67, #0
  static lab2 + #68, #0
  static lab2 + #69, #0
  static lab2 + #70, #0
  static lab2 + #71, #0
  static lab2 + #72, #0
  static lab2 + #73, #2050
  static lab2 + #74, #0
  static lab2 + #75, #0
  static lab2 + #76, #0
  static lab2 + #77, #0
  static lab2 + #78, #0
  static lab2 + #79, #2050

  ;Linha 2
  static lab2 + #80, #2050
  static lab2 + #81, #0
  static lab2 + #82, #2329
  static lab2 + #83, #0
  static lab2 + #84, #2327
  static lab2 + #85, #0
  static lab2 + #86, #2049
  static lab2 + #87, #2056
  static lab2 + #88, #2049
  static lab2 + #89, #2053
  static lab2 + #90, #0
  static lab2 + #91, #2055
  static lab2 + #92, #2049
  static lab2 + #93, #2049
  static lab2 + #94, #0
  static lab2 + #95, #2050
  static lab2 + #96, #0
  static lab2 + #97, #2055
  static lab2 + #98, #2049
  static lab2 + #99, #2053
  static lab2 + #100, #0
  static lab2 + #101, #2050
  static lab2 + #102, #0
  static lab2 + #103, #2050
  static lab2 + #104, #0
  static lab2 + #105, #2060
  static lab2 + #106, #2049
  static lab2 + #107, #2049
  static lab2 + #108, #2049
  static lab2 + #109, #2049
  static lab2 + #110, #2049
  static lab2 + #111, #2053
  static lab2 + #112, #0
  static lab2 + #113, #2050
  static lab2 + #114, #0
  static lab2 + #115, #2050
  static lab2 + #116, #0
  static lab2 + #117, #2050
  static lab2 + #118, #0
  static lab2 + #119, #2050

  ;Linha 3
  static lab2 + #120, #2050
  static lab2 + #121, #0
  static lab2 + #122, #0
  static lab2 + #123, #0
  static lab2 + #124, #2050
  static lab2 + #125, #0
  static lab2 + #126, #0
  static lab2 + #127, #2050
  static lab2 + #128, #0
  static lab2 + #129, #2050
  static lab2 + #130, #0
  static lab2 + #131, #0
  static lab2 + #132, #0
  static lab2 + #133, #0
  static lab2 + #134, #0
  static lab2 + #135, #2050
  static lab2 + #136, #0
  static lab2 + #137, #0
  static lab2 + #138, #0
  static lab2 + #139, #2050
  static lab2 + #140, #0
  static lab2 + #141, #2050
  static lab2 + #142, #2852
  static lab2 + #143, #2050
  static lab2 + #144, #0
  static lab2 + #145, #2050
  static lab2 + #146, #0
  static lab2 + #147, #0
  static lab2 + #148, #0
  static lab2 + #149, #0
  static lab2 + #150, #0
  static lab2 + #151, #2050
  static lab2 + #152, #0
  static lab2 + #153, #0
  static lab2 + #154, #0
  static lab2 + #155, #2050
  static lab2 + #156, #0
  static lab2 + #157, #2050
  static lab2 + #158, #1564
  static lab2 + #159, #2050

  ;Linha 4
  static lab2 + #160, #2057
  static lab2 + #161, #2049
  static lab2 + #162, #2328
  static lab2 + #163, #2049
  static lab2 + #164, #2054
  static lab2 + #165, #0
  static lab2 + #166, #2049
  static lab2 + #167, #2059
  static lab2 + #168, #0
  static lab2 + #169, #2055
  static lab2 + #170, #2049
  static lab2 + #171, #2049
  static lab2 + #172, #2049
  static lab2 + #173, #2049
  static lab2 + #174, #2049
  static lab2 + #175, #2051
  static lab2 + #176, #2049
  static lab2 + #177, #2049
  static lab2 + #178, #0
  static lab2 + #179, #2050
  static lab2 + #180, #0
  static lab2 + #181, #2055
  static lab2 + #182, #2049
  static lab2 + #183, #2059
  static lab2 + #184, #0
  static lab2 + #185, #2050
  static lab2 + #186, #0
  static lab2 + #187, #0
  static lab2 + #188, #1306
  static lab2 + #189, #0
  static lab2 + #190, #0
  static lab2 + #191, #2057
  static lab2 + #192, #2049
  static lab2 + #193, #2049
  static lab2 + #194, #2049
  static lab2 + #195, #2059
  static lab2 + #196, #0
  static lab2 + #197, #2055
  static lab2 + #198, #2049
  static lab2 + #199, #2059

  ;Linha 5
  static lab2 + #200, #2050
  static lab2 + #201, #0
  static lab2 + #202, #0
  static lab2 + #203, #0
  static lab2 + #204, #0
  static lab2 + #205, #0
  static lab2 + #206, #0
  static lab2 + #207, #2327
  static lab2 + #208, #0
  static lab2 + #209, #0
  static lab2 + #210, #0
  static lab2 + #211, #0
  static lab2 + #212, #0
  static lab2 + #213, #0
  static lab2 + #214, #0
  static lab2 + #215, #2050
  static lab2 + #216, #0
  static lab2 + #217, #0
  static lab2 + #218, #0
  static lab2 + #219, #2050
  static lab2 + #220, #0
  static lab2 + #221, #0
  static lab2 + #222, #0
  static lab2 + #223, #2050
  static lab2 + #224, #0
  static lab2 + #225, #2050
  static lab2 + #226, #0
  static lab2 + #227, #0
  static lab2 + #228, #0
  static lab2 + #229, #0
  static lab2 + #230, #0
  static lab2 + #231, #2050
  static lab2 + #232, #0
  static lab2 + #233, #0
  static lab2 + #234, #0
  static lab2 + #235, #2050
  static lab2 + #236, #0
  static lab2 + #237, #0
  static lab2 + #238, #0
  static lab2 + #239, #2050

  ;Linha 6
  static lab2 + #240, #2050
  static lab2 + #241, #0
  static lab2 + #242, #2050
  static lab2 + #243, #0
  static lab2 + #244, #0
  static lab2 + #245, #2049
  static lab2 + #246, #2049
  static lab2 + #247, #2058
  static lab2 + #248, #2049
  static lab2 + #249, #2053
  static lab2 + #250, #0
  static lab2 + #251, #2049
  static lab2 + #252, #2049
  static lab2 + #253, #2053
  static lab2 + #254, #0
  static lab2 + #255, #2050
  static lab2 + #256, #0
  static lab2 + #257, #2060
  static lab2 + #258, #2049
  static lab2 + #259, #2054
  static lab2 + #260, #0
  static lab2 + #261, #2050
  static lab2 + #262, #0
  static lab2 + #263, #2050
  static lab2 + #264, #0
  static lab2 + #265, #2057
  static lab2 + #266, #2049
  static lab2 + #267, #2049
  static lab2 + #268, #1560
  static lab2 + #269, #2053
  static lab2 + #270, #0
  static lab2 + #271, #2050
  static lab2 + #272, #0
  static lab2 + #273, #2050
  static lab2 + #274, #0
  static lab2 + #275, #2055
  static lab2 + #276, #2049
  static lab2 + #277, #2049
  static lab2 + #278, #0
  static lab2 + #279, #2050

  ;Linha 7
  static lab2 + #280, #2050
  static lab2 + #281, #0
  static lab2 + #282, #2050
  static lab2 + #283, #0
  static lab2 + #284, #0
  static lab2 + #285, #0
  static lab2 + #286, #0
  static lab2 + #287, #0
  static lab2 + #288, #0
  static lab2 + #289, #2050
  static lab2 + #290, #0
  static lab2 + #291, #0
  static lab2 + #292, #0
  static lab2 + #293, #2050
  static lab2 + #294, #0
  static lab2 + #295, #2050
  static lab2 + #296, #0
  static lab2 + #297, #2050
  static lab2 + #298, #0
  static lab2 + #299, #0
  static lab2 + #300, #0
  static lab2 + #301, #2050
  static lab2 + #302, #0
  static lab2 + #303, #2050
  static lab2 + #304, #0
  static lab2 + #305, #2050
  static lab2 + #306, #0
  static lab2 + #307, #0
  static lab2 + #308, #0
  static lab2 + #309, #2050
  static lab2 + #310, #0
  static lab2 + #311, #2050
  static lab2 + #312, #0
  static lab2 + #313, #2050
  static lab2 + #314, #0
  static lab2 + #315, #0
  static lab2 + #316, #0
  static lab2 + #317, #0
  static lab2 + #318, #0
  static lab2 + #319, #2050

  ;Linha 8
  static lab2 + #320, #2050
  static lab2 + #321, #0
  static lab2 + #322, #2055
  static lab2 + #323, #2049
  static lab2 + #324, #2049
  static lab2 + #325, #2049
  static lab2 + #326, #2049
  static lab2 + #327, #2053
  static lab2 + #328, #0
  static lab2 + #329, #2055
  static lab2 + #330, #2049
  static lab2 + #331, #2053
  static lab2 + #332, #0
  static lab2 + #333, #2050
  static lab2 + #334, #0
  static lab2 + #335, #2050
  static lab2 + #336, #0
  static lab2 + #337, #2050
  static lab2 + #338, #0
  static lab2 + #339, #2060
  static lab2 + #340, #2049
  static lab2 + #341, #2054
  static lab2 + #342, #0
  static lab2 + #343, #2050
  static lab2 + #344, #0
  static lab2 + #345, #2050
  static lab2 + #346, #0
  static lab2 + #347, #2050
  static lab2 + #348, #0
  static lab2 + #349, #2057
  static lab2 + #350, #2049
  static lab2 + #351, #2054
  static lab2 + #352, #0
  static lab2 + #353, #2057
  static lab2 + #354, #2049
  static lab2 + #355, #2049
  static lab2 + #356, #2049
  static lab2 + #357, #2053
  static lab2 + #358, #0
  static lab2 + #359, #2050

  ;Linha 9
  static lab2 + #360, #2050
  static lab2 + #361, #0
  static lab2 + #362, #0
  static lab2 + #363, #0
  static lab2 + #364, #0
  static lab2 + #365, #0
  static lab2 + #366, #0
  static lab2 + #367, #2050
  static lab2 + #368, #0
  static lab2 + #369, #0
  static lab2 + #370, #0
  static lab2 + #371, #2050
  static lab2 + #372, #0
  static lab2 + #373, #2050
  static lab2 + #374, #0
  static lab2 + #375, #0
  static lab2 + #376, #0
  static lab2 + #377, #2050
  static lab2 + #378, #2852
  static lab2 + #379, #2050
  static lab2 + #380, #0
  static lab2 + #381, #0
  static lab2 + #382, #0
  static lab2 + #383, #2050
  static lab2 + #384, #0
  static lab2 + #385, #0
  static lab2 + #386, #0
  static lab2 + #387, #2050
  static lab2 + #388, #0
  static lab2 + #389, #2050
  static lab2 + #390, #0
  static lab2 + #391, #0
  static lab2 + #392, #0
  static lab2 + #393, #2050
  static lab2 + #394, #2852
  static lab2 + #395, #0
  static lab2 + #396, #0
  static lab2 + #397, #2050
  static lab2 + #398, #0
  static lab2 + #399, #2050

  ;Linha 10
  static lab2 + #400, #2057
  static lab2 + #401, #2049
  static lab2 + #402, #2049
  static lab2 + #403, #2049
  static lab2 + #404, #2049
  static lab2 + #405, #2053
  static lab2 + #406, #0
  static lab2 + #407, #2055
  static lab2 + #408, #2049
  static lab2 + #409, #2049
  static lab2 + #410, #0
  static lab2 + #411, #2050
  static lab2 + #412, #0
  static lab2 + #413, #2055
  static lab2 + #414, #2049
  static lab2 + #415, #2049
  static lab2 + #416, #2049
  static lab2 + #417, #2058
  static lab2 + #418, #2049
  static lab2 + #419, #2059
  static lab2 + #420, #0
  static lab2 + #421, #2049
  static lab2 + #422, #2049
  static lab2 + #423, #2051
  static lab2 + #424, #2049
  static lab2 + #425, #2049
  static lab2 + #426, #2049
  static lab2 + #427, #2054
  static lab2 + #428, #0
  static lab2 + #429, #1559
  static lab2 + #430, #0
  static lab2 + #431, #2049
  static lab2 + #432, #2049
  static lab2 + #433, #2058
  static lab2 + #434, #2049
  static lab2 + #435, #2053
  static lab2 + #436, #0
  static lab2 + #437, #2050
  static lab2 + #438, #0
  static lab2 + #439, #2050

  ;Linha 11
  static lab2 + #440, #2050
  static lab2 + #441, #0
  static lab2 + #442, #0
  static lab2 + #443, #0
  static lab2 + #444, #2852
  static lab2 + #445, #2050
  static lab2 + #446, #0
  static lab2 + #447, #0
  static lab2 + #448, #0
  static lab2 + #449, #0
  static lab2 + #450, #0
  static lab2 + #451, #2050
  static lab2 + #452, #0
  static lab2 + #453, #0
  static lab2 + #454, #0
  static lab2 + #455, #0
  static lab2 + #456, #0
  static lab2 + #457, #0
  static lab2 + #458, #0
  static lab2 + #459, #2327
  static lab2 + #460, #0
  static lab2 + #461, #0
  static lab2 + #462, #0
  static lab2 + #463, #2050
  static lab2 + #464, #0
  static lab2 + #465, #0
  static lab2 + #466, #0
  static lab2 + #467, #0
  static lab2 + #468, #0
  static lab2 + #469, #2050
  static lab2 + #470, #0
  static lab2 + #471, #0
  static lab2 + #472, #0
  static lab2 + #473, #0
  static lab2 + #474, #0
  static lab2 + #475, #2050
  static lab2 + #476, #0
  static lab2 + #477, #0
  static lab2 + #478, #0
  static lab2 + #479, #2050

  ;Linha 12
  static lab2 + #480, #2050
  static lab2 + #481, #0
  static lab2 + #482, #2049
  static lab2 + #483, #2049
  static lab2 + #484, #2049
  static lab2 + #485, #2051
  static lab2 + #486, #2049
  static lab2 + #487, #2049
  static lab2 + #488, #2049
  static lab2 + #489, #2049
  static lab2 + #490, #2049
  static lab2 + #491, #2058
  static lab2 + #492, #2049
  static lab2 + #493, #2049
  static lab2 + #494, #2049
  static lab2 + #495, #2056
  static lab2 + #496, #2049
  static lab2 + #497, #2049
  static lab2 + #498, #0
  static lab2 + #499, #2050
  static lab2 + #500, #0
  static lab2 + #501, #2050
  static lab2 + #502, #0
  static lab2 + #503, #2050
  static lab2 + #504, #0
  static lab2 + #505, #2060
  static lab2 + #506, #2049
  static lab2 + #507, #2049
  static lab2 + #508, #2049
  static lab2 + #509, #2051
  static lab2 + #510, #2049
  static lab2 + #511, #2049
  static lab2 + #512, #2049
  static lab2 + #513, #2049
  static lab2 + #514, #0
  static lab2 + #515, #2057
  static lab2 + #516, #2049
  static lab2 + #517, #2049
  static lab2 + #518, #2049
  static lab2 + #519, #2059

  ;Linha 13
  static lab2 + #520, #2050
  static lab2 + #521, #0
  static lab2 + #522, #0
  static lab2 + #523, #0
  static lab2 + #524, #0
  static lab2 + #525, #2050
  static lab2 + #526, #0
  static lab2 + #527, #0
  static lab2 + #528, #0
  static lab2 + #529, #0
  static lab2 + #530, #0
  static lab2 + #531, #0
  static lab2 + #532, #0
  static lab2 + #533, #0
  static lab2 + #534, #0
  static lab2 + #535, #2050
  static lab2 + #536, #0
  static lab2 + #537, #0
  static lab2 + #538, #0
  static lab2 + #539, #2050
  static lab2 + #540, #0
  static lab2 + #541, #2050
  static lab2 + #542, #0
  static lab2 + #543, #0
  static lab2 + #544, #0
  static lab2 + #545, #2050
  static lab2 + #546, #0
  static lab2 + #547, #0
  static lab2 + #548, #0
  static lab2 + #549, #2050
  static lab2 + #550, #0
  static lab2 + #551, #0
  static lab2 + #552, #0
  static lab2 + #553, #0
  static lab2 + #554, #0
  static lab2 + #555, #2050
  static lab2 + #556, #0
  static lab2 + #557, #0
  static lab2 + #558, #0
  static lab2 + #559, #2050

  ;Linha 14
  static lab2 + #560, #2057
  static lab2 + #561, #2049
  static lab2 + #562, #2049
  static lab2 + #563, #2049
  static lab2 + #564, #0
  static lab2 + #565, #2050
  static lab2 + #566, #0
  static lab2 + #567, #2330
  static lab2 + #568, #0
  static lab2 + #569, #0
  static lab2 + #570, #2060
  static lab2 + #571, #2049
  static lab2 + #572, #2049
  static lab2 + #573, #2053
  static lab2 + #574, #0
  static lab2 + #575, #2050
  static lab2 + #576, #0
  static lab2 + #577, #2049
  static lab2 + #578, #2049
  static lab2 + #579, #2059
  static lab2 + #580, #0
  static lab2 + #581, #2055
  static lab2 + #582, #2049
  static lab2 + #583, #2049
  static lab2 + #584, #2049
  static lab2 + #585, #2059
  static lab2 + #586, #0
  static lab2 + #587, #2050
  static lab2 + #588, #0
  static lab2 + #589, #2050
  static lab2 + #590, #0
  static lab2 + #591, #2060
  static lab2 + #592, #2049
  static lab2 + #593, #2049
  static lab2 + #594, #2049
  static lab2 + #595, #2054
  static lab2 + #596, #0
  static lab2 + #597, #2050
  static lab2 + #598, #0
  static lab2 + #599, #2050

  ;Linha 15
  static lab2 + #600, #2050
  static lab2 + #601, #0
  static lab2 + #602, #0
  static lab2 + #603, #0
  static lab2 + #604, #0
  static lab2 + #605, #2050
  static lab2 + #606, #0
  static lab2 + #607, #0
  static lab2 + #608, #0
  static lab2 + #609, #0
  static lab2 + #610, #1303
  static lab2 + #611, #0
  static lab2 + #612, #0
  static lab2 + #613, #2050
  static lab2 + #614, #0
  static lab2 + #615, #2050
  static lab2 + #616, #0
  static lab2 + #617, #0
  static lab2 + #618, #0
  static lab2 + #619, #2050
  static lab2 + #620, #0
  static lab2 + #621, #0
  static lab2 + #622, #0
  static lab2 + #623, #0
  static lab2 + #624, #0
  static lab2 + #625, #2050
  static lab2 + #626, #0
  static lab2 + #627, #2050
  static lab2 + #628, #0
  static lab2 + #629, #0
  static lab2 + #630, #0
  static lab2 + #631, #2050
  static lab2 + #632, #0
  static lab2 + #633, #0
  static lab2 + #634, #0
  static lab2 + #635, #0
  static lab2 + #636, #0
  static lab2 + #637, #2050
  static lab2 + #638, #0
  static lab2 + #639, #2050

  ;Linha 16
  static lab2 + #640, #2050
  static lab2 + #641, #0
  static lab2 + #642, #2049
  static lab2 + #643, #2049
  static lab2 + #644, #2049
  static lab2 + #645, #2058
  static lab2 + #646, #2049
  static lab2 + #647, #2056
  static lab2 + #648, #1304
  static lab2 + #649, #2049
  static lab2 + #650, #2058
  static lab2 + #651, #2053
  static lab2 + #652, #0
  static lab2 + #653, #2050
  static lab2 + #654, #0
  static lab2 + #655, #2055
  static lab2 + #656, #2049
  static lab2 + #657, #2053
  static lab2 + #658, #0
  static lab2 + #659, #2057
  static lab2 + #660, #2049
  static lab2 + #661, #2049
  static lab2 + #662, #2049
  static lab2 + #663, #2049
  static lab2 + #664, #0
  static lab2 + #665, #2050
  static lab2 + #666, #0
  static lab2 + #667, #2055
  static lab2 + #668, #2049
  static lab2 + #669, #2049
  static lab2 + #670, #2049
  static lab2 + #671, #2054
  static lab2 + #672, #0
  static lab2 + #673, #2060
  static lab2 + #674, #2049
  static lab2 + #675, #2049
  static lab2 + #676, #2049
  static lab2 + #677, #2059
  static lab2 + #678, #0
  static lab2 + #679, #2050

  ;Linha 17
  static lab2 + #680, #2050
  static lab2 + #681, #0
  static lab2 + #682, #0
  static lab2 + #683, #0
  static lab2 + #684, #0
  static lab2 + #685, #0
  static lab2 + #686, #0
  static lab2 + #687, #2050
  static lab2 + #688, #0
  static lab2 + #689, #0
  static lab2 + #690, #0
  static lab2 + #691, #2050
  static lab2 + #692, #0
  static lab2 + #693, #2050
  static lab2 + #694, #0
  static lab2 + #695, #0
  static lab2 + #696, #2852
  static lab2 + #697, #2050
  static lab2 + #698, #0
  static lab2 + #699, #2050
  static lab2 + #700, #0
  static lab2 + #701, #0
  static lab2 + #702, #0
  static lab2 + #703, #0
  static lab2 + #704, #0
  static lab2 + #705, #2050
  static lab2 + #706, #0
  static lab2 + #707, #0
  static lab2 + #708, #0
  static lab2 + #709, #0
  static lab2 + #710, #0
  static lab2 + #711, #0
  static lab2 + #712, #0
  static lab2 + #713, #2050
  static lab2 + #714, #0
  static lab2 + #715, #0
  static lab2 + #716, #0
  static lab2 + #717, #2050
  static lab2 + #718, #0
  static lab2 + #719, #2050

  ;Linha 18
  static lab2 + #720, #2050
  static lab2 + #721, #0
  static lab2 + #722, #2050
  static lab2 + #723, #0
  static lab2 + #724, #2049
  static lab2 + #725, #2049
  static lab2 + #726, #2049
  static lab2 + #727, #2058
  static lab2 + #728, #2049
  static lab2 + #729, #2049
  static lab2 + #730, #0
  static lab2 + #731, #2050
  static lab2 + #732, #0
  static lab2 + #733, #2055
  static lab2 + #734, #2049
  static lab2 + #735, #2056
  static lab2 + #736, #2049
  static lab2 + #737, #2054
  static lab2 + #738, #0
  static lab2 + #739, #2057
  static lab2 + #740, #2049
  static lab2 + #741, #2049
  static lab2 + #742, #2049
  static lab2 + #743, #2053
  static lab2 + #744, #0
  static lab2 + #745, #2055
  static lab2 + #746, #2049
  static lab2 + #747, #2056
  static lab2 + #748, #2049
  static lab2 + #749, #2049
  static lab2 + #750, #2049
  static lab2 + #751, #2049
  static lab2 + #752, #2049
  static lab2 + #753, #2059
  static lab2 + #754, #0
  static lab2 + #755, #2050
  static lab2 + #756, #0
  static lab2 + #757, #2050
  static lab2 + #758, #0
  static lab2 + #759, #2050

  ;Linha 19
  static lab2 + #760, #2050
  static lab2 + #761, #0
  static lab2 + #762, #2050
  static lab2 + #763, #0
  static lab2 + #764, #0
  static lab2 + #765, #0
  static lab2 + #766, #0
  static lab2 + #767, #0
  static lab2 + #768, #0
  static lab2 + #769, #0
  static lab2 + #770, #0
  static lab2 + #771, #2050
  static lab2 + #772, #0
  static lab2 + #773, #0
  static lab2 + #774, #0
  static lab2 + #775, #2050
  static lab2 + #776, #0
  static lab2 + #777, #0
  static lab2 + #778, #0
  static lab2 + #779, #2050
  static lab2 + #780, #0
  static lab2 + #781, #0
  static lab2 + #782, #0
  static lab2 + #783, #2050
  static lab2 + #784, #0
  static lab2 + #785, #0
  static lab2 + #786, #0
  static lab2 + #787, #2050
  static lab2 + #788, #0
  static lab2 + #789, #0
  static lab2 + #790, #0
  static lab2 + #791, #0
  static lab2 + #792, #0
  static lab2 + #793, #2050
  static lab2 + #794, #0
  static lab2 + #795, #2050
  static lab2 + #796, #0
  static lab2 + #797, #0
  static lab2 + #798, #0
  static lab2 + #799, #2050

  ;Linha 20
  static lab2 + #800, #2050
  static lab2 + #801, #0
  static lab2 + #802, #2057
  static lab2 + #803, #2049
  static lab2 + #804, #2049
  static lab2 + #805, #2049
  static lab2 + #806, #2049
  static lab2 + #807, #2049
  static lab2 + #808, #2049
  static lab2 + #809, #2053
  static lab2 + #810, #0
  static lab2 + #811, #2055
  static lab2 + #812, #2049
  static lab2 + #813, #2049
  static lab2 + #814, #0
  static lab2 + #815, #2050
  static lab2 + #816, #0
  static lab2 + #817, #2060
  static lab2 + #818, #2049
  static lab2 + #819, #2054
  static lab2 + #820, #0
  static lab2 + #821, #2050
  static lab2 + #822, #0
  static lab2 + #823, #2057
  static lab2 + #824, #2049
  static lab2 + #825, #2049
  static lab2 + #826, #0
  static lab2 + #827, #2327
  static lab2 + #828, #0
  static lab2 + #829, #2060
  static lab2 + #830, #2049
  static lab2 + #831, #2049
  static lab2 + #832, #0
  static lab2 + #833, #0
  static lab2 + #834, #0
  static lab2 + #835, #2055
  static lab2 + #836, #2049
  static lab2 + #837, #2049
  static lab2 + #838, #2049
  static lab2 + #839, #2059

  ;Linha 21
  static lab2 + #840, #2050
  static lab2 + #841, #0
  static lab2 + #842, #2050
  static lab2 + #843, #0
  static lab2 + #844, #0
  static lab2 + #845, #0
  static lab2 + #846, #0
  static lab2 + #847, #0
  static lab2 + #848, #2852
  static lab2 + #849, #2050
  static lab2 + #850, #0
  static lab2 + #851, #0
  static lab2 + #852, #0
  static lab2 + #853, #0
  static lab2 + #854, #0
  static lab2 + #855, #2050
  static lab2 + #856, #0
  static lab2 + #857, #2050
  static lab2 + #858, #0
  static lab2 + #859, #0
  static lab2 + #860, #0
  static lab2 + #861, #2050
  static lab2 + #862, #0
  static lab2 + #863, #2050
  static lab2 + #864, #0
  static lab2 + #865, #0
  static lab2 + #866, #0
  static lab2 + #867, #2050
  static lab2 + #868, #0
  static lab2 + #869, #2050
  static lab2 + #870, #0
  static lab2 + #871, #0
  static lab2 + #872, #0
  static lab2 + #873, #2050
  static lab2 + #874, #0
  static lab2 + #875, #0
  static lab2 + #876, #0
  static lab2 + #877, #0
  static lab2 + #878, #0
  static lab2 + #879, #2050

  ;Linha 22
  static lab2 + #880, #2050
  static lab2 + #881, #0
  static lab2 + #882, #2050
  static lab2 + #883, #0
  static lab2 + #884, #2060
  static lab2 + #885, #2049
  static lab2 + #886, #2049
  static lab2 + #887, #2049
  static lab2 + #888, #2049
  static lab2 + #889, #2054
  static lab2 + #890, #0
  static lab2 + #891, #2060
  static lab2 + #892, #2049
  static lab2 + #893, #2049
  static lab2 + #894, #2049
  static lab2 + #895, #2054
  static lab2 + #896, #0
  static lab2 + #897, #2057
  static lab2 + #898, #2049
  static lab2 + #899, #2049
  static lab2 + #900, #0
  static lab2 + #901, #2050
  static lab2 + #902, #0
  static lab2 + #903, #2055
  static lab2 + #904, #2049
  static lab2 + #905, #2049
  static lab2 + #906, #2049
  static lab2 + #907, #2054
  static lab2 + #908, #0
  static lab2 + #909, #2050
  static lab2 + #910, #0
  static lab2 + #911, #2049
  static lab2 + #912, #2049
  static lab2 + #913, #2058
  static lab2 + #914, #2049
  static lab2 + #915, #2056
  static lab2 + #916, #2049
  static lab2 + #917, #24
  static lab2 + #918, #2049
  static lab2 + #919, #2059

  ;Linha 23
  static lab2 + #920, #2050
  static lab2 + #921, #0
  static lab2 + #922, #0
  static lab2 + #923, #0
  static lab2 + #924, #2050
  static lab2 + #925, #0
  static lab2 + #926, #0
  static lab2 + #927, #0
  static lab2 + #928, #0
  static lab2 + #929, #0
  static lab2 + #930, #0
  static lab2 + #931, #2050
  static lab2 + #932, #0
  static lab2 + #933, #0
  static lab2 + #934, #0
  static lab2 + #935, #0
  static lab2 + #936, #0
  static lab2 + #937, #2050
  static lab2 + #938, #0
  static lab2 + #939, #0
  static lab2 + #940, #0
  static lab2 + #941, #2050
  static lab2 + #942, #0
  static lab2 + #943, #0
  static lab2 + #944, #0
  static lab2 + #945, #0
  static lab2 + #946, #0
  static lab2 + #947, #0
  static lab2 + #948, #0
  static lab2 + #949, #2050
  static lab2 + #950, #0
  static lab2 + #951, #0
  static lab2 + #952, #0
  static lab2 + #953, #0
  static lab2 + #954, #0
  static lab2 + #955, #2050
  static lab2 + #956, #0
  static lab2 + #957, #0
  static lab2 + #958, #0
  static lab2 + #959, #2050

  ;Linha 24
  static lab2 + #960, #2057
  static lab2 + #961, #2049
  static lab2 + #962, #2049
  static lab2 + #963, #0
  static lab2 + #964, #2050
  static lab2 + #965, #0
  static lab2 + #966, #2049
  static lab2 + #967, #2049
  static lab2 + #968, #2049
  static lab2 + #969, #2049
  static lab2 + #970, #2049
  static lab2 + #971, #2054
  static lab2 + #972, #0
  static lab2 + #973, #2049
  static lab2 + #974, #2049
  static lab2 + #975, #2049
  static lab2 + #976, #2049
  static lab2 + #977, #2054
  static lab2 + #978, #0
  static lab2 + #979, #2060
  static lab2 + #980, #2049
  static lab2 + #981, #2058
  static lab2 + #982, #2049
  static lab2 + #983, #2049
  static lab2 + #984, #2049
  static lab2 + #985, #2049
  static lab2 + #986, #2049
  static lab2 + #987, #2049
  static lab2 + #988, #2049
  static lab2 + #989, #2058
  static lab2 + #990, #2049
  static lab2 + #991, #2049
  static lab2 + #992, #2049
  static lab2 + #993, #2049
  static lab2 + #994, #0
  static lab2 + #995, #2050
  static lab2 + #996, #0
  static lab2 + #997, #30
  static lab2 + #998, #0
  static lab2 + #999, #2050

  ;Linha 25
  static lab2 + #1000, #2050
  static lab2 + #1001, #0
  static lab2 + #1002, #0
  static lab2 + #1003, #0
  static lab2 + #1004, #2050
  static lab2 + #1005, #0
  static lab2 + #1006, #0
  static lab2 + #1007, #0
  static lab2 + #1008, #0
  static lab2 + #1009, #0
  static lab2 + #1010, #0
  static lab2 + #1011, #0
  static lab2 + #1012, #0
  static lab2 + #1013, #0
  static lab2 + #1014, #0
  static lab2 + #1015, #0
  static lab2 + #1016, #0
  static lab2 + #1017, #0
  static lab2 + #1018, #0
  static lab2 + #1019, #2050
  static lab2 + #1020, #2852
  static lab2 + #1021, #0
  static lab2 + #1022, #0
  static lab2 + #1023, #0
  static lab2 + #1024, #0
  static lab2 + #1025, #0
  static lab2 + #1026, #0
  static lab2 + #1027, #0
  static lab2 + #1028, #0
  static lab2 + #1029, #0
  static lab2 + #1030, #0
  static lab2 + #1031, #0
  static lab2 + #1032, #0
  static lab2 + #1033, #0
  static lab2 + #1034, #0
  static lab2 + #1035, #2050
  static lab2 + #1036, #0
  static lab2 + #1037, #0
  static lab2 + #1038, #26
  static lab2 + #1039, #2050

  ;Linha 26
  static lab2 + #1040, #2057
  static lab2 + #1041, #2049
  static lab2 + #1042, #2049
  static lab2 + #1043, #2049
  static lab2 + #1044, #2058
  static lab2 + #1045, #2049
  static lab2 + #1046, #2049
  static lab2 + #1047, #2049
  static lab2 + #1048, #2049
  static lab2 + #1049, #2049
  static lab2 + #1050, #2049
  static lab2 + #1051, #2049
  static lab2 + #1052, #2049
  static lab2 + #1053, #2049
  static lab2 + #1054, #2049
  static lab2 + #1055, #2049
  static lab2 + #1056, #2049
  static lab2 + #1057, #2049
  static lab2 + #1058, #2049
  static lab2 + #1059, #2058
  static lab2 + #1060, #2049
  static lab2 + #1061, #2049
  static lab2 + #1062, #2049
  static lab2 + #1063, #2049
  static lab2 + #1064, #2049
  static lab2 + #1065, #2049
  static lab2 + #1066, #2049
  static lab2 + #1067, #2049
  static lab2 + #1068, #2049
  static lab2 + #1069, #2049
  static lab2 + #1070, #2049
  static lab2 + #1071, #2049
  static lab2 + #1072, #2049
  static lab2 + #1073, #2049
  static lab2 + #1074, #2049
  static lab2 + #1075, #2058
  static lab2 + #1076, #2049
  static lab2 + #1077, #2049
  static lab2 + #1078, #2049
  static lab2 + #1079, #2059

  ;Linha 27
  static lab2 + #1080, #0
  static lab2 + #1081, #0
  static lab2 + #1082, #0
  static lab2 + #1083, #0
  static lab2 + #1084, #0
  static lab2 + #1085, #0
  static lab2 + #1086, #0
  static lab2 + #1087, #0
  static lab2 + #1088, #0
  static lab2 + #1089, #0
  static lab2 + #1090, #0
  static lab2 + #1091, #0
  static lab2 + #1092, #0
  static lab2 + #1093, #0
  static lab2 + #1094, #0
  static lab2 + #1095, #0
  static lab2 + #1096, #0
  static lab2 + #1097, #0
  static lab2 + #1098, #0
  static lab2 + #1099, #0
  static lab2 + #1100, #0
  static lab2 + #1101, #0
  static lab2 + #1102, #0
  static lab2 + #1103, #0
  static lab2 + #1104, #0
  static lab2 + #1105, #0
  static lab2 + #1106, #0
  static lab2 + #1107, #0
  static lab2 + #1108, #0
  static lab2 + #1109, #0
  static lab2 + #1110, #0
  static lab2 + #1111, #0
  static lab2 + #1112, #0
  static lab2 + #1113, #0
  static lab2 + #1114, #0
  static lab2 + #1115, #0
  static lab2 + #1116, #0
  static lab2 + #1117, #0
  static lab2 + #1118, #0
  static lab2 + #1119, #0

  ;Linha 28
  static lab2 + #1120, #0
  static lab2 + #1121, #0
  static lab2 + #1122, #0
  static lab2 + #1123, #0
  static lab2 + #1124, #0
  static lab2 + #1125, #0
  static lab2 + #1126, #0
  static lab2 + #1127, #0
  static lab2 + #1128, #0
  static lab2 + #1129, #0
  static lab2 + #1130, #0
  static lab2 + #1131, #0
  static lab2 + #1132, #0
  static lab2 + #1133, #0
  static lab2 + #1134, #0
  static lab2 + #1135, #0
  static lab2 + #1136, #0
  static lab2 + #1137, #0
  static lab2 + #1138, #0
  static lab2 + #1139, #0
  static lab2 + #1140, #0
  static lab2 + #1141, #0
  static lab2 + #1142, #0
  static lab2 + #1143, #0
  static lab2 + #1144, #0
  static lab2 + #1145, #0
  static lab2 + #1146, #0
  static lab2 + #1147, #0
  static lab2 + #1148, #0
  static lab2 + #1149, #0
  static lab2 + #1150, #0
  static lab2 + #1151, #0
  static lab2 + #1152, #0
  static lab2 + #1153, #0
  static lab2 + #1154, #0
  static lab2 + #1155, #0
  static lab2 + #1156, #0
  static lab2 + #1157, #0
  static lab2 + #1158, #0
  static lab2 + #1159, #0

  ;Linha 29
  static lab2 + #1160, #0
  static lab2 + #1161, #0
  static lab2 + #1162, #0
  static lab2 + #1163, #0
  static lab2 + #1164, #0
  static lab2 + #1165, #0
  static lab2 + #1166, #0
  static lab2 + #1167, #0
  static lab2 + #1168, #0
  static lab2 + #1169, #0
  static lab2 + #1170, #0
  static lab2 + #1171, #0
  static lab2 + #1172, #0
  static lab2 + #1173, #0
  static lab2 + #1174, #0
  static lab2 + #1175, #0
  static lab2 + #1176, #0
  static lab2 + #1177, #0
  static lab2 + #1178, #0
  static lab2 + #1179, #0
  static lab2 + #1180, #0
  static lab2 + #1181, #0
  static lab2 + #1182, #0
  static lab2 + #1183, #0
  static lab2 + #1184, #0
  static lab2 + #1185, #0
  static lab2 + #1186, #0
  static lab2 + #1187, #0
  static lab2 + #1188, #0
  static lab2 + #1189, #0
  static lab2 + #1190, #0
  static lab2 + #1191, #0
  static lab2 + #1192, #0
  static lab2 + #1193, #0
  static lab2 + #1194, #0
  static lab2 + #1195, #0
  static lab2 + #1196, #0
  static lab2 + #1197, #0
  static lab2 + #1198, #0
  static lab2 + #1199, #0

; ------------

; r0 = any position
; r1 = character to print
; r2 = player position
; r3-r7 = general usage

main:
  call printCurrentScreen
	loadn r0, #31
	loadn r1, #390
	loadn r2, #0
	outchar r0, r1
	jmp move

move:
	inchar r3
	loadn r4, #255
	cmp r3, r4
	jeq move

	loadn r4, #'w'
	cmp r3, r4
	jeq move_up

	loadn r4, #'s'
	cmp r3, r4
	jeq move_down

	loadn r4, #'a'
	cmp r3, r4
	jeq move_left

	loadn r4, #'d'
	cmp r3, r4
	jeq move_right

	jmp move

	; r3 = steps needed to move, r4 = new pos

	move_up:
		loadn r3, #40
		cmp r1, r3
		jle move
		sub r4, r1, r3
		call move_checkColision
    loadn r2, #map
    add r2, r2, r1
    loadi r2, r2
		outchar r2, r1
		mov r1, r4
		outchar r0, r1
		jmp move

	move_down:
		loadn r3, #40
		loadn r4, #1199
		sub r4, r4, r1
		cmp r3, r4
		jgr move
		add r4, r1, r3
		call move_checkColision
    loadn r2, #map
    add r2, r2, r1
    loadi r2, r2
		outchar r2, r1
		mov r1, r4
		outchar r0, r1
		jmp move

	move_left:
		loadn r3, #40
		mod r4, r1, r3
		loadn r3, #0
		cmp r4, r3
		jeq move
		mov r4, r1
		dec r4
		call move_checkColision
    loadn r2, #map
    add r2, r2, r1
    loadi r2, r2
		outchar r2, r1
		mov r1, r4
		outchar r0, r1
		jmp move

	move_right:
		loadn r3, #40
		mod r4, r1, r3
		loadn r3, #39
		cmp r3, r4
		jeq move
		mov r4, r1
		inc r4
		call move_checkColision
    loadn r2, #map
    add r2, r2, r1
    loadi r2, r2
		outchar r2, r1
		mov r1, r4
		outchar r0, r1
		jmp move

  move_checkColision:
    push r3
    push r5
    push r6

    loadn r3, #map
    add r3, r3, r4
    loadi r3, r3
    loadn r5, #128
    mod r3, r3, r5
    
    loadn r5, #26
    ceg move_checkColision_Lever
    
    loadn r5, #0
    cmp r3, r5
    jne move_checkColision_Wall
  
    pop r3
    pop r5
    pop r6
    rts
    
    move_checkColision_Lever:
      loadn r5, #29
      cel move_treatLever
      rts
    
    move_checkColision_Wall:
      pop r3
      pop r5
      pop r6
      jmp move

  move_treatLever:
    rts
    
  ; r6 = button position
	move_treatButton:
    loadn r5, #map
		loadn r6, #276
    outchar r2, r6 
    add r5, r5, r6
		loadn r7, #0
		storei r5, r7
		jmp move

	move_treatFlag:
    push r0
    push r1

    call printClearScreen
    
    loadn r1, #winStr
    loadn r0, #winPos
    loadi r0, r0
    call printString

    loadn r1, #repeatStr
    loadn r0, #repeatPos
    loadi r0, r0
    call printString
    
    pop r1
    pop r0
  
    jmp move_treatEndRestart
    
  move_treatEndRestart:
    inchar r3
    loadn r4, #255
    cmp r3, r4
    jeq move_treatEndRestart
    
    loadn r4, #'0'
    cmp r3, r4
    jeq main
    halt

;
; Print functions, screen functions
;

printScreen:
  push r0
  push r2
  push r3

  loadn r0, #0
  loadn r2, #1200

  printScreenLoop:
    add r3,r0,r1
    loadi r3, r3
    outchar r3, r0
	  call makeScreenArray
    inc r0
    cmp r0, r2
    jne printScreenLoop

  pop r3
  pop r2
  pop r0
  rts

  makeScreenArray:
  push r1

  loadn r1, #map
  add r1, r1, r0
	storei r1, r3
	
  pop r1
  rts

printClearScreen:
  push r0
  push r1
  push r2
  
  loadn r0, #0
  loadn r1, #0
  loadn r2, #1200
  
  printClearScreenLoop:
    outchar r1, r0
    inc r0
    cmp r0, r2
    jne printClearScreenLoop
    
  pop r2
  pop r1
  pop r0
  rts

printCurrentScreen:
  push r1
  push r3

  loadn r3, #currentMap
  loadi r3, r3

  loadn r1, #0
  cmp r3, r1
  jeq printLab1

  loadn r1, #1
  cmp r3, r1
  jeq printLab2 
  
  printLab1:
    loadn r1, #lab1
    jmp printCurrentScreenLeave
  
  printLab2:
    loadn r1, #lab2
    jmp printCurrentScreenLeave

  printCurrentScreenLeave:
    call printScreen
    call printBaseScreen
    pop r1
    rts

; r0 = starting pos, r1 = screen
printBaseScreen:
  push r0
  push r1
  push r2
  push r3

  loadn r0, #1080
  loadn r1, #telaBase
  loadn r3, #1200

  printBaseScreenLoop:
    add r2, r1, r0
    loadi r2, r2
    outchar r2, r0
    inc r0
    cmp r0, r3
    jne printBaseScreenLoop

  pop r3
  pop r2
  pop r1
  pop r0
  rts

; params : r0 = starting position, r1 = string
printString:
  push r2
  push r3
  push r4

  loadn r2, #'\0' ; max position
  loadn r4, #0

  printStringLoop:
    add r3, r1, r4
    loadi r3, r3
    cmp r3, r2
    jeq printStringLeave
    outchar r3, r0
    inc r0
    inc r4
    jmp printStringLoop
  
  printStringLeave:
    pop r4
    pop r3
    pop r2
    rts