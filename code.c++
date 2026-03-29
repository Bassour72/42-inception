#include <iostream>

// Your original version (predictable/linear)
int gen_random(int seed) {
    int rng = 0;
    rng += seed * 3;  // mult by 3
    rng *= 42;        // mult by 42
    rng >>= 1;        // bitshift-right by 1
    rng %= 10;        // modulo by 10
    return rng;
}

// Improved version (Linear Congruential Generator style)
int gen_random1(int seed) {
    // Use unsigned to handle overflow gracefully
    unsigned int rng = (unsigned int)seed * 1103515245 + 12345;
    
    // XOR-shift mixing to scramble the bits
    rng ^= (rng >> 16);
    
    // Mask to ensure a positive value, then modulo
    return (int)(rng & 0x7FFFFFFF) % 10;
}
// Your original version (predictable/linear)
// int gen_random(int seed) {
//     int rng = 0;
//     rng += seed * 3;
//     rng *= 42;
//     rng >>= 1;
//     rng %= 10;
//     return rng;
// }

// // Improved version (Linear Congruential Generator style)
// int gen_random1(int seed) {
//     // Cast to unsigned to handle overflow gracefully
//     unsigned int rng = (unsigned int)seed * 1103515245 + 12345;
//     rng ^= (rng >> 16);
//     return (int)(rng & 0x7FFFFFFF) % 10;
// }


#include <iostream>
#include <iomanip> // For formatting output

// Function declarations
// int gen_random(int seed);
// int gen_random1(int seed);
int main() {
    // Print table header
    std::cout << std::left << std::setw(8) << "Seed" 
              << "| " << std::setw(12) << "gen_random" 
              << "| " << std::setw(12) << "gen_random1" << std::endl;
    std::cout << "------------------------------------------" << std::endl;

    // Test with seeds 1 through 10
    for (int i = 1; i <= 10; ++i) {
        std::cout << std::left << std::setw(8) << i 
                  << "| " << std::setw(12) << gen_random(i) 
                  << "| " << std::setw(12) << gen_random1(i) << std::endl;
    }

    return 0;
}

