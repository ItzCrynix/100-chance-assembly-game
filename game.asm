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

winStr : string "You win!"
winPos : var #1
  static winPos, #576

repeatStr : string "Press 0 to go again."
repeatPos : var #1
  static repeatPos, #611

; ---------------

; Maps

labyrinth : var #1200
  ;Linha 0
  static labyrinth + #0, #3967
  static labyrinth + #1, #27
  static labyrinth + #2, #3967
  static labyrinth + #3, #27
  static labyrinth + #4, #3967
  static labyrinth + #5, #3967
  static labyrinth + #6, #3967
  static labyrinth + #7, #3967
  static labyrinth + #8, #3967
  static labyrinth + #9, #3967
  static labyrinth + #10, #3967
  static labyrinth + #11, #3967
  static labyrinth + #12, #3967
  static labyrinth + #13, #3967
  static labyrinth + #14, #3967
  static labyrinth + #15, #3967
  static labyrinth + #16, #3967
  static labyrinth + #17, #3967
  static labyrinth + #18, #3967
  static labyrinth + #19, #3967
  static labyrinth + #20, #3967
  static labyrinth + #21, #3967
  static labyrinth + #22, #3967
  static labyrinth + #23, #3967
  static labyrinth + #24, #3967
  static labyrinth + #25, #3967
  static labyrinth + #26, #3967
  static labyrinth + #27, #3967
  static labyrinth + #28, #3967
  static labyrinth + #29, #3967
  static labyrinth + #30, #3967
  static labyrinth + #31, #3967
  static labyrinth + #32, #3967
  static labyrinth + #33, #3967
  static labyrinth + #34, #3967
  static labyrinth + #35, #3967
  static labyrinth + #36, #3967
  static labyrinth + #37, #3967
  static labyrinth + #38, #3967
  static labyrinth + #39, #3967

  ;Linha 1
  static labyrinth + #40, #3967
  static labyrinth + #41, #27
  static labyrinth + #42, #3967
  static labyrinth + #43, #27
  static labyrinth + #44, #27
  static labyrinth + #45, #27
  static labyrinth + #46, #27
  static labyrinth + #47, #27
  static labyrinth + #48, #27
  static labyrinth + #49, #27
  static labyrinth + #50, #27
  static labyrinth + #51, #27
  static labyrinth + #52, #27
  static labyrinth + #53, #27
  static labyrinth + #54, #27
  static labyrinth + #55, #27
  static labyrinth + #56, #27
  static labyrinth + #57, #27
  static labyrinth + #58, #27
  static labyrinth + #59, #27
  static labyrinth + #60, #27
  static labyrinth + #61, #27
  static labyrinth + #62, #27
  static labyrinth + #63, #27
  static labyrinth + #64, #27
  static labyrinth + #65, #27
  static labyrinth + #66, #27
  static labyrinth + #67, #27
  static labyrinth + #68, #27
  static labyrinth + #69, #27
  static labyrinth + #70, #27
  static labyrinth + #71, #27
  static labyrinth + #72, #27
  static labyrinth + #73, #27
  static labyrinth + #74, #27
  static labyrinth + #75, #27
  static labyrinth + #76, #27
  static labyrinth + #77, #27
  static labyrinth + #78, #27
  static labyrinth + #79, #3967

  ;Linha 2
  static labyrinth + #80, #3967
  static labyrinth + #81, #27
  static labyrinth + #82, #3967
  static labyrinth + #83, #27
  static labyrinth + #84, #3967
  static labyrinth + #85, #27
  static labyrinth + #86, #3967
  static labyrinth + #87, #27
  static labyrinth + #88, #3967
  static labyrinth + #89, #3967
  static labyrinth + #90, #3967
  static labyrinth + #91, #3967
  static labyrinth + #92, #3967
  static labyrinth + #93, #3967
  static labyrinth + #94, #3967
  static labyrinth + #95, #3967
  static labyrinth + #96, #3967
  static labyrinth + #97, #3967
  static labyrinth + #98, #3967
  static labyrinth + #99, #3967
  static labyrinth + #100, #3967
  static labyrinth + #101, #3967
  static labyrinth + #102, #27
  static labyrinth + #103, #3967
  static labyrinth + #104, #3967
  static labyrinth + #105, #27
  static labyrinth + #106, #3967
  static labyrinth + #107, #3967
  static labyrinth + #108, #3967
  static labyrinth + #109, #3967
  static labyrinth + #110, #3967
  static labyrinth + #111, #3967
  static labyrinth + #112, #3967
  static labyrinth + #113, #3967
  static labyrinth + #114, #3967
  static labyrinth + #115, #3967
  static labyrinth + #116, #27
  static labyrinth + #117, #2842
  static labyrinth + #118, #27
  static labyrinth + #119, #3967

  ;Linha 3
  static labyrinth + #120, #3967
  static labyrinth + #121, #27
  static labyrinth + #122, #3967
  static labyrinth + #123, #27
  static labyrinth + #124, #3967
  static labyrinth + #125, #27
  static labyrinth + #126, #3967
  static labyrinth + #127, #27
  static labyrinth + #128, #3967
  static labyrinth + #129, #3967
  static labyrinth + #130, #3967
  static labyrinth + #131, #3967
  static labyrinth + #132, #3967
  static labyrinth + #133, #27
  static labyrinth + #134, #3967
  static labyrinth + #135, #27
  static labyrinth + #136, #3967
  static labyrinth + #137, #27
  static labyrinth + #138, #3967
  static labyrinth + #139, #27
  static labyrinth + #140, #27
  static labyrinth + #141, #27
  static labyrinth + #142, #27
  static labyrinth + #143, #27
  static labyrinth + #144, #3967
  static labyrinth + #145, #27
  static labyrinth + #146, #3967
  static labyrinth + #147, #27
  static labyrinth + #148, #27
  static labyrinth + #149, #27
  static labyrinth + #150, #27
  static labyrinth + #151, #27
  static labyrinth + #152, #27
  static labyrinth + #153, #27
  static labyrinth + #154, #27
  static labyrinth + #155, #3967
  static labyrinth + #156, #27
  static labyrinth + #157, #3967
  static labyrinth + #158, #27
  static labyrinth + #159, #3967

  ;Linha 4
  static labyrinth + #160, #3967
  static labyrinth + #161, #27
  static labyrinth + #162, #3967
  static labyrinth + #163, #27
  static labyrinth + #164, #3967
  static labyrinth + #165, #27
  static labyrinth + #166, #3967
  static labyrinth + #167, #27
  static labyrinth + #168, #27
  static labyrinth + #169, #27
  static labyrinth + #170, #27
  static labyrinth + #171, #27
  static labyrinth + #172, #27
  static labyrinth + #173, #27
  static labyrinth + #174, #3967
  static labyrinth + #175, #27
  static labyrinth + #176, #3967
  static labyrinth + #177, #27
  static labyrinth + #178, #3967
  static labyrinth + #179, #3967
  static labyrinth + #180, #3967
  static labyrinth + #181, #3967
  static labyrinth + #182, #3967
  static labyrinth + #183, #27
  static labyrinth + #184, #3967
  static labyrinth + #185, #27
  static labyrinth + #186, #3967
  static labyrinth + #187, #27
  static labyrinth + #188, #3967
  static labyrinth + #189, #3967
  static labyrinth + #190, #3967
  static labyrinth + #191, #3967
  static labyrinth + #192, #3967
  static labyrinth + #193, #3967
  static labyrinth + #194, #3967
  static labyrinth + #195, #3967
  static labyrinth + #196, #27
  static labyrinth + #197, #3967
  static labyrinth + #198, #27
  static labyrinth + #199, #3967

  ;Linha 5
  static labyrinth + #200, #3967
  static labyrinth + #201, #27
  static labyrinth + #202, #3967
  static labyrinth + #203, #27
  static labyrinth + #204, #3967
  static labyrinth + #205, #27
  static labyrinth + #206, #3967
  static labyrinth + #207, #3967
  static labyrinth + #208, #3967
  static labyrinth + #209, #3967
  static labyrinth + #210, #3967
  static labyrinth + #211, #3967
  static labyrinth + #212, #3967
  static labyrinth + #213, #3967
  static labyrinth + #214, #3967
  static labyrinth + #215, #27
  static labyrinth + #216, #3967
  static labyrinth + #217, #27
  static labyrinth + #218, #3967
  static labyrinth + #219, #27
  static labyrinth + #220, #27
  static labyrinth + #221, #27
  static labyrinth + #222, #27
  static labyrinth + #223, #27
  static labyrinth + #224, #3967
  static labyrinth + #225, #27
  static labyrinth + #226, #3967
  static labyrinth + #227, #27
  static labyrinth + #228, #27
  static labyrinth + #229, #27
  static labyrinth + #230, #3967
  static labyrinth + #231, #27
  static labyrinth + #232, #27
  static labyrinth + #233, #27
  static labyrinth + #234, #27
  static labyrinth + #235, #27
  static labyrinth + #236, #27
  static labyrinth + #237, #3967
  static labyrinth + #238, #27
  static labyrinth + #239, #3967

  ;Linha 6
  static labyrinth + #240, #3967
  static labyrinth + #241, #27
  static labyrinth + #242, #3967
  static labyrinth + #243, #27
  static labyrinth + #244, #3967
  static labyrinth + #245, #27
  static labyrinth + #246, #27
  static labyrinth + #247, #27
  static labyrinth + #248, #27
  static labyrinth + #249, #27
  static labyrinth + #250, #27
  static labyrinth + #251, #27
  static labyrinth + #252, #27
  static labyrinth + #253, #27
  static labyrinth + #254, #3967
  static labyrinth + #255, #27
  static labyrinth + #256, #3967
  static labyrinth + #257, #27
  static labyrinth + #258, #3967
  static labyrinth + #259, #3967
  static labyrinth + #260, #3967
  static labyrinth + #261, #3967
  static labyrinth + #262, #3967
  static labyrinth + #263, #27
  static labyrinth + #264, #3967
  static labyrinth + #265, #27
  static labyrinth + #266, #3967
  static labyrinth + #267, #3967
  static labyrinth + #268, #3967
  static labyrinth + #269, #27
  static labyrinth + #270, #3967
  static labyrinth + #271, #3967
  static labyrinth + #272, #3967
  static labyrinth + #273, #3967
  static labyrinth + #274, #3967
  static labyrinth + #275, #3967
  static labyrinth + #276, #2334
  static labyrinth + #277, #3967
  static labyrinth + #278, #27
  static labyrinth + #279, #3967

  ;Linha 7
  static labyrinth + #280, #3967
  static labyrinth + #281, #27
  static labyrinth + #282, #3967
  static labyrinth + #283, #3967
  static labyrinth + #284, #3967
  static labyrinth + #285, #3967
  static labyrinth + #286, #3967
  static labyrinth + #287, #3967
  static labyrinth + #288, #3967
  static labyrinth + #289, #3967
  static labyrinth + #290, #3967
  static labyrinth + #291, #3967
  static labyrinth + #292, #3967
  static labyrinth + #293, #3967
  static labyrinth + #294, #3967
  static labyrinth + #295, #27
  static labyrinth + #296, #3967
  static labyrinth + #297, #27
  static labyrinth + #298, #27
  static labyrinth + #299, #27
  static labyrinth + #300, #27
  static labyrinth + #301, #27
  static labyrinth + #302, #27
  static labyrinth + #303, #27
  static labyrinth + #304, #3967
  static labyrinth + #305, #27
  static labyrinth + #306, #27
  static labyrinth + #307, #27
  static labyrinth + #308, #3967
  static labyrinth + #309, #27
  static labyrinth + #310, #3967
  static labyrinth + #311, #3967
  static labyrinth + #312, #27
  static labyrinth + #313, #27
  static labyrinth + #314, #27
  static labyrinth + #315, #27
  static labyrinth + #316, #27
  static labyrinth + #317, #27
  static labyrinth + #318, #27
  static labyrinth + #319, #3967

  ;Linha 8
  static labyrinth + #320, #3967
  static labyrinth + #321, #27
  static labyrinth + #322, #3967
  static labyrinth + #323, #27
  static labyrinth + #324, #3967
  static labyrinth + #325, #27
  static labyrinth + #326, #27
  static labyrinth + #327, #27
  static labyrinth + #328, #27
  static labyrinth + #329, #27
  static labyrinth + #330, #27
  static labyrinth + #331, #27
  static labyrinth + #332, #27
  static labyrinth + #333, #27
  static labyrinth + #334, #27
  static labyrinth + #335, #27
  static labyrinth + #336, #3967
  static labyrinth + #337, #27
  static labyrinth + #338, #3967
  static labyrinth + #339, #3967
  static labyrinth + #340, #3967
  static labyrinth + #341, #3967
  static labyrinth + #342, #3967
  static labyrinth + #343, #3967
  static labyrinth + #344, #3967
  static labyrinth + #345, #3967
  static labyrinth + #346, #3967
  static labyrinth + #347, #27
  static labyrinth + #348, #3967
  static labyrinth + #349, #27
  static labyrinth + #350, #3967
  static labyrinth + #351, #3967
  static labyrinth + #352, #27
  static labyrinth + #353, #3967
  static labyrinth + #354, #3967
  static labyrinth + #355, #3967
  static labyrinth + #356, #3967
  static labyrinth + #357, #3967
  static labyrinth + #358, #27
  static labyrinth + #359, #3967

  ;Linha 9
  static labyrinth + #360, #3967
  static labyrinth + #361, #27
  static labyrinth + #362, #3967
  static labyrinth + #363, #27
  static labyrinth + #364, #3967
  static labyrinth + #365, #3967
  static labyrinth + #366, #3967
  static labyrinth + #367, #3967
  static labyrinth + #368, #3967
  static labyrinth + #369, #3967
  static labyrinth + #370, #3967
  static labyrinth + #371, #3967
  static labyrinth + #372, #3967
  static labyrinth + #373, #27
  static labyrinth + #374, #3967
  static labyrinth + #375, #27
  static labyrinth + #376, #27
  static labyrinth + #377, #27
  static labyrinth + #378, #27
  static labyrinth + #379, #27
  static labyrinth + #380, #27
  static labyrinth + #381, #27
  static labyrinth + #382, #27
  static labyrinth + #383, #27
  static labyrinth + #384, #27
  static labyrinth + #385, #27
  static labyrinth + #386, #3967
  static labyrinth + #387, #27
  static labyrinth + #388, #3967
  static labyrinth + #389, #27
  static labyrinth + #390, #3967
  static labyrinth + #391, #3967
  static labyrinth + #392, #27
  static labyrinth + #393, #3967
  static labyrinth + #394, #27
  static labyrinth + #395, #27
  static labyrinth + #396, #27
  static labyrinth + #397, #3967
  static labyrinth + #398, #27
  static labyrinth + #399, #3967

  ;Linha 10
  static labyrinth + #400, #3967
  static labyrinth + #401, #27
  static labyrinth + #402, #3967
  static labyrinth + #403, #27
  static labyrinth + #404, #27
  static labyrinth + #405, #27
  static labyrinth + #406, #27
  static labyrinth + #407, #27
  static labyrinth + #408, #27
  static labyrinth + #409, #27
  static labyrinth + #410, #27
  static labyrinth + #411, #27
  static labyrinth + #412, #3967
  static labyrinth + #413, #27
  static labyrinth + #414, #3967
  static labyrinth + #415, #27
  static labyrinth + #416, #3967
  static labyrinth + #417, #3967
  static labyrinth + #418, #3967
  static labyrinth + #419, #3967
  static labyrinth + #420, #3967
  static labyrinth + #421, #3967
  static labyrinth + #422, #3967
  static labyrinth + #423, #3967
  static labyrinth + #424, #3967
  static labyrinth + #425, #27
  static labyrinth + #426, #3967
  static labyrinth + #427, #27
  static labyrinth + #428, #3967
  static labyrinth + #429, #27
  static labyrinth + #430, #793
  static labyrinth + #431, #3967
  static labyrinth + #432, #27
  static labyrinth + #433, #3967
  static labyrinth + #434, #27
  static labyrinth + #435, #3967
  static labyrinth + #436, #27
  static labyrinth + #437, #3967
  static labyrinth + #438, #27
  static labyrinth + #439, #3967

  ;Linha 11
  static labyrinth + #440, #3967
  static labyrinth + #441, #27
  static labyrinth + #442, #3967
  static labyrinth + #443, #3967
  static labyrinth + #444, #3967
  static labyrinth + #445, #3967
  static labyrinth + #446, #3967
  static labyrinth + #447, #3967
  static labyrinth + #448, #3967
  static labyrinth + #449, #3967
  static labyrinth + #450, #3967
  static labyrinth + #451, #27
  static labyrinth + #452, #3967
  static labyrinth + #453, #27
  static labyrinth + #454, #3967
  static labyrinth + #455, #27
  static labyrinth + #456, #27
  static labyrinth + #457, #27
  static labyrinth + #458, #27
  static labyrinth + #459, #27
  static labyrinth + #460, #27
  static labyrinth + #461, #27
  static labyrinth + #462, #27
  static labyrinth + #463, #27
  static labyrinth + #464, #3967
  static labyrinth + #465, #27
  static labyrinth + #466, #3967
  static labyrinth + #467, #27
  static labyrinth + #468, #3967
  static labyrinth + #469, #27
  static labyrinth + #470, #27
  static labyrinth + #471, #27
  static labyrinth + #472, #27
  static labyrinth + #473, #3967
  static labyrinth + #474, #27
  static labyrinth + #475, #3967
  static labyrinth + #476, #27
  static labyrinth + #477, #3967
  static labyrinth + #478, #27
  static labyrinth + #479, #3967

  ;Linha 12
  static labyrinth + #480, #3967
  static labyrinth + #481, #27
  static labyrinth + #482, #3967
  static labyrinth + #483, #27
  static labyrinth + #484, #3967
  static labyrinth + #485, #27
  static labyrinth + #486, #27
  static labyrinth + #487, #27
  static labyrinth + #488, #27
  static labyrinth + #489, #27
  static labyrinth + #490, #3967
  static labyrinth + #491, #27
  static labyrinth + #492, #3967
  static labyrinth + #493, #27
  static labyrinth + #494, #3967
  static labyrinth + #495, #3967
  static labyrinth + #496, #3967
  static labyrinth + #497, #3967
  static labyrinth + #498, #3967
  static labyrinth + #499, #3967
  static labyrinth + #500, #3967
  static labyrinth + #501, #3967
  static labyrinth + #502, #3967
  static labyrinth + #503, #27
  static labyrinth + #504, #3967
  static labyrinth + #505, #27
  static labyrinth + #506, #3967
  static labyrinth + #507, #3967
  static labyrinth + #508, #3967
  static labyrinth + #509, #3967
  static labyrinth + #510, #3967
  static labyrinth + #511, #3967
  static labyrinth + #512, #3967
  static labyrinth + #513, #3967
  static labyrinth + #514, #27
  static labyrinth + #515, #3967
  static labyrinth + #516, #27
  static labyrinth + #517, #3967
  static labyrinth + #518, #27
  static labyrinth + #519, #3967

  ;Linha 13
  static labyrinth + #520, #3967
  static labyrinth + #521, #27
  static labyrinth + #522, #3967
  static labyrinth + #523, #27
  static labyrinth + #524, #3967
  static labyrinth + #525, #27
  static labyrinth + #526, #3967
  static labyrinth + #527, #3967
  static labyrinth + #528, #3967
  static labyrinth + #529, #27
  static labyrinth + #530, #3967
  static labyrinth + #531, #27
  static labyrinth + #532, #3967
  static labyrinth + #533, #27
  static labyrinth + #534, #27
  static labyrinth + #535, #27
  static labyrinth + #536, #27
  static labyrinth + #537, #27
  static labyrinth + #538, #27
  static labyrinth + #539, #27
  static labyrinth + #540, #27
  static labyrinth + #541, #27
  static labyrinth + #542, #3967
  static labyrinth + #543, #27
  static labyrinth + #544, #3967
  static labyrinth + #545, #27
  static labyrinth + #546, #3967
  static labyrinth + #547, #27
  static labyrinth + #548, #27
  static labyrinth + #549, #27
  static labyrinth + #550, #27
  static labyrinth + #551, #27
  static labyrinth + #552, #27
  static labyrinth + #553, #27
  static labyrinth + #554, #27
  static labyrinth + #555, #3967
  static labyrinth + #556, #27
  static labyrinth + #557, #3967
  static labyrinth + #558, #27
  static labyrinth + #559, #3967

  ;Linha 14
  static labyrinth + #560, #3967
  static labyrinth + #561, #27
  static labyrinth + #562, #3967
  static labyrinth + #563, #27
  static labyrinth + #564, #3967
  static labyrinth + #565, #27
  static labyrinth + #566, #3967
  static labyrinth + #567, #3967
  static labyrinth + #568, #3967
  static labyrinth + #569, #27
  static labyrinth + #570, #3967
  static labyrinth + #571, #27
  static labyrinth + #572, #3967
  static labyrinth + #573, #3967
  static labyrinth + #574, #3967
  static labyrinth + #575, #3967
  static labyrinth + #576, #3967
  static labyrinth + #577, #3967
  static labyrinth + #578, #3967
  static labyrinth + #579, #3967
  static labyrinth + #580, #3967
  static labyrinth + #581, #27
  static labyrinth + #582, #3967
  static labyrinth + #583, #27
  static labyrinth + #584, #3967
  static labyrinth + #585, #3967
  static labyrinth + #586, #3967
  static labyrinth + #587, #3967
  static labyrinth + #588, #3967
  static labyrinth + #589, #3967
  static labyrinth + #590, #3967
  static labyrinth + #591, #3967
  static labyrinth + #592, #3967
  static labyrinth + #593, #3967
  static labyrinth + #594, #3967
  static labyrinth + #595, #3967
  static labyrinth + #596, #27
  static labyrinth + #597, #3967
  static labyrinth + #598, #27
  static labyrinth + #599, #3967

  ;Linha 15
  static labyrinth + #600, #3967
  static labyrinth + #601, #27
  static labyrinth + #602, #3967
  static labyrinth + #603, #27
  static labyrinth + #604, #3967
  static labyrinth + #605, #27
  static labyrinth + #606, #3967
  static labyrinth + #607, #27
  static labyrinth + #608, #27
  static labyrinth + #609, #27
  static labyrinth + #610, #3967
  static labyrinth + #611, #27
  static labyrinth + #612, #27
  static labyrinth + #613, #27
  static labyrinth + #614, #27
  static labyrinth + #615, #27
  static labyrinth + #616, #27
  static labyrinth + #617, #27
  static labyrinth + #618, #27
  static labyrinth + #619, #27
  static labyrinth + #620, #3967
  static labyrinth + #621, #27
  static labyrinth + #622, #3967
  static labyrinth + #623, #27
  static labyrinth + #624, #27
  static labyrinth + #625, #27
  static labyrinth + #626, #27
  static labyrinth + #627, #27
  static labyrinth + #628, #27
  static labyrinth + #629, #27
  static labyrinth + #630, #27
  static labyrinth + #631, #27
  static labyrinth + #632, #27
  static labyrinth + #633, #27
  static labyrinth + #634, #27
  static labyrinth + #635, #27
  static labyrinth + #636, #27
  static labyrinth + #637, #3967
  static labyrinth + #638, #27
  static labyrinth + #639, #3967

  ;Linha 16
  static labyrinth + #640, #3967
  static labyrinth + #641, #27
  static labyrinth + #642, #3967
  static labyrinth + #643, #27
  static labyrinth + #644, #3967
  static labyrinth + #645, #27
  static labyrinth + #646, #3967
  static labyrinth + #647, #3967
  static labyrinth + #648, #3967
  static labyrinth + #649, #3967
  static labyrinth + #650, #3967
  static labyrinth + #651, #3967
  static labyrinth + #652, #3967
  static labyrinth + #653, #3967
  static labyrinth + #654, #3967
  static labyrinth + #655, #3967
  static labyrinth + #656, #3967
  static labyrinth + #657, #3967
  static labyrinth + #658, #3967
  static labyrinth + #659, #3967
  static labyrinth + #660, #3967
  static labyrinth + #661, #27
  static labyrinth + #662, #3967
  static labyrinth + #663, #3967
  static labyrinth + #664, #3967
  static labyrinth + #665, #3967
  static labyrinth + #666, #3967
  static labyrinth + #667, #3967
  static labyrinth + #668, #3967
  static labyrinth + #669, #3967
  static labyrinth + #670, #3967
  static labyrinth + #671, #3967
  static labyrinth + #672, #3967
  static labyrinth + #673, #3967
  static labyrinth + #674, #3967
  static labyrinth + #675, #3967
  static labyrinth + #676, #3967
  static labyrinth + #677, #3967
  static labyrinth + #678, #27
  static labyrinth + #679, #3967

  ;Linha 17
  static labyrinth + #680, #3967
  static labyrinth + #681, #27
  static labyrinth + #682, #27
  static labyrinth + #683, #27
  static labyrinth + #684, #3967
  static labyrinth + #685, #27
  static labyrinth + #686, #27
  static labyrinth + #687, #27
  static labyrinth + #688, #27
  static labyrinth + #689, #27
  static labyrinth + #690, #27
  static labyrinth + #691, #27
  static labyrinth + #692, #27
  static labyrinth + #693, #27
  static labyrinth + #694, #27
  static labyrinth + #695, #27
  static labyrinth + #696, #27
  static labyrinth + #697, #27
  static labyrinth + #698, #27
  static labyrinth + #699, #27
  static labyrinth + #700, #27
  static labyrinth + #701, #27
  static labyrinth + #702, #27
  static labyrinth + #703, #27
  static labyrinth + #704, #27
  static labyrinth + #705, #27
  static labyrinth + #706, #27
  static labyrinth + #707, #27
  static labyrinth + #708, #27
  static labyrinth + #709, #27
  static labyrinth + #710, #27
  static labyrinth + #711, #27
  static labyrinth + #712, #27
  static labyrinth + #713, #27
  static labyrinth + #714, #27
  static labyrinth + #715, #27
  static labyrinth + #716, #27
  static labyrinth + #717, #3967
  static labyrinth + #718, #27
  static labyrinth + #719, #3967

  ;Linha 18
  static labyrinth + #720, #3967
  static labyrinth + #721, #27
  static labyrinth + #722, #3967
  static labyrinth + #723, #3967
  static labyrinth + #724, #3967
  static labyrinth + #725, #3967
  static labyrinth + #726, #3967
  static labyrinth + #727, #3967
  static labyrinth + #728, #3967
  static labyrinth + #729, #3967
  static labyrinth + #730, #3967
  static labyrinth + #731, #3967
  static labyrinth + #732, #3967
  static labyrinth + #733, #3967
  static labyrinth + #734, #3967
  static labyrinth + #735, #3967
  static labyrinth + #736, #3967
  static labyrinth + #737, #3967
  static labyrinth + #738, #3967
  static labyrinth + #739, #3967
  static labyrinth + #740, #3967
  static labyrinth + #741, #3967
  static labyrinth + #742, #3967
  static labyrinth + #743, #27
  static labyrinth + #744, #3967
  static labyrinth + #745, #3967
  static labyrinth + #746, #3967
  static labyrinth + #747, #3967
  static labyrinth + #748, #3967
  static labyrinth + #749, #3967
  static labyrinth + #750, #3967
  static labyrinth + #751, #3967
  static labyrinth + #752, #27
  static labyrinth + #753, #3967
  static labyrinth + #754, #3967
  static labyrinth + #755, #3967
  static labyrinth + #756, #3967
  static labyrinth + #757, #3967
  static labyrinth + #758, #27
  static labyrinth + #759, #3967

  ;Linha 19
  static labyrinth + #760, #3967
  static labyrinth + #761, #27
  static labyrinth + #762, #3967
  static labyrinth + #763, #27
  static labyrinth + #764, #27
  static labyrinth + #765, #27
  static labyrinth + #766, #27
  static labyrinth + #767, #3967
  static labyrinth + #768, #27
  static labyrinth + #769, #27
  static labyrinth + #770, #27
  static labyrinth + #771, #27
  static labyrinth + #772, #27
  static labyrinth + #773, #27
  static labyrinth + #774, #27
  static labyrinth + #775, #27
  static labyrinth + #776, #27
  static labyrinth + #777, #27
  static labyrinth + #778, #27
  static labyrinth + #779, #27
  static labyrinth + #780, #27
  static labyrinth + #781, #27
  static labyrinth + #782, #27
  static labyrinth + #783, #27
  static labyrinth + #784, #3967
  static labyrinth + #785, #27
  static labyrinth + #786, #27
  static labyrinth + #787, #27
  static labyrinth + #788, #27
  static labyrinth + #789, #27
  static labyrinth + #790, #27
  static labyrinth + #791, #3967
  static labyrinth + #792, #27
  static labyrinth + #793, #3967
  static labyrinth + #794, #27
  static labyrinth + #795, #27
  static labyrinth + #796, #27
  static labyrinth + #797, #3967
  static labyrinth + #798, #27
  static labyrinth + #799, #3967

  ;Linha 20
  static labyrinth + #800, #3967
  static labyrinth + #801, #27
  static labyrinth + #802, #3967
  static labyrinth + #803, #27
  static labyrinth + #804, #3967
  static labyrinth + #805, #3967
  static labyrinth + #806, #3967
  static labyrinth + #807, #3967
  static labyrinth + #808, #3967
  static labyrinth + #809, #3967
  static labyrinth + #810, #3967
  static labyrinth + #811, #3967
  static labyrinth + #812, #3967
  static labyrinth + #813, #3967
  static labyrinth + #814, #3967
  static labyrinth + #815, #3967
  static labyrinth + #816, #3967
  static labyrinth + #817, #3967
  static labyrinth + #818, #3967
  static labyrinth + #819, #3967
  static labyrinth + #820, #3967
  static labyrinth + #821, #3967
  static labyrinth + #822, #3967
  static labyrinth + #823, #27
  static labyrinth + #824, #3967
  static labyrinth + #825, #27
  static labyrinth + #826, #3967
  static labyrinth + #827, #3967
  static labyrinth + #828, #3967
  static labyrinth + #829, #3967
  static labyrinth + #830, #27
  static labyrinth + #831, #3967
  static labyrinth + #832, #27
  static labyrinth + #833, #3967
  static labyrinth + #834, #27
  static labyrinth + #835, #3967
  static labyrinth + #836, #27
  static labyrinth + #837, #3967
  static labyrinth + #838, #27
  static labyrinth + #839, #3967

  ;Linha 21
  static labyrinth + #840, #3967
  static labyrinth + #841, #27
  static labyrinth + #842, #3967
  static labyrinth + #843, #27
  static labyrinth + #844, #27
  static labyrinth + #845, #27
  static labyrinth + #846, #3967
  static labyrinth + #847, #27
  static labyrinth + #848, #27
  static labyrinth + #849, #27
  static labyrinth + #850, #27
  static labyrinth + #851, #27
  static labyrinth + #852, #27
  static labyrinth + #853, #27
  static labyrinth + #854, #27
  static labyrinth + #855, #3967
  static labyrinth + #856, #27
  static labyrinth + #857, #3967
  static labyrinth + #858, #27
  static labyrinth + #859, #3967
  static labyrinth + #860, #27
  static labyrinth + #861, #27
  static labyrinth + #862, #3967
  static labyrinth + #863, #27
  static labyrinth + #864, #3967
  static labyrinth + #865, #27
  static labyrinth + #866, #27
  static labyrinth + #867, #27
  static labyrinth + #868, #27
  static labyrinth + #869, #3967
  static labyrinth + #870, #27
  static labyrinth + #871, #3967
  static labyrinth + #872, #27
  static labyrinth + #873, #3967
  static labyrinth + #874, #27
  static labyrinth + #875, #3967
  static labyrinth + #876, #27
  static labyrinth + #877, #3967
  static labyrinth + #878, #27
  static labyrinth + #879, #3967

  ;Linha 22
  static labyrinth + #880, #3967
  static labyrinth + #881, #27
  static labyrinth + #882, #3967
  static labyrinth + #883, #3967
  static labyrinth + #884, #3967
  static labyrinth + #885, #27
  static labyrinth + #886, #3967
  static labyrinth + #887, #27
  static labyrinth + #888, #3967
  static labyrinth + #889, #3967
  static labyrinth + #890, #3967
  static labyrinth + #891, #3967
  static labyrinth + #892, #3967
  static labyrinth + #893, #3967
  static labyrinth + #894, #27
  static labyrinth + #895, #3967
  static labyrinth + #896, #27
  static labyrinth + #897, #3967
  static labyrinth + #898, #27
  static labyrinth + #899, #3967
  static labyrinth + #900, #27
  static labyrinth + #901, #3967
  static labyrinth + #902, #3967
  static labyrinth + #903, #27
  static labyrinth + #904, #3967
  static labyrinth + #905, #3967
  static labyrinth + #906, #3967
  static labyrinth + #907, #3967
  static labyrinth + #908, #3967
  static labyrinth + #909, #3967
  static labyrinth + #910, #27
  static labyrinth + #911, #3967
  static labyrinth + #912, #27
  static labyrinth + #913, #3967
  static labyrinth + #914, #27
  static labyrinth + #915, #3967
  static labyrinth + #916, #27
  static labyrinth + #917, #3967
  static labyrinth + #918, #27
  static labyrinth + #919, #3967

  ;Linha 23
  static labyrinth + #920, #3967
  static labyrinth + #921, #27
  static labyrinth + #922, #27
  static labyrinth + #923, #27
  static labyrinth + #924, #3967
  static labyrinth + #925, #27
  static labyrinth + #926, #3967
  static labyrinth + #927, #27
  static labyrinth + #928, #3967
  static labyrinth + #929, #27
  static labyrinth + #930, #27
  static labyrinth + #931, #27
  static labyrinth + #932, #27
  static labyrinth + #933, #3967
  static labyrinth + #934, #27
  static labyrinth + #935, #3967
  static labyrinth + #936, #27
  static labyrinth + #937, #3967
  static labyrinth + #938, #27
  static labyrinth + #939, #3967
  static labyrinth + #940, #27
  static labyrinth + #941, #3967
  static labyrinth + #942, #3967
  static labyrinth + #943, #27
  static labyrinth + #944, #3967
  static labyrinth + #945, #27
  static labyrinth + #946, #27
  static labyrinth + #947, #27
  static labyrinth + #948, #27
  static labyrinth + #949, #3967
  static labyrinth + #950, #27
  static labyrinth + #951, #3967
  static labyrinth + #952, #27
  static labyrinth + #953, #3967
  static labyrinth + #954, #27
  static labyrinth + #955, #3967
  static labyrinth + #956, #27
  static labyrinth + #957, #3967
  static labyrinth + #958, #27
  static labyrinth + #959, #3967

  ;Linha 24
  static labyrinth + #960, #3967
  static labyrinth + #961, #27
  static labyrinth + #962, #3967
  static labyrinth + #963, #27
  static labyrinth + #964, #3967
  static labyrinth + #965, #27
  static labyrinth + #966, #3967
  static labyrinth + #967, #27
  static labyrinth + #968, #3967
  static labyrinth + #969, #27
  static labyrinth + #970, #3967
  static labyrinth + #971, #3967
  static labyrinth + #972, #27
  static labyrinth + #973, #3967
  static labyrinth + #974, #27
  static labyrinth + #975, #3967
  static labyrinth + #976, #27
  static labyrinth + #977, #3967
  static labyrinth + #978, #27
  static labyrinth + #979, #3967
  static labyrinth + #980, #27
  static labyrinth + #981, #3967
  static labyrinth + #982, #3967
  static labyrinth + #983, #27
  static labyrinth + #984, #3967
  static labyrinth + #985, #27
  static labyrinth + #986, #3967
  static labyrinth + #987, #3967
  static labyrinth + #988, #27
  static labyrinth + #989, #3967
  static labyrinth + #990, #27
  static labyrinth + #991, #3967
  static labyrinth + #992, #27
  static labyrinth + #993, #3967
  static labyrinth + #994, #27
  static labyrinth + #995, #3967
  static labyrinth + #996, #27
  static labyrinth + #997, #3967
  static labyrinth + #998, #27
  static labyrinth + #999, #3967

  ;Linha 25
  static labyrinth + #1000, #3967
  static labyrinth + #1001, #27
  static labyrinth + #1002, #3967
  static labyrinth + #1003, #27
  static labyrinth + #1004, #3967
  static labyrinth + #1005, #27
  static labyrinth + #1006, #3967
  static labyrinth + #1007, #27
  static labyrinth + #1008, #3967
  static labyrinth + #1009, #27
  static labyrinth + #1010, #3967
  static labyrinth + #1011, #3967
  static labyrinth + #1012, #3967
  static labyrinth + #1013, #3967
  static labyrinth + #1014, #27
  static labyrinth + #1015, #3967
  static labyrinth + #1016, #27
  static labyrinth + #1017, #3967
  static labyrinth + #1018, #27
  static labyrinth + #1019, #3967
  static labyrinth + #1020, #27
  static labyrinth + #1021, #3967
  static labyrinth + #1022, #3967
  static labyrinth + #1023, #27
  static labyrinth + #1024, #3967
  static labyrinth + #1025, #3967
  static labyrinth + #1026, #3967
  static labyrinth + #1027, #3967
  static labyrinth + #1028, #27
  static labyrinth + #1029, #3967
  static labyrinth + #1030, #27
  static labyrinth + #1031, #3967
  static labyrinth + #1032, #27
  static labyrinth + #1033, #3967
  static labyrinth + #1034, #3967
  static labyrinth + #1035, #3967
  static labyrinth + #1036, #27
  static labyrinth + #1037, #3967
  static labyrinth + #1038, #27
  static labyrinth + #1039, #3967

  ;Linha 26
  static labyrinth + #1040, #3967
  static labyrinth + #1041, #27
  static labyrinth + #1042, #3967
  static labyrinth + #1043, #27
  static labyrinth + #1044, #3967
  static labyrinth + #1045, #27
  static labyrinth + #1046, #3967
  static labyrinth + #1047, #27
  static labyrinth + #1048, #3967
  static labyrinth + #1049, #27
  static labyrinth + #1050, #27
  static labyrinth + #1051, #27
  static labyrinth + #1052, #27
  static labyrinth + #1053, #27
  static labyrinth + #1054, #27
  static labyrinth + #1055, #3967
  static labyrinth + #1056, #27
  static labyrinth + #1057, #27
  static labyrinth + #1058, #27
  static labyrinth + #1059, #3967
  static labyrinth + #1060, #27
  static labyrinth + #1061, #3967
  static labyrinth + #1062, #3967
  static labyrinth + #1063, #27
  static labyrinth + #1064, #27
  static labyrinth + #1065, #27
  static labyrinth + #1066, #27
  static labyrinth + #1067, #27
  static labyrinth + #1068, #27
  static labyrinth + #1069, #3967
  static labyrinth + #1070, #27
  static labyrinth + #1071, #3967
  static labyrinth + #1072, #27
  static labyrinth + #1073, #27
  static labyrinth + #1074, #27
  static labyrinth + #1075, #27
  static labyrinth + #1076, #27
  static labyrinth + #1077, #3967
  static labyrinth + #1078, #27
  static labyrinth + #1079, #3967

  ;Linha 27
  static labyrinth + #1080, #3967
  static labyrinth + #1081, #27
  static labyrinth + #1082, #3967
  static labyrinth + #1083, #3967
  static labyrinth + #1084, #3967
  static labyrinth + #1085, #3967
  static labyrinth + #1086, #3967
  static labyrinth + #1087, #27
  static labyrinth + #1088, #3967
  static labyrinth + #1089, #3967
  static labyrinth + #1090, #3967
  static labyrinth + #1091, #3967
  static labyrinth + #1092, #3967
  static labyrinth + #1093, #3967
  static labyrinth + #1094, #3967
  static labyrinth + #1095, #3967
  static labyrinth + #1096, #3967
  static labyrinth + #1097, #3967
  static labyrinth + #1098, #3967
  static labyrinth + #1099, #3967
  static labyrinth + #1100, #27
  static labyrinth + #1101, #3967
  static labyrinth + #1102, #3967
  static labyrinth + #1103, #3967
  static labyrinth + #1104, #3967
  static labyrinth + #1105, #3967
  static labyrinth + #1106, #3967
  static labyrinth + #1107, #3967
  static labyrinth + #1108, #3967
  static labyrinth + #1109, #3967
  static labyrinth + #1110, #27
  static labyrinth + #1111, #3967
  static labyrinth + #1112, #3967
  static labyrinth + #1113, #3967
  static labyrinth + #1114, #3967
  static labyrinth + #1115, #3967
  static labyrinth + #1116, #3967
  static labyrinth + #1117, #3967
  static labyrinth + #1118, #27
  static labyrinth + #1119, #3967

  ;Linha 28
  static labyrinth + #1120, #3967
  static labyrinth + #1121, #27
  static labyrinth + #1122, #27
  static labyrinth + #1123, #27
  static labyrinth + #1124, #27
  static labyrinth + #1125, #27
  static labyrinth + #1126, #27
  static labyrinth + #1127, #27
  static labyrinth + #1128, #27
  static labyrinth + #1129, #27
  static labyrinth + #1130, #27
  static labyrinth + #1131, #27
  static labyrinth + #1132, #27
  static labyrinth + #1133, #27
  static labyrinth + #1134, #27
  static labyrinth + #1135, #27
  static labyrinth + #1136, #27
  static labyrinth + #1137, #27
  static labyrinth + #1138, #27
  static labyrinth + #1139, #27
  static labyrinth + #1140, #27
  static labyrinth + #1141, #27
  static labyrinth + #1142, #27
  static labyrinth + #1143, #27
  static labyrinth + #1144, #27
  static labyrinth + #1145, #27
  static labyrinth + #1146, #27
  static labyrinth + #1147, #27
  static labyrinth + #1148, #27
  static labyrinth + #1149, #27
  static labyrinth + #1150, #27
  static labyrinth + #1151, #27
  static labyrinth + #1152, #27
  static labyrinth + #1153, #27
  static labyrinth + #1154, #27
  static labyrinth + #1155, #27
  static labyrinth + #1156, #27
  static labyrinth + #1157, #27
  static labyrinth + #1158, #27
  static labyrinth + #1159, #3967

  ;Linha 29
  static labyrinth + #1160, #3967
  static labyrinth + #1161, #3967
  static labyrinth + #1162, #3967
  static labyrinth + #1163, #3967
  static labyrinth + #1164, #3967
  static labyrinth + #1165, #3967
  static labyrinth + #1166, #3967
  static labyrinth + #1167, #3967
  static labyrinth + #1168, #3967
  static labyrinth + #1169, #3967
  static labyrinth + #1170, #3967
  static labyrinth + #1171, #3967
  static labyrinth + #1172, #3967
  static labyrinth + #1173, #3967
  static labyrinth + #1174, #3967
  static labyrinth + #1175, #3967
  static labyrinth + #1176, #3967
  static labyrinth + #1177, #3967
  static labyrinth + #1178, #3967
  static labyrinth + #1179, #3967
  static labyrinth + #1180, #3967
  static labyrinth + #1181, #3967
  static labyrinth + #1182, #3967
  static labyrinth + #1183, #3967
  static labyrinth + #1184, #3967
  static labyrinth + #1185, #3967
  static labyrinth + #1186, #3967
  static labyrinth + #1187, #3967
  static labyrinth + #1188, #3967
  static labyrinth + #1189, #3967
  static labyrinth + #1190, #3967
  static labyrinth + #1191, #3967
  static labyrinth + #1192, #3967
  static labyrinth + #1193, #3967
  static labyrinth + #1194, #3967
  static labyrinth + #1195, #3967
  static labyrinth + #1196, #3967
  static labyrinth + #1197, #3967
  static labyrinth + #1198, #3967
  static labyrinth + #1199, #3967

