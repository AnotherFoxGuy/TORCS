@echo off


if not exist .\data\cars\categories\free goto data_cars_categories_free
call .\create_dir .\runtime
call .\create_dir .\runtime\categories
if exist .\data\cars\categories\free\free.xml copy .\data\cars\categories\free\free.xml .\runtime\categories\free.xml
:data_cars_categories_free

if not exist .\data\cars\categories\Offroad-4WD-GrA goto data_cars_categories_Offroad_4WD_GrA
call .\create_dir .\runtime
call .\create_dir .\runtime\categories
if exist .\data\cars\categories\Offroad-4WD-GrA\Offroad-4WD-GrA.xml copy .\data\cars\categories\Offroad-4WD-GrA\Offroad-4WD-GrA.xml .\runtime\categories\Offroad-4WD-GrA.xml
:data_cars_categories_Offroad_4WD_GrA

if not exist .\data\cars\categories\Offroad-RWD-GrA goto data_cars_categories_Offroad_RWD_GrA
call .\create_dir .\runtime
call .\create_dir .\runtime\categories
if exist .\data\cars\categories\Offroad-RWD-GrA\Offroad-RWD-GrA.xml copy .\data\cars\categories\Offroad-RWD-GrA\Offroad-RWD-GrA.xml .\runtime\categories\Offroad-RWD-GrA.xml
:data_cars_categories_Offroad_RWD_GrA

if not exist .\data\cars\categories\Track-4WD-GrB goto data_cars_categories_Track_4WD_GrB
call .\create_dir .\runtime
call .\create_dir .\runtime\categories
if exist .\data\cars\categories\Track-4WD-GrB\Track-4WD-GrB.xml copy .\data\cars\categories\Track-4WD-GrB\Track-4WD-GrB.xml .\runtime\categories\Track-4WD-GrB.xml
:data_cars_categories_Track_4WD_GrB

if not exist .\data\cars\categories\Track-FWD-GrA goto data_cars_categories_Track_FWD_GrA
call .\create_dir .\runtime
call .\create_dir .\runtime\categories
if exist .\data\cars\categories\Track-FWD-GrA\Track-FWD-GrA.xml copy .\data\cars\categories\Track-FWD-GrA\Track-FWD-GrA.xml .\runtime\categories\Track-FWD-GrA.xml
:data_cars_categories_Track_FWD_GrA

if not exist .\data\cars\categories\Track-FWD-GrB goto data_cars_categories_Track_FWD_GrB
call .\create_dir .\runtime
call .\create_dir .\runtime\categories
if exist .\data\cars\categories\Track-FWD-GrB\Track-FWD-GrB.xml copy .\data\cars\categories\Track-FWD-GrB\Track-FWD-GrB.xml .\runtime\categories\Track-FWD-GrB.xml
:data_cars_categories_Track_FWD_GrB

if not exist .\data\cars\categories\Track-RWD-GrA goto data_cars_categories_Track_RWD_GrA
call .\create_dir .\runtime
call .\create_dir .\runtime\categories
if exist .\data\cars\categories\Track-RWD-GrA\Track-RWD-GrA.xml copy .\data\cars\categories\Track-RWD-GrA\Track-RWD-GrA.xml .\runtime\categories\Track-RWD-GrA.xml
:data_cars_categories_Track_RWD_GrA

if not exist .\data\cars\categories\Track-RWD-GrB goto data_cars_categories_Track_RWD_GrB
call .\create_dir .\runtime
call .\create_dir .\runtime\categories
if exist .\data\cars\categories\Track-RWD-GrB\Track-RWD-GrB.xml copy .\data\cars\categories\Track-RWD-GrB\Track-RWD-GrB.xml .\runtime\categories\Track-RWD-GrB.xml
:data_cars_categories_Track_RWD_GrB

if not exist .\data\cars\categories\Track-RWD-GrC goto data_cars_categories_Track_RWD_GrC
call .\create_dir .\runtime
call .\create_dir .\runtime\categories
if exist .\data\cars\categories\Track-RWD-GrC\Track-RWD-GrC.xml copy .\data\cars\categories\Track-RWD-GrC\Track-RWD-GrC.xml .\runtime\categories\Track-RWD-GrC.xml
:data_cars_categories_Track_RWD_GrC

if not exist .\data\cars\models\155-DTM goto data_cars_models_155_DTM
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\155-DTM
if exist .\data\cars\models\155-DTM\155-DTM.xml copy .\data\cars\models\155-DTM\155-DTM.xml .\runtime\cars\155-DTM\155-DTM.xml
if exist .\data\cars\models\155-DTM\texmapper.xml copy .\data\cars\models\155-DTM\texmapper.xml .\runtime\cars\155-DTM\texmapper.xml
if exist .\data\cars\models\155-DTM\155-DTM-1024.rgb copy .\data\cars\models\155-DTM\155-DTM-1024.rgb .\runtime\cars\155-DTM\155-DTM-1024.rgb
if exist .\data\cars\models\155-DTM\155-DTM.rgb copy .\data\cars\models\155-DTM\155-DTM.rgb .\runtime\cars\155-DTM\155-DTM.rgb
if exist .\data\cars\models\155-DTM\tex-wheel.rgb copy .\data\cars\models\155-DTM\tex-wheel.rgb .\runtime\cars\155-DTM\tex-wheel.rgb
if exist .\data\cars\models\155-DTM\155-DTM.ac copy .\data\cars\models\155-DTM\155-DTM.ac .\runtime\cars\155-DTM\155-DTM.ac
if exist .\data\cars\models\155-DTM\155-DTM-base.ac copy .\data\cars\models\155-DTM\155-DTM-base.ac .\runtime\cars\155-DTM\155-DTM-base.ac
if exist .\data\cars\models\155-DTM\155-DTM-src.ac copy .\data\cars\models\155-DTM\155-DTM-src.ac .\runtime\cars\155-DTM\155-DTM-src.ac
:data_cars_models_155_DTM

if not exist .\data\cars\models\206W10 goto data_cars_models_206W10
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\206W10
if exist .\data\cars\models\206W10\206W10.xml copy .\data\cars\models\206W10\206W10.xml .\runtime\cars\206W10\206W10.xml
if exist .\data\cars\models\206W10\206W10.rgb copy .\data\cars\models\206W10\206W10.rgb .\runtime\cars\206W10\206W10.rgb
if exist .\data\cars\models\206W10\tex-wheel.rgb copy .\data\cars\models\206W10\tex-wheel.rgb .\runtime\cars\206W10\tex-wheel.rgb
if exist .\data\cars\models\206W10\206W10.acc copy .\data\cars\models\206W10\206W10.acc .\runtime\cars\206W10\206W10.acc
if exist .\data\cars\models\206W10\readme.txt copy .\data\cars\models\206W10\readme.txt .\runtime\cars\206W10\readme.txt
:data_cars_models_206W10

if not exist .\data\cars\models\306W61 goto data_cars_models_306W61
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\306W61
if exist .\data\cars\models\306W61\306W61.xml copy .\data\cars\models\306W61\306W61.xml .\runtime\cars\306W61\306W61.xml
if exist .\data\cars\models\306W61\306W61.rgb copy .\data\cars\models\306W61\306W61.rgb .\runtime\cars\306W61\306W61.rgb
if exist .\data\cars\models\306W61\tex-wheel.rgb copy .\data\cars\models\306W61\tex-wheel.rgb .\runtime\cars\306W61\tex-wheel.rgb
if exist .\data\cars\models\306W61\306W61.acc copy .\data\cars\models\306W61\306W61.acc .\runtime\cars\306W61\306W61.acc
if exist .\data\cars\models\306W61\readme.txt copy .\data\cars\models\306W61\readme.txt .\runtime\cars\306W61\readme.txt
:data_cars_models_306W61

if not exist .\data\cars\models\360-challenge goto data_cars_models_360_challenge
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\360-challenge
if exist .\data\cars\models\360-challenge\texmapper.xml copy .\data\cars\models\360-challenge\texmapper.xml .\runtime\cars\360-challenge\texmapper.xml
if exist .\data\cars\models\360-challenge\tex-wheel.rgb copy .\data\cars\models\360-challenge\tex-wheel.rgb .\runtime\cars\360-challenge\tex-wheel.rgb
if exist .\data\cars\models\360-challenge\360-challenge-base.ac copy .\data\cars\models\360-challenge\360-challenge-base.ac .\runtime\cars\360-challenge\360-challenge-base.ac
if exist .\data\cars\models\360-challenge\360-challenge.xml copy .\data\cars\models\360-challenge\360-challenge.xml .\runtime\cars\360-challenge\360-challenge.xml
if exist .\data\cars\models\360-challenge\360-challenge.ac copy .\data\cars\models\360-challenge\360-challenge.ac .\runtime\cars\360-challenge\360-challenge.ac
if exist .\data\cars\models\360-challenge\360-challenge.acc copy .\data\cars\models\360-challenge\360-challenge.acc .\runtime\cars\360-challenge\360-challenge.acc
if exist .\data\cars\models\360-challenge\360-challenge.rgb copy .\data\cars\models\360-challenge\360-challenge.rgb .\runtime\cars\360-challenge\360-challenge.rgb
:data_cars_models_360_challenge

if not exist .\data\cars\models\360-modena goto data_cars_models_360_modena
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\360-modena
if exist .\data\cars\models\360-modena\360-modena.xml copy .\data\cars\models\360-modena\360-modena.xml .\runtime\cars\360-modena\360-modena.xml
if exist .\data\cars\models\360-modena\360-modena.ac copy .\data\cars\models\360-modena\360-modena.ac .\runtime\cars\360-modena\360-modena.ac
if exist .\data\cars\models\360-modena\360-modena-lod1.ac copy .\data\cars\models\360-modena\360-modena-lod1.ac .\runtime\cars\360-modena\360-modena-lod1.ac
if exist .\data\cars\models\360-modena\texmapper.xml copy .\data\cars\models\360-modena\texmapper.xml .\runtime\cars\360-modena\texmapper.xml
if exist .\data\cars\models\360-modena\tex-wheel.rgb copy .\data\cars\models\360-modena\tex-wheel.rgb .\runtime\cars\360-modena\tex-wheel.rgb
if exist .\data\cars\models\360-modena\360-modena.rgb copy .\data\cars\models\360-modena\360-modena.rgb .\runtime\cars\360-modena\360-modena.rgb
if exist .\data\cars\models\360-modena\360-modena-src.ac copy .\data\cars\models\360-modena\360-modena-src.ac .\runtime\cars\360-modena\360-modena-src.ac
:data_cars_models_360_modena

if not exist .\data\cars\models\acura-nsx-sz goto data_cars_models_acura_nsx_sz
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\acura-nsx-sz
if exist .\data\cars\models\acura-nsx-sz\acura-nsx-sz.xml copy .\data\cars\models\acura-nsx-sz\acura-nsx-sz.xml .\runtime\cars\acura-nsx-sz\acura-nsx-sz.xml
if exist .\data\cars\models\acura-nsx-sz\acura-nsx-sz.ac copy .\data\cars\models\acura-nsx-sz\acura-nsx-sz.ac .\runtime\cars\acura-nsx-sz\acura-nsx-sz.ac
if exist .\data\cars\models\acura-nsx-sz\tex-wheel.rgb copy .\data\cars\models\acura-nsx-sz\tex-wheel.rgb .\runtime\cars\acura-nsx-sz\tex-wheel.rgb
if exist .\data\cars\models\acura-nsx-sz\acura-nsx-sz.rgb copy .\data\cars\models\acura-nsx-sz\acura-nsx-sz.rgb .\runtime\cars\acura-nsx-sz\acura-nsx-sz.rgb
if exist .\data\cars\models\acura-nsx-sz\acura-nsx-sz-lod1.ac copy .\data\cars\models\acura-nsx-sz\acura-nsx-sz-lod1.ac .\runtime\cars\acura-nsx-sz\acura-nsx-sz-lod1.ac
if exist .\data\cars\models\acura-nsx-sz\acura-nsx-sz-src.ac copy .\data\cars\models\acura-nsx-sz\acura-nsx-sz-src.ac .\runtime\cars\acura-nsx-sz\acura-nsx-sz-src.ac
:data_cars_models_acura_nsx_sz

if not exist .\data\cars\models\alpha-156-rk goto data_cars_models_alpha_156_rk
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\alpha-156-rk
if exist .\data\cars\models\alpha-156-rk\alpha-156-rk.xml copy .\data\cars\models\alpha-156-rk\alpha-156-rk.xml .\runtime\cars\alpha-156-rk\alpha-156-rk.xml
if exist .\data\cars\models\alpha-156-rk\alpha-156-rk.rgb copy .\data\cars\models\alpha-156-rk\alpha-156-rk.rgb .\runtime\cars\alpha-156-rk\alpha-156-rk.rgb
if exist .\data\cars\models\alpha-156-rk\tex-wheel.rgb copy .\data\cars\models\alpha-156-rk\tex-wheel.rgb .\runtime\cars\alpha-156-rk\tex-wheel.rgb
if exist .\data\cars\models\alpha-156-rk\1562.ac copy .\data\cars\models\alpha-156-rk\1562.ac .\runtime\cars\alpha-156-rk\1562.ac
if exist .\data\cars\models\alpha-156-rk\alpha-156-rk.ac copy .\data\cars\models\alpha-156-rk\alpha-156-rk.ac .\runtime\cars\alpha-156-rk\alpha-156-rk.ac
if exist .\data\cars\models\alpha-156-rk\alpha-156-rk-lod.ac copy .\data\cars\models\alpha-156-rk\alpha-156-rk-lod.ac .\runtime\cars\alpha-156-rk\alpha-156-rk-lod.ac
if exist .\data\cars\models\alpha-156-rk\alpha-156-rk-src.ac copy .\data\cars\models\alpha-156-rk\alpha-156-rk-src.ac .\runtime\cars\alpha-156-rk\alpha-156-rk-src.ac
if exist .\data\cars\models\alpha-156-rk\Readme.txt copy .\data\cars\models\alpha-156-rk\Readme.txt .\runtime\cars\alpha-156-rk\Readme.txt
:data_cars_models_alpha_156_rk

