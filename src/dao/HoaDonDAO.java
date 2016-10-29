package dao;

import java.util.List;

import model.HoaDon;

public interface HoaDonDAO {
	public void themHoaDon(HoaDon hd);
	
	public int getMaHD(HoaDon hd);
	
	public List<HoaDon> getListHD();
}
