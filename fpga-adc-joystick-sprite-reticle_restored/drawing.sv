module drawing (
    input logic clk25, rst,
    input logic [9:0] x, y,
    input logic [11:0] CH0,
    input logic [11:0] CH1,
    input logic inDisplayArea,
    input logic hsync, vsync,
    output logic [3:0] vga_r, vga_g, vga_b,
    output logic vga_hsync, vga_vsync,
    input logic frame,
    output logic [11:0] adr_sprite,
    input logic [11:0] color_pixel_sprite
);



    localparam SCREEN_WIDTH  = 640;
    localparam SCREEN_HEIGHT = 480;
    localparam SPRITE_WIDTH  = 60;  // largeur du sprite en pixels
    localparam SPRITE_HEIGHT = 60;  // hauteur du sprite en pixels

    localparam SPRITE_X = (SCREEN_WIDTH - SPRITE_WIDTH) / 2;  // Position centrale en X
    localparam SPRITE_Y = (SCREEN_HEIGHT - SPRITE_HEIGHT) / 2; // Position centrale en Y


    integer sprite_x, sprite_y;
    integer sprite_dx, sprite_dy;

    logic first_frame = 1;




    always_ff @(posedge clk25) begin
        if (rst==1) begin
            first_frame <= 1;  // active l'initialisation après le premier cycle
        end else
        begin
            if (frame) begin
                if (first_frame) begin
                    sprite_x <= SPRITE_X;
                    sprite_y <= SPRITE_Y;
                    first_frame <= 0;  // Désactive l'initialisation après le premier cycle
                end else
                begin
                    if (CH0 > 3000) sprite_dy <= 6;
                    else if (CH0 > 2100) sprite_dy <= 2;
                    else if (CH0 > 1900) sprite_dy <= 0;
                    else if (CH0 > 1000) sprite_dy <= -2;
                    else sprite_dy <= -6;

                    if (CH1 > 3000) sprite_dx <= -6;
                    else if (CH1 > 2100) sprite_dx <= -2;
                    else if (CH1 > 1900) sprite_dx <= 0;
                    else if (CH1 > 1000) sprite_dx <= 2;
                    else sprite_dx <= 6;

                    sprite_x <= sprite_x + sprite_dx;
                    sprite_y <= sprite_y + sprite_dy;

                    if (sprite_x > SCREEN_WIDTH - SPRITE_WIDTH) begin   // rebond sur bord droit
                        sprite_x <= SCREEN_WIDTH - SPRITE_WIDTH;
                    end
                    else if (sprite_x < 0) begin                     // rebond sur bord gauche
                        sprite_x <= 0;
                    end

                    if (sprite_y > SCREEN_HEIGHT - SPRITE_HEIGHT) begin  // rebond sur bord bas
                        sprite_y <= SCREEN_HEIGHT - SPRITE_HEIGHT;
                    end
                    else if (sprite_y < 0) begin                     // rebond sur bord haut
                        sprite_y <= 0;
                    end

                end
            end
        end
    end



// ----- Gestion de l'affichage -----

    // inSprite=1 si le pixel (x, y) en cours de balayage est à l'intérieur du sprite, inSprite=0 sinon
    assign inSprite = (x >= sprite_x) && (x < sprite_x + SPRITE_WIDTH)
        &&
        (y >= sprite_y) && (y < sprite_y + SPRITE_HEIGHT);

    assign adr_sprite = (y - sprite_y) * SPRITE_WIDTH + (x - sprite_x); // adresse en ROM

    logic [3:0] r, g, b;

    always_comb begin
        r = 4'h0;  // hors zone d'affichage active de l'écran
        g = 4'h0;
        b = 4'h0;

        if (inDisplayArea) begin
            r = 4'h0;  // Couleur de fond par défaut
            g = 4'h0;
            b = 4'h0;

            // dessin du sprite
            if (inSprite) begin
                r = color_pixel_sprite[11:8];
                g = color_pixel_sprite[7:4];
                b = color_pixel_sprite[3:0];
            end
            else if ((x == sprite_x + SPRITE_WIDTH / 2)
                || (y == sprite_y + SPRITE_HEIGHT / 2)) begin // les 2 lignes horizontale et verticale de la croix du viseur
                    r = 4'h3a;
                    g = 4'hd4;
                    b = 4'hd4;
                end
        end
    end

    always_ff @(posedge clk25) begin
        {vga_hsync, vga_vsync} <= {hsync, vsync};
        {vga_r, vga_g, vga_b}  <= {r, g, b};
    end

endmodule
