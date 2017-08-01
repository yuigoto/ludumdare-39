/// @description  approach(start, end, step)
/// @function  approach
/// @param start
/// @param  end
/// @param  step

/**
 * Taken from Matt Thorson's Grandma Engine, 
 * shifts the start value towards end by step.
 */
if (argument[0] > argument[1]) {
    return max(argument[0] - argument[2], argument[1]);
} else {
    return min(argument[0] + argument[2], argument[1]);
}
