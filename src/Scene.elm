module Scene exposing (scene)

import Angle
import Block3d
import Camera3d
import Color
import Direction3d
import Html exposing (Html)
import Length
import Pixels
import Point3d
import Scene3d
    exposing
        ( blockWithShadow
        , group
        , quad
        , translateIn
        )
import Scene3d.Material as Material
import Viewpoint3d


wood =
    Material.nonmetal { baseColor = Color.yellow, roughness = 0.1 }


base =
    let
        x0 =
            -0.28

        x1 =
            0.28

        t =
            0.01
    in
    group
        [ blockWithShadow wood <|
            Block3d.from
                (Point3d.meters x0 -0.1 0.2)
                (Point3d.meters x1 0.1 0.21)
        , blockWithShadow wood <|
            Block3d.from
                (Point3d.meters x0 -0.2 0)
                (Point3d.meters (x0 + t) 0.2 0.4)
        , blockWithShadow wood <|
            Block3d.from
                (Point3d.meters (x1 - t) -0.2 0)
                (Point3d.meters x1 0.2 0.4)
        ]


top =
    group
        [ blockWithShadow wood <|
            Block3d.from
                (Point3d.meters -0.3 -0.2 0.4)
                (Point3d.meters 0.3 0.2 0.41)
        , blockWithShadow wood <|
            Block3d.from
                (Point3d.meters -0.3 -0.2 0)
                (Point3d.meters -0.29 0.2 0.4)
        , blockWithShadow wood <|
            Block3d.from
                (Point3d.meters 0.29 -0.2 0)
                (Point3d.meters 0.3 0.2 0.4)
        , blockWithShadow wood <|
            Block3d.from
                (Point3d.meters -0.3 0 0.2)
                (Point3d.meters 0.3 0.01 0.4)
        ]


scene : Html msg
scene =
    let
        h =
            0.5
    in
    Scene3d.sunny
        { entities =
            [ quad (Material.nonmetal { baseColor = Color.white, roughness = 1 })
                (Point3d.meters -1 -1 0)
                (Point3d.meters 1 -1 0)
                (Point3d.meters 1 1 0)
                (Point3d.meters -1 1 0)
            , base
            , top |> translateIn Direction3d.positiveZ (Length.meters <| h - 0.4)
            ]
        , camera =
            Camera3d.perspective
                { viewpoint =
                    Viewpoint3d.lookAt
                        { focalPoint = Point3d.meters -1 2 0
                        , eyePoint = Point3d.meters 2 -6 3
                        , upDirection = Direction3d.positiveZ
                        }
                , verticalFieldOfView = Angle.degrees 20
                }
        , clipDepth = Length.meters 1
        , background = Scene3d.transparentBackground
        , dimensions = ( Pixels.pixels 400, Pixels.pixels 300 )
        , shadows = True
        , sunlightDirection =
            Maybe.withDefault Direction3d.positiveZ <|
                Direction3d.from (Point3d.meters -0.5 -1 2) Point3d.origin
        , upDirection = Direction3d.positiveZ
        }
