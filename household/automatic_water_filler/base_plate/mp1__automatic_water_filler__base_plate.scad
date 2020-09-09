//                    _
// |\/| _  _  _  _  _|_) __  o _  __| _
// |  |(/_(_|(_|| |_>|  | (_)|(/_(_ |_>
//         _|               _|
//       www.megansprojects.com
// 
// Automatuic water filler base plate

plate_width     = 60;
plate_length    = 160;
plate_thickness = 3;
plate_mount_hole_diameter = 5;
plate_mount_hole_distance = 10;

pressure_dist_from_left = 50;
pressure_hole_diam = 5;
pressure_hole_distance = 45;

valve_dist_from_left = 110;
valve_hole_diam = 5;
valve_hole_distance = 25;
value_post_height = 8;
value_post_diameter = 15;

plate_centre = plate_width / 2;
difference()
{
    union()
    {
        // base plate
        cube ( [ plate_length, plate_width, plate_thickness ] ) ;
        
        // value posts
        translate([valve_dist_from_left ,plate_centre - valve_hole_distance/2, 0])
            cylinder ( plate_thickness + value_post_height , value_post_diameter/2 , value_post_diameter/2 );
        translate([valve_dist_from_left ,plate_centre + valve_hole_distance/2, 0])
            cylinder ( plate_thickness + value_post_height , value_post_diameter/2 , value_post_diameter/2 );
        translate([valve_dist_from_left + valve_hole_distance ,plate_centre - valve_hole_distance/2, 0])
            cylinder ( plate_thickness + value_post_height , value_post_diameter/2 , value_post_diameter/2 );
        translate([valve_dist_from_left + valve_hole_distance ,plate_centre + valve_hole_distance/2, 0])
            cylinder ( plate_thickness + value_post_height , value_post_diameter/2 , value_post_diameter/2 );
    }
    
    union()
    {
        // plate mounting holes
        translate([plate_mount_hole_distance , plate_mount_hole_distance, 0])
            cylinder ( plate_thickness  , plate_mount_hole_diameter/2 , plate_mount_hole_diameter/2 );
        translate([plate_mount_hole_distance , plate_width - plate_mount_hole_distance, 0])
            cylinder ( plate_thickness  , plate_mount_hole_diameter/2 , plate_mount_hole_diameter/2 );
        translate([plate_length - plate_mount_hole_distance , plate_mount_hole_distance, 0])
            cylinder ( plate_thickness , plate_mount_hole_diameter/2 , plate_mount_hole_diameter/2 );
        translate([plate_length - plate_mount_hole_distance , plate_width - plate_mount_hole_distance, 0])
            cylinder ( plate_thickness , plate_mount_hole_diameter/2 , plate_mount_hole_diameter/2 );

        // pressure regulator holes
        translate([pressure_dist_from_left , plate_centre - pressure_hole_distance/2, 0])
            cylinder ( plate_thickness  , pressure_hole_diam/2 , pressure_hole_diam/2 );
        translate([pressure_dist_from_left , plate_centre + pressure_hole_distance/2, 0])
            cylinder ( plate_thickness  , pressure_hole_diam/2 , pressure_hole_diam/2 );

        // value holes
        translate([valve_dist_from_left ,plate_centre - valve_hole_distance/2, 0])
            cylinder ( plate_thickness + value_post_height , valve_hole_diam/2 , valve_hole_diam/2 );
        translate([valve_dist_from_left ,plate_centre + valve_hole_distance/2, 0])
            cylinder ( plate_thickness + value_post_height , valve_hole_diam/2 , valve_hole_diam/2 );
        translate([valve_dist_from_left + valve_hole_distance ,plate_centre - valve_hole_distance/2, 0])
            cylinder ( plate_thickness + value_post_height , valve_hole_diam/2 , valve_hole_diam/2 );
        translate([valve_dist_from_left + valve_hole_distance ,plate_centre + valve_hole_distance/2, 0])
            cylinder ( plate_thickness + value_post_height , valve_hole_diam/2 , valve_hole_diam/2 );
    }
}
