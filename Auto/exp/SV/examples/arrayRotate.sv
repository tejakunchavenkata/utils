program test;

  int arr1 [10], arr2 [10];
  int x, y, z;

  initial begin
    // Reset
    arr1 = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    $display(arr1);

    // With a different array
    arr2 = {arr1[1:9], arr1[0]};
    $display(arr2);

    // With same array
    arr1 = {arr1[1:9], arr1[0]};  // <- Error
    $display(arr1);

    // Reset and reverse rotation
    arr1 = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    arr1 = {arr1[9], arr1[0:8]};  // <- Error
    $display(arr1);

    // Reset and reverse rotation with a constant
    arr1 = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    arr1 = {9, arr1[0:8]};  // <- Error
    $display(arr1);

    x = 1;
    y = 2;
    z = 3;

    $display(x, " ", y, " ", z);
    {x, y, z} = {z, x, y};
    $display(x, " ", y, " ", z);
  end
endprogram : test