if not exist .\data\cars\models\baja-bug goto data_cars_models_baja_bug
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\baja-bug
if exist .\data\cars\models\baja-bug\baja-bug-base.ac copy .\data\cars\models\baja-bug\baja-bug-base.ac .\runtime\cars\baja-bug\baja-bug-base.ac
if exist .\data\cars\models\baja-bug\baja-bug.ac copy .\data\cars\models\baja-bug\baja-bug.ac .\runtime\cars\baja-bug\baja-bug.ac
if exist .\data\cars\models\baja-bug\baja-bug.acc copy .\data\cars\models\baja-bug\baja-bug.acc .\runtime\cars\baja-bug\baja-bug.acc
if exist .\data\cars\models\baja-bug\baja-bug.rgb copy .\data\cars\models\baja-bug\baja-bug.rgb .\runtime\cars\baja-bug\baja-bug.rgb
if exist .\data\cars\models\baja-bug\baja-bug.xml copy .\data\cars\models\baja-bug\baja-bug.xml .\runtime\cars\baja-bug\baja-bug.xml
if exist .\data\cars\models\baja-bug\texmapper.xml copy .\data\cars\models\baja-bug\texmapper.xml .\runtime\cars\baja-bug\texmapper.xml
if exist .\data\cars\models\baja-bug\tex-wheel.rgb copy .\data\cars\models\baja-bug\tex-wheel.rgb .\runtime\cars\baja-bug\tex-wheel.rgb
:data_cars_models_baja_bug

if not exist .\data\cars\models\buggy goto data_cars_models_buggy
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\buggy
if exist .\data\cars\models\buggy\buggy.xml copy .\data\cars\models\buggy\buggy.xml .\runtime\cars\buggy\buggy.xml
if exist .\data\cars\models\buggy\buggy.ac copy .\data\cars\models\buggy\buggy.ac .\runtime\cars\buggy\buggy.ac
if exist .\data\cars\models\buggy\buggy.rgb copy .\data\cars\models\buggy\buggy.rgb .\runtime\cars\buggy\buggy.rgb
if exist .\data\cars\models\buggy\tex-wheel.rgb copy .\data\cars\models\buggy\tex-wheel.rgb .\runtime\cars\buggy\tex-wheel.rgb
if exist .\data\cars\models\buggy\buggy-src.ac copy .\data\cars\models\buggy\buggy-src.ac .\runtime\cars\buggy\buggy-src.ac
:data_cars_models_buggy

if not exist .\data\cars\models\cg-nascar-fwd goto data_cars_models_cg_nascar_fwd
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\cg-nascar-fwd
if exist .\data\cars\models\cg-nascar-fwd\cg-nascar-fwd.xml copy .\data\cars\models\cg-nascar-fwd\cg-nascar-fwd.xml .\runtime\cars\cg-nascar-fwd\cg-nascar-fwd.xml
if exist .\data\cars\models\cg-nascar-fwd\cg-nascar-fwd.ac copy .\data\cars\models\cg-nascar-fwd\cg-nascar-fwd.ac .\runtime\cars\cg-nascar-fwd\cg-nascar-fwd.ac
if exist .\data\cars\models\cg-nascar-fwd\cg-nascar-fwd.rgb copy .\data\cars\models\cg-nascar-fwd\cg-nascar-fwd.rgb .\runtime\cars\cg-nascar-fwd\cg-nascar-fwd.rgb
if exist .\data\cars\models\cg-nascar-fwd\tex-wheel.rgb copy .\data\cars\models\cg-nascar-fwd\tex-wheel.rgb .\runtime\cars\cg-nascar-fwd\tex-wheel.rgb
:data_cars_models_cg_nascar_fwd

if not exist .\data\cars\models\cg-nascar-rwd goto data_cars_models_cg_nascar_rwd
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\cg-nascar-rwd
if exist .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd.xml copy .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd.xml .\runtime\cars\cg-nascar-rwd\cg-nascar-rwd.xml
if exist .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd.ac copy .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd.ac .\runtime\cars\cg-nascar-rwd\cg-nascar-rwd.ac
if exist .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd-lod1.ac copy .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd-lod1.ac .\runtime\cars\cg-nascar-rwd\cg-nascar-rwd-lod1.ac
if exist .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd.rgb copy .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd.rgb .\runtime\cars\cg-nascar-rwd\cg-nascar-rwd.rgb
if exist .\data\cars\models\cg-nascar-rwd\tex-wheel.rgb copy .\data\cars\models\cg-nascar-rwd\tex-wheel.rgb .\runtime\cars\cg-nascar-rwd\tex-wheel.rgb
if exist .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd-src.ac copy .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd-src.ac .\runtime\cars\cg-nascar-rwd\cg-nascar-rwd-src.ac
:data_cars_models_cg_nascar_rwd

if not exist .\data\cars\models\clkdtm goto data_cars_models_clkdtm
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\clkdtm
if exist .\data\cars\models\clkdtm\clkdtm.xml copy .\data\cars\models\clkdtm\clkdtm.xml .\runtime\cars\clkdtm\clkdtm.xml
if exist .\data\cars\models\clkdtm\clkdtm.rgb copy .\data\cars\models\clkdtm\clkdtm.rgb .\runtime\cars\clkdtm\clkdtm.rgb
if exist .\data\cars\models\clkdtm\tex-wheel.rgb copy .\data\cars\models\clkdtm\tex-wheel.rgb .\runtime\cars\clkdtm\tex-wheel.rgb
if exist .\data\cars\models\clkdtm\clkdtm.ac copy .\data\cars\models\clkdtm\clkdtm.ac .\runtime\cars\clkdtm\clkdtm.ac
if exist .\data\cars\models\clkdtm\clkdtm-src.ac copy .\data\cars\models\clkdtm\clkdtm-src.ac .\runtime\cars\clkdtm\clkdtm-src.ac
if exist .\data\cars\models\clkdtm\clkdtm.xcf copy .\data\cars\models\clkdtm\clkdtm.xcf .\runtime\cars\clkdtm\clkdtm.xcf
:data_cars_models_clkdtm

if not exist .\data\cars\models\corvette goto data_cars_models_corvette
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\corvette
if exist .\data\cars\models\corvette\corvette.xml copy .\data\cars\models\corvette\corvette.xml .\runtime\cars\corvette\corvette.xml
if exist .\data\cars\models\corvette\corvette-base.ac copy .\data\cars\models\corvette\corvette-base.ac .\runtime\cars\corvette\corvette-base.ac
if exist .\data\cars\models\corvette\corvette.ac copy .\data\cars\models\corvette\corvette.ac .\runtime\cars\corvette\corvette.ac
if exist .\data\cars\models\corvette\tex-wheel.rgb copy .\data\cars\models\corvette\tex-wheel.rgb .\runtime\cars\corvette\tex-wheel.rgb
if exist .\data\cars\models\corvette\texmapper.xml copy .\data\cars\models\corvette\texmapper.xml .\runtime\cars\corvette\texmapper.xml
if exist .\data\cars\models\corvette\corvette.rgb copy .\data\cars\models\corvette\corvette.rgb .\runtime\cars\corvette\corvette.rgb
:data_cars_models_corvette

if not exist .\data\cars\models\CORW61 goto data_cars_models_CORW61
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\CORW61
if exist .\data\cars\models\CORW61\CORW61.xml copy .\data\cars\models\CORW61\CORW61.xml .\runtime\cars\CORW61\CORW61.xml
if exist .\data\cars\models\CORW61\CORW61.rgb copy .\data\cars\models\CORW61\CORW61.rgb .\runtime\cars\CORW61\CORW61.rgb
if exist .\data\cars\models\CORW61\tex-wheel.rgb copy .\data\cars\models\CORW61\tex-wheel.rgb .\runtime\cars\CORW61\tex-wheel.rgb
if exist .\data\cars\models\CORW61\CORW61.acc copy .\data\cars\models\CORW61\CORW61.acc .\runtime\cars\CORW61\CORW61.acc
if exist .\data\cars\models\CORW61\readme.txt copy .\data\cars\models\CORW61\readme.txt .\runtime\cars\CORW61\readme.txt
:data_cars_models_CORW61

if not exist .\data\cars\models\EVOWRC61 goto data_cars_models_EVOWRC61
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\EVOWRC61
if exist .\data\cars\models\EVOWRC61\EVOWRC61.xml copy .\data\cars\models\EVOWRC61\EVOWRC61.xml .\runtime\cars\EVOWRC61\EVOWRC61.xml
if exist .\data\cars\models\EVOWRC61\EVOWRC61.rgb copy .\data\cars\models\EVOWRC61\EVOWRC61.rgb .\runtime\cars\EVOWRC61\EVOWRC61.rgb
if exist .\data\cars\models\EVOWRC61\tex-wheel.rgb copy .\data\cars\models\EVOWRC61\tex-wheel.rgb .\runtime\cars\EVOWRC61\tex-wheel.rgb
if exist .\data\cars\models\EVOWRC61\EVOWRC61.acc copy .\data\cars\models\EVOWRC61\EVOWRC61.acc .\runtime\cars\EVOWRC61\EVOWRC61.acc
if exist .\data\cars\models\EVOWRC61\readme.txt copy .\data\cars\models\EVOWRC61\readme.txt .\runtime\cars\EVOWRC61\readme.txt
:data_cars_models_EVOWRC61

if not exist .\data\cars\models\FOCW61 goto data_cars_models_FOCW61
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\FOCW61
if exist .\data\cars\models\FOCW61\FOCW61.xml copy .\data\cars\models\FOCW61\FOCW61.xml .\runtime\cars\FOCW61\FOCW61.xml
if exist .\data\cars\models\FOCW61\FOCW61.rgb copy .\data\cars\models\FOCW61\FOCW61.rgb .\runtime\cars\FOCW61\FOCW61.rgb
if exist .\data\cars\models\FOCW61\tex-wheel.rgb copy .\data\cars\models\FOCW61\tex-wheel.rgb .\runtime\cars\FOCW61\tex-wheel.rgb
if exist .\data\cars\models\FOCW61\FOCW61.acc copy .\data\cars\models\FOCW61\FOCW61.acc .\runtime\cars\FOCW61\FOCW61.acc
if exist .\data\cars\models\FOCW61\readme.txt copy .\data\cars\models\FOCW61\readme.txt .\runtime\cars\FOCW61\readme.txt
:data_cars_models_FOCW61

if not exist .\data\cars\models\gt40 goto data_cars_models_gt40
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\gt40
if exist .\data\cars\models\gt40\gt40.xml copy .\data\cars\models\gt40\gt40.xml .\runtime\cars\gt40\gt40.xml
if exist .\data\cars\models\gt40\gt40.acc copy .\data\cars\models\gt40\gt40.acc .\runtime\cars\gt40\gt40.acc
if exist .\data\cars\models\gt40\tex-wheel.rgb copy .\data\cars\models\gt40\tex-wheel.rgb .\runtime\cars\gt40\tex-wheel.rgb
if exist .\data\cars\models\gt40\gt40.rgb copy .\data\cars\models\gt40\gt40.rgb .\runtime\cars\gt40\gt40.rgb
if exist .\data\cars\models\gt40\gt40-src.ac copy .\data\cars\models\gt40\gt40-src.ac .\runtime\cars\gt40\gt40-src.ac
:data_cars_models_gt40

if not exist .\data\cars\models\lotus-gt1 goto data_cars_models_lotus_gt1
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\lotus-gt1
if exist .\data\cars\models\lotus-gt1\lotus-gt1.xml copy .\data\cars\models\lotus-gt1\lotus-gt1.xml .\runtime\cars\lotus-gt1\lotus-gt1.xml
if exist .\data\cars\models\lotus-gt1\lotus-gt1.ac copy .\data\cars\models\lotus-gt1\lotus-gt1.ac .\runtime\cars\lotus-gt1\lotus-gt1.ac
if exist .\data\cars\models\lotus-gt1\lotus-gt1-base.ac copy .\data\cars\models\lotus-gt1\lotus-gt1-base.ac .\runtime\cars\lotus-gt1\lotus-gt1-base.ac
if exist .\data\cars\models\lotus-gt1\texmapper.xml copy .\data\cars\models\lotus-gt1\texmapper.xml .\runtime\cars\lotus-gt1\texmapper.xml
if exist .\data\cars\models\lotus-gt1\tex-wheel.rgb copy .\data\cars\models\lotus-gt1\tex-wheel.rgb .\runtime\cars\lotus-gt1\tex-wheel.rgb
if exist .\data\cars\models\lotus-gt1\lotus-gt1.rgb copy .\data\cars\models\lotus-gt1\lotus-gt1.rgb .\runtime\cars\lotus-gt1\lotus-gt1.rgb
if exist .\data\cars\models\lotus-gt1\lotus-gt1-512.rgb copy .\data\cars\models\lotus-gt1\lotus-gt1-512.rgb .\runtime\cars\lotus-gt1\lotus-gt1-512.rgb
if exist .\data\cars\models\lotus-gt1\lotus-gt1-src.ac copy .\data\cars\models\lotus-gt1\lotus-gt1-src.ac .\runtime\cars\lotus-gt1\lotus-gt1-src.ac
:data_cars_models_lotus_gt1

if not exist .\data\cars\models\mclaren-f1 goto data_cars_models_mclaren_f1
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\mclaren-f1
if exist .\data\cars\models\mclaren-f1\mclaren-f1.xml copy .\data\cars\models\mclaren-f1\mclaren-f1.xml .\runtime\cars\mclaren-f1\mclaren-f1.xml
if exist .\data\cars\models\mclaren-f1\mclaren-f1.ac copy .\data\cars\models\mclaren-f1\mclaren-f1.ac .\runtime\cars\mclaren-f1\mclaren-f1.ac
if exist .\data\cars\models\mclaren-f1\mclaren-f1-lod1.ac copy .\data\cars\models\mclaren-f1\mclaren-f1-lod1.ac .\runtime\cars\mclaren-f1\mclaren-f1-lod1.ac
if exist .\data\cars\models\mclaren-f1\texmapper.xml copy .\data\cars\models\mclaren-f1\texmapper.xml .\runtime\cars\mclaren-f1\texmapper.xml
if exist .\data\cars\models\mclaren-f1\tex-wheel.rgb copy .\data\cars\models\mclaren-f1\tex-wheel.rgb .\runtime\cars\mclaren-f1\tex-wheel.rgb
if exist .\data\cars\models\mclaren-f1\mclaren-f1.rgb copy .\data\cars\models\mclaren-f1\mclaren-f1.rgb .\runtime\cars\mclaren-f1\mclaren-f1.rgb
if exist .\data\cars\models\mclaren-f1\mclaren-f1-512.rgb copy .\data\cars\models\mclaren-f1\mclaren-f1-512.rgb .\runtime\cars\mclaren-f1\mclaren-f1-512.rgb
if exist .\data\cars\models\mclaren-f1\mclaren-f1-src.ac copy .\data\cars\models\mclaren-f1\mclaren-f1-src.ac .\runtime\cars\mclaren-f1\mclaren-f1-src.ac
:data_cars_models_mclaren_f1

