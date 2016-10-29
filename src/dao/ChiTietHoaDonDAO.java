package dao;

import java.util.List;

import model.ChiTietHoaDon;

public interface ChiTietHoaDonDAO {
	public void themChiTietHoaDon(ChiTietHoaDon cthd);
	
	public List<ChiTietHoaDon> getListCTHDByMHD(int mhd);
}
