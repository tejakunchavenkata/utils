#include <iostream>
#include <vector>
#include <ctime>

using namespace std;

int main(){
        const int size = 1000000;
        time_t start, end;
        
        time(&start);
        vector<int> vect(size);
        for(int j = 0; j < 200; j++) {
        for(int i = 0; i < size; i++){ vect[i] = i * 2; }
        for(int i = 0; i < size; i++){ vect[i] *= 5; }
        for(int i = 0; i < size; i++){ vect[i] *= 7; }
        for(int i = 0; i < size; i++){ vect[i] *= 4; }
        }
        time(&end);
        cout<<difftime(end, start)<<" seconds."<<endl;

        time(&start);
        int arr[size];
        for(int j = 0; j < 200; j++) {
        for(int i = 0; i < size; i++){ arr[i] = i * 2; }
        for(int i = 0; i < size; i++){ arr[i] *= 5; } 
        for(int i = 0; i < size; i++){ arr[i] *= 7; } 
        for(int i = 0; i < size; i++){ arr[i] *= 4; } 
        }
        time(&end);
        cout<<difftime(end, start)<<" seconds."<<endl;
}