if not exist .\data\cars\models\p406 goto data_cars_models_p406
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\p406
if exist .\data\cars\models\p406\p406.xml copy .\data\cars\models\p406\p406.xml .\runtime\cars\p406\p406.xml
if exist .\data\cars\models\p406\texmapper.xml copy .\data\cars\models\p406\texmapper.xml .\runtime\cars\p406\texmapper.xml
if exist .\data\cars\models\p406\p406.ac copy .\data\cars\models\p406\p406.ac .\runtime\cars\p406\p406.ac
if exist .\data\cars\models\p406\p406-base.ac copy .\data\cars\models\p406\p406-base.ac .\runtime\cars\p406\p406-base.ac
if exist .\data\cars\models\p406\p406-512.rgb copy .\data\cars\models\p406\p406-512.rgb .\runtime\cars\p406\p406-512.rgb
if exist .\data\cars\models\p406\p406.rgb copy .\data\cars\models\p406\p406.rgb .\runtime\cars\p406\p406.rgb
if exist .\data\cars\models\p406\tex-wheel.rgb copy .\data\cars\models\p406\tex-wheel.rgb .\runtime\cars\p406\tex-wheel.rgb
:data_cars_models_p406

if not exist .\data\cars\models\porsche-gt1 goto data_cars_models_porsche_gt1
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\porsche-gt1
if exist .\data\cars\models\porsche-gt1\porsche-gt1.xml copy .\data\cars\models\porsche-gt1\porsche-gt1.xml .\runtime\cars\porsche-gt1\porsche-gt1.xml
if exist .\data\cars\models\porsche-gt1\porsche-gt1.ac copy .\data\cars\models\porsche-gt1\porsche-gt1.ac .\runtime\cars\porsche-gt1\porsche-gt1.ac
if exist .\data\cars\models\porsche-gt1\porsche-gt1-lod1.ac copy .\data\cars\models\porsche-gt1\porsche-gt1-lod1.ac .\runtime\cars\porsche-gt1\porsche-gt1-lod1.ac
if exist .\data\cars\models\porsche-gt1\tex-wheel.rgb copy .\data\cars\models\porsche-gt1\tex-wheel.rgb .\runtime\cars\porsche-gt1\tex-wheel.rgb
if exist .\data\cars\models\porsche-gt1\porsche-gt1.rgb copy .\data\cars\models\porsche-gt1\porsche-gt1.rgb .\runtime\cars\porsche-gt1\porsche-gt1.rgb
if exist .\data\cars\models\porsche-gt1\porsche-gt1-src.ac copy .\data\cars\models\porsche-gt1\porsche-gt1-src.ac .\runtime\cars\porsche-gt1\porsche-gt1-src.ac
:data_cars_models_porsche_gt1

if not exist .\data\cars\models\porsche-gt3rs goto data_cars_models_porsche_gt3rs
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\porsche-gt3rs
if exist .\data\cars\models\porsche-gt3rs\porsche-gt3rs.xml copy .\data\cars\models\porsche-gt3rs\porsche-gt3rs.xml .\runtime\cars\porsche-gt3rs\porsche-gt3rs.xml
if exist .\data\cars\models\porsche-gt3rs\porsche-gt3rs.ac copy .\data\cars\models\porsche-gt3rs\porsche-gt3rs.ac .\runtime\cars\porsche-gt3rs\porsche-gt3rs.ac
if exist .\data\cars\models\porsche-gt3rs\porsche-gt3rs.rgb copy .\data\cars\models\porsche-gt3rs\porsche-gt3rs.rgb .\runtime\cars\porsche-gt3rs\porsche-gt3rs.rgb
if exist .\data\cars\models\porsche-gt3rs\tex-wheel.rgb copy .\data\cars\models\porsche-gt3rs\tex-wheel.rgb .\runtime\cars\porsche-gt3rs\tex-wheel.rgb
if exist .\data\cars\models\porsche-gt3rs\porsche-gt3rs-src.ac copy .\data\cars\models\porsche-gt3rs\porsche-gt3rs-src.ac .\runtime\cars\porsche-gt3rs\porsche-gt3rs-src.ac
if exist .\data\cars\models\porsche-gt3rs\porsche-gt3rs-lod1.acc copy .\data\cars\models\porsche-gt3rs\porsche-gt3rs-lod1.acc .\runtime\cars\porsche-gt3rs\porsche-gt3rs-lod1.acc
:data_cars_models_porsche_gt3rs

if not exist .\data\cars\models\SWRC62 goto data_cars_models_SWRC62
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\SWRC62
if exist .\data\cars\models\SWRC62\SWRC62.xml copy .\data\cars\models\SWRC62\SWRC62.xml .\runtime\cars\SWRC62\SWRC62.xml
if exist .\data\cars\models\SWRC62\SWRC62.rgb copy .\data\cars\models\SWRC62\SWRC62.rgb .\runtime\cars\SWRC62\SWRC62.rgb
if exist .\data\cars\models\SWRC62\tex-wheel.rgb copy .\data\cars\models\SWRC62\tex-wheel.rgb .\runtime\cars\SWRC62\tex-wheel.rgb
if exist .\data\cars\models\SWRC62\SWRC62.acc copy .\data\cars\models\SWRC62\SWRC62.acc .\runtime\cars\SWRC62\SWRC62.acc
if exist .\data\cars\models\SWRC62\readme.txt copy .\data\cars\models\SWRC62\readme.txt .\runtime\cars\SWRC62\readme.txt
:data_cars_models_SWRC62

if not exist .\data\cars\models\viper-gts-r goto data_cars_models_viper_gts_r
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\viper-gts-r
if exist .\data\cars\models\viper-gts-r\viper-gts-r.xml copy .\data\cars\models\viper-gts-r\viper-gts-r.xml .\runtime\cars\viper-gts-r\viper-gts-r.xml
if exist .\data\cars\models\viper-gts-r\tex-wheel.rgb copy .\data\cars\models\viper-gts-r\tex-wheel.rgb .\runtime\cars\viper-gts-r\tex-wheel.rgb
if exist .\data\cars\models\viper-gts-r\viper-gts-r.rgb copy .\data\cars\models\viper-gts-r\viper-gts-r.rgb .\runtime\cars\viper-gts-r\viper-gts-r.rgb
if exist .\data\cars\models\viper-gts-r\viper-gts-r.ac copy .\data\cars\models\viper-gts-r\viper-gts-r.ac .\runtime\cars\viper-gts-r\viper-gts-r.ac
if exist .\data\cars\models\viper-gts-r\viper-gts-r-512.rgb copy .\data\cars\models\viper-gts-r\viper-gts-r-512.rgb .\runtime\cars\viper-gts-r\viper-gts-r-512.rgb
if exist .\data\cars\models\viper-gts-r\viper-gts-r-base.ac copy .\data\cars\models\viper-gts-r\viper-gts-r-base.ac .\runtime\cars\viper-gts-r\viper-gts-r-base.ac
if exist .\data\cars\models\viper-gts-r\texmapper.xml copy .\data\cars\models\viper-gts-r\texmapper.xml .\runtime\cars\viper-gts-r\texmapper.xml
if exist .\data\cars\models\viper-gts-r\viper-gts-r-src.ac copy .\data\cars\models\viper-gts-r\viper-gts-r-src.ac .\runtime\cars\viper-gts-r\viper-gts-r-src.ac
:data_cars_models_viper_gts_r

if not exist .\data\cars\models\xj-220 goto data_cars_models_xj_220
call .\create_dir .\runtime
call .\create_dir .\runtime\cars
call .\create_dir .\runtime\cars\xj-220
if exist .\data\cars\models\xj-220\xj-220.xml copy .\data\cars\models\xj-220\xj-220.xml .\runtime\cars\xj-220\xj-220.xml
if exist .\data\cars\models\xj-220\xj-220.rgb copy .\data\cars\models\xj-220\xj-220.rgb .\runtime\cars\xj-220\xj-220.rgb
if exist .\data\cars\models\xj-220\xj-220.ac copy .\data\cars\models\xj-220\xj-220.ac .\runtime\cars\xj-220\xj-220.ac
if exist .\data\cars\models\xj-220\tex-wheel.rgb copy .\data\cars\models\xj-220\tex-wheel.rgb .\runtime\cars\xj-220\tex-wheel.rgb
if exist .\data\cars\models\xj-220\xj-220-base.ac copy .\data\cars\models\xj-220\xj-220-base.ac .\runtime\cars\xj-220\xj-220-base.ac
if exist .\data\cars\models\xj-220\texmapper.xml copy .\data\cars\models\xj-220\texmapper.xml .\runtime\cars\xj-220\texmapper.xml
if exist .\data\cars\models\xj-220\xj-220-src.ac copy .\data\cars\models\xj-220\xj-220-src.ac .\runtime\cars\xj-220\xj-220-src.ac
:data_cars_models_xj_220

if not exist .\data\data\fonts goto data_data_fonts
call .\create_dir .\runtime
call .\create_dir .\runtime\data
call .\create_dir .\runtime\data\fonts
if exist .\data\data\fonts\b5.glf copy .\data\data\fonts\b5.glf .\runtime\data\fonts\b5.glf
if exist .\data\data\fonts\b6.glf copy .\data\data\fonts\b6.glf .\runtime\data\fonts\b6.glf
if exist .\data\data\fonts\b7.glf copy .\data\data\fonts\b7.glf .\runtime\data\fonts\b7.glf
if exist .\data\data\fonts\digital.glf copy .\data\data\fonts\digital.glf .\runtime\data\fonts\digital.glf
if exist .\data\data\fonts\fragile.glf copy .\data\data\fonts\fragile.glf .\runtime\data\fonts\fragile.glf
if exist .\data\data\fonts\Makefile copy .\data\data\fonts\Makefile .\runtime\data\fonts\Makefile
:data_data_fonts

if not exist .\data\data\img goto data_data_img
call .\create_dir .\runtime
call .\create_dir .\runtime\data
call .\create_dir .\runtime\data\img
if exist .\data\data\img\arrow-down.png copy .\data\data\img\arrow-down.png .\runtime\data\img\arrow-down.png
if exist .\data\data\img\arrow-down-pushed.png copy .\data\data\img\arrow-down-pushed.png .\runtime\data\img\arrow-down-pushed.png
if exist .\data\data\img\arrow-left.png copy .\data\data\img\arrow-left.png .\runtime\data\img\arrow-left.png
if exist .\data\data\img\arrow-left-pushed.png copy .\data\data\img\arrow-left-pushed.png .\runtime\data\img\arrow-left-pushed.png
if exist .\data\data\img\arrow-right.png copy .\data\data\img\arrow-right.png .\runtime\data\img\arrow-right.png
if exist .\data\data\img\arrow-right-pushed.png copy .\data\data\img\arrow-right-pushed.png .\runtime\data\img\arrow-right-pushed.png
if exist .\data\data\img\arrow-up.png copy .\data\data\img\arrow-up.png .\runtime\data\img\arrow-up.png
if exist .\data\data\img\arrow-up-pushed.png copy .\data\data\img\arrow-up-pushed.png .\runtime\data\img\arrow-up-pushed.png
if exist .\data\data\img\ruler.png copy .\data\data\img\ruler.png .\runtime\data\img\ruler.png
if exist .\data\data\img\ruler-pushed.png copy .\data\data\img\ruler-pushed.png .\runtime\data\img\ruler-pushed.png
if exist .\data\data\img\splash-free1.png copy .\data\data\img\splash-free1.png .\runtime\data\img\splash-free1.png
if exist .\data\data\img\splash-free4.png copy .\data\data\img\splash-free4.png .\runtime\data\img\splash-free4.png
if exist .\data\data\img\splash-free5.png copy .\data\data\img\splash-free5.png .\runtime\data\img\splash-free5.png
if exist .\data\data\img\splash-free7.png copy .\data\data\img\splash-free7.png .\runtime\data\img\splash-free7.png
if exist .\data\data\img\splash-free.png copy .\data\data\img\splash-free.png .\runtime\data\img\splash-free.png
if exist .\data\data\img\splash-graphconf.png copy .\data\data\img\splash-graphconf.png .\runtime\data\img\splash-graphconf.png
if exist .\data\data\img\splash-graphic.png copy .\data\data\img\splash-graphic.png .\runtime\data\img\splash-graphic.png
if exist .\data\data\img\splash-joycal.png copy .\data\data\img\splash-joycal.png .\runtime\data\img\splash-joycal.png
if exist .\data\data\img\splash-joyconf.png copy .\data\data\img\splash-joyconf.png .\runtime\data\img\splash-joyconf.png
if exist .\data\data\img\splash-main.png copy .\data\data\img\splash-main.png .\runtime\data\img\splash-main.png
if exist .\data\data\img\splash-options.png copy .\data\data\img\splash-options.png .\runtime\data\img\splash-options.png
if exist .\data\data\img\splash.png copy .\data\data\img\splash.png .\runtime\data\img\splash.png
if exist .\data\data\img\splash-practice.png copy .\data\data\img\splash-practice.png .\runtime\data\img\splash-practice.png
if exist .\data\data\img\splash-prsess.png copy .\data\data\img\splash-prsess.png .\runtime\data\img\splash-prsess.png
if exist .\data\data\img\splash-qrdrv.png copy .\data\data\img\splash-qrdrv.png .\runtime\data\img\splash-qrdrv.png
if exist .\data\data\img\splash-qrloading.png copy .\data\data\img\splash-qrloading.png .\runtime\data\img\splash-qrloading.png
if exist .\data\data\img\splash-qr.png copy .\data\data\img\splash-qr.png .\runtime\data\img\splash-qr.png
if exist .\data\data\img\splash-qrtrk.png copy .\data\data\img\splash-qrtrk.png .\runtime\data\img\splash-qrtrk.png
if exist .\data\data\img\splash-quit.png copy .\data\data\img\splash-quit.png .\runtime\data\img\splash-quit.png
if exist .\data\data\img\splash-raceopt.png copy .\data\data\img\splash-raceopt.png .\runtime\data\img\splash-raceopt.png
if exist .\data\data\img\splash-result.png copy .\data\data\img\splash-result.png .\runtime\data\img\splash-result.png
:data_data_img

