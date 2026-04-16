#include <boost/lambda/lambda.hpp>
#include <iostream>
#include <iterator>
#include <algorithm>
#include <vector>

int main() {
    std::cout << "Boost calisiyor! Sayilari 3 ile carpiyoruz: " << std::endl;
    
    std::vector<int> sayilar;
    sayilar.push_back(1);
    sayilar.push_back(2);
    sayilar.push_back(3);

    // Boost lambda kullanarak her sayiyi 3 ile carpip ekrana yazdiriyoruz
    std::for_each(sayilar.begin(), sayilar.end(), std::cout << (boost::lambda::_1 * 3) << " ");
    
    std::cout << std::endl;
    return 0;
}
