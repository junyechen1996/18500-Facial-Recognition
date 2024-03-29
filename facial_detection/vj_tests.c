
#include <stdio.h>
#include "inc/vj_io.h"
#include "inc/vj_utils.h"
#include "inc/vj_types.h"

#define FACTOR 1.2

int main() {
    unsigned char image[IMAGE_HEIGHT][IMAGE_WIDTH];
    unsigned char scaled_image[IMAGE_HEIGHT][IMAGE_WIDTH];
    unsigned int integral_image[IMAGE_HEIGHT][IMAGE_WIDTH];
    unsigned int integral_image_sq[IMAGE_HEIGHT][IMAGE_WIDTH];

    load_image_file("images/subject01.gif.pgm", image);
    scale(image, IMAGE_HEIGHT, IMAGE_WIDTH, scaled_image, IMAGE_HEIGHT / FACTOR, IMAGE_WIDTH / FACTOR);
    save_image_file("subject01.gif_scale.pgm", IMAGE_HEIGHT / FACTOR, IMAGE_WIDTH / FACTOR, scaled_image);

    for (unsigned int row = 0; row < IMAGE_HEIGHT; row ++) {
        for (unsigned int col = 0; col < IMAGE_WIDTH; col ++) {
            image[row][col] = 1;
        }
    }

    get_integral_image(image, integral_image, integral_image_sq, IMAGE_HEIGHT, IMAGE_WIDTH);
    for (unsigned int row = 0; row < 10; row ++) {
        for (unsigned int col = 0; col < 10; col ++) {
            printf("%d ", integral_image[row][col]);
        }
        printf("\n");
    }

    return 0;
}