if not exist .\data\data\menu goto data_data_menu
call .\create_dir .\runtime
call .\create_dir .\runtime\menu
if exist .\data\data\menu\entry.xml copy .\data\data\menu\entry.xml .\runtime\menu\entry.xml
:data_data_menu

if not exist .\data\data\objects goto data_data_objects
call .\create_dir .\runtime
call .\create_dir .\runtime\data
call .\create_dir .\runtime\data\objects
if exist .\data\data\objects\ad1.ac copy .\data\data\objects\ad1.ac .\runtime\data\objects\ad1.ac
if exist .\data\data\objects\bridge.ac copy .\data\data\objects\bridge.ac .\runtime\data\objects\bridge.ac
if exist .\data\data\objects\bridge-arch.ac copy .\data\data\objects\bridge-arch.ac .\runtime\data\objects\bridge-arch.ac
if exist .\data\data\objects\building1.ac copy .\data\data\objects\building1.ac .\runtime\data\objects\building1.ac
if exist .\data\data\objects\building2.ac copy .\data\data\objects\building2.ac .\runtime\data\objects\building2.ac
if exist .\data\data\objects\forest1.ac copy .\data\data\objects\forest1.ac .\runtime\data\objects\forest1.ac
if exist .\data\data\objects\forest2.ac copy .\data\data\objects\forest2.ac .\runtime\data\objects\forest2.ac
if exist .\data\data\objects\forest3.ac copy .\data\data\objects\forest3.ac .\runtime\data\objects\forest3.ac
if exist .\data\data\objects\needle.ac copy .\data\data\objects\needle.ac .\runtime\data\objects\needle.ac
if exist .\data\data\objects\stadium1.ac copy .\data\data\objects\stadium1.ac .\runtime\data\objects\stadium1.ac
if exist .\data\data\objects\stand-inter.ac copy .\data\data\objects\stand-inter.ac .\runtime\data\objects\stand-inter.ac
if exist .\data\data\objects\stand-main.ac copy .\data\data\objects\stand-main.ac .\runtime\data\objects\stand-main.ac
if exist .\data\data\objects\stand-wall.ac copy .\data\data\objects\stand-wall.ac .\runtime\data\objects\stand-wall.ac
if exist .\data\data\objects\tree10.ac copy .\data\data\objects\tree10.ac .\runtime\data\objects\tree10.ac
if exist .\data\data\objects\tree11.ac copy .\data\data\objects\tree11.ac .\runtime\data\objects\tree11.ac
if exist .\data\data\objects\tree12.ac copy .\data\data\objects\tree12.ac .\runtime\data\objects\tree12.ac
if exist .\data\data\objects\tree13.ac copy .\data\data\objects\tree13.ac .\runtime\data\objects\tree13.ac
if exist .\data\data\objects\tree14.ac copy .\data\data\objects\tree14.ac .\runtime\data\objects\tree14.ac
if exist .\data\data\objects\tree15.ac copy .\data\data\objects\tree15.ac .\runtime\data\objects\tree15.ac
if exist .\data\data\objects\tree16.ac copy .\data\data\objects\tree16.ac .\runtime\data\objects\tree16.ac
if exist .\data\data\objects\tree17.ac copy .\data\data\objects\tree17.ac .\runtime\data\objects\tree17.ac
if exist .\data\data\objects\tree1.ac copy .\data\data\objects\tree1.ac .\runtime\data\objects\tree1.ac
if exist .\data\data\objects\tree2.ac copy .\data\data\objects\tree2.ac .\runtime\data\objects\tree2.ac
if exist .\data\data\objects\tree3.ac copy .\data\data\objects\tree3.ac .\runtime\data\objects\tree3.ac
if exist .\data\data\objects\tree4.ac copy .\data\data\objects\tree4.ac .\runtime\data\objects\tree4.ac
if exist .\data\data\objects\tree5.ac copy .\data\data\objects\tree5.ac .\runtime\data\objects\tree5.ac
if exist .\data\data\objects\tree6.ac copy .\data\data\objects\tree6.ac .\runtime\data\objects\tree6.ac
if exist .\data\data\objects\tree7.ac copy .\data\data\objects\tree7.ac .\runtime\data\objects\tree7.ac
if exist .\data\data\objects\tree8.ac copy .\data\data\objects\tree8.ac .\runtime\data\objects\tree8.ac
if exist .\data\data\objects\tree9.ac copy .\data\data\objects\tree9.ac .\runtime\data\objects\tree9.ac
:data_data_objects

if not exist .\data\data\sound goto data_data_sound
call .\create_dir .\runtime
call .\create_dir .\runtime\data
call .\create_dir .\runtime\data\sound
if exist .\data\data\sound\crash1.wav copy .\data\data\sound\crash1.wav .\runtime\data\sound\crash1.wav
if exist .\data\data\sound\crash2.wav copy .\data\data\sound\crash2.wav .\runtime\data\sound\crash2.wav
if exist .\data\data\sound\crash3.wav copy .\data\data\sound\crash3.wav .\runtime\data\sound\crash3.wav
if exist .\data\data\sound\crash4.wav copy .\data\data\sound\crash4.wav .\runtime\data\sound\crash4.wav
if exist .\data\data\sound\crash5.wav copy .\data\data\sound\crash5.wav .\runtime\data\sound\crash5.wav
if exist .\data\data\sound\crash6.wav copy .\data\data\sound\crash6.wav .\runtime\data\sound\crash6.wav
if exist .\data\data\sound\engine-1.wav copy .\data\data\sound\engine-1.wav .\runtime\data\sound\engine-1.wav
if exist .\data\data\sound\skid.wav copy .\data\data\sound\skid.wav .\runtime\data\sound\skid.wav
:data_data_sound

