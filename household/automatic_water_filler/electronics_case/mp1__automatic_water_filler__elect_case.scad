//                    _
// |\/| _  _  _  _  _|_) __  o _  __| _
// |  |(/_(_|(_|| |_>|  | (_)|(/_(_ |_>
//         _|               _|
//       www.megansprojects.com
// 
// Automatuic water filler electronics case

$fn = 32;
case_wall_thickness = 2;

case_length_inside  = 100;
case_width_inside   = 60;
case_depth_inside   = 40;

module square_pillar( x,y,z, width, heigth, hole_depth, hole_radius)
{    translate ( [ x,y,z ])
    {
        difference()
        {
            cube ([width, width, heigth ], false);   
            translate ([ width /2 , width/2 , heigth - hole_depth ])
            {
                cylinder (hole_depth, hole_radius,hole_radius);
            }
        }
    };
}

module round_pillar( x,y,z, width, heigth, hole_depth, hole_radius)
{    translate ( [ x,y,z ])
    {
        difference()
        {
            cylinder ( heigth, width/2, width/2);   
            translate ([ 0,0 , heigth - hole_depth ])
            {
               cylinder (hole_depth, hole_radius, hole_radius);
            }
        }
    };
}

module case( in_l, in_w, in_d, thickness )
{
    pillar_width = 5;
    pillar_hole_depth = 20;
    pillar_hole_radius = 2.5 /2;
    screw_bot_r = 3 /2 ;
    screw_top_r = 3 /2;
    
    hpw = pillar_width /2;
    // Main box
    difference ()
    {
        union()
        {
            translate ( [ -thickness,-thickness,-thickness ] )
            {
                cube ([in_l+2*thickness, in_w+2*thickness, in_d + thickness ], false);   
            };
        };
        union()
        {
            translate ( [ 0,0,0] )
            {
                cube ([in_l, in_w, in_d], false);
            }
        };
    };
    
    
  
    square_pillar (0,0,0, pillar_width , in_d-thickness, pillar_hole_depth, pillar_hole_radius);
    square_pillar (0,in_w-pillar_width,0, pillar_width , in_d-thickness, pillar_hole_depth, pillar_hole_radius);
    square_pillar (in_l-pillar_width,0,0, pillar_width , in_d-thickness, pillar_hole_depth, pillar_hole_radius);
    square_pillar (in_l-pillar_width,in_w-pillar_width,0, pillar_width , in_d-thickness, pillar_hole_depth, pillar_hole_radius);
    
    // Bottom plate
    
    translate ( [0, in_w + thickness * 4, -thickness])
    difference ()
    {
        cube( [ in_l, in_w, thickness]);
        union()
        {
            translate ([pillar_width/2, pillar_width/2, 0])
                cylinder ( thickness, screw_bot_r, screw_top_r);
            translate ([in_l - pillar_width/2, pillar_width/2, 0])
                cylinder ( thickness, screw_bot_r, screw_top_r);
            translate ([pillar_width/2, in_w - pillar_width/2, 0])
                cylinder ( thickness, screw_bot_r, screw_top_r);
            translate ([in_l - pillar_width/2, in_w - pillar_width/2, 0])
                cylinder ( thickness, screw_bot_r, screw_top_r);
        }
    }
}


lcd_opening_width = 64;
lcd_opening_height = 14;
lcd_width = 80;
lcd_height = 36;
lcd_pillar_heigth=6;
lcd_hole_offset = 2;
lcd_hole_r = 2.5/2;
lcd_hole_depth = lcd_pillar_heigth;

lcd_x_pos = (case_length_inside - lcd_opening_width)/2;
lcd_y_pos = 15;

difference ()
{
    case ( case_length_inside, case_width_inside, case_depth_inside, case_wall_thickness );
    translate ([ lcd_x_pos,lcd_y_pos, -case_wall_thickness])
        cube ([lcd_opening_width,lcd_opening_height,case_wall_thickness],false);
}

//pillars for lcd
round_pillar( lcd_x_pos - 5,lcd_y_pos- 8, 0,2*lcd_hole_r + case_wall_thickness, lcd_pillar_heigth, lcd_hole_depth , lcd_hole_r);
round_pillar( lcd_x_pos - 5,lcd_y_pos- 8+30, 0,2*lcd_hole_r + case_wall_thickness, lcd_pillar_heigth, lcd_hole_depth , lcd_hole_r);
round_pillar( lcd_x_pos - 5+75,lcd_y_pos- 8, 0,2*lcd_hole_r + case_wall_thickness, lcd_pillar_heigth, lcd_hole_depth , lcd_hole_r);
round_pillar( lcd_x_pos - 5+75,lcd_y_pos- 8+30, 0,2*lcd_hole_r + case_wall_thickness, lcd_pillar_heigth, lcd_hole_depth , lcd_hole_r);
