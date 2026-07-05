class Solution {
    public int firstMissingPositive(int[] nums) {
        int n = nums.length;
        for(int i = 0; i < n; i++) {
            if(nums[i] < 0) nums[i] = 0;
        }
        for(int i = 0; i < n; i++) {
            int m = Math.abs(nums[i]);
            if(m > 0 && m <= n) {
                if(nums[m-1] > 0) nums[m-1] *= -1;
                else if (nums[m-1]==0) nums[m-1] = -1*(n+2);
            }
        }
        int i = 1;
        while(i <= n) {
            if(nums[i-1] >= 0) {
                return i;
            }
            i++;
        }

        return n+1;

    }
}