if not exist .\data\data\textures goto data_data_textures
call .\create_dir .\runtime
call .\create_dir .\runtime\data
call .\create_dir .\runtime\data\textures
if exist .\data\data\textures\background.png copy .\data\data\textures\background.png .\runtime\data\textures\background.png
if exist .\data\data\textures\env.png copy .\data\data\textures\env.png .\runtime\data\textures\env.png
if exist .\data\data\textures\envshadow.png copy .\data\data\textures\envshadow.png .\runtime\data\textures\envshadow.png
if exist .\data\data\textures\back-sign.rgb copy .\data\data\textures\back-sign.rgb .\runtime\data\textures\back-sign.rgb
if exist .\data\data\textures\building1.rgb copy .\data\data\textures\building1.rgb .\runtime\data\textures\building1.rgb
if exist .\data\data\textures\building2.rgb copy .\data\data\textures\building2.rgb .\runtime\data\textures\building2.rgb
if exist .\data\data\textures\bump-2.rgb copy .\data\data\textures\bump-2.rgb .\runtime\data\textures\bump-2.rgb
if exist .\data\data\textures\bump-3.rgb copy .\data\data\textures\bump-3.rgb .\runtime\data\textures\bump-3.rgb
if exist .\data\data\textures\bump-4.rgb copy .\data\data\textures\bump-4.rgb .\runtime\data\textures\bump-4.rgb
if exist .\data\data\textures\bump-5.rgb copy .\data\data\textures\bump-5.rgb .\runtime\data\textures\bump-5.rgb
if exist .\data\data\textures\bump-6.rgb copy .\data\data\textures\bump-6.rgb .\runtime\data\textures\bump-6.rgb
if exist .\data\data\textures\bump-7.rgb copy .\data\data\textures\bump-7.rgb .\runtime\data\textures\bump-7.rgb
if exist .\data\data\textures\bump-8.rgb copy .\data\data\textures\bump-8.rgb .\runtime\data\textures\bump-8.rgb
if exist .\data\data\textures\bump-9.rgb copy .\data\data\textures\bump-9.rgb .\runtime\data\textures\bump-9.rgb
if exist .\data\data\textures\bump-as.rgb copy .\data\data\textures\bump-as.rgb .\runtime\data\textures\bump-as.rgb
if exist .\data\data\textures\bump-finegrain.rgb copy .\data\data\textures\bump-finegrain.rgb .\runtime\data\textures\bump-finegrain.rgb
if exist .\data\data\textures\bump-sand.rgb copy .\data\data\textures\bump-sand.rgb .\runtime\data\textures\bump-sand.rgb
if exist .\data\data\textures\concrete2.rgb copy .\data\data\textures\concrete2.rgb .\runtime\data\textures\concrete2.rgb
if exist .\data\data\textures\concrete.rgb copy .\data\data\textures\concrete.rgb .\runtime\data\textures\concrete.rgb
if exist .\data\data\textures\counter-bg-10.rgb copy .\data\data\textures\counter-bg-10.rgb .\runtime\data\textures\counter-bg-10.rgb
if exist .\data\data\textures\counter-bg2.rgb copy .\data\data\textures\counter-bg2.rgb .\runtime\data\textures\counter-bg2.rgb
if exist .\data\data\textures\counter-bg.rgb copy .\data\data\textures\counter-bg.rgb .\runtime\data\textures\counter-bg.rgb
if exist .\data\data\textures\counter-bg-rpm.rgb copy .\data\data\textures\counter-bg-rpm.rgb .\runtime\data\textures\counter-bg-rpm.rgb
if exist .\data\data\textures\counter.rgb copy .\data\data\textures\counter.rgb .\runtime\data\textures\counter.rgb
if exist .\data\data\textures\fire0.rgb copy .\data\data\textures\fire0.rgb .\runtime\data\textures\fire0.rgb
if exist .\data\data\textures\fire1.rgb copy .\data\data\textures\fire1.rgb .\runtime\data\textures\fire1.rgb
if exist .\data\data\textures\forest1.rgb copy .\data\data\textures\forest1.rgb .\runtime\data\textures\forest1.rgb
if exist .\data\data\textures\forest1-r.rgb copy .\data\data\textures\forest1-r.rgb .\runtime\data\textures\forest1-r.rgb
if exist .\data\data\textures\forest2.rgb copy .\data\data\textures\forest2.rgb .\runtime\data\textures\forest2.rgb
if exist .\data\data\textures\forest3.rgb copy .\data\data\textures\forest3.rgb .\runtime\data\textures\forest3.rgb
if exist .\data\data\textures\fuel-gauge.rgb copy .\data\data\textures\fuel-gauge.rgb .\runtime\data\textures\fuel-gauge.rgb
if exist .\data\data\textures\gauge.rgb copy .\data\data\textures\gauge.rgb .\runtime\data\textures\gauge.rgb
if exist .\data\data\textures\grassg1.rgb copy .\data\data\textures\grassg1.rgb .\runtime\data\textures\grassg1.rgb
if exist .\data\data\textures\grassg2.rgb copy .\data\data\textures\grassg2.rgb .\runtime\data\textures\grassg2.rgb
if exist .\data\data\textures\grassg3.rgb copy .\data\data\textures\grassg3.rgb .\runtime\data\textures\grassg3.rgb
if exist .\data\data\textures\logo.rgb copy .\data\data\textures\logo.rgb .\runtime\data\textures\logo.rgb
if exist .\data\data\textures\panel-empty.rgb copy .\data\data\textures\panel-empty.rgb .\runtime\data\textures\panel-empty.rgb
if exist .\data\data\textures\people1.rgb copy .\data\data\textures\people1.rgb .\runtime\data\textures\people1.rgb
if exist .\data\data\textures\pit-left.rgb copy .\data\data\textures\pit-left.rgb .\runtime\data\textures\pit-left.rgb
if exist .\data\data\textures\pit-right.rgb copy .\data\data\textures\pit-right.rgb .\runtime\data\textures\pit-right.rgb
if exist .\data\data\textures\pylon1.rgb copy .\data\data\textures\pylon1.rgb .\runtime\data\textures\pylon1.rgb
if exist .\data\data\textures\pylon2.rgb copy .\data\data\textures\pylon2.rgb .\runtime\data\textures\pylon2.rgb
if exist .\data\data\textures\pylon3.rgb copy .\data\data\textures\pylon3.rgb .\runtime\data\textures\pylon3.rgb
if exist .\data\data\textures\red-light-off.rgb copy .\data\data\textures\red-light-off.rgb .\runtime\data\textures\red-light-off.rgb
if exist .\data\data\textures\red-light-on.rgb copy .\data\data\textures\red-light-on.rgb .\runtime\data\textures\red-light-on.rgb
if exist .\data\data\textures\rock2.rgb copy .\data\data\textures\rock2.rgb .\runtime\data\textures\rock2.rgb
if exist .\data\data\textures\rock3.rgb copy .\data\data\textures\rock3.rgb .\runtime\data\textures\rock3.rgb
if exist .\data\data\textures\rpm5500.rgb copy .\data\data\textures\rpm5500.rgb .\runtime\data\textures\rpm5500.rgb
if exist .\data\data\textures\rpm7000.rgb copy .\data\data\textures\rpm7000.rgb .\runtime\data\textures\rpm7000.rgb
if exist .\data\data\textures\rpm8000.rgb copy .\data\data\textures\rpm8000.rgb .\runtime\data\textures\rpm8000.rgb
if exist .\data\data\textures\rpm8500.rgb copy .\data\data\textures\rpm8500.rgb .\runtime\data\textures\rpm8500.rgb
if exist .\data\data\textures\smoke.rgb copy .\data\data\textures\smoke.rgb .\runtime\data\textures\smoke.rgb
if exist .\data\data\textures\speed240.rgb copy .\data\data\textures\speed240.rgb .\runtime\data\textures\speed240.rgb
if exist .\data\data\textures\speed300.rgb copy .\data\data\textures\speed300.rgb .\runtime\data\textures\speed300.rgb
if exist .\data\data\textures\speed360.rgb copy .\data\data\textures\speed360.rgb .\runtime\data\textures\speed360.rgb
if exist .\data\data\textures\torcs-ad1.rgb copy .\data\data\textures\torcs-ad1.rgb .\runtime\data\textures\torcs-ad1.rgb
if exist .\data\data\textures\tr-asphalt-both_nmm.rgb copy .\data\data\textures\tr-asphalt-both_nmm.rgb .\runtime\data\textures\tr-asphalt-both_nmm.rgb
if exist .\data\data\textures\tr-asphalt-both.rgb copy .\data\data\textures\tr-asphalt-both.rgb .\runtime\data\textures\tr-asphalt-both.rgb
if exist .\data\data\textures\tr-asphalt-grass-l.rgb copy .\data\data\textures\tr-asphalt-grass-l.rgb .\runtime\data\textures\tr-asphalt-grass-l.rgb
if exist .\data\data\textures\tr-asphalt-grass-r.rgb copy .\data\data\textures\tr-asphalt-grass-r.rgb .\runtime\data\textures\tr-asphalt-grass-r.rgb
if exist .\data\data\textures\tr-asphalt-left_nmm.rgb copy .\data\data\textures\tr-asphalt-left_nmm.rgb .\runtime\data\textures\tr-asphalt-left_nmm.rgb
if exist .\data\data\textures\tr-asphalt-left.rgb copy .\data\data\textures\tr-asphalt-left.rgb .\runtime\data\textures\tr-asphalt-left.rgb
if exist .\data\data\textures\tr-asphalt-l_nmm.rgb copy .\data\data\textures\tr-asphalt-l_nmm.rgb .\runtime\data\textures\tr-asphalt-l_nmm.rgb
if exist .\data\data\textures\tr-asphalt-l.rgb copy .\data\data\textures\tr-asphalt-l.rgb .\runtime\data\textures\tr-asphalt-l.rgb
if exist .\data\data\textures\tr-asphalt_nmm.rgb copy .\data\data\textures\tr-asphalt_nmm.rgb .\runtime\data\textures\tr-asphalt_nmm.rgb
if exist .\data\data\textures\tr-asphalt-p_nmm.rgb copy .\data\data\textures\tr-asphalt-p_nmm.rgb .\runtime\data\textures\tr-asphalt-p_nmm.rgb
if exist .\data\data\textures\tr-asphalt-p.rgb copy .\data\data\textures\tr-asphalt-p.rgb .\runtime\data\textures\tr-asphalt-p.rgb
if exist .\data\data\textures\tr-asphalt.rgb copy .\data\data\textures\tr-asphalt.rgb .\runtime\data\textures\tr-asphalt.rgb
if exist .\data\data\textures\tr-asphalt-right_nmm.rgb copy .\data\data\textures\tr-asphalt-right_nmm.rgb .\runtime\data\textures\tr-asphalt-right_nmm.rgb
if exist .\data\data\textures\tr-asphalt-right.rgb copy .\data\data\textures\tr-asphalt-right.rgb .\runtime\data\textures\tr-asphalt-right.rgb
if exist .\data\data\textures\tr-asphalt-sand.rgb copy .\data\data\textures\tr-asphalt-sand.rgb .\runtime\data\textures\tr-asphalt-sand.rgb
if exist .\data\data\textures\tr-barrier.rgb copy .\data\data\textures\tr-barrier.rgb .\runtime\data\textures\tr-barrier.rgb
if exist .\data\data\textures\tr-concrete_nmm.rgb copy .\data\data\textures\tr-concrete_nmm.rgb .\runtime\data\textures\tr-concrete_nmm.rgb
if exist .\data\data\textures\tr-concrete.rgb copy .\data\data\textures\tr-concrete.rgb .\runtime\data\textures\tr-concrete.rgb
if exist .\data\data\textures\tr-curb-l.rgb copy .\data\data\textures\tr-curb-l.rgb .\runtime\data\textures\tr-curb-l.rgb
if exist .\data\data\textures\tr-curb-r.rgb copy .\data\data\textures\tr-curb-r.rgb .\runtime\data\textures\tr-curb-r.rgb
if exist .\data\data\textures\tr-dirtb.rgb copy .\data\data\textures\tr-dirtb.rgb .\runtime\data\textures\tr-dirtb.rgb
if exist .\data\data\textures\tr-dirt.rgb copy .\data\data\textures\tr-dirt.rgb .\runtime\data\textures\tr-dirt.rgb
if exist .\data\data\textures\tree10.rgb copy .\data\data\textures\tree10.rgb .\runtime\data\textures\tree10.rgb
if exist .\data\data\textures\tree11.rgb copy .\data\data\textures\tree11.rgb .\runtime\data\textures\tree11.rgb
if exist .\data\data\textures\tree12.rgb copy .\data\data\textures\tree12.rgb .\runtime\data\textures\tree12.rgb
if exist .\data\data\textures\tree13.rgb copy .\data\data\textures\tree13.rgb .\runtime\data\textures\tree13.rgb
if exist .\data\data\textures\tree14.rgb copy .\data\data\textures\tree14.rgb .\runtime\data\textures\tree14.rgb
if exist .\data\data\textures\tree15.rgb copy .\data\data\textures\tree15.rgb .\runtime\data\textures\tree15.rgb
if exist .\data\data\textures\tree16.rgb copy .\data\data\textures\tree16.rgb .\runtime\data\textures\tree16.rgb
if exist .\data\data\textures\tree17.rgb copy .\data\data\textures\tree17.rgb .\runtime\data\textures\tree17.rgb
if exist .\data\data\textures\tree1.rgb copy .\data\data\textures\tree1.rgb .\runtime\data\textures\tree1.rgb
if exist .\data\data\textures\tree2.rgb copy .\data\data\textures\tree2.rgb .\runtime\data\textures\tree2.rgb
if exist .\data\data\textures\tree3.rgb copy .\data\data\textures\tree3.rgb .\runtime\data\textures\tree3.rgb
if exist .\data\data\textures\tree4.rgb copy .\data\data\textures\tree4.rgb .\runtime\data\textures\tree4.rgb
if exist .\data\data\textures\tree5.rgb copy .\data\data\textures\tree5.rgb .\runtime\data\textures\tree5.rgb
if exist .\data\data\textures\tree7.rgb copy .\data\data\textures\tree7.rgb .\runtime\data\textures\tree7.rgb
if exist .\data\data\textures\tree8.rgb copy .\data\data\textures\tree8.rgb .\runtime\data\textures\tree8.rgb
if exist .\data\data\textures\tree9.rgb copy .\data\data\textures\tree9.rgb .\runtime\data\textures\tree9.rgb
if exist .\data\data\textures\tr-fake-road-2.rgb copy .\data\data\textures\tr-fake-road-2.rgb .\runtime\data\textures\tr-fake-road-2.rgb
if exist .\data\data\textures\tr-fake-road-borders.rgb copy .\data\data\textures\tr-fake-road-borders.rgb .\runtime\data\textures\tr-fake-road-borders.rgb
if exist .\data\data\textures\tr-fake-road-lines.rgb copy .\data\data\textures\tr-fake-road-lines.rgb .\runtime\data\textures\tr-fake-road-lines.rgb
if exist .\data\data\textures\tr-fake-road.rgb copy .\data\data\textures\tr-fake-road.rgb .\runtime\data\textures\tr-fake-road.rgb
if exist .\data\data\textures\tr-grass2.rgb copy .\data\data\textures\tr-grass2.rgb .\runtime\data\textures\tr-grass2.rgb
if exist .\data\data\textures\tr-grass3.rgb copy .\data\data\textures\tr-grass3.rgb .\runtime\data\textures\tr-grass3.rgb
if exist .\data\data\textures\tr-grass4.rgb copy .\data\data\textures\tr-grass4.rgb .\runtime\data\textures\tr-grass4.rgb
if exist .\data\data\textures\tr-grass5.rgb copy .\data\data\textures\tr-grass5.rgb .\runtime\data\textures\tr-grass5.rgb
if exist .\data\data\textures\tr-grass.rgb copy .\data\data\textures\tr-grass.rgb .\runtime\data\textures\tr-grass.rgb
if exist .\data\data\textures\tr-sand2.rgb copy .\data\data\textures\tr-sand2.rgb .\runtime\data\textures\tr-sand2.rgb
if exist .\data\data\textures\tr-sand.rgb copy .\data\data\textures\tr-sand.rgb .\runtime\data\textures\tr-sand.rgb
if exist .\data\data\textures\tr-snow.rgb copy .\data\data\textures\tr-snow.rgb .\runtime\data\textures\tr-snow.rgb
if exist .\data\data\textures\tr-tirewall.rgb copy .\data\data\textures\tr-tirewall.rgb .\runtime\data\textures\tr-tirewall.rgb
if exist .\data\data\textures\tr-wall_nmm.rgb copy .\data\data\textures\tr-wall_nmm.rgb .\runtime\data\textures\tr-wall_nmm.rgb
if exist .\data\data\textures\tr-wall.rgb copy .\data\data\textures\tr-wall.rgb .\runtime\data\textures\tr-wall.rgb
if exist .\data\data\textures\tr-water.rgb copy .\data\data\textures\tr-water.rgb .\runtime\data\textures\tr-water.rgb
if exist .\data\data\textures\turn100L.rgb copy .\data\data\textures\turn100L.rgb .\runtime\data\textures\turn100L.rgb
if exist .\data\data\textures\turn100R.rgb copy .\data\data\textures\turn100R.rgb .\runtime\data\textures\turn100R.rgb
if exist .\data\data\textures\turn150L.rgb copy .\data\data\textures\turn150L.rgb .\runtime\data\textures\turn150L.rgb
if exist .\data\data\textures\turn150R.rgb copy .\data\data\textures\turn150R.rgb .\runtime\data\textures\turn150R.rgb
if exist .\data\data\textures\turn200L.rgb copy .\data\data\textures\turn200L.rgb .\runtime\data\textures\turn200L.rgb
if exist .\data\data\textures\turn200R.rgb copy .\data\data\textures\turn200R.rgb .\runtime\data\textures\turn200R.rgb
if exist .\data\data\textures\turn300L.rgb copy .\data\data\textures\turn300L.rgb .\runtime\data\textures\turn300L.rgb
if exist .\data\data\textures\turn300R.rgb copy .\data\data\textures\turn300R.rgb .\runtime\data\textures\turn300R.rgb
if exist .\data\data\textures\turn50L.rgb copy .\data\data\textures\turn50L.rgb .\runtime\data\textures\turn50L.rgb
if exist .\data\data\textures\turn50R.rgb copy .\data\data\textures\turn50R.rgb .\runtime\data\textures\turn50R.rgb
:data_data_textures

if not exist .\data\data\tracks goto data_data_tracks
call .\create_dir .\runtime
call .\create_dir .\runtime\data
call .\create_dir .\runtime\data\tracks
if exist .\data\data\tracks\dirt.xml copy .\data\data\tracks\dirt.xml .\runtime\data\tracks\dirt.xml
if exist .\data\data\tracks\objects.xml copy .\data\data\tracks\objects.xml .\runtime\data\tracks\objects.xml
if exist .\data\data\tracks\oval.xml copy .\data\data\tracks\oval.xml .\runtime\data\tracks\oval.xml
if exist .\data\data\tracks\road.xml copy .\data\data\tracks\road.xml .\runtime\data\tracks\road.xml
if exist .\data\data\tracks\surfaces.xml copy .\data\data\tracks\surfaces.xml .\runtime\data\tracks\surfaces.xml
:data_data_tracks

if not exist .\data\tracks\aalborg goto data_tracks_aalborg
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\road
call .\create_dir .\runtime\tracks\road\aalborg
if exist .\data\tracks\aalborg\aalborg.xml copy .\data\tracks\aalborg\aalborg.xml .\runtime\tracks\road\aalborg\aalborg.xml
if exist .\data\tracks\aalborg\aalborg.ac copy .\data\tracks\aalborg\aalborg.ac .\runtime\tracks\road\aalborg\aalborg.ac
if exist .\data\tracks\aalborg\aalborg.png copy .\data\tracks\aalborg\aalborg.png .\runtime\tracks\road\aalborg\aalborg.png
:data_tracks_aalborg

if not exist .\data\tracks\a-speedway goto data_tracks_a_speedway
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\oval
call .\create_dir .\runtime\tracks\oval\a-speedway
if exist .\data\tracks\a-speedway\a-speedway.xml copy .\data\tracks\a-speedway\a-speedway.xml .\runtime\tracks\oval\a-speedway\a-speedway.xml
if exist .\data\tracks\a-speedway\background.png copy .\data\tracks\a-speedway\background.png .\runtime\tracks\oval\a-speedway\background.png
if exist .\data\tracks\a-speedway\a-speedway.ac copy .\data\tracks\a-speedway\a-speedway.ac .\runtime\tracks\oval\a-speedway\a-speedway.ac
if exist .\data\tracks\a-speedway\a-speedway-relief.ac copy .\data\tracks\a-speedway\a-speedway-relief.ac .\runtime\tracks\oval\a-speedway\a-speedway-relief.ac
if exist .\data\tracks\a-speedway\a-speedway.png copy .\data\tracks\a-speedway\a-speedway.png .\runtime\tracks\oval\a-speedway\a-speedway.png
:data_tracks_a_speedway

if not exist .\data\tracks\dirt\alpine-d1 goto data_tracks_dirt_alpine_d1
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\dirt
call .\create_dir .\runtime\tracks\dirt\alpine-d1
if exist .\data\tracks\dirt\alpine-d1\alpine-d1.xml copy .\data\tracks\dirt\alpine-d1\alpine-d1.xml .\runtime\tracks\dirt\alpine-d1\alpine-d1.xml
if exist .\data\tracks\dirt\alpine-d1\alpine-d1.png copy .\data\tracks\dirt\alpine-d1\alpine-d1.png .\runtime\tracks\dirt\alpine-d1\alpine-d1.png
if exist .\data\tracks\dirt\alpine-d1\alpine-d1.ac copy .\data\tracks\dirt\alpine-d1\alpine-d1.ac .\runtime\tracks\dirt\alpine-d1\alpine-d1.ac
if exist .\data\tracks\dirt\alpine-d1\elevation-map.png copy .\data\tracks\dirt\alpine-d1\elevation-map.png .\runtime\tracks\dirt\alpine-d1\elevation-map.png
if exist .\data\tracks\dirt\alpine-d1\relief.ac copy .\data\tracks\dirt\alpine-d1\relief.ac .\runtime\tracks\dirt\alpine-d1\relief.ac
:data_tracks_dirt_alpine_d1

