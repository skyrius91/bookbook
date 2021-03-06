package site.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.itwill.dao.DocumentDAO;
import site.itwill.dto.Document;

@Service
public class DocumentServiceImpl implements DocumentService {

	@Autowired
	private DocumentDAO documentDAO;
	
	@Override
	public List<Document> getDocumentList() {
		return documentDAO.selectDocumentList();
	}

	@Transactional
	@Override
	public void addDocument(Document document) {
		documentDAO.insertDocument(document);
	}

	@Override
	public Document getDocument(int docno) {
		return documentDAO.selectDocument(docno);
	}

	@Transactional
	@Override
	public void modifyDocument(Document document) {
		documentDAO.updateDocument(document);
	}
	
}
