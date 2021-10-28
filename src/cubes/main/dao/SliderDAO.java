package cubes.main.dao;

import java.util.List;

import cubes.main.entity.Slider;

public interface SliderDAO {
	
	public List<Slider> getSLiderList();
	
	public void saveSlider(Slider slider);
	
	public Slider getSliderById(int id);
	
	public void deleteSlider(int id);
	
	

}