if not exist .\data\tracks\dirt-1 goto data_tracks_dirt_1
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\dirt
call .\create_dir .\runtime\tracks\dirt\dirt-1
if exist .\data\tracks\dirt-1\dirt-1.xml copy .\data\tracks\dirt-1\dirt-1.xml .\runtime\tracks\dirt\dirt-1\dirt-1.xml
if exist .\data\tracks\dirt-1\background.png copy .\data\tracks\dirt-1\background.png .\runtime\tracks\dirt\dirt-1\background.png
if exist .\data\tracks\dirt-1\dirt-1.ac copy .\data\tracks\dirt-1\dirt-1.ac .\runtime\tracks\dirt\dirt-1\dirt-1.ac
if exist .\data\tracks\dirt-1\dirt-1.png copy .\data\tracks\dirt-1\dirt-1.png .\runtime\tracks\dirt\dirt-1\dirt-1.png
if exist .\data\tracks\dirt-1\elevation-map.png copy .\data\tracks\dirt-1\elevation-map.png .\runtime\tracks\dirt\dirt-1\elevation-map.png
if exist .\data\tracks\dirt-1\dirt-1-relief.ac copy .\data\tracks\dirt-1\dirt-1-relief.ac .\runtime\tracks\dirt\dirt-1\dirt-1-relief.ac
if exist .\data\tracks\dirt-1\objects-map1.png copy .\data\tracks\dirt-1\objects-map1.png .\runtime\tracks\dirt\dirt-1\objects-map1.png
if exist .\data\tracks\dirt-1\objects-map2.png copy .\data\tracks\dirt-1\objects-map2.png .\runtime\tracks\dirt\dirt-1\objects-map2.png
:data_tracks_dirt_1

if not exist .\data\tracks\dirt-2 goto data_tracks_dirt_2
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\dirt
call .\create_dir .\runtime\tracks\dirt\dirt-2
if exist .\data\tracks\dirt-2\dirt-2.xml copy .\data\tracks\dirt-2\dirt-2.xml .\runtime\tracks\dirt\dirt-2\dirt-2.xml
if exist .\data\tracks\dirt-2\background.png copy .\data\tracks\dirt-2\background.png .\runtime\tracks\dirt\dirt-2\background.png
if exist .\data\tracks\dirt-2\dirt-2.ac copy .\data\tracks\dirt-2\dirt-2.ac .\runtime\tracks\dirt\dirt-2\dirt-2.ac
if exist .\data\tracks\dirt-2\dirt-2.png copy .\data\tracks\dirt-2\dirt-2.png .\runtime\tracks\dirt\dirt-2\dirt-2.png
:data_tracks_dirt_2

if not exist .\data\tracks\dirt-3 goto data_tracks_dirt_3
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\dirt
call .\create_dir .\runtime\tracks\dirt\dirt-3
if exist .\data\tracks\dirt-3\dirt-3.xml copy .\data\tracks\dirt-3\dirt-3.xml .\runtime\tracks\dirt\dirt-3\dirt-3.xml
if exist .\data\tracks\dirt-3\background.png copy .\data\tracks\dirt-3\background.png .\runtime\tracks\dirt\dirt-3\background.png
if exist .\data\tracks\dirt-3\background2.png copy .\data\tracks\dirt-3\background2.png .\runtime\tracks\dirt\dirt-3\background2.png
if exist .\data\tracks\dirt-3\dirt-3.ac copy .\data\tracks\dirt-3\dirt-3.ac .\runtime\tracks\dirt\dirt-3\dirt-3.ac
if exist .\data\tracks\dirt-3\dirt-3-relief.ac copy .\data\tracks\dirt-3\dirt-3-relief.ac .\runtime\tracks\dirt\dirt-3\dirt-3-relief.ac
if exist .\data\tracks\dirt-3\dirt-3.png copy .\data\tracks\dirt-3\dirt-3.png .\runtime\tracks\dirt\dirt-3\dirt-3.png
:data_tracks_dirt_3

if not exist .\data\tracks\dirt-4 goto data_tracks_dirt_4
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\dirt
call .\create_dir .\runtime\tracks\dirt\dirt-4
if exist .\data\tracks\dirt-4\dirt-4.xml copy .\data\tracks\dirt-4\dirt-4.xml .\runtime\tracks\dirt\dirt-4\dirt-4.xml
if exist .\data\tracks\dirt-4\background.png copy .\data\tracks\dirt-4\background.png .\runtime\tracks\dirt\dirt-4\background.png
if exist .\data\tracks\dirt-4\dirt-4.ac copy .\data\tracks\dirt-4\dirt-4.ac .\runtime\tracks\dirt\dirt-4\dirt-4.ac
if exist .\data\tracks\dirt-4\dirt-4-relief.ac copy .\data\tracks\dirt-4\dirt-4-relief.ac .\runtime\tracks\dirt\dirt-4\dirt-4-relief.ac
if exist .\data\tracks\dirt-4\dirt-4.png copy .\data\tracks\dirt-4\dirt-4.png .\runtime\tracks\dirt\dirt-4\dirt-4.png
:data_tracks_dirt_4

if not exist .\data\tracks\dirt-5 goto data_tracks_dirt_5
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\dirt
call .\create_dir .\runtime\tracks\dirt\dirt-5
if exist .\data\tracks\dirt-5\dirt-5.xml copy .\data\tracks\dirt-5\dirt-5.xml .\runtime\tracks\dirt\dirt-5\dirt-5.xml
if exist .\data\tracks\dirt-5\background.png copy .\data\tracks\dirt-5\background.png .\runtime\tracks\dirt\dirt-5\background.png
if exist .\data\tracks\dirt-5\dirt-5.ac copy .\data\tracks\dirt-5\dirt-5.ac .\runtime\tracks\dirt\dirt-5\dirt-5.ac
if exist .\data\tracks\dirt-5\dirt-5.png copy .\data\tracks\dirt-5\dirt-5.png .\runtime\tracks\dirt\dirt-5\dirt-5.png
:data_tracks_dirt_5

if not exist .\data\tracks\dirt-6 goto data_tracks_dirt_6
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\dirt
call .\create_dir .\runtime\tracks\dirt\dirt-6
if exist .\data\tracks\dirt-6\dirt-6.xml copy .\data\tracks\dirt-6\dirt-6.xml .\runtime\tracks\dirt\dirt-6\dirt-6.xml
if exist .\data\tracks\dirt-6\background.png copy .\data\tracks\dirt-6\background.png .\runtime\tracks\dirt\dirt-6\background.png
if exist .\data\tracks\dirt-6\dirt-6.ac copy .\data\tracks\dirt-6\dirt-6.ac .\runtime\tracks\dirt\dirt-6\dirt-6.ac
if exist .\data\tracks\dirt-6\dirt-6.png copy .\data\tracks\dirt-6\dirt-6.png .\runtime\tracks\dirt\dirt-6\dirt-6.png
:data_tracks_dirt_6

if not exist .\data\tracks\eroad goto data_tracks_eroad
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\road
call .\create_dir .\runtime\tracks\road\eroad
if exist .\data\tracks\eroad\eroad.xml copy .\data\tracks\eroad\eroad.xml .\runtime\tracks\road\eroad\eroad.xml
if exist .\data\tracks\eroad\background.png copy .\data\tracks\eroad\background.png .\runtime\tracks\road\eroad\background.png
if exist .\data\tracks\eroad\eroad.ac copy .\data\tracks\eroad\eroad.ac .\runtime\tracks\road\eroad\eroad.ac
if exist .\data\tracks\eroad\eroad-relief.ac copy .\data\tracks\eroad\eroad-relief.ac .\runtime\tracks\road\eroad\eroad-relief.ac
if exist .\data\tracks\eroad\eroad.png copy .\data\tracks\eroad\eroad.png .\runtime\tracks\road\eroad\eroad.png
:data_tracks_eroad

if not exist .\data\tracks\e-track-1 goto data_tracks_e_track_1
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\road
call .\create_dir .\runtime\tracks\road\e-track-1
if exist .\data\tracks\e-track-1\e-track-1.xml copy .\data\tracks\e-track-1\e-track-1.xml .\runtime\tracks\road\e-track-1\e-track-1.xml
if exist .\data\tracks\e-track-1\background.png copy .\data\tracks\e-track-1\background.png .\runtime\tracks\road\e-track-1\background.png
if exist .\data\tracks\e-track-1\e-track-1.ac copy .\data\tracks\e-track-1\e-track-1.ac .\runtime\tracks\road\e-track-1\e-track-1.ac
if exist .\data\tracks\e-track-1\e-track-1.png copy .\data\tracks\e-track-1\e-track-1.png .\runtime\tracks\road\e-track-1\e-track-1.png
:data_tracks_e_track_1

if not exist .\data\tracks\e-track-2 goto data_tracks_e_track_2
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\road
call .\create_dir .\runtime\tracks\road\e-track-2
if exist .\data\tracks\e-track-2\e-track-2.xml copy .\data\tracks\e-track-2\e-track-2.xml .\runtime\tracks\road\e-track-2\e-track-2.xml
if exist .\data\tracks\e-track-2\e-track-2.acc copy .\data\tracks\e-track-2\e-track-2.acc .\runtime\tracks\road\e-track-2\e-track-2.acc
if exist .\data\tracks\e-track-2\background.png copy .\data\tracks\e-track-2\background.png .\runtime\tracks\road\e-track-2\background.png
if exist .\data\tracks\e-track-2\e-track-2.png copy .\data\tracks\e-track-2\e-track-2.png .\runtime\tracks\road\e-track-2\e-track-2.png
if exist .\data\tracks\e-track-2\env.png copy .\data\tracks\e-track-2\env.png .\runtime\tracks\road\e-track-2\env.png
if exist .\data\tracks\e-track-2\pylon3.rgb copy .\data\tracks\e-track-2\pylon3.rgb .\runtime\tracks\road\e-track-2\pylon3.rgb
if exist .\data\tracks\e-track-2\e-track-2.ac copy .\data\tracks\e-track-2\e-track-2.ac .\runtime\tracks\road\e-track-2\e-track-2.ac
if exist .\data\tracks\e-track-2\e-track-2-relief.ac copy .\data\tracks\e-track-2\e-track-2-relief.ac .\runtime\tracks\road\e-track-2\e-track-2-relief.ac
if exist .\data\tracks\e-track-2\elevation-map.png copy .\data\tracks\e-track-2\elevation-map.png .\runtime\tracks\road\e-track-2\elevation-map.png
if exist .\data\tracks\e-track-2\object-map1.png copy .\data\tracks\e-track-2\object-map1.png .\runtime\tracks\road\e-track-2\object-map1.png
if exist .\data\tracks\e-track-2\object-map2.png copy .\data\tracks\e-track-2\object-map2.png .\runtime\tracks\road\e-track-2\object-map2.png
:data_tracks_e_track_2

if not exist .\data\tracks\e-track-3 goto data_tracks_e_track_3
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\road
call .\create_dir .\runtime\tracks\road\e-track-3
if exist .\data\tracks\e-track-3\e-track-3.xml copy .\data\tracks\e-track-3\e-track-3.xml .\runtime\tracks\road\e-track-3\e-track-3.xml
if exist .\data\tracks\e-track-3\background.png copy .\data\tracks\e-track-3\background.png .\runtime\tracks\road\e-track-3\background.png
if exist .\data\tracks\e-track-3\env.rgb copy .\data\tracks\e-track-3\env.rgb .\runtime\tracks\road\e-track-3\env.rgb
if exist .\data\tracks\e-track-3\e-track-3.ac copy .\data\tracks\e-track-3\e-track-3.ac .\runtime\tracks\road\e-track-3\e-track-3.ac
if exist .\data\tracks\e-track-3\e-track-3.png copy .\data\tracks\e-track-3\e-track-3.png .\runtime\tracks\road\e-track-3\e-track-3.png
:data_tracks_e_track_3

if not exist .\data\tracks\e-track-4 goto data_tracks_e_track_4
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\road
call .\create_dir .\runtime\tracks\road\e-track-4
if exist .\data\tracks\e-track-4\e-track-4.xml copy .\data\tracks\e-track-4\e-track-4.xml .\runtime\tracks\road\e-track-4\e-track-4.xml
if exist .\data\tracks\e-track-4\background.png copy .\data\tracks\e-track-4\background.png .\runtime\tracks\road\e-track-4\background.png
if exist .\data\tracks\e-track-4\e-track-4.ac copy .\data\tracks\e-track-4\e-track-4.ac .\runtime\tracks\road\e-track-4\e-track-4.ac
if exist .\data\tracks\e-track-4\e-track-4.png copy .\data\tracks\e-track-4\e-track-4.png .\runtime\tracks\road\e-track-4\e-track-4.png
:data_tracks_e_track_4

if not exist .\data\tracks\e-track-5 goto data_tracks_e_track_5
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\oval
call .\create_dir .\runtime\tracks\oval\e-track-5
if exist .\data\tracks\e-track-5\e-track-5.xml copy .\data\tracks\e-track-5\e-track-5.xml .\runtime\tracks\oval\e-track-5\e-track-5.xml
if exist .\data\tracks\e-track-5\background.png copy .\data\tracks\e-track-5\background.png .\runtime\tracks\oval\e-track-5\background.png
if exist .\data\tracks\e-track-5\e-track-5.ac copy .\data\tracks\e-track-5\e-track-5.ac .\runtime\tracks\oval\e-track-5\e-track-5.ac
if exist .\data\tracks\e-track-5\e-track-5-relief.ac copy .\data\tracks\e-track-5\e-track-5-relief.ac .\runtime\tracks\oval\e-track-5\e-track-5-relief.ac
if exist .\data\tracks\e-track-5\e-track-5.png copy .\data\tracks\e-track-5\e-track-5.png .\runtime\tracks\oval\e-track-5\e-track-5.png
:data_tracks_e_track_5

if not exist .\data\tracks\e-track-6 goto data_tracks_e_track_6
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\road
call .\create_dir .\runtime\tracks\road\e-track-6
if exist .\data\tracks\e-track-6\e-track-6.xml copy .\data\tracks\e-track-6\e-track-6.xml .\runtime\tracks\road\e-track-6\e-track-6.xml
if exist .\data\tracks\e-track-6\background.png copy .\data\tracks\e-track-6\background.png .\runtime\tracks\road\e-track-6\background.png
if exist .\data\tracks\e-track-6\e-track-6.ac copy .\data\tracks\e-track-6\e-track-6.ac .\runtime\tracks\road\e-track-6\e-track-6.ac
if exist .\data\tracks\e-track-6\e-track-6.png copy .\data\tracks\e-track-6\e-track-6.png .\runtime\tracks\road\e-track-6\e-track-6.png
:data_tracks_e_track_6

