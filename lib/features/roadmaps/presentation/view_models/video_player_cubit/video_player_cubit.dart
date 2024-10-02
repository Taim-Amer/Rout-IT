import 'package:bloc/bloc.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerState {
  final VideoPlayerController videoPlayerController;
  final bool isControllerInitialized;

  VideoPlayerState({
    required this.videoPlayerController,
    required this.isControllerInitialized,
  });
}

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  VideoPlayerCubit(this.videoUrl)
      : super(VideoPlayerState(
          videoPlayerController: VideoPlayerController.network(''),
          isControllerInitialized: false,
        ));

  final String videoUrl;

  Future<void> initializeVideoPlayer() async {
    print("this is the video url${videoUrl}");
    print(videoUrl);
    final videoPlayerController = VideoPlayerController.network(videoUrl);

    await videoPlayerController.initialize();
    print("the video is initialized ");
    videoPlayerController.setLooping(true);
    videoPlayerController.play();

    emit(VideoPlayerState(
      videoPlayerController: videoPlayerController,
      isControllerInitialized: true,
    ));
  }

  void togglePlayPause() {
    final currentState = state;
    if (currentState.videoPlayerController.value.isPlaying) {
      currentState.videoPlayerController.pause();
    } else {
      currentState.videoPlayerController.play();
    }
    emit(VideoPlayerState(
      videoPlayerController: currentState.videoPlayerController,
      isControllerInitialized: currentState.isControllerInitialized,
    ));
  }

  @override
  Future<void> close() {
    state.videoPlayerController.dispose();
    return super.close();
  }
}
