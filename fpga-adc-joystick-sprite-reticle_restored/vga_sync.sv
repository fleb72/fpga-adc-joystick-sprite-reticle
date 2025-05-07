module vga_sync #(
    parameter hpixels = 800,     // nombre de pixels par ligne
    parameter vlines = 525,      // nombre de lignes image
    parameter hpulse = 96,       // largeur d'impulsion du signal HSYNC
    parameter vpulse = 2,        // largeur d'impulsion du signal VSYNC
    parameter hbp = 48,          // horizontal back porch
    parameter hfp = 16,          // horizontal front porch
    parameter vbp = 33,          // vertical back porch
    parameter vfp = 10           // vertical front porch
) (
    input  logic clk25,          // signal horloge 25MHz, signal reset
    output logic [9:0] x, y,     // coordonnées écran pixel en cours
    output logic inDisplayArea,  // inDisplayArea = 1 si le pixel en cours est dans la zone d'affichage, = 0 sinon
    output logic hsync, vsync,   // signaux de synchronisation horizontale et verticale
    output logic frame           // fin du balayage au début de la 481è ligne (définition 640x480)
);


    // compteurs 10 bits horizontal et vertical
    // counterX : compteur de pixels sur une ligne
    // counterY : compteur de lignes
    logic [9:0] counterX, counterY;


    always_ff @(posedge clk25) // sur front montant de l'horloge 25MHz, ou front descendant du signal Reset
        begin
            // compter les pixels jusqu'en bout de ligne
            if (counterX < hpixels - 1)
                counterX <= counterX + 10'd1;
            else
                // En fin de ligne, remettre le compteur de pixels à zéro,
                // et incrémenter le compteur de lignes.
                // Quand toutes les lignes ont été balayées,
                // remettre le compteur de lignes à zéro.
                begin
                    counterX <= 0;
                    if (counterY < vlines - 1)
                        counterY <= counterY + 10'd1;
                    else
                        counterY <= 0;
                end
        end

    // Génération des signaux de synchronisations (logique négative)
    // <expression 1> ? <expression 2> : <expression 3>, opérateur ternaire comme en C
    assign hsync = ((counterX >= hpixels - hbp - hpulse) && (counterX < hpixels - hbp)) ? 1'b0 : 1'b1;
    assign vsync = ((counterY >= vlines - vbp - vpulse) && (counterY < vlines - vbp)) ? 1'b0 : 1'b1;

    // inDisplayArea = 1 si le pixel en cours est dans la zone d'affichage, = 0 sinon
    assign inDisplayArea = (counterX < hpixels - hbp - hfp - hpulse)
        &&
        (counterY < vlines - vbp - vfp - vpulse);

    // Coordonnées écran du pixel en cours
    // (x, y) = (0, 0) à l'origine de la zone affichable
    assign x = counterX;
    assign y = counterY;

    // frame=1 au début de la 481è ligne, lorsque la zone d'affichage active a été balayée.
    assign frame = (counterX == 0) && (counterY == vlines - vpulse - vfp - vbp);

endmodule