if not exist .\data\tracks\g-track-1 goto data_tracks_g_track_1
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\oval
call .\create_dir .\runtime\tracks\oval\g-track-1
if exist .\data\tracks\g-track-1\g-track-1.xml copy .\data\tracks\g-track-1\g-track-1.xml .\runtime\tracks\oval\g-track-1\g-track-1.xml
if exist .\data\tracks\g-track-1\g-track-1.ac copy .\data\tracks\g-track-1\g-track-1.ac .\runtime\tracks\oval\g-track-1\g-track-1.ac
if exist .\data\tracks\g-track-1\background.png copy .\data\tracks\g-track-1\background.png .\runtime\tracks\oval\g-track-1\background.png
if exist .\data\tracks\g-track-1\g-track-1.png copy .\data\tracks\g-track-1\g-track-1.png .\runtime\tracks\oval\g-track-1\g-track-1.png
if exist .\data\tracks\g-track-1\alltree2.rgb copy .\data\tracks\g-track-1\alltree2.rgb .\runtime\tracks\oval\g-track-1\alltree2.rgb
if exist .\data\tracks\g-track-1\alltree.rgb copy .\data\tracks\g-track-1\alltree.rgb .\runtime\tracks\oval\g-track-1\alltree.rgb
if exist .\data\tracks\g-track-1\asphalt2.rgb copy .\data\tracks\g-track-1\asphalt2.rgb .\runtime\tracks\oval\g-track-1\asphalt2.rgb
if exist .\data\tracks\g-track-1\asphalt3.rgb copy .\data\tracks\g-track-1\asphalt3.rgb .\runtime\tracks\oval\g-track-1\asphalt3.rgb
if exist .\data\tracks\g-track-1\env.rgb copy .\data\tracks\g-track-1\env.rgb .\runtime\tracks\oval\g-track-1\env.rgb
if exist .\data\tracks\g-track-1\grassg1.rgb copy .\data\tracks\g-track-1\grassg1.rgb .\runtime\tracks\oval\g-track-1\grassg1.rgb
if exist .\data\tracks\g-track-1\grassg2.rgb copy .\data\tracks\g-track-1\grassg2.rgb .\runtime\tracks\oval\g-track-1\grassg2.rgb
if exist .\data\tracks\g-track-1\grassg3.rgb copy .\data\tracks\g-track-1\grassg3.rgb .\runtime\tracks\oval\g-track-1\grassg3.rgb
if exist .\data\tracks\g-track-1\rock2.rgb copy .\data\tracks\g-track-1\rock2.rgb .\runtime\tracks\oval\g-track-1\rock2.rgb
if exist .\data\tracks\g-track-1\rock3.rgb copy .\data\tracks\g-track-1\rock3.rgb .\runtime\tracks\oval\g-track-1\rock3.rgb
if exist .\data\tracks\g-track-1\texte1.rgb copy .\data\tracks\g-track-1\texte1.rgb .\runtime\tracks\oval\g-track-1\texte1.rgb
:data_tracks_g_track_1

if not exist .\data\tracks\michigan goto data_tracks_michigan
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\oval
call .\create_dir .\runtime\tracks\oval\michigan
if exist .\data\tracks\michigan\michigan.xml copy .\data\tracks\michigan\michigan.xml .\runtime\tracks\oval\michigan\michigan.xml
if exist .\data\tracks\michigan\background.png copy .\data\tracks\michigan\background.png .\runtime\tracks\oval\michigan\background.png
if exist .\data\tracks\michigan\michigan.ac copy .\data\tracks\michigan\michigan.ac .\runtime\tracks\oval\michigan\michigan.ac
if exist .\data\tracks\michigan\michigan.png copy .\data\tracks\michigan\michigan.png .\runtime\tracks\oval\michigan\michigan.png
:data_tracks_michigan

if not exist .\data\tracks\mixed-1 goto data_tracks_mixed_1
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\dirt
call .\create_dir .\runtime\tracks\dirt\mixed-1
if exist .\data\tracks\mixed-1\mixed-1.xml copy .\data\tracks\mixed-1\mixed-1.xml .\runtime\tracks\dirt\mixed-1\mixed-1.xml
if exist .\data\tracks\mixed-1\mixed-1.ac copy .\data\tracks\mixed-1\mixed-1.ac .\runtime\tracks\dirt\mixed-1\mixed-1.ac
if exist .\data\tracks\mixed-1\background.png copy .\data\tracks\mixed-1\background.png .\runtime\tracks\dirt\mixed-1\background.png
if exist .\data\tracks\mixed-1\env1.png copy .\data\tracks\mixed-1\env1.png .\runtime\tracks\dirt\mixed-1\env1.png
if exist .\data\tracks\mixed-1\mixed-1.png copy .\data\tracks\mixed-1\mixed-1.png .\runtime\tracks\dirt\mixed-1\mixed-1.png
:data_tracks_mixed_1

if not exist .\data\tracks\mixed-2 goto data_tracks_mixed_2
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\dirt
call .\create_dir .\runtime\tracks\dirt\mixed-2
if exist .\data\tracks\mixed-2\mixed-2.xml copy .\data\tracks\mixed-2\mixed-2.xml .\runtime\tracks\dirt\mixed-2\mixed-2.xml
if exist .\data\tracks\mixed-2\background.png copy .\data\tracks\mixed-2\background.png .\runtime\tracks\dirt\mixed-2\background.png
if exist .\data\tracks\mixed-2\env.rgb copy .\data\tracks\mixed-2\env.rgb .\runtime\tracks\dirt\mixed-2\env.rgb
if exist .\data\tracks\mixed-2\mixed-2.ac copy .\data\tracks\mixed-2\mixed-2.ac .\runtime\tracks\dirt\mixed-2\mixed-2.ac
if exist .\data\tracks\mixed-2\mixed-2.png copy .\data\tracks\mixed-2\mixed-2.png .\runtime\tracks\dirt\mixed-2\mixed-2.png
:data_tracks_mixed_2

if not exist .\data\tracks\oval\daytona goto data_tracks_oval_daytona
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\oval
call .\create_dir .\runtime\tracks\oval\daytona
if exist .\data\tracks\oval\daytona\daytona.xml copy .\data\tracks\oval\daytona\daytona.xml .\runtime\tracks\oval\daytona\daytona.xml
if exist .\data\tracks\oval\daytona\daytona.ac copy .\data\tracks\oval\daytona\daytona.ac .\runtime\tracks\oval\daytona\daytona.ac
if exist .\data\tracks\oval\daytona\daytona.png copy .\data\tracks\oval\daytona\daytona.png .\runtime\tracks\oval\daytona\daytona.png
:data_tracks_oval_daytona

if not exist .\data\tracks\road\alpine-1 goto data_tracks_road_alpine_1
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\road
call .\create_dir .\runtime\tracks\road\alpine-1
if exist .\data\tracks\road\alpine-1\alpine-1.xml copy .\data\tracks\road\alpine-1\alpine-1.xml .\runtime\tracks\road\alpine-1\alpine-1.xml
if exist .\data\tracks\road\alpine-1\alpine-1.ac copy .\data\tracks\road\alpine-1\alpine-1.ac .\runtime\tracks\road\alpine-1\alpine-1.ac
if exist .\data\tracks\road\alpine-1\alpine-1.png copy .\data\tracks\road\alpine-1\alpine-1.png .\runtime\tracks\road\alpine-1\alpine-1.png
if exist .\data\tracks\road\alpine-1\elevation-map.png copy .\data\tracks\road\alpine-1\elevation-map.png .\runtime\tracks\road\alpine-1\elevation-map.png
if exist .\data\tracks\road\alpine-1\relief.ac copy .\data\tracks\road\alpine-1\relief.ac .\runtime\tracks\road\alpine-1\relief.ac
if exist .\data\tracks\road\alpine-1\background.png copy .\data\tracks\road\alpine-1\background.png .\runtime\tracks\road\alpine-1\background.png
:data_tracks_road_alpine_1

if not exist .\data\tracks\road\ep-pau goto data_tracks_road_ep_pau
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\road
call .\create_dir .\runtime\tracks\road\ep-pau
if exist .\data\tracks\road\ep-pau\ep-pau.xml copy .\data\tracks\road\ep-pau\ep-pau.xml .\runtime\tracks\road\ep-pau\ep-pau.xml
if exist .\data\tracks\road\ep-pau\ep-pau.ac copy .\data\tracks\road\ep-pau\ep-pau.ac .\runtime\tracks\road\ep-pau\ep-pau.ac
:data_tracks_road_ep_pau

if not exist .\data\tracks\road\g-track-2 goto data_tracks_road_g_track_2
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\road
call .\create_dir .\runtime\tracks\road\g-track-2
if exist .\data\tracks\road\g-track-2\g-track-2.xml copy .\data\tracks\road\g-track-2\g-track-2.xml .\runtime\tracks\road\g-track-2\g-track-2.xml
if exist .\data\tracks\road\g-track-2\g-track-2.acc copy .\data\tracks\road\g-track-2\g-track-2.acc .\runtime\tracks\road\g-track-2\g-track-2.acc
if exist .\data\tracks\road\g-track-2\g-track-2.ac copy .\data\tracks\road\g-track-2\g-track-2.ac .\runtime\tracks\road\g-track-2\g-track-2.ac
if exist .\data\tracks\road\g-track-2\g-track-2-relief.ac copy .\data\tracks\road\g-track-2\g-track-2-relief.ac .\runtime\tracks\road\g-track-2\g-track-2-relief.ac
if exist .\data\tracks\road\g-track-2\g-track-2.png copy .\data\tracks\road\g-track-2\g-track-2.png .\runtime\tracks\road\g-track-2\g-track-2.png
if exist .\data\tracks\road\g-track-2\background.png copy .\data\tracks\road\g-track-2\background.png .\runtime\tracks\road\g-track-2\background.png
if exist .\data\tracks\road\g-track-2\alltree.rgb copy .\data\tracks\road\g-track-2\alltree.rgb .\runtime\tracks\road\g-track-2\alltree.rgb
if exist .\data\tracks\road\g-track-2\arbor01.rgb copy .\data\tracks\road\g-track-2\arbor01.rgb .\runtime\tracks\road\g-track-2\arbor01.rgb
if exist .\data\tracks\road\g-track-2\asasphr.rgb copy .\data\tracks\road\g-track-2\asasphr.rgb .\runtime\tracks\road\g-track-2\asasphr.rgb
if exist .\data\tracks\road\g-track-2\asb2l.rgb copy .\data\tracks\road\g-track-2\asb2l.rgb .\runtime\tracks\road\g-track-2\asb2l.rgb
if exist .\data\tracks\road\g-track-2\asb2r.rgb copy .\data\tracks\road\g-track-2\asb2r.rgb .\runtime\tracks\road\g-track-2\asb2r.rgb
if exist .\data\tracks\road\g-track-2\asconcr.rgb copy .\data\tracks\road\g-track-2\asconcr.rgb .\runtime\tracks\road\g-track-2\asconcr.rgb
if exist .\data\tracks\road\g-track-2\asgrassr.rgb copy .\data\tracks\road\g-track-2\asgrassr.rgb .\runtime\tracks\road\g-track-2\asgrassr.rgb
if exist .\data\tracks\road\g-track-2\asphalt3.rgb copy .\data\tracks\road\g-track-2\asphalt3.rgb .\runtime\tracks\road\g-track-2\asphalt3.rgb
if exist .\data\tracks\road\g-track-2\asphalt4.rgb copy .\data\tracks\road\g-track-2\asphalt4.rgb .\runtime\tracks\road\g-track-2\asphalt4.rgb
if exist .\data\tracks\road\g-track-2\asphalt.rgb copy .\data\tracks\road\g-track-2\asphalt.rgb .\runtime\tracks\road\g-track-2\asphalt.rgb
if exist .\data\tracks\road\g-track-2\asp_n.rgb copy .\data\tracks\road\g-track-2\asp_n.rgb .\runtime\tracks\road\g-track-2\asp_n.rgb
if exist .\data\tracks\road\g-track-2\assandr.rgb copy .\data\tracks\road\g-track-2\assandr.rgb .\runtime\tracks\road\g-track-2\assandr.rgb
if exist .\data\tracks\road\g-track-2\astiled.rgb copy .\data\tracks\road\g-track-2\astiled.rgb .\runtime\tracks\road\g-track-2\astiled.rgb
if exist .\data\tracks\road\g-track-2\barg1_n.rgb copy .\data\tracks\road\g-track-2\barg1_n.rgb .\runtime\tracks\road\g-track-2\barg1_n.rgb
if exist .\data\tracks\road\g-track-2\barg2.rgb copy .\data\tracks\road\g-track-2\barg2.rgb .\runtime\tracks\road\g-track-2\barg2.rgb
if exist .\data\tracks\road\g-track-2\barg3.rgb copy .\data\tracks\road\g-track-2\barg3.rgb .\runtime\tracks\road\g-track-2\barg3.rgb
if exist .\data\tracks\road\g-track-2\barr1.rgb copy .\data\tracks\road\g-track-2\barr1.rgb .\runtime\tracks\road\g-track-2\barr1.rgb
if exist .\data\tracks\road\g-track-2\concdal.rgb copy .\data\tracks\road\g-track-2\concdal.rgb .\runtime\tracks\road\g-track-2\concdal.rgb
if exist .\data\tracks\road\g-track-2\gconcrete.rgb copy .\data\tracks\road\g-track-2\gconcrete.rgb .\runtime\tracks\road\g-track-2\gconcrete.rgb
if exist .\data\tracks\road\g-track-2\grassg1.rgb copy .\data\tracks\road\g-track-2\grassg1.rgb .\runtime\tracks\road\g-track-2\grassg1.rgb
if exist .\data\tracks\road\g-track-2\grassg3.rgb copy .\data\tracks\road\g-track-2\grassg3.rgb .\runtime\tracks\road\g-track-2\grassg3.rgb
if exist .\data\tracks\road\g-track-2\grtiled.rgb copy .\data\tracks\road\g-track-2\grtiled.rgb .\runtime\tracks\road\g-track-2\grtiled.rgb
if exist .\data\tracks\road\g-track-2\gsand.rgb copy .\data\tracks\road\g-track-2\gsand.rgb .\runtime\tracks\road\g-track-2\gsand.rgb
if exist .\data\tracks\road\g-track-2\gsandtiled.rgb copy .\data\tracks\road\g-track-2\gsandtiled.rgb .\runtime\tracks\road\g-track-2\gsandtiled.rgb
if exist .\data\tracks\road\g-track-2\gtirewall.rgb copy .\data\tracks\road\g-track-2\gtirewall.rgb .\runtime\tracks\road\g-track-2\gtirewall.rgb
if exist .\data\tracks\road\g-track-2\poutre3.rgb copy .\data\tracks\road\g-track-2\poutre3.rgb .\runtime\tracks\road\g-track-2\poutre3.rgb
if exist .\data\tracks\road\g-track-2\poutre4.rgb copy .\data\tracks\road\g-track-2\poutre4.rgb .\runtime\tracks\road\g-track-2\poutre4.rgb
if exist .\data\tracks\road\g-track-2\reflect.rgb copy .\data\tracks\road\g-track-2\reflect.rgb .\runtime\tracks\road\g-track-2\reflect.rgb
if exist .\data\tracks\road\g-track-2\rock4.rgb copy .\data\tracks\road\g-track-2\rock4.rgb .\runtime\tracks\road\g-track-2\rock4.rgb
if exist .\data\tracks\road\g-track-2\spec.rgb copy .\data\tracks\road\g-track-2\spec.rgb .\runtime\tracks\road\g-track-2\spec.rgb
if exist .\data\tracks\road\g-track-2\std.rgb copy .\data\tracks\road\g-track-2\std.rgb .\runtime\tracks\road\g-track-2\std.rgb
if exist .\data\tracks\road\g-track-2\tent.rgb copy .\data\tracks\road\g-track-2\tent.rgb .\runtime\tracks\road\g-track-2\tent.rgb
if exist .\data\tracks\road\g-track-2\torcs0.rgb copy .\data\tracks\road\g-track-2\torcs0.rgb .\runtime\tracks\road\g-track-2\torcs0.rgb
if exist .\data\tracks\road\g-track-2\torcs1.rgb copy .\data\tracks\road\g-track-2\torcs1.rgb .\runtime\tracks\road\g-track-2\torcs1.rgb
if exist .\data\tracks\road\g-track-2\torcs2.rgb copy .\data\tracks\road\g-track-2\torcs2.rgb .\runtime\tracks\road\g-track-2\torcs2.rgb
if exist .\data\tracks\road\g-track-2\trcurbl.rgb copy .\data\tracks\road\g-track-2\trcurbl.rgb .\runtime\tracks\road\g-track-2\trcurbl.rgb
if exist .\data\tracks\road\g-track-2\trcurbr.rgb copy .\data\tracks\road\g-track-2\trcurbr.rgb .\runtime\tracks\road\g-track-2\trcurbr.rgb
if exist .\data\tracks\road\g-track-2\treecl1.rgb copy .\data\tracks\road\g-track-2\treecl1.rgb .\runtime\tracks\road\g-track-2\treecl1.rgb
if exist .\data\tracks\road\g-track-2\treewate.rgb copy .\data\tracks\road\g-track-2\treewate.rgb .\runtime\tracks\road\g-track-2\treewate.rgb
:data_tracks_road_g_track_2

