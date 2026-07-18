class Solution {
    public boolean isPalindrome(int x) {
        int rem=0,sum=0;
        int temp=x;
        while(temp>0){
            rem = temp%10;
            sum = sum*10 + rem;
            temp = temp/10;
        }
        if(x==sum){
            return true;
        }
        return false;
    }
}