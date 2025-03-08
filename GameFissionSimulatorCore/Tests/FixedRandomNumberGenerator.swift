// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation

/// A private implementation for a RandomNumberGenerator, to be used with unit tests.
public class FixedRandomNumberGenerator: RandomNumberGenerator {

    /// Fixed values of "randomness" (not random at all).
    private let notRandomAtAll: [UInt64] = [
        4634132415377626121,
        13190363142983655647,
        12688487824784659368,
        17476508583357159952,
        7953631453946418592,
        7361739627671480434,
        17585354741934400077,
        4796881726441424156,
        11656658353418069507,
        16751910840860522188,
        11147349224792255867,
        9054863418595717074,
        6934722448257803133,
        4825472254656652778,
        5611686806270627417,
        12105918902935036893,
        3468921525507050978,
        15977785809968706783,
        10429405249494951649,
        17536717582952492439,
        9195606796264839465,
        5889228833750905060,
        4178504090239489999,
        7529665997522184748,
        3456312131356959919,
        13043340998354562222,
        17873178772941084887,
        10980419488622384943,
        9797818310843249475,
        10240718302012635257,
        6234676372189416934,
        94386576363342730,
        9278070471889135188,
        13961964061402286869,
        4322917996822680874,
        10447220389772881625,
        3966446257277545748,
        8440716264136575483,
        5172544694517201695,
        11768426922013334425,
        4337628590299427577,
        8747224454741262120,
        16549277754276001437,
        9247911789114926706,
        1007095645801921355,
        16047545473288028383,
        3002556710061547090,
        4543898691732043335,
        10809724557126409534,
        18217018308598025309,
        3313475675153683818,
        10227616695902488396,
        11305895513787735654,
        12098241661070651873,
        18015812192863697686,
        168557119995646475,
        3877034209113321304,
        8197430406277147540,
        18174260145953736017,
        10742345631303216520,
        14448559600621615325,
        13089546756340247033,
        1789403498271029769,
        17707675824834840204,
        9107494420027040592,
        17820000412985804461,
        5344648862660812463,
        17778149433372221450,
        11012882103919627637,
        783773285439094422,
        4316931864289116452,
        2789978639129822161,
        12775117389165103194,
        285468076640518179,
        2646036229872015612,
        6770069505335045816,
        1259652060120258575,
        4082591095815920567,
        4264436903628677331,
        8068606381985687213,
        1270556158716330005,
        14634286630067051258,
        7041594912515038324,
        5572756108991353543,
        7436202665412166542,
        12906204821557137833,
        16663717926808184966,
        10500584882570398635,
        2510239772511301221,
        13038749416528828214,
        2313992199547713108,
        13422375580325676524,
        1090711397958444329,
        8325311481615388896,
        16638701555081185275,
        5133808264876646529,
        11349708381520460738,
        17251090667032915504,
        17245856539650832327,
        2460202559660072435,
        16255432253904366547,
        13486657015912563468,
        4667628860467444175,
        16851062867040646614,
        12217148553342722900,
        9993157867498599486,
        4391231549937522661,
        2694095797330349435,
        440076916830600458,
        16852124390956296173,
        7871911223838320791,
        16626410322941506824,
        2628071060352601662,
        9507684337874165615,
        15113165485398471112,
        10319553496914933772,
        13116415760589516683,
        664018386023988918,
        2546432716971384661,
        9741612692086527065,
        950258109551104068,
        18445646855337438641,
        15012283072880412369,
        7258520498556154585,
        5376761778772527535,
        18288436881409300231,
        3163399610022998023,
        13844439074113982922,
        1427772745933559084,
        1495619313276471918,
        14210035735407745221,
        16101541270451113224,
        2189100112329771832,
        12967237882069132011,
        17860849387366531149,
        5906309962622598674,
        6323505211753360316,
        9273038500654586437,
        3778583416118473258,
        2080954551948725498,
        12908097825105607077,
        4642592061300137287,
        6056073610280194338,
        18353114817739762601,
        13131237464616876755,
        17490475939315067670,
        3604817779566356450,
        2901690899515650070,
        12315086582677087938,
        516382911908971962,
        12574646244526295687,
        11222135115006669732,
        580382608033467350,
        4077546230333585646,
        12121286626858888390,
        5322894213950411467,
        14606238026916084489,
        3693143808306269312,
        6755202695090029796,
        1328540637231659401,
        9030322898582824276,
        4902473137166666717,
        13200163176903878374,
        10483060864629535758,
        13121835113839103891,
        255027454154887572,
        3412164011094086412,
        14088302451723820755,
        15303588822604394138,
        17622262940036931006,
        4641378042048799659,
        6272962221420176400,
        1672608493175088274,
        17390981395274690435,
        4893108331366616352,
        3283756109330845871,
        70352584579756954,
        94475242018680620,
        13018076017138003796,
        6709124471885975465,
        16723911337378047345,
        7100799371615518046,
        17583598551452256690,
        10881264487336522918,
        11038551946396282441,
        7743422342537478839,
        16243533527541865419,
        11875783342603729372,
        8011075639585920910,
        7080744750949383737,
        18210422454726297656,
        7469489683010482053,
        6885714451330468782,
        254982620803992105,
        10316489170548821291,
        2934601101164941058,
        13858699171202746627,
        8528302101678747780,
        1403677357326870621,
        3763592540972833029,
        11644215882076148854,
        3408422110768830820,
        2762474652673461951,
        6784845430843652342,
        6256899768528021519,
        7960790660263924103,
        16412986359950870419,
        8459449534480663681,
        4580574902944242326,
        17359670066174980690,
        18355732271337918730,
        4753343645614556860,
        1379178325199455660,
        7457459779344517527,
        17248262823591810872,
        14123151981847576575,
        6148632234726344395,
        16406002171685555,
        4925140145943623109,
        14682833141082365484,
        5699425141407951181,
        11810371054331151669,
        15953689187007249287,
        17956788961971633600,
        12198903520448980215,
        14514625771779081176]

    private var index: Int = 0

    public func next() -> UInt64 {

        // Get a not so random number, based on current index.
        let random: UInt64 = notRandomAtAll[index]

        // Move the index.
        if index + 1 >= notRandomAtAll.count {
            index = 0
        } else {
            index += 1
        }

        // Return the result.
        return random
    }
}
