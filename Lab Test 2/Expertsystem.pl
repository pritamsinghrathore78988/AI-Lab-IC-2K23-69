%IC-2K23-69 AI LAB TEST 2 ASSIGNMENT

% SMART IRRIGATION DECISION SYSTEM
:- use_module(library(readutil)).

% 1. CROP MOISTURE REQUIREMENTS (FACTS)
crop_limit(tomato, 40).
crop_limit(wheat, 30).

% 2. TAKE CROP INPUT FROM USER
read_crop(Crop) :-
    nl,
    write('Available Crops: tomato, wheat'), nl,
    write('Enter Crop Name: '),
    read_line_to_string(user_input, Input),
    normalize_space(string(Clean), Input),
    string_lower(Clean, Lower),

    ( Lower = "tomato" ->
        Crop = tomato
    ;
      Lower = "wheat" ->
        Crop = wheat
    ;
        write('Invalid crop! Please enter tomato or wheat.'), nl,
        read_crop(Crop)
    ).

% 3. TAKE NUMERIC INPUT FROM USER
read_number(Message, Min, Max, Value) :-
    write(Message),
    read_line_to_string(user_input, Input),
    normalize_space(string(Clean), Input),
    ( catch(number_string(N, Clean), _, fail),
      number(N),
      N >= Min,
      N =< Max ->
        Value = N
    ;
        write('Invalid input! Enter a value between '),
        write(Min),
        write(' and '),
        write(Max), nl,
        read_number(Message, Min, Max, Value)
    ).

% 4. TAKE RAINFALL INPUT FROM USER
read_rainfall(Rain) :-
    write('Is rainfall expected? (yes/no): '),
    read_line_to_string(user_input, Input),
    normalize_space(string(Clean), Input),
    string_lower(Clean, Lower),

    ( Lower = "yes" ->
        Rain = yes
    ;
      Lower = "no" ->
        Rain = no
    ;
        write('Please enter yes or no.'), nl,
        read_rainfall(Rain)
    ).

% 5. SOIL CONDITION
soil_condition(Crop, Moisture, dry) :-
    crop_limit(Crop, Limit),
    Moisture < Limit.
soil_condition(Crop, Moisture, adequate) :-
    crop_limit(Crop, Limit),
    Moisture >= Limit.

% 6. TEMPERATURE CONDITION
temperature_condition(T, high) :-
    T >= 35.

temperature_condition(T, moderate) :-
    T < 35.

% 7. HUMIDITY CONDITION
humidity_condition(H, low) :-
    H =< 40.

humidity_condition(H, normal) :-
    H > 40.

% 8. DECISION-MAKING RULES
% Rule 1: Postpone irrigation if rainfall is expected and soil moisture is insufficient.

recommendation(Crop, M, T, H, yes,
               postpone, no_irrigation,
               'Rainfall is expected, so irrigation is postponed') :-

    crop_limit(Crop, Limit),
    M < Limit,
    !.


% Rule 2: No irrigation if soil moisture is sufficient.

recommendation(Crop, M, T, H, Rain,
               not_required, no_irrigation,
               'Soil moisture is sufficient for this crop') :-

    crop_limit(Crop, Limit),
    M >= Limit,
    !.


% Rule 3: High irrigation for very low moisture or hot and dry weather.

recommendation(Crop, M, T, H, no,
               required, high,
               'Very low moisture or hot and dry weather') :-

    crop_limit(Crop, Limit),
    M < Limit,
    (M =< 15 ; (T >= 35, H =< 40)),
    !.


% Rule 4: Medium irrigation for moisture up to 25%.

recommendation(Crop, M, T, H, no,
               required, medium,
               'Soil moisture is moderately low') :-

    crop_limit(Crop, Limit),
    M < Limit,
    M =< 25,
    !.


% Rule 5: Low irrigation for remaining insufficient moisture.

recommendation(Crop, M, T, H, no,
               required, low,
               'Soil moisture is below crop requirement') :-

    crop_limit(Crop, Limit),
    M < Limit.


% 9. DISPLAY RESULT

display_result(Crop, M, T, H, Rain) :-

    soil_condition(Crop, M, Soil),
    temperature_condition(T, Temp),
    humidity_condition(H, Hum),

    recommendation(Crop, M, T, H, Rain,
                   Action, Level, Reason),

    nl,
    write('===================================='), nl,
    write('       SMART IRRIGATION SYSTEM'), nl,
    write('===================================='), nl,

    write('Crop: '),
    write(Crop), nl,

    write('Soil Moisture: '),
    write(M), write('%'), nl,

    write('Soil Condition: '),
    write(Soil), nl,

    write('Temperature: '),
    write(T), write(' C'), nl,

    write('Temperature Condition: '),
    write(Temp), nl,

    write('Humidity: '),
    write(H), write('%'), nl,

    write('Humidity Condition: '),
    write(Hum), nl,

    write('Rainfall Expected: '),
    write(Rain), nl,

    write('------------------------------------'), nl,

    write('Recommendation: '),
    write(Action), nl,

    write('Suggested Level: '),
    write(Level), nl,

    write('Reason: '),
    write(Reason), nl,

    write('===================================='), nl.


% 10. MAIN PROGRAM - USER INPUT

start :-

    nl,
    write('===================================='), nl,
    write('   SMART IRRIGATION DECISION SYSTEM'), nl,
    write('===================================='), nl,

    read_crop(Crop),

    read_number('Enter Soil Moisture (0-100%): ',0, 100, M),

    read_number('Enter Temperature (0-60 C): ',0, 60, T),

    read_number('Enter Humidity (0-100%): ',0, 100, H),
    read_rainfall(Rain),
    display_result(Crop, M, T, H, Rain).
