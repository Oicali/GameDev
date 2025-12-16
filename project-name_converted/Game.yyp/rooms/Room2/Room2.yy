{
  "$GMRoom": "v1",
  "%Name": "Room2",
  "creationCodeFile": "",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [],
  "isDnd": false,

  "layers": [
    {
      "resourceType": "GMRInstanceLayer",
      "resourceVersion": "1.0",
      "name": "effects_indicator",
      "depth": 0,
      "effectEnabled": true,
      "effectType": null,
      "gridX": 32,
      "gridY": 32,
      "hierarchyFrozen": false,
      "inheritLayerDepth": false,
      "inheritLayerSettings": false,
      "inheritSubLayers": true,
      "inheritVisibility": true,
      "instances": [
        {
          "resourceType": "GMRInstance",
          "resourceVersion": "1.0",
          "name": "inst_6F0E36D3",
          "colour": 4294967295,
          "frozen": false,
          "hasCreationCode": false,
          "ignore": false,
          "imageIndex": 0,
          "imageSpeed": 1.0,
          "inheritCode": false,
          "inheritItemSettings": false,
          "isDnd": false,
          "objectId": {
            "name": "obj_effect_indicator",
            "path": "objects/obj_effect_indicator/obj_effect_indicator.yy"
          },
          "rotation": 0.0,
          "scaleX": 1.0,
          "scaleY": 1.0,
          "x": 0.0,
          "y": 0.0
        }
      ],
      "layers": [],
      "properties": [],
      "userdefinedDepth": false,
      "visible": true
    },

    {
      "resourceType": "GMRInstanceLayer",
      "resourceVersion": "1.0",
      "name": "gift",
      "depth": 100,
      "instances": [
        {
          "resourceType": "GMRInstance",
          "resourceVersion": "1.0",
          "name": "inst_68C5975C",
          "objectId": {
            "name": "obj_gift",
            "path": "objects/obj_gift/obj_gift.yy"
          },
          "x": 320.0,
          "y": 192.0,
          "scaleX": 2.2307692,
          "scaleY": 2.0
        }
      ],
      "layers": [],
      "visible": true
    },

    {
      "resourceType": "GMRInstanceLayer",
      "resourceVersion": "1.0",
      "name": "rat",
      "depth": 200,
      "instances": [
        {
          "resourceType": "GMRInstance",
          "resourceVersion": "1.0",
          "name": "inst_26461A87",
          "objectId": {
            "name": "obj_mouse",
            "path": "objects/obj_mouse/obj_mouse.yy"
          },
          "x": 992.0,
          "y": 224.0,
          "scaleX": 2.3333333,
          "scaleY": 2.3333333
        }
      ],
      "layers": [],
      "visible": true
    },

    {
      "resourceType": "GMRInstanceLayer",
      "resourceVersion": "1.0",
      "name": "controller",
      "depth": 300,
      "instances": [
        {
          "resourceType": "GMRInstance",
          "resourceVersion": "1.0",
          "name": "inst_7FCB9000",
          "objectId": {
            "name": "obj_controller",
            "path": "objects/obj_controller/obj_controller.yy"
          },
          "x": 32.0,
          "y": 0.0
        }
      ],
      "layers": [],
      "visible": true
    },

    {
      "resourceType": "GMRInstanceLayer",
      "resourceVersion": "1.0",
      "name": "cat",
      "depth": 400,
      "instances": [
        {
          "resourceType": "GMRInstance",
          "resourceVersion": "1.0",
          "name": "inst_405443C5",
          "objectId": {
            "name": "obj_cat",
            "path": "objects/obj_cat/obj_cat.yy"
          },
          "x": 512.0,
          "y": 320.0,
          "scaleX": 3.6666665,
          "scaleY": 3.6666665
        }
      ],
      "layers": [],
      "visible": true
    },

    {
      "resourceType": "GMRBackgroundLayer",
      "resourceVersion": "1.0",
      "name": "Background",
      "depth": 500,
      "colour": 4279769112,
      "visible": true
    }
  ],

  "parent": {
    "name": "Rooms",
    "path": "folders/Rooms.yy"
  },

  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1
  },

  "roomSettings": {
    "Width": 1366,
    "Height": 768,
    "persistent": false,
    "inheritRoomSettings": false
  },

  "resourceType": "GMRoom",
  "resourceVersion": "2.0"
}
