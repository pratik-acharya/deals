package edu.mum.deals.deal.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.deals.deal.domain.Enquiry;

@Repository
public interface EnquiryRepository extends CrudRepository<Enquiry, Long> {

}