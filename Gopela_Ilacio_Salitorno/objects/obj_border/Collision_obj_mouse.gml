/// @description Insert description here
// You can write your code in this editor

if (room == Map3) {
    if (other.x < x) other.hsp = -abs(other.hsp); // bounce right
    else if (other.x > x) other.hsp = abs(other.hsp); // bounce left
    if (other.y < y) other.vsp = -abs(other.vsp); // bounce down
    else if (other.y > y) other.vsp = abs(other.vsp); // bounce up
} else {
	other.speed = 0;
}