; ------------

; r0 = player (#31), r1 = position (#2 initially), r2 = esc (black char; #3967)
main:
  loadn r0, #labyrinth
	call printScreen
	loadn r0, #31
	loadn r1, #390
	loadn r2, #3967
	outchar r0, r1
	jmp move

; r3 = move input, r4 = idle/char
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
		call move_checkWall
		outchar r2, r1
		mov r1, r4
		outchar r0, r1
		jmp move_checkObj

	move_down:
		loadn r3, #40
		loadn r4, #1199
		sub r4, r4, r1
		cmp r3, r4
		jgr move
		add r4, r1, r3
		call move_checkWall
		outchar r2, r1
		mov r1, r4
		outchar r0, r1
		jmp move_checkObj

	move_left:
		loadn r3, #40
		mod r4, r1, r3
		loadn r3, #3967
		cmp r4, r3
		jeq move
		mov r4, r1
		dec r4
		call move_checkWall
		outchar r2, r1
		mov r1, r4
		outchar r0, r1
		jmp move_checkObj

	move_right:
		loadn r3, #40
		mod r4, r1, r3
		loadn r3, #39
		cmp r3, r4
		jeq move
		mov r4, r1
		inc r4
		call move_checkWall
		outchar r2, r1
		mov r1, r4
		outchar r0, r1
		jmp move_checkObj

	move_checkWall:
    push r5

    loadn r5, #map
		add r5, r5, r4
    loadi r5, r5
		loadn r6, #27
		cmp r5, r6
		jeq move
		loadn r6, #2334
		cmp r5, r6
		jeq move
		
    pop r5
    rts

	move_checkObj:
    loadn r5, #map
    add r5, r5, r1
		loadi r5, r5
		loadn r6, #793
		cmp r5, r6
		jeq move_treatButton
		loadn r6, #2842
		cmp r5, r6
		jeq move_treatFlag
		jmp move
	
  ; r6 = button position
	move_treatButton:
    loadn r5, #map
		loadn r6, #276
    outchar r2, r6 
    add r5, r5, r6
		loadn r7, #3967
		storei r5, r7
		jmp move
		
	move_treatFlag:
    push r0
    push r1

    call printClearScreen
    
    loadn r0, #winStr
    loadn r1, #winPos
    loadi r1, r1
    call printString

    loadn r0, #repeatStr
    loadn r1, #repeatPos
    loadi r1, r1
    call printString
    
    pop r1
    pop r0

    jmp move_waitRestart
    
  move_waitRestart:
    inchar r3
    loadn r4, #255
    cmp r3, r4
    jeq move_waitRestart
    
    loadn r4, #'0'
    cmp r3, r4
    jeq main
    halt

; r1 = current position in screen from "printScreen"
makeScreenArray:
  push r0

  loadn r0, #map
  add r0, r0, r1
	storei r0, r3
	
  pop r0
  rts

; params : r0 = screen
printScreen:
  push r1
  push r2
  push r3

  loadn r1, #0
  loadn r2, #1200

  printScreenLoop:
    add r3,r0,r1
    loadi r3, r3
    outchar r3, r1
	  call makeScreenArray
    inc r1
    cmp r1, r2
    jne printScreenLoop

  pop r3
  pop r2
  pop r1
  rts

printClearScreen:
  push R0
  push R1
  push R2
  
  loadn r0, #3967
  loadn r1, #0
  loadn r2, #1200
  
  printClearScreenLoop:
    outchar r0, r1
    inc r1
    cmp r1, r2
    jne printClearScreenLoop
    
  pop R2
  pop R1
  pop R0
  rts

; params : r0 = string, r1 = starting position
printString:
  push r2
  push r3
  push r4

  loadn r2, #'\0' ; max position
  loadn r4, #0

  printStringLoop:
    add r3, r0, r4
    loadi r3, r3
    cmp r3, r2
    jeq printStringLeave
    outchar r3, r1
    inc r1
    inc r4
    jmp printStringLoop
  
  printStringLeave:
    pop r4
    pop r3
    pop r2
    rts