if not exist .\data\tracks\road\g-track-3 goto data_tracks_road_g_track_3
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\road
call .\create_dir .\runtime\tracks\road\g-track-3
if exist .\data\tracks\road\g-track-3\g-track-3.xml copy .\data\tracks\road\g-track-3\g-track-3.xml .\runtime\tracks\road\g-track-3\g-track-3.xml
if exist .\data\tracks\road\g-track-3\g-track-3.acc copy .\data\tracks\road\g-track-3\g-track-3.acc .\runtime\tracks\road\g-track-3\g-track-3.acc
if exist .\data\tracks\road\g-track-3\background.png copy .\data\tracks\road\g-track-3\background.png .\runtime\tracks\road\g-track-3\background.png
if exist .\data\tracks\road\g-track-3\env.png copy .\data\tracks\road\g-track-3\env.png .\runtime\tracks\road\g-track-3\env.png
if exist .\data\tracks\road\g-track-3\envshadow.png copy .\data\tracks\road\g-track-3\envshadow.png .\runtime\tracks\road\g-track-3\envshadow.png
if exist .\data\tracks\road\g-track-3\g-track-3.png copy .\data\tracks\road\g-track-3\g-track-3.png .\runtime\tracks\road\g-track-3\g-track-3.png
if exist .\data\tracks\road\g-track-3\arbor01.rgb copy .\data\tracks\road\g-track-3\arbor01.rgb .\runtime\tracks\road\g-track-3\arbor01.rgb
if exist .\data\tracks\road\g-track-3\asasphr.rgb copy .\data\tracks\road\g-track-3\asasphr.rgb .\runtime\tracks\road\g-track-3\asasphr.rgb
if exist .\data\tracks\road\g-track-3\asb2l.rgb copy .\data\tracks\road\g-track-3\asb2l.rgb .\runtime\tracks\road\g-track-3\asb2l.rgb
if exist .\data\tracks\road\g-track-3\asconcr.rgb copy .\data\tracks\road\g-track-3\asconcr.rgb .\runtime\tracks\road\g-track-3\asconcr.rgb
if exist .\data\tracks\road\g-track-3\asgrassr_n.rgb copy .\data\tracks\road\g-track-3\asgrassr_n.rgb .\runtime\tracks\road\g-track-3\asgrassr_n.rgb
if exist .\data\tracks\road\g-track-3\asphalt4.rgb copy .\data\tracks\road\g-track-3\asphalt4.rgb .\runtime\tracks\road\g-track-3\asphalt4.rgb
if exist .\data\tracks\road\g-track-3\asp_n.rgb copy .\data\tracks\road\g-track-3\asp_n.rgb .\runtime\tracks\road\g-track-3\asp_n.rgb
if exist .\data\tracks\road\g-track-3\asp.rgb copy .\data\tracks\road\g-track-3\asp.rgb .\runtime\tracks\road\g-track-3\asp.rgb
if exist .\data\tracks\road\g-track-3\assandr.rgb copy .\data\tracks\road\g-track-3\assandr.rgb .\runtime\tracks\road\g-track-3\assandr.rgb
if exist .\data\tracks\road\g-track-3\astiled.rgb copy .\data\tracks\road\g-track-3\astiled.rgb .\runtime\tracks\road\g-track-3\astiled.rgb
if exist .\data\tracks\road\g-track-3\barg1_n.rgb copy .\data\tracks\road\g-track-3\barg1_n.rgb .\runtime\tracks\road\g-track-3\barg1_n.rgb
if exist .\data\tracks\road\g-track-3\barg2.rgb copy .\data\tracks\road\g-track-3\barg2.rgb .\runtime\tracks\road\g-track-3\barg2.rgb
if exist .\data\tracks\road\g-track-3\barg3.rgb copy .\data\tracks\road\g-track-3\barg3.rgb .\runtime\tracks\road\g-track-3\barg3.rgb
if exist .\data\tracks\road\g-track-3\barg4.rgb copy .\data\tracks\road\g-track-3\barg4.rgb .\runtime\tracks\road\g-track-3\barg4.rgb
if exist .\data\tracks\road\g-track-3\barr1.rgb copy .\data\tracks\road\g-track-3\barr1.rgb .\runtime\tracks\road\g-track-3\barr1.rgb
if exist .\data\tracks\road\g-track-3\concdal.rgb copy .\data\tracks\road\g-track-3\concdal.rgb .\runtime\tracks\road\g-track-3\concdal.rgb
if exist .\data\tracks\road\g-track-3\gconcrete.rgb copy .\data\tracks\road\g-track-3\gconcrete.rgb .\runtime\tracks\road\g-track-3\gconcrete.rgb
if exist .\data\tracks\road\g-track-3\ggrass3.rgb copy .\data\tracks\road\g-track-3\ggrass3.rgb .\runtime\tracks\road\g-track-3\ggrass3.rgb
if exist .\data\tracks\road\g-track-3\ground0.rgb copy .\data\tracks\road\g-track-3\ground0.rgb .\runtime\tracks\road\g-track-3\ground0.rgb
if exist .\data\tracks\road\g-track-3\ground1.rgb copy .\data\tracks\road\g-track-3\ground1.rgb .\runtime\tracks\road\g-track-3\ground1.rgb
if exist .\data\tracks\road\g-track-3\grtiled.rgb copy .\data\tracks\road\g-track-3\grtiled.rgb .\runtime\tracks\road\g-track-3\grtiled.rgb
if exist .\data\tracks\road\g-track-3\gsand.rgb copy .\data\tracks\road\g-track-3\gsand.rgb .\runtime\tracks\road\g-track-3\gsand.rgb
if exist .\data\tracks\road\g-track-3\gsandtiled.rgb copy .\data\tracks\road\g-track-3\gsandtiled.rgb .\runtime\tracks\road\g-track-3\gsandtiled.rgb
if exist .\data\tracks\road\g-track-3\gtirewall.rgb copy .\data\tracks\road\g-track-3\gtirewall.rgb .\runtime\tracks\road\g-track-3\gtirewall.rgb
if exist .\data\tracks\road\g-track-3\house.rgb copy .\data\tracks\road\g-track-3\house.rgb .\runtime\tracks\road\g-track-3\house.rgb
if exist .\data\tracks\road\g-track-3\mur2.rgb copy .\data\tracks\road\g-track-3\mur2.rgb .\runtime\tracks\road\g-track-3\mur2.rgb
if exist .\data\tracks\road\g-track-3\road1.rgb copy .\data\tracks\road\g-track-3\road1.rgb .\runtime\tracks\road\g-track-3\road1.rgb
if exist .\data\tracks\road\g-track-3\road2.rgb copy .\data\tracks\road\g-track-3\road2.rgb .\runtime\tracks\road\g-track-3\road2.rgb
if exist .\data\tracks\road\g-track-3\road3.rgb copy .\data\tracks\road\g-track-3\road3.rgb .\runtime\tracks\road\g-track-3\road3.rgb
if exist .\data\tracks\road\g-track-3\road4.rgb copy .\data\tracks\road\g-track-3\road4.rgb .\runtime\tracks\road\g-track-3\road4.rgb
if exist .\data\tracks\road\g-track-3\road5.rgb copy .\data\tracks\road\g-track-3\road5.rgb .\runtime\tracks\road\g-track-3\road5.rgb
if exist .\data\tracks\road\g-track-3\rockg0.rgb copy .\data\tracks\road\g-track-3\rockg0.rgb .\runtime\tracks\road\g-track-3\rockg0.rgb
if exist .\data\tracks\road\g-track-3\shadow2.rgb copy .\data\tracks\road\g-track-3\shadow2.rgb .\runtime\tracks\road\g-track-3\shadow2.rgb
if exist .\data\tracks\road\g-track-3\torcs0.rgb copy .\data\tracks\road\g-track-3\torcs0.rgb .\runtime\tracks\road\g-track-3\torcs0.rgb
if exist .\data\tracks\road\g-track-3\torcs1.rgb copy .\data\tracks\road\g-track-3\torcs1.rgb .\runtime\tracks\road\g-track-3\torcs1.rgb
if exist .\data\tracks\road\g-track-3\torcs2.rgb copy .\data\tracks\road\g-track-3\torcs2.rgb .\runtime\tracks\road\g-track-3\torcs2.rgb
if exist .\data\tracks\road\g-track-3\trcurbl.rgb copy .\data\tracks\road\g-track-3\trcurbl.rgb .\runtime\tracks\road\g-track-3\trcurbl.rgb
if exist .\data\tracks\road\g-track-3\trcurbr.rgb copy .\data\tracks\road\g-track-3\trcurbr.rgb .\runtime\tracks\road\g-track-3\trcurbr.rgb
if exist .\data\tracks\road\g-track-3\treebui1.rgb copy .\data\tracks\road\g-track-3\treebui1.rgb .\runtime\tracks\road\g-track-3\treebui1.rgb
if exist .\data\tracks\road\g-track-3\treeg10.rgb copy .\data\tracks\road\g-track-3\treeg10.rgb .\runtime\tracks\road\g-track-3\treeg10.rgb
if exist .\data\tracks\road\g-track-3\truck0.rgb copy .\data\tracks\road\g-track-3\truck0.rgb .\runtime\tracks\road\g-track-3\truck0.rgb
if exist .\data\tracks\road\g-track-3\truck1.rgb copy .\data\tracks\road\g-track-3\truck1.rgb .\runtime\tracks\road\g-track-3\truck1.rgb
if exist .\data\tracks\road\g-track-3\walls2.rgb copy .\data\tracks\road\g-track-3\walls2.rgb .\runtime\tracks\road\g-track-3\walls2.rgb
if exist .\data\tracks\road\g-track-3\walls.rgb copy .\data\tracks\road\g-track-3\walls.rgb .\runtime\tracks\road\g-track-3\walls.rgb
:data_tracks_road_g_track_3

if not exist .\data\tracks\wheel-1 goto data_tracks_wheel_1
call .\create_dir .\runtime
call .\create_dir .\runtime\tracks
call .\create_dir .\runtime\tracks\road
call .\create_dir .\runtime\tracks\road\wheel-1
if exist .\data\tracks\wheel-1\wheel-1.xml copy .\data\tracks\wheel-1\wheel-1.xml .\runtime\tracks\road\wheel-1\wheel-1.xml
if exist .\data\tracks\wheel-1\background.png copy .\data\tracks\wheel-1\background.png .\runtime\tracks\road\wheel-1\background.png
if exist .\data\tracks\wheel-1\env.rgb copy .\data\tracks\wheel-1\env.rgb .\runtime\tracks\road\wheel-1\env.rgb
if exist .\data\tracks\wheel-1\wheel-1.ac copy .\data\tracks\wheel-1\wheel-1.ac .\runtime\tracks\road\wheel-1\wheel-1.ac
if exist .\data\tracks\wheel-1\wheel-1.png copy .\data\tracks\wheel-1\wheel-1.png .\runtime\tracks\road\wheel-1\wheel-1.png
:data_tracks_wheel_1

if not exist . goto _home_torcs_sb3_torcs_torcs
call .\create_dir .\runtime
call .\create_dir .\runtime\.
if exist .\CHANGELOG.html copy .\CHANGELOG.html .\runtime\.\CHANGELOG.html
if exist .\COPYING copy .\COPYING .\runtime\.\COPYING
:_home_torcs_sb3_torcs_torcs
