function sound(arg0)
{
    audio_sound_pitch(arg0, random_range(0.7, 1.3));
    audio_play_sound(arg0, 0, false);
}
