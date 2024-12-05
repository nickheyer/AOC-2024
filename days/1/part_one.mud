#!/bin/mud

# BUBBLE
fn b_sort_array
    len = array_length ${1}
    r_1 = range 0 ${len}
    for i in ${r_1}
        r_2 = range ${i} ${len}
        for j in ${r_2}
            arr_i = array_get ${1} ${i}
            arr_j = array_get ${1} ${j}

            if greater_than ${arr_i} ${arr_j}
                temp = set ${arr_i}
                array_set ${1} ${i} ${arr_j}
                array_set ${1} ${j} ${temp}
            end
        end
    end

    return ${1}
end

# SWAP SORT INNER FUNCTION
fn s_inner_sort
    arr = set ${1}
    j = set ${2}

    arr_j = array_get ${arr} ${j}
    next_calc = calc ${j} + 1
    arr_next = array_get ${arr} ${next_calc}

    if greater_than ${arr_j} ${arr_next}
        temp = set ${arr_j}
        array_set ${arr} ${j} ${arr_next}
        array_set ${arr} ${next_calc} ${temp}
        return true
    end

    return false
end

# SWAP SORT
fn s_sort_array
    r = set ${1}
    r_len = array_length ${r}
    r_1 = range 0 ${r_len}
    for i in ${r_1}

        swapped = set false
        end_r = calc ${r_len} - ${i} - 1
        r_2 = range 0 ${end_r}
        for j in ${r_2}
            swapped_inner = s_inner_sort ${r} ${j}
            if ${swapped_inner}
                swapped = set true
            end
        end

        if not ${swapped}
            return ${r}
        end
    end

    return ${r}
end


fn parse_to_array
    delim_space = set "   "
    left_list_init = array
    right_list_init = array 
    for line in ${1}
        line_pair = split ${line} ${delim_space}
        left = array_get ${line_pair} 0
        right = array_get ${line_pair} 1
        array_push ${left_list_init} ${left}
        array_push ${right_list_init} ${right}
        freed = release ${line_pair}
        assert ${freed}
    end

    concat_arr_res = array ${left_list_init} ${right_list_init}
    return ${concat_arr_res}
end

fn print_array
    for item in ${1}
        echo ${item}
    end
end

fn measure_execution_time
    end_time = current_time
    start_time = set ${1}
    elapsed_time = calc ${end_time} - ${start_time}
    
    seconds = calc ${elapsed_time} / 1000
    milliseconds = calc ${elapsed_time} % 1000
    
    echo "EXEC TIME: ${seconds} S ${milliseconds} MS"
    return ${elapsed_time}
end


fn run_bubble_sort_test
    input_text = readfile ./input.txt
    input_trim = trim ${input_text}
    input_lines = split ${input_trim} "\n"

    total_len = array_length ${input_lines}
    echo "NUM PAIRS: ${total_len}"

    combined_arr = parse_to_array ${input_lines}

    left_unsorted = array_get ${combined_arr} 0
    left_len = array_length ${left_unsorted}
    assert_eq ${left_len} ${total_len}

    right_unsorted = array_get ${combined_arr} 1
    right_len = array_length ${right_unsorted}
    assert_eq ${right_len} ${total_len}

    echo "______ LAZY BUBBLE SORT ______"
    start = current_time
    left_sorted = b_sort_array ${left_unsorted}
    measure_execution_time ${start}
    left_len = array_length ${left_sorted}
    echo "BUBBLE SORT - LEFT LEN: ${left_len}"
    assert_eq ${left_len} ${total_len}

    start = current_time
    right_sorted = b_sort_array ${right_unsorted}
    measure_execution_time ${start}
    right_len = array_length ${right_sorted}
    echo "BUBBLE SORT - RIGHT LEN: ${right_len}"
    assert_eq ${right_len} ${total_len}

    freed = release ${input_lines}
    assert ${freed}

    freed = release -r ${combined_arr}
    assert ${freed}
end

fn run_swap_sort_test
    input_text = readfile ./input.txt
    input_trim = trim ${input_text}
    input_lines = split ${input_trim} "\n"

    total_len = array_length ${input_lines}
    echo "NUM PAIRS: ${total_len}"

    combined_arr = parse_to_array ${input_lines}

    left_unsorted = array_get ${combined_arr} 0
    left_len = array_length ${left_unsorted}
    assert_eq ${left_len} ${total_len}
    echo "LEFT UNSORTED:"
    print_array ${left_sorted}

    right_unsorted = array_get ${combined_arr} 1
    right_len = array_length ${right_unsorted}
    assert_eq ${right_len} ${total_len}
    echo "RIGHT UNSORTED:"
    print_array ${right_unsorted}

    echo "______ SWAP SORT ______"
    start = current_time
    left_sorted = s_sort_array ${left_unsorted}
    measure_execution_time ${start}
    left_len = array_length ${left_sorted}
    echo "SWAP SORT - LEFT LEN: ${left_len}"
    assert_eq ${left_len} ${total_len}
    echo "LEFT SORTED:"
    print_array ${left_sorted}

    start = current_time
    right_sorted = s_sort_array ${right_unsorted}
    measure_execution_time ${start}
    right_len = array_length ${right_sorted}
    echo "SWAP SORT - RIGHT LEN: ${right_len}"
    assert_eq ${right_len} ${total_len}
    echo "RIGHT SORTED:"
    print_array ${right_sorted}


    freed = release ${input_lines}
    assert ${freed}

    freed = release -r ${combined_arr}
    assert ${freed}
end

run_bubble_sort_test
run_swap_sort_test

