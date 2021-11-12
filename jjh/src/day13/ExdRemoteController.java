package day13;

public interface ExdRemoteController {
	public void powerOn();
	public void powerOff();
}

interface ExdTvRemoteController extends ExdRemoteController {
	public void volumeUp();
	public void volumeDown();
	public void channelUp();
	public void channelDown();
	public void changeChannel(int num);
}

class ExdTvRemoteCon implements ExdTvRemoteController{
	
	private boolean power = false; //TV전원 상태 초기값 = 꺼져있음(false)
	private int channel = 1; //채널 초기값 = 1번
	private int volume = 0;
	private int maxChannel = 999;
	private int maxVolume = 32;
	
	@Override
	public void powerOn() {
		power = true;
		System.out.println("전원이 켜졌습니다.");
	}

	@Override
	public void powerOff() {
		power = false;
		System.out.println("전원이 꺼졌습니다.");
	}

	@Override
	public void volumeUp() {
		//TV가 꺼져있으면 소리 올리지 마세요.
		if(!power) {
			return;
		}
		++volume;
		volume = volume > maxVolume ? maxVolume : volume;
		/*if(volume > maxVolume) {
			volume = maxVolume;
		}*/
		System.out.println("소리 : " + volume);
		
	}

	@Override
	public void volumeDown() {
		if(!power) {
			return;
		}
		--volume;
		volume = volume < 0 ? 0 : volume;
		/*if(volume < 0) {
			volume = 0;
		}*/
		System.out.println("소리 : " + volume);		
		
	}

	@Override
	public void channelUp() {
		if(!power) {
			return;
		}
		++channel;
		channel = channel > maxChannel ? maxChannel : channel;
		System.out.println("채널 : " + channel);
	}

	@Override
	public void channelDown() {
		if(!power) {
			return;
		}
		--channel;
		channel = channel < 0 ? 0 : channel;
		System.out.println("채널 : " + channel);
		
	}

	@Override
	public void changeChannel(int num) {
		if(!power) {
			return;
		}
		channel = maxChannel < num ? maxChannel : num;
		System.out.println("채널 : " + channel);
	}
	public ExdTvRemoteCon(int maxVolume, int maxChannel) {
		this.maxChannel = maxChannel;
		this.maxVolume =  maxVolume;
	}
	
}
class ExdLGTvRemoteCon extends ExdTvRemoteCon{
	public final static String LOGO = "LG";
	public ExdLGTvRemoteCon(int maxVolume, int maxChannel) {
		super(maxVolume, maxChannel);
	}
}
class ExdSamSungTvRemoteCon extends ExdTvRemoteCon{
	public final static String LOGO = "SAMSUNG";
	public ExdSamSungTvRemoteCon(int maxVolume, int maxChannel) {
		super(maxVolume, maxChannel);
}